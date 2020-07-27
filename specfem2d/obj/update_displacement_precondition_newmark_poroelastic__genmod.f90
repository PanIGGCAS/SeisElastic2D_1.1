        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:45 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE                                                          &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_POROELASTIC__genmod
          INTERFACE 
            SUBROUTINE                                                  &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_POROELASTIC(DELTAT,      &
     &DELTATOVER2,DELTATSQUAREOVER2,ACCELS_POROELASTIC,                 &
     &VELOCS_POROELASTIC,DISPLS_POROELASTIC,ACCELW_POROELASTIC,         &
     &VELOCW_POROELASTIC,DISPLW_POROELASTIC)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_POROELASTIC
              REAL(KIND=8) :: DELTAT
              REAL(KIND=8) :: DELTATOVER2
              REAL(KIND=8) :: DELTATSQUAREOVER2
              REAL(KIND=4) :: ACCELS_POROELASTIC(3,NGLOB_POROELASTIC)
              REAL(KIND=4) :: VELOCS_POROELASTIC(3,NGLOB_POROELASTIC)
              REAL(KIND=4) :: DISPLS_POROELASTIC(3,NGLOB_POROELASTIC)
              REAL(KIND=4) :: ACCELW_POROELASTIC(3,NGLOB_POROELASTIC)
              REAL(KIND=4) :: VELOCW_POROELASTIC(3,NGLOB_POROELASTIC)
              REAL(KIND=4) :: DISPLW_POROELASTIC(3,NGLOB_POROELASTIC)
            END SUBROUTINE                                              &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_POROELASTIC
          END INTERFACE 
        END MODULE                                                      &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_POROELASTIC__genmod
