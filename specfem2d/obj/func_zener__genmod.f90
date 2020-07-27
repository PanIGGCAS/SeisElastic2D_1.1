        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FUNC_ZENER__genmod
          INTERFACE 
            SUBROUTINE FUNC_ZENER(X,AFUNC,N,QREF,POINT)
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: X
              REAL(KIND=8), INTENT(OUT) :: AFUNC(1:N)
              REAL(KIND=8), INTENT(IN) :: QREF
              REAL(KIND=8), INTENT(IN) :: POINT(1:N)
            END SUBROUTINE FUNC_ZENER
          END INTERFACE 
        END MODULE FUNC_ZENER__genmod
