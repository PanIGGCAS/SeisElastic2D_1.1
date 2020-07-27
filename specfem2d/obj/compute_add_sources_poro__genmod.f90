        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:36 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_PORO__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_PORO(ACCELS_POROELASTIC,     &
     &ACCELW_POROELASTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          POROELASTIC,                                            &
     &          NGLOB_POROELASTIC,                                      &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          ANGLESOURCE,                                            &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          IS_PROC_SOURCE,                                         &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          HXIS_STORE,                                             &
     &          HGAMMAS_STORE,                                          &
     &          IBOOL,                                                  &
     &          POROSITY,                                               &
     &          TORTUOSITY,                                             &
     &          DENSITY,                                                &
     &          KMATO
              REAL(KIND=4) :: ACCELS_POROELASTIC(2,NGLOB_POROELASTIC)
              REAL(KIND=4) :: ACCELW_POROELASTIC(2,NGLOB_POROELASTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_PORO
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_PORO__genmod
