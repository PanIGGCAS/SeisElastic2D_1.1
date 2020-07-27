        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:44 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SAVE_OPENDX_JACOBIAN__genmod
          INTERFACE 
            SUBROUTINE SAVE_OPENDX_JACOBIAN(NSPEC,NPGEO,NGNOD,KNODS,    &
     &COORG,XIGLL,ZIGLL,AXISYM,IS_ON_THE_AXIS,XIGLJ)
              INTEGER(KIND=4) :: NGNOD
              INTEGER(KIND=4) :: NPGEO
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: KNODS(NGNOD,NSPEC)
              REAL(KIND=8) :: COORG(2,NPGEO)
              REAL(KIND=8) :: XIGLL(5)
              REAL(KIND=8) :: ZIGLL(5)
              LOGICAL(KIND=4) :: AXISYM
              LOGICAL(KIND=4) :: IS_ON_THE_AXIS(NSPEC)
              REAL(KIND=8) :: XIGLJ(5)
            END SUBROUTINE SAVE_OPENDX_JACOBIAN
          END INTERFACE 
        END MODULE SAVE_OPENDX_JACOBIAN__genmod
