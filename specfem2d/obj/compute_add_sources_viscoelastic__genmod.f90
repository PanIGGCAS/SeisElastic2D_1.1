        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:42 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ADD_SOURCES_VISCOELASTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ADD_SOURCES_VISCOELASTIC(ACCEL_ELASTIC,IT&
     &,I_STAGE)
              USE SPECFEM_PAR, ONLY :                                   &
     &          P_SV,                                                   &
     &          ELASTIC,                                                &
     &          NGLOB_ELASTIC,                                          &
     &          NSOURCES,                                               &
     &          SOURCE_TYPE,                                            &
     &          ANGLESOURCE,                                            &
     &          SOURCE_TIME_FUNCTION,                                   &
     &          IS_PROC_SOURCE,                                         &
     &          ISPEC_SELECTED_SOURCE,                                  &
     &          SOURCEARRAY,                                            &
     &          HXIS_STORE,                                             &
     &          HGAMMAS_STORE,                                          &
     &          IBOOL
              REAL(KIND=4) :: ACCEL_ELASTIC(3,NGLOB_ELASTIC)
              INTEGER(KIND=4) :: IT
              INTEGER(KIND=4) :: I_STAGE
            END SUBROUTINE COMPUTE_ADD_SOURCES_VISCOELASTIC
          END INTERFACE 
        END MODULE COMPUTE_ADD_SOURCES_VISCOELASTIC__genmod
