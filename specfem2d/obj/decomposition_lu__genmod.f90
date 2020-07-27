        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DECOMPOSITION_LU__genmod
          INTERFACE 
            SUBROUTINE DECOMPOSITION_LU(A,I_MIN,N,INDX,D)
              INTEGER(KIND=4), INTENT(IN) :: N
              INTEGER(KIND=4), INTENT(IN) :: I_MIN
              REAL(KIND=8), INTENT(INOUT) :: A(I_MIN:N,I_MIN:N)
              INTEGER(KIND=4), INTENT(INOUT) :: INDX(I_MIN:N)
              REAL(KIND=8), INTENT(OUT) :: D
            END SUBROUTINE DECOMPOSITION_LU
          END INTERFACE 
        END MODULE DECOMPOSITION_LU__genmod
