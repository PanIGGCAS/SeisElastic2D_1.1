        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:46 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_ACOUSTIC_EDGE__genmod
          INTERFACE 
            SUBROUTINE GET_ACOUSTIC_EDGE(NGNOD,N,TYPE,E1,E2,IXMIN,IXMAX,&
     &IZMIN,IZMAX)
              INTEGER(KIND=4), INTENT(IN) :: NGNOD
              INTEGER(KIND=4), INTENT(IN) :: N(NGNOD)
              INTEGER(KIND=4), INTENT(IN) :: TYPE
              INTEGER(KIND=4), INTENT(IN) :: E1
              INTEGER(KIND=4), INTENT(IN) :: E2
              INTEGER(KIND=4), INTENT(OUT) :: IXMIN
              INTEGER(KIND=4), INTENT(OUT) :: IXMAX
              INTEGER(KIND=4), INTENT(OUT) :: IZMIN
              INTEGER(KIND=4), INTENT(OUT) :: IZMAX
            END SUBROUTINE GET_ACOUSTIC_EDGE
          END INTERFACE 
        END MODULE GET_ACOUSTIC_EDGE__genmod
