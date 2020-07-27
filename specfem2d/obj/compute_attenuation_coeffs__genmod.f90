        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ATTENUATION_COEFFS__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ATTENUATION_COEFFS(N,QREF,F0,F_MIN,F_MAX,&
     &TAU_EPSILON,TAU_SIGMA)
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=8), INTENT(IN) :: QREF
              REAL(KIND=8), INTENT(IN) :: F0
              REAL(KIND=8), INTENT(IN) :: F_MIN
              REAL(KIND=8), INTENT(IN) :: F_MAX
              REAL(KIND=8), INTENT(OUT) :: TAU_EPSILON(1:N)
              REAL(KIND=8), INTENT(OUT) :: TAU_SIGMA(1:N)
            END SUBROUTINE COMPUTE_ATTENUATION_COEFFS
          END INTERFACE 
        END MODULE COMPUTE_ATTENUATION_COEFFS__genmod
