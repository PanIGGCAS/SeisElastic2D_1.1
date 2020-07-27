        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE REMPLIT_POINT__genmod
          INTERFACE 
            SUBROUTINE REMPLIT_POINT(FMIN,FMAX,N,POINT)
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: FMIN
              REAL(KIND=8), INTENT(IN) :: FMAX
              REAL(KIND=8), INTENT(OUT) :: POINT(1:N)
            END SUBROUTINE REMPLIT_POINT
          END INTERFACE 
        END MODULE REMPLIT_POINT__genmod
