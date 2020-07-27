program lcg_initialize
    ! To calculate hessian_vector product
    ! by PWY for Hessian-vector product calculation 04-16-2017
    use seismo_parameters
    implicit none

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    integer, parameter :: NARGS = 6
    INTEGER :: itime, ier, isrc,i,j,iter
    character(len=MAX_STRING_LEN) :: kernel_names(MAX_KERNEL_NUM)
    character(len=MAX_STRING_LEN) :: kernel_names_comma_delimited
    character(len=MAX_STRING_LEN) :: model_names(MAX_KERNEL_NUM)
    character(len=MAX_STRING_LEN) :: model_names_comma_delimited
    character(len=MAX_STRING_LEN) :: precond_name
    character(len=MAX_STRING_LEN) :: pdh_names(MAX_KERNEL_NUM)! diagonal pseudo Hessian names
    character(len=MAX_STRING_LEN) :: arg(NARGS)
    character(len=MAX_STRING_LEN) :: directory
    real t1,t2
    character, parameter :: delimiter=','

    call cpu_time(t1)

    ! parse command line arguments
    if (command_argument_count() /= NARGS) then
        if (DISPLAY_DETAILS) then
            print *, 'USAGE:  mpirun -np NPROC bin/gradient.exe ...'
            stop ' Please check command line arguments'
        endif
    endif

    do i = 1, NARGS
    call get_command_argument(i,arg(i), status=ier)
    enddo

    read(arg(1),*) nproc
    directory=arg(2) 
    kernel_names_comma_delimited = arg(3)
    precond_name=arg(4)
    model_names_comma_delimited = arg(5)
    read(arg(6),*) iter

    call split_string(kernel_names_comma_delimited,delimiter,kernel_names,nker)
    call split_string(model_names_comma_delimited,delimiter,model_names,nmod)
    call split_string(precond_name,delimiter,pdh_names,npre) ! PWY

    if (nker .ne. nmod) then
        print*, 'number of kernel ',nker,' is not equal to number of model ',nmod
        stop
    endif
    if(precond) then
        print*,'optimization with preconditioning'
        print*,'preconditioner -- ', trim(adjustl(precond_name))
        print*,'preconditioner -- ', trim(adjustl(pdh_names(1)))
    else
        print*,'optimization without preconditioning'
    endif

    ! PWY
    call initialize(directory,adjustl(kernel_names(1:NKER)),adjustl(precond_name),adjustl(model_names(1:nmod)))

    !! save update direction 
    !call finalize(directory)   

    call cpu_time(t2)

    if (DISPLAY_DETAILS .and. myrank==0) print *,'Computation time with CPU:',t2-t1

end program lcg_initialize

subroutine initialize(directory,kernel_names,precond_name,model_names)

    use seismo_parameters
    implicit none
    integer :: ier,iker,imod
    integer :: filesize,nspec_start,nspec_end
    real(kind=CUSTOM_REAL) :: wtr
    real(kind=CUSTOM_REAL) :: max_kernel_before_pre
    real(kind=CUSTOM_REAL) :: max_kernel_after_pre
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory
    character(len=MAX_STRING_LEN) :: kernel_names(nker)
    character(len=MAX_STRING_LEN) :: model_names(nmod)
    character(len=MAX_STRING_LEN) :: precond_name
    character(len=MAX_STRING_LEN) :: pdh_names(nker)
    character(len=MAX_FILENAME_LEN) :: filename_pre
    real(kind=CUSTOM_REAL), dimension(:,:,:,:,:),allocatable :: temp_store

    !! Modulue-density parameterization
    real(kind=CUSTOM_REAL), dimension(:,:,:,:),allocatable :: temp_store_kappa
    real(kind=CUSTOM_REAL), dimension(:,:,:,:),allocatable :: temp_store_mu
    real(kind=CUSTOM_REAL), dimension(:,:,:,:),allocatable :: temp_store_rho
    real(kind=CUSTOM_REAL), dimension(:,:,:,:,:),allocatable :: temp_store_modulus

    real(kind=CUSTOM_REAL), dimension(:),allocatable :: vector
    real(kind=CUSTOM_REAL), dimension(:),allocatable :: x_cur
    real(kind=CUSTOM_REAL), dimension(:),allocatable :: r_cur
    real(kind=CUSTOM_REAL), dimension(:),allocatable :: p_cur
    real(kind=CUSTOM_REAL), dimension(:),allocatable :: hv_product
    real(kind=CUSTOM_REAL), dimension(:),allocatable :: g_old

    real(kind=CUSTOM_REAL) :: scalar
    character, parameter :: delimiter_pre=','

    call split_string(precond_name,delimiter_pre,pdh_names,npre) ! PWY
    ! slice database file
    allocate(nspec_proc(nproc))
    nspec_proc=0
    scalar=0.001

    do myrank=0,nproc-1

    ! nspec
    write(filename,'(a,i6.6,a)') &
        trim(directory)//'/misfit_kernel_update/proc',myrank,'_'//trim(IBOOL_NAME) 
    open(IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print *,'Error: could not open database file:',trim(filename)
        stop 'Error opening _NSPEC_IBOOL file'
    endif
    read(IIN) nspec_proc(myrank+1)
    close(IIN)

    if(DISPLAY_DETAILS .and. myrank==0) print*, 'nspec_proc=',nspec_proc(myrank+1)

    enddo

    nspec=sum(nspec_proc)
    if(DISPLAY_DETAILS) print*,'NGLLX*NGLLY*NGLLZ*NSPEC*nmod:',NGLLX,NGLLY,NGLLZ,NSPEC,nmod

    !! gloabl
    allocate(g_new(NGLLX*NGLLY*NGLLZ*NSPEC*nmod))
    g_new = 0.0_CUSTOM_REAL
    allocate(vector(size(g_new)))
    allocate(x_cur(size(g_new)))
    allocate(r_cur(size(g_new)))
    allocate(p_cur(size(g_new)))
    allocate(hv_product(size(g_new)))
    allocate(g_old(size(g_new)))
    vector =0.0_CUSTOM_REAL
    x_cur =0.0_CUSTOM_REAL
    r_cur =0.0_CUSTOM_REAL
    p_cur =0.0_CUSTOM_REAL
    hv_product =0.0_CUSTOM_REAL
    g_old =0.0_CUSTOM_REAL

    allocate(temp_store(NGLLX,NGLLY,NGLLZ,NSPEC,nmod))

    temp_store = 0.0_CUSTOM_REAL
    !! prepare g_new
    do myrank=0,nproc-1
    nspec_start=sum(nspec_proc(1:myrank))+1
    nspec_end=sum(nspec_proc(1:myrank))+nspec_proc(myrank+1)
    do iker=1,nker
    if(smooth) then
        write(filename,'(a,i6.6,a)') &
            trim(directory)//'/misfit_kernel_update/proc',myrank,&
            '_'//trim(kernel_names(iker))//'_smooth.bin'
    else
        write(filename,'(a,i6.6,a)') &
            trim(directory)//'/misfit_kernel_update/proc',myrank,&
            '_'//trim(kernel_names(iker))//'.bin'
    endif
    if(myrank==0) print*,'LOAD misfit_kernel -- ',trim(filename)
    open(IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    read(IIN) temp_store(:,:,:,nspec_start:nspec_end,iker)
    close(IIN)
    enddo ! iker
    enddo  ! myrank
    !! convert to 1D vector
    g_new=reshape(temp_store,shape(g_new))

    temp_store = 0.0_CUSTOM_REAL
    !! prepare vector
    do myrank=0,nproc-1
    nspec_start=sum(nspec_proc(1:myrank))+1
    nspec_end=sum(nspec_proc(1:myrank))+nspec_proc(myrank+1)
    do iker=1,nker
    if(smooth) then
        write(filename,'(a,i6.6,a)') &
            trim(directory)//'/misfit_kernel_pre/proc',myrank,&
            '_'//trim(kernel_names(iker))//'_smooth.bin'
    else
        write(filename,'(a,i6.6,a)') &
            trim(directory)//'/misfit_kernel_pre/proc',myrank,&
            '_'//trim(kernel_names(iker))//'.bin'
    endif
    if(myrank==0) print*,'LOAD misfit_kernel -- ',trim(filename)
    open(IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    read(IIN) temp_store(:,:,:,nspec_start:nspec_end,iker)
    close(IIN)
    enddo ! iker
    enddo  ! myrank
    !! convert to 1D vector
    g_old=reshape(temp_store,shape(g_old))
    hv_product(:)=(g_new(:)-g_old(:))/scalar
    x_cur(:)=-g_new(:)
    r_cur(:)=-g_new(:) - hv_product(:)
    p_cur(:)=r_cur(:)

    !! write vector and Hessian-vector product
    write(filename,'(a)')  trim(directory)//'/lcg_optimize/g_old.bin'
    print*,'SAVE g_old -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    write(IOUT) g_old
    close(IOUT) 

    write(filename,'(a)')  trim(directory)//'/lcg_optimize/x_cur.bin'
    print*,'SAVE x_cur -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    write(IOUT) x_cur
    close(IOUT)

    write(filename,'(a)')  trim(directory)//'/lcg_optimize/p_cur.bin'
    print*,'SAVE p_cur -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    write(IOUT) p_cur
    close(IOUT)

    write(filename,'(a)')  trim(directory)//'/lcg_optimize/r_cur.bin'
    print*,'SAVE r_cur -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error: could not open gradient file: '
    endif
    write(IOUT) r_cur
    close(IOUT) 

    temp_store = 0.0_CUSTOM_REAL

    temp_store=reshape(r_cur,shape(temp_store))

    do myrank=0,nproc-1
    nspec_start=sum(nspec_proc(1:myrank))+1
    nspec_end=sum(nspec_proc(1:myrank))+nspec_proc(myrank+1)
    do iker=1,nker
    if(smooth) then
      write(filename,'(a,i6.6,a)') &
          trim(directory)//'/lcg_optimize/proc',myrank,'_'//&
          trim(kernel_names(iker))//'_smooth.bin'
    else
      write(filename,'(a,i6.6,a)') &
          trim(directory)//'/lcg_optimize/proc',myrank,'_'//&
          trim(kernel_names(iker))//'.bin'    
    endif
    if (myrank == 0) print*,'SAVE r_cur -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error reading neighbors external mesh file'
    endif
    write(IOUT) temp_store(:,:,:,nspec_start:nspec_end,iker)
    close(IOUT)
    enddo ! imod
    enddo ! myrank

    ! deallocate
    deallocate(g_new)
    deallocate(vector)
    deallocate(hv_product)
    deallocate(temp_store)
    deallocate(nspec_proc)
    deallocate(g_old)
    deallocate(r_cur)
    deallocate(x_cur)
    deallocate(p_cur)
end subroutine initialize
