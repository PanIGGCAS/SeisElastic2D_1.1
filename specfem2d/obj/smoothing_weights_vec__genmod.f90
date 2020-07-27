        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:09 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SMOOTHING_WEIGHTS_VEC__genmod
          INTERFACE 
            SUBROUTINE SMOOTHING_WEIGHTS_VEC(X0,Z0,SIGMA_H2_INV,        &
     &SIGMA_V2_INV,EXP_VAL,XX_ELEM,ZZ_ELEM)
              REAL(KIND=4), INTENT(IN) :: X0
              REAL(KIND=4), INTENT(IN) :: Z0
              REAL(KIND=4), INTENT(IN) :: SIGMA_H2_INV
              REAL(KIND=4), INTENT(IN) :: SIGMA_V2_INV
              REAL(KIND=4), INTENT(OUT) :: EXP_VAL(5,5)
              REAL(KIND=4), INTENT(IN) :: XX_ELEM(5,5)
              REAL(KIND=4), INTENT(IN) :: ZZ_ELEM(5,5)
            END SUBROUTINE SMOOTHING_WEIGHTS_VEC
          END INTERFACE 
        END MODULE SMOOTHING_WEIGHTS_VEC__genmod
