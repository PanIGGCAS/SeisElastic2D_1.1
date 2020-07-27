        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LFIT_ZENER__genmod
          INTERFACE 
            SUBROUTINE LFIT_ZENER(X,Y,SIG,NDAT,POIDS,IA,COVAR,CHISQ,MA, &
     &QREF,POINT)
              INTEGER(KIND=4), INTENT(IN) :: MA
              INTEGER(KIND=4), INTENT(IN) :: NDAT
              REAL(KIND=8), INTENT(IN) :: X(1:NDAT)
              REAL(KIND=8), INTENT(IN) :: Y(1:NDAT)
              REAL(KIND=8), INTENT(IN) :: SIG(1:NDAT)
              REAL(KIND=8), INTENT(OUT) :: POIDS(1:MA)
              LOGICAL(KIND=4), INTENT(IN) :: IA(1:MA)
              REAL(KIND=8), INTENT(OUT) :: COVAR(1:MA,1:MA)
              REAL(KIND=8), INTENT(OUT) :: CHISQ
              REAL(KIND=8), INTENT(IN) :: QREF
              REAL(KIND=8), INTENT(IN) :: POINT(1:MA)
            END SUBROUTINE LFIT_ZENER
          END INTERFACE 
        END MODULE LFIT_ZENER__genmod
