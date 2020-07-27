        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:46 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INVTIME__genmod
          INTERFACE 
            SUBROUTINE INVTIME(TIMESTAMP,YR,MON,DAY,HR,MINVALUE)
              INTEGER(KIND=4), INTENT(IN) :: TIMESTAMP
              INTEGER(KIND=4), INTENT(OUT) :: YR
              INTEGER(KIND=4), INTENT(OUT) :: MON
              INTEGER(KIND=4), INTENT(OUT) :: DAY
              INTEGER(KIND=4), INTENT(OUT) :: HR
              INTEGER(KIND=4), INTENT(OUT) :: MINVALUE
            END SUBROUTINE INVTIME
          END INTERFACE 
        END MODULE INVTIME__genmod
