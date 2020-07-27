        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:43 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_VECTOR_ONE_ELEMENT__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_VECTOR_ONE_ELEMENT(FIELD_ACOUSTIC,       &
     &FIELD_GRAVITOACOUSTIC,FIELD_GRAVITO,FIELD_ELASTIC,                &
     &FIELDS_POROELASTIC,ISPEC)
              USE SPECFEM_PAR
              REAL(KIND=4) :: FIELD_ACOUSTIC(NGLOB_ACOUSTIC)
              REAL(KIND=4) :: FIELD_GRAVITOACOUSTIC(                    &
     &NGLOB_GRAVITOACOUSTIC)
              REAL(KIND=4) :: FIELD_GRAVITO(NGLOB_GRAVITOACOUSTIC)
              REAL(KIND=4) :: FIELD_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: FIELDS_POROELASTIC(2,NGLOB_POROELASTIC)
              INTEGER(KIND=4) :: ISPEC
            END SUBROUTINE COMPUTE_VECTOR_ONE_ELEMENT
          END INTERFACE 
        END MODULE COMPUTE_VECTOR_ONE_ELEMENT__genmod
