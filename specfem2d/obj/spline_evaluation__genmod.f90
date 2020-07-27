        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:20 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SPLINE_EVALUATION__genmod
          INTERFACE 
            SUBROUTINE SPLINE_EVALUATION(XPOINT,YPOINT,                 &
     &SPLINE_COEFFICIENTS,NPOINT,X_EVALUATE_SPLINE,Y_SPLINE_OBTAINED)
              INTEGER(KIND=4), INTENT(IN) :: NPOINT
              REAL(KIND=8), INTENT(IN) :: XPOINT(NPOINT)
              REAL(KIND=8), INTENT(IN) :: YPOINT(NPOINT)
              REAL(KIND=8), INTENT(IN) :: SPLINE_COEFFICIENTS(NPOINT)
              REAL(KIND=8), INTENT(IN) :: X_EVALUATE_SPLINE
              REAL(KIND=8), INTENT(OUT) :: Y_SPLINE_OBTAINED
            END SUBROUTINE SPLINE_EVALUATION
          END INTERFACE 
        END MODULE SPLINE_EVALUATION__genmod
