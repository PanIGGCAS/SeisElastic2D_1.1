        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:12 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LIK_PARAMETER_COMPUTATION__genmod
          INTERFACE 
            SUBROUTINE LIK_PARAMETER_COMPUTATION(TIMEVAL,DELTAT,KAPPA_X,&
     &BETA_X,ALPHA_X,KAPPA_Z,BETA_Z,ALPHA_Z,CPML_REGION_LOCAL,INDEX_IK, &
     &A_0,A_1,A_2,SINGULARITY_TYPE_2,BB_1,BB_2,COEF0_1,COEF1_1,COEF2_1, &
     &COEF0_2,COEF1_2,COEF2_2)
              REAL(KIND=8), INTENT(IN) :: TIMEVAL
              REAL(KIND=8) :: DELTAT
              REAL(KIND=8), INTENT(IN) :: KAPPA_X
              REAL(KIND=8), INTENT(IN) :: BETA_X
              REAL(KIND=8), INTENT(IN) :: ALPHA_X
              REAL(KIND=8), INTENT(IN) :: KAPPA_Z
              REAL(KIND=8), INTENT(IN) :: BETA_Z
              REAL(KIND=8), INTENT(IN) :: ALPHA_Z
              INTEGER(KIND=4), INTENT(IN) :: CPML_REGION_LOCAL
              INTEGER(KIND=4), INTENT(IN) :: INDEX_IK
              REAL(KIND=8), INTENT(OUT) :: A_0
              REAL(KIND=8), INTENT(OUT) :: A_1
              REAL(KIND=8), INTENT(OUT) :: A_2
              INTEGER(KIND=4), INTENT(OUT) :: SINGULARITY_TYPE_2
              REAL(KIND=8) :: BB_1
              REAL(KIND=8) :: BB_2
              REAL(KIND=8), INTENT(OUT) :: COEF0_1
              REAL(KIND=8), INTENT(OUT) :: COEF1_1
              REAL(KIND=8), INTENT(OUT) :: COEF2_1
              REAL(KIND=8), INTENT(OUT) :: COEF0_2
              REAL(KIND=8), INTENT(OUT) :: COEF1_2
              REAL(KIND=8), INTENT(OUT) :: COEF2_2
            END SUBROUTINE LIK_PARAMETER_COMPUTATION
          END INTERFACE 
        END MODULE LIK_PARAMETER_COMPUTATION__genmod
