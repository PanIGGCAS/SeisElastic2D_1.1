        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GRAD_MAX_RESIDU__genmod
          INTERFACE 
            SUBROUTINE GRAD_MAX_RESIDU(X,GRAD,N,NOPT,THETA_MIN,THETA_MAX&
     &)
              INTEGER(KIND=4), INTENT(IN) :: NOPT
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: X(1:NOPT)
              REAL(KIND=8), INTENT(OUT) :: GRAD(1:NOPT)
              REAL(KIND=8), INTENT(IN) :: THETA_MIN
              REAL(KIND=8), INTENT(IN) :: THETA_MAX
            END SUBROUTINE GRAD_MAX_RESIDU
          END INTERFACE 
        END MODULE GRAD_MAX_RESIDU__genmod
