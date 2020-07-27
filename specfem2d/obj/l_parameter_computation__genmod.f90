        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:12 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE L_PARAMETER_COMPUTATION__genmod
          INTERFACE 
            SUBROUTINE L_PARAMETER_COMPUTATION(TIMEVAL,DELTAT,KAPPA_X,  &
     &BETA_X,ALPHA_X,KAPPA_Z,BETA_Z,ALPHA_Z,CPML_REGION_LOCAL,A_0,A_1,  &
     &A_2,A_3,A_4,SINGULARITY_TYPE,BB_1,COEF0_1,COEF1_1,COEF2_1,BB_2,   &
     &COEF0_2,COEF1_2,COEF2_2)
              REAL(KIND=8) :: TIMEVAL
              REAL(KIND=8) :: DELTAT
              REAL(KIND=8), INTENT(IN) :: KAPPA_X
              REAL(KIND=8), INTENT(IN) :: BETA_X
              REAL(KIND=8), INTENT(IN) :: ALPHA_X
              REAL(KIND=8), INTENT(IN) :: KAPPA_Z
              REAL(KIND=8), INTENT(IN) :: BETA_Z
              REAL(KIND=8), INTENT(IN) :: ALPHA_Z
              INTEGER(KIND=4), INTENT(IN) :: CPML_REGION_LOCAL
              REAL(KIND=8), INTENT(OUT) :: A_0
              REAL(KIND=8), INTENT(OUT) :: A_1
              REAL(KIND=8), INTENT(OUT) :: A_2
              REAL(KIND=8), INTENT(OUT) :: A_3
              REAL(KIND=8), INTENT(OUT) :: A_4
              INTEGER(KIND=4), INTENT(OUT) :: SINGULARITY_TYPE
              REAL(KIND=8), INTENT(OUT) :: BB_1
              REAL(KIND=8), INTENT(OUT) :: COEF0_1
              REAL(KIND=8), INTENT(OUT) :: COEF1_1
              REAL(KIND=8), INTENT(OUT) :: COEF2_1
              REAL(KIND=8), INTENT(OUT) :: BB_2
              REAL(KIND=8), INTENT(OUT) :: COEF0_2
              REAL(KIND=8), INTENT(OUT) :: COEF1_2
              REAL(KIND=8), INTENT(OUT) :: COEF2_2
            END SUBROUTINE L_PARAMETER_COMPUTATION
          END INTERFACE 
        END MODULE L_PARAMETER_COMPUTATION__genmod
