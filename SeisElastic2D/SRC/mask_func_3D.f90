program mask_func_3D
    ! To mask source

#ifdef USE_MPI
    use mpi
#endif

    use seismo_parameters
    implicit none

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    integer, parameter :: NARGS = 6
    character(len=MAX_STRING_LEN) :: arg(NARGS)
    character(len=MAX_STRING_LEN) :: input_dir,output_dir,stations_dir
    INTEGER :: i, ier
    real t1,t2

#ifdef USE_MPI
    call MPI_INIT(ier)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,nproc,ier)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myrank,ier)
#else
    nproc = 1
    myrank = 0
#endif

    call cpu_time(t1)

    ! parse command line arguments
    if (command_argument_count() /= NARGS) then
        if (myrank == 0) then
            print *, 'USAGE:  mpirun -np NPROC bin/sum_kernel.exe ...'
            stop ' Please check command line arguments'
        endif
    endif

#ifdef USE_MPI
    call MPI_BARRIER(MPI_COMM_WORLD,ier)
#endif

    do i = 1, NARGS
    call get_command_argument(i,arg(i), status=ier)
    enddo

    read(arg(1),*) x_source
    read(arg(2),*) y_source
    read(arg(3),*) z_source
    input_dir=arg(4)
    output_dir=arg(5)
    stations_dir=arg(6)

    z_source = z_source * 1000

    !! initialization  -- get number of spectral elements
    call initialize(input_dir)

    !! generate mask file
    if(MASK_SOURCE) call add_source_mask_3D()
    if (MASK_STATION) call add_station_mask_3D(stations_dir)
    if (MASK_MODEL) call add_model_mask_3D()
    !! save mask file
    call finalize(output_dir)

    call cpu_time(t2)

#ifdef USE_MPI
    ! stop all the processes and exit
    call MPI_FINALIZE(ier)
#endif

end program mask_func_3D
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine initialize(directory)
    use seismo_parameters
    implicit none
    integer :: ier
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory
    logical :: ex=.false.
    integer :: NSPEC_N, NGLOB_N, NSPEC_IRREGULAR_N

!    real(kind=CUSTOM_REAL), dimension(:,:,:,:),allocatable :: ibool

!    allocate(ibool(NGLLX,NGLLY,NGLLZ,NSPEC),stat=ier)

    write(filename,'(a,i6.6,a)') trim(directory)//'/proc',myrank,'_'//trim(IBOOL_NAME)
    open(IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print *,'Error: could not open database file: ',trim(filename)
        stop 'Error opening _NSPEC_IBOOL file'
    endif
    read(IIN) nspec
!    allocate(ibool(NGLLX,NGLLY,NGLLZ,nspec),stat=ier)
!    print *, 'PWY is testing ibool 1'
!    read(IIN) ibool
    close(IIN)
!    print *, 'PWY is testing ibool 2'

    !prname_lp = prname(1:len_trim(prname))//'external_mesh.bin'

    write(filename,'(a,i6.6,a)') trim(directory)//'/proc',myrank,'_'//'external_mesh.bin'
    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
    if (ier /= 0) then
      print *,'Error could not open database file (PWY is testing mask 3D function):',trim(filename)
      !call exit_mpi(myrank, 'Error reading neighbors external mesh file')
    endif
    read(IIN) NSPEC_N
    read(IIN) NGLOB_N
    read(IIN) NSPEC_IRREGULAR_N

!    print *, 'PWY is testing mask NGLLX, NGLLY, NGLLZ, NSPEC_N:', NGLLX, NGLLY, NGLLZ, NSPEC_N
!    print *, 'PWY is testing mask NGLOB_N,NSPEC_IRREGULAR_N,NSPEC:', NGLOB_N, NSPEC_IRREGULAR_N,nspec

      ! allocates mesh arrays
    allocate(ibool(NGLLX,NGLLY,NGLLZ,NSPEC_N),stat=ier)
    !if (ier /= 0) call exit_MPI_without_rank('error allocating array 1019')
    if (ier /= 0) stop 'Error allocating array ibool'
    allocate(xstore_3D(NGLOB_N),ystore_3D(NGLOB_N),zstore_3D(NGLOB_N),stat=ier)
    !if (ier /= 0) call exit_MPI_without_rank('error allocating array 1020')
    if (ier /= 0) stop 'Error allocating array xstore_3D etc.'

      ! ibool file
    read(IIN) ibool

      ! global point arrays
    read(IIN) xstore_3D
    read(IIN) ystore_3D
    read(IIN) zstore_3D
    close(IIN)

!    zstore_3D(:) = zstore_3D(:) * 1000

!    print*, 'PWY maximum model depth:',maxval(abs(zstore_3D(:)))
!    print*, 'PWY minimum model depth:',minval(abs(zstore_3D(:)))

!    print*, 'PWY maximum model x:',maxval(abs(xstore_3D(:)))
!    print*, 'PWY minimum model x:',minval(abs(xstore_3D(:)))

!    print*, 'PWY maximum model y:',maxval(abs(ystore_3D(:)))
!    print*, 'PWY minimum model y:',minval(abs(ystore_3D(:)))

    !print *,'PWY has read coordinates!'

    allocate(mask(NGLLX,NGLLY,NGLLZ,NSPEC_N))
    mask(:,:,:,:) = 1
!    allocate(xstore_3D(NGLLX*NGLLY*NGLLZ*nspec))
!    allocate(ystore_3D(NGLLX*NGLLY*NGLLZ*nspec))
!    allocate(zstore_3D(NGLLX*NGLLY*NGLLZ*nspec))
!    xstore_3D = 0.0
!    ystore_3D = 0.0 
!    zstore_3D = 0.0

    allocate(xstore(NGLLX,NGLLY,NGLLZ,NSPEC_N))
    allocate(ystore(NGLLX,NGLLY,NGLLZ,NSPEC_N))
    allocate(zstore(NGLLX,NGLLY,NGLLZ,NSPEC_N))

    !xstore=reshape(xstore_3D,shape(xstore))
    !ystore=reshape(ystore_3D,shape(ystore))
    !zstore=reshape(zstore_3D,shape(zstore))

!    xstore = 0.0
!    ystore = 0.0
!    zstore = 0.0



!    write(filename, '(a,i6.6,a)') trim(directory)//'/proc',myrank,'_x.bin'
!    ! gets the coordinate x of the points located in my slice
!    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
!    if (ier /= 0) then
!        print *,'Error: could not open database file: ',trim(filename)
!        stop 'Error reading neighbors external mesh file'
!    endif
!    ! global point arrays
!    read(IIN) xstore_3D
!    close(IIN)

!    xstore=reshape(xstore_3D,shape(xstore))

!    !exist
!    write(filename, '(a,i6.6,a)') trim(directory)//'/proc',myrank,'_y.bin'
!        ! gets the coordinate y of the points located in my slice
!    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
!    if (ier /= 0) then
!        print *,'Error: could not open database file: ',trim(filename)
!        stop 'Error reading neighbors external mesh file'
!    endif
!        ! global point arrays
!    read(IIN) ystore_3D
!    close(IIN)

!    ystore=reshape(ystore_3D,shape(ystore))

!    write(filename, '(a,i6.6,a)') trim(directory)//'/proc',myrank,'_z.bin'
!    ! gets the coordinate z of the points located in my slice
!    open(unit=IIN,file=trim(filename),status='old',action='read',form='unformatted',iostat=ier)
!    if (ier /= 0) then
!        print *,'Error: could not open database file: ',trim(filename)
!        stop 'Error reading neighbors external mesh file'
!    endif
!    ! global point arrays
!    read(IIN) zstore_3D
!    close(IIN)

!    zstore=reshape(zstore_3D,shape(zstore))

end subroutine initialize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine add_source_mask_3D()
    use seismo_parameters
    implicit none
    integer :: ix,iy,iz,ispec,iglob
    real :: dis

    if(myrank==0) then
        print* 
        print*, 'mask source at:', x_source, y_source, z_source
        print* 
    endif

    !print *, 'PWY maximum model depth:',maxval(abs(zstore_3D(:)))
    !print *, 'PWY minimum model depth:',minval(abs(zstore_3D(:)))

    !print *, 'PWY maximum model x:',maxval(abs(xstore_3D(:)))
    !print *, 'PWY minimum model x:',minval(abs(xstore_3D(:)))

    !print *, 'PWY maximum model y:',maxval(abs(ystore_3D(:)))
    !print *, 'PWY minimum model y:',minval(abs(ystore_3D(:)))

    !print *, 'PWY maximum ibool:',maxval((ibool(:,:,:,:)))
    !print *, 'PWY minimum ibool:',minval((ibool(:,:,:,:)))

    do ix = 1,NGLLX
    do iy = 1,NGLLY
    do iz = 1,NGLLZ
    do ispec = 1,NSPEC
    iglob=ibool(ix,iy,iz,ispec)
    !iglob=ix*iy*iz*ispec
    !print *, 'PWY iglob:',iglob
    dis = sqrt((xstore_3D(iglob)-x_source)**2+&
        (ystore_3D(iglob)-y_source)**2+ &
        (abs(zstore_3D(iglob))-abs(z_source))**2)
    
    !print *,'PWY distance smaller than 200 is:',dis
    if(dis<=source_radius) then 
        !print *,'PWY distance is:',dis
        ! gaussian
        if (MASK_DAMP) then
          mask(ix,iy,iz,ispec)=mask(ix,iy,iz,ispec) * &
              (1.0 - exp(-4.0*(dis/source_radius)**2))**4
        endif
        if (.not. MASK_DAMP) then
          ! mute 
          mask(ix,iy,iz,ispec)=0.0
          !print *,'PWY is setting mask region !'
        endif
    endif
    enddo
    enddo
    enddo
    enddo
    
    !print *,'PWY has created mask function!'

end subroutine add_source_mask_3D

subroutine add_model_mask_3D()
    use seismo_parameters
    implicit none
    integer :: ix,iy,iz,ispec,iglob
    real :: dis

    if(myrank==0) then
        print*
        print*, 'mask source at:', x_source, y_source, z_source
        print*
    endif

    do ix = 1,NGLLX
    do iy = 1,NGLLY
    do iz = 1,NGLLZ
    do ispec = 1,NSPEC
    iglob=ibool(ix,iy,iz,ispec)
!    mask_z=mask_z/1000
    if((abs(zstore_3D(iglob)))<=mask_z) then
        ! gaussian
        !mask(ix,iy,iz,ispec)=mask(ix,iy,iz,ispec) * &
        !    (1.0 - exp(-4.0*(dis/source_radius)**2))**4
        ! mute 
        mask(ix,iy,iz,ispec)=0.0
!        print*, 'PWY is masking model'
    endif
!    print*, 'PWY maximum model depth:',maxval(abs(zstore_3D(:)))
!    mask_zend=mask_zend/1000
    if((abs(zstore_3D(iglob)))>mask_zend) then
        ! gaussian
        !mask(ix,iy,iz,ispec)=mask(ix,iy,iz,ispec) * &
        !    (1.0 - exp(-4.0*(dis/source_radius)**2))**4
        ! mute 
        mask(ix,iy,iz,ispec)=0.0
    endif
    enddo
    enddo
    enddo
    enddo
end subroutine add_model_mask_3D
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine add_station_mask_3D(directory)
    use seismo_parameters
    implicit none
    character(len=MAX_STRING_LEN) :: directory
    integer :: ier
    character(len=MAX_FILENAME_LEN) :: filename
    integer :: ix,iy,iz,ispec,irec,iglob
    real :: dis
    CHARACTER (LEN=MAX_STRING_LEN) :: station_name, network_name
    real(kind=CUSTOM_REAL) :: stele,stbur

    allocate(st_xval(NREC))
    allocate(st_yval(NREC))
    allocate(st_zval(NREC))
    st_xval = 0.0 
    st_yval = 0.0 
    st_zval = 0.0

    if(myrank==0) then
        print*
        print*, 'mask stations'
        print*
    endif

    !! read STATION file 
    write(filename,'(a)') trim(directory)//'/STATIONS_FILTERED'
    OPEN (UNIT=IIN,FILE=trim(filename),STATUS='OLD',action='read',iostat=ier)
    if(ier /=0) then
        print*,'Error opening file. File load station file'
        stop
    else
        do irec=1,NREC ! trace loop
        read(IIN,*) station_name,network_name,st_yval(irec),st_xval(irec),stele,st_zval(irec)
        !print *,'PWY stations:',station_name,network_name,st_xval(irec),st_yval(irec),stele,st_zval(irec)
        enddo
    end if
    close(IIN)

    do ix = 1,NGLLX
    do iy = 1,NGLLY
    do iz = 1,NGLLZ
    do ispec = 1,NSPEC
    iglob=ibool(ix,iy,iz,ispec)
    do irec=1,NREC
    !print *,'PWY stations:',station_name,network_name,st_xval(irec),st_yval(irec),stele,st_zval(irec)
    dis = sqrt((xstore_3D(iglob)-st_xval(irec))**2+&
        (ystore_3D(iglob)-st_yval(irec))**2+ &
        (abs(zstore_3D(iglob))-abs(st_zval(irec)))**2)
    if(dis<=station_radius) then
        ! gaussian damping
        mask(ix,iy,iz,ispec)=mask(ix,iy,iz,ispec) * & 
            (1.0 - exp(-4.0*(dis/station_radius)**2))**4
        ! zero mute
        !  mask(ix,iy,iz,ispec)= 0.0
    endif
    enddo
    enddo
    enddo
    enddo
    enddo

    deallocate(st_xval)
    deallocate(st_yval)
    deallocate(st_zval)

end subroutine add_station_mask_3D
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine finalize(directory)
    use seismo_parameters
    implicit none
    integer :: ier
    character(len=MAX_FILENAME_LEN) :: filename
    character(len=MAX_STRING_LEN) :: directory

    write(filename,'(a,i6.6,a)') trim(directory)//'/proc',myrank,'_mask.bin'
    open(IOUT,file=trim(filename),status='unknown',action='write',form='unformatted',iostat=ier)
    if (ier /= 0) then
        print *,'Error: could not open source mask file: ',trim(filename)
        stop 'Error opening source mask file'
    endif
    write(IOUT) mask
    close(IOUT)

    deallocate(mask)
    deallocate(xstore)
    deallocate(ystore)
    deallocate(zstore)
    deallocate(xstore_3D)
    deallocate(ystore_3D)
    deallocate(zstore_3D)
end subroutine finalize
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
