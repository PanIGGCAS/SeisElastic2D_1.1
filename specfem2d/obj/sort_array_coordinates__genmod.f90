        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:44 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SORT_ARRAY_COORDINATES__genmod
          INTERFACE 
            SUBROUTINE SORT_ARRAY_COORDINATES(NPOINTOT,X,Z,IBOOL,IGLOB, &
     &LOCVAL,IFSEG,NGLOB,IND,NINSEG,IWORK,WORK)
              INTEGER(KIND=4), INTENT(IN) :: NPOINTOT
              REAL(KIND=8), INTENT(IN) :: X(NPOINTOT)
              REAL(KIND=8), INTENT(IN) :: Z(NPOINTOT)
              INTEGER(KIND=4), INTENT(INOUT) :: IBOOL(NPOINTOT)
              INTEGER(KIND=4) :: IGLOB(NPOINTOT)
              INTEGER(KIND=4) :: LOCVAL(NPOINTOT)
              LOGICAL(KIND=4) :: IFSEG(NPOINTOT)
              INTEGER(KIND=4), INTENT(OUT) :: NGLOB
              INTEGER(KIND=4) :: IND(NPOINTOT)
              INTEGER(KIND=4) :: NINSEG(NPOINTOT)
              INTEGER(KIND=4) :: IWORK(NPOINTOT)
              REAL(KIND=8) :: WORK(NPOINTOT)
            END SUBROUTINE SORT_ARRAY_COORDINATES
          END INTERFACE 
        END MODULE SORT_ARRAY_COORDINATES__genmod
