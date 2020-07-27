        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FUNC_OBJECTIVE__genmod
          INTERFACE 
            SUBROUTINE FUNC_OBJECTIVE(X,RES,FREQ,QREF,N,NOPT)
              INTEGER(KIND=4), INTENT(IN) :: NOPT
              REAL(KIND=8), INTENT(IN) :: X(1:NOPT)
              REAL(KIND=8), INTENT(OUT) :: RES
              REAL(KIND=8), INTENT(IN) :: FREQ
              REAL(KIND=8), INTENT(IN) :: QREF
              INTEGER(KIND=4), INTENT(IN) :: N
            END SUBROUTINE FUNC_OBJECTIVE
          END INTERFACE 
        END MODULE FUNC_OBJECTIVE__genmod
