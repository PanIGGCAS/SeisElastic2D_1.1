        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:32 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC(                    &
     &POTENTIAL_DOT_DOT_ACOUSTIC,IT,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          ACOUSTIC,                                               &
     &          NGLOB_ACOUSTIC,                                         &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          IS_PROC_SOURCE,                                         &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          HXIS_STORE,                                             &
     &          HGAMMAS_STORE,                                          &
     &          IBOOL,                                                  &
     &          KAPPASTORE
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB_ACOUSTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_ACOUSTIC
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_ACOUSTIC__genmod
