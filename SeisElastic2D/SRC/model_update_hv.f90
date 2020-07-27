program model_update_hv
    ! To update model along search direction
    ! yanhuay@princeton.edu

    use seismo_parameters
    implicit none

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    integer, parameter :: NARGS = 4
    INTEGER :: itime, ier, isrc,i,j
    character(len=MAX_STRING_LEN) :: model_names(MAX_KERNEL_NUM)
    character(len=MAX_STRING_LEN) :: model_names_comma_delimited
    character(len=MAX_STRING_LEN) :: kernel_names(MAX_KERNEL_NUM)
    character(len=MAX_STRING_LEN) :: kernel_names_comma_delimited
    character(len=MAX_STRING_LEN) :: arg(NARGS)
    character(len=MAX_STRING_LEN) :: directory
    real t1,t2
    character, parameter :: delimiter=','

    call cpu_time(t1)

    ! parse command line arguments
    if (command_argument_count() /= NARGS) then
        print *, 'USAGE:  mpirun -np NPROC bin/model_update.exe nproc directory MODEL_NAME, step_length'
        stop ' Please check command line arguments'
    endif

    do i = 1, NARGS
    call get_command_argument(i,arg(i), status=ier)
    enddo

    read(arg(1),*) nproc
    directory=arg(2)
    model_names_comma_delimited = arg(3)
    read(arg(4),*) step_length
!    read(arg(5),*) scaling_factor
!    kernel_names_comma_delimited = arg(5)
    if (myrank == 0) write(*,'(a,f15.2,a)') 'try step length -- ',step_length*100,'%'

    call split_string(model_names_comma_delimited,delimiter,model_names,nmod)
!    call split_string(kernel_names_comma_delimited,delimiter,kernel_names,nmod)
    !! initialization  -- get number of spectral elements
    call initialize(directory)

    !! update model
    !! check parameterization
    !if (model_names(1)=='vp') then
    call update_hv(directory)
    !    print *, 'Velocity-density Parameterization !!!'
    !endif
!    if (kernel_names(1)=='kappa_kernel') then
!        call update_modulus(directory)
!        print *, 'Modulus-density Parameterization !!!'
!    endif

    !! save updated model  
    call finalize(directory,adjustl(model_names(1:nmod)))

end program model_update_hv
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine initialize(directory)
    use seismo_parameters
    implicit none
    integer :: ier,filesize
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory
    character(len=MAX_STRING_LEN) :: model_name

    ! slice database file
    allocate(nspec_proc(nproc))
    nspec_proc=0
    do myrank=0,nproc-1

    ! nspec
    write(filename,'(a,i6.6,a)') &
        trim(directory)//'/misfit_kernel/proc',myrank,'_'//trim(IBOOL_NAME) 
    write(filename,'(a,i6.6,a)') &
        trim(directory)//'/misfit_kernel/proc',myrank,'_'//trim(IBOOL_NAME)
    open(IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)            
    if (ier /= 0) then                          
        print *,'Error: could not open database file:',trim(filename)
        stop 'Error opening NSPEC_IBOOL file'       
    endif                                                
    read(IIN) nspec_proc(myrank+1)
    close(IIN)                                                          

    enddo

    nspec=sum(nspec_proc)
    if(DISPLAY_DETAILS) print*,'NGLLX*NGLLY*NGLLZ*NSPEC*nmod:',NGLLX,NGLLY,NGLLZ,NSPEC,nmod

    allocate(m_new(NGLLX*NGLLY*NGLLZ*NSPEC*nmod))
    m_new = 0.0_CUSTOM_REAL
    allocate(p_new(NGLLX*NGLLY*NGLLZ*NSPEC*nmod))
    p_new = 0.0_CUSTOM_REAL
    allocate(m_try(NGLLX*NGLLY*NGLLZ*NSPEC*nmod))
    m_try = 0.0_CUSTOM_REAL
    allocate(g_new(NGLLX*NGLLY*NGLLZ*NSPEC*nmod))
    g_new = 0.0_CUSTOM_REAL

end subroutine initialize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine update_hv(directory)
    use seismo_parameters
    implicit none
    integer :: ier,imod
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory
    real(kind=CUSTOM_REAL), dimension(:,:,:,:,:), allocatable :: temp_store
    !! LOAD p_new
    write(filename,'(a)') &
        trim(directory)//'/optimizer/g_new.bin'
    print*,'LOAD p_new -- ', trim(filename)
    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open model file: ',trim(filename)
        stop 'Error reading neighbors external mesh file'
    endif
    read(IIN) g_new
    close(IIN)

    p_new(:)=-g_new(:)

    !! LOAD m_new
    write(filename,'(a)') &
        trim(directory)//'/optimizer/m_new.bin'
    print*,'LOAD m_new -- ', trim(filename)
    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open model file: ',trim(filename)
        stop 'Error reading neighbors external mesh file'
    endif
    read(IIN) m_new
    close(IIN)
    if(DISPLAY_DETAILS .and. myrank==0) print *,'Min / Max m_new = ', &
        minval(m_new(:)),maxval(m_new(:))
 !!   step_length=100
    !! update 
!    p_new=p_new*100
    if (ATTENUATION_SCALING) then
         allocate(temp_store(NGLLX,NGLLY,NGLLZ,NSPEC,nmod))
         temp_store=0.0_CUSTOM_REAL
         temp_store=reshape(p_new,shape(temp_store))
         temp_store(:,:,:,:,3) = scaling_factor_1 * temp_store(:,:,:,:,3)
         temp_store(:,:,:,:,4) = scaling_factor_2 * temp_store(:,:,:,:,4)
         p_new=reshape(temp_store,shape(p_new))
    endif
    m_try = m_new * (1+step_length*p_new) 
    if(DISPLAY_DETAILS .and. myrank==0) print *,'Min / Max m_try = ', &
        minval(m_try(:)),maxval(m_try(:))

end subroutine update_hv

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine finalize(directory,model_names)
    use seismo_parameters
    implicit none
    integer :: ier,imod
    integer :: nspec_start,nspec_end
    character(len=MAX_STRING_LEN) :: model_names(nmod)
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory
    real(kind=CUSTOM_REAL), dimension(:,:,:,:,:),allocatable :: temp_store

    allocate(temp_store(NGLLX,NGLLY,NGLLZ,NSPEC,nmod))
    temp_store = 0.0_CUSTOM_REAL

    temp_store=reshape(m_try,shape(temp_store))

    do myrank=0,nproc-1
    nspec_start=sum(nspec_proc(1:myrank))+1
    nspec_end=sum(nspec_proc(1:myrank))+nspec_proc(myrank+1)
    do imod=1,nmod
    write(filename,'(a,i6.6,a)') &
        trim(directory)//'/m_try_hv/proc',myrank,'_'//&
        trim(model_names(imod))//'.bin'
    if (myrank == 0) print*,'SAVE m_try_hv -- ', trim(filename)
    open(unit=IOUT,file=trim(filename),status='unknown',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print*, 'Error: could not open gradient file: ',trim(filename)
        stop 'Error reading neighbors external mesh file'
    endif
    write(IOUT) temp_store(:,:,:,nspec_start:nspec_end,imod)
    close(IOUT)
    enddo ! imod
    enddo ! myrank

    deallocate(temp_store)
    deallocate(m_new)
    deallocate(m_try)
    deallocate(p_new)
    deallocate(g_new)
    deallocate(nspec_proc)
end subroutine finalize 
