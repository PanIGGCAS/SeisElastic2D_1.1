        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GRAD_FUNC_MINI__genmod
          INTERFACE 
            SUBROUTINE GRAD_FUNC_MINI(X,GRAD,QREF,N,NOPT,K,F_MIN,F_MAX)
              INTEGER(KIND=4), INTENT(IN) :: K
              INTEGER(KIND=4), INTENT(IN) :: NOPT
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: X(1:NOPT)
              REAL(KIND=8), INTENT(OUT) :: GRAD(1:NOPT)
              REAL(KIND=8), INTENT(IN) :: QREF
              REAL(KIND=8), INTENT(IN) :: F_MIN
              REAL(KIND=8), INTENT(IN) :: F_MAX
            END SUBROUTINE GRAD_FUNC_MINI
          END INTERFACE 
        END MODULE GRAD_FUNC_MINI__genmod
