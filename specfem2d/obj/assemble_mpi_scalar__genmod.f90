        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ASSEMBLE_MPI_SCALAR__genmod
          INTERFACE 
            SUBROUTINE ASSEMBLE_MPI_SCALAR(ARRAY_VAL1,NPOIN_VAL1,       &
     &ARRAY_VAL2,ARRAY_VAL5,NPOIN_VAL2,ARRAY_VAL3,ARRAY_VAL4,NPOIN_VAL3)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NINTERFACE,                                             &
     &          MAX_IBOOL_INTERFACES_SIZE_AC,                           &
     &          MAX_IBOOL_INTERFACES_SIZE_EL,                           &
     &          MAX_IBOOL_INTERFACES_SIZE_PO,                           &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          IBOOL_INTERFACES_ELASTIC,                               &
     &          IBOOL_INTERFACES_POROELASTIC,                           &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          NIBOOL_INTERFACES_ELASTIC,                              &
     &          NIBOOL_INTERFACES_POROELASTIC,                          &
     &          MY_NEIGHBOURS,                                          &
     &          IER
              INTEGER(KIND=4) :: NPOIN_VAL3
              INTEGER(KIND=4) :: NPOIN_VAL2
              INTEGER(KIND=4) :: NPOIN_VAL1
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL1(NPOIN_VAL1)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL2(NPOIN_VAL2)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL5(NPOIN_VAL2)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL3(NPOIN_VAL3)
              REAL(KIND=4), INTENT(INOUT) :: ARRAY_VAL4(NPOIN_VAL3)
            END SUBROUTINE ASSEMBLE_MPI_SCALAR
          END INTERFACE 
        END MODULE ASSEMBLE_MPI_SCALAR__genmod
