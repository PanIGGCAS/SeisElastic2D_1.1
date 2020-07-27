        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FUNC_MINI__genmod
          INTERFACE 
            SUBROUTINE FUNC_MINI(X,RES,QREF,N,NOPT,K,F_MIN,F_MAX)
              INTEGER(KIND=4), INTENT(IN) :: NOPT
              REAL(KIND=8), INTENT(IN) :: X(1:NOPT)
              REAL(KIND=8), INTENT(OUT) :: RES
              REAL(KIND=8), INTENT(IN) :: QREF
              INTEGER(KIND=4), INTENT(IN) :: N
              INTEGER(KIND=4), INTENT(IN) :: K
              REAL(KIND=8), INTENT(IN) :: F_MIN
              REAL(KIND=8), INTENT(IN) :: F_MAX
            END SUBROUTINE FUNC_MINI
          END INTERFACE 
        END MODULE FUNC_MINI__genmod
