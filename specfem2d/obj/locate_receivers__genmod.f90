        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:05 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE LOCATE_RECEIVERS__genmod
          INTERFACE 
            SUBROUTINE LOCATE_RECEIVERS(IBOOL,COORD,NSPEC,NGLOB,XIGLL,  &
     &ZIGLL,NREC,NRECLOC,RECLOC,WHICH_PROC_RECEIVER,NPROC,MYRANK,ST_XVAL&
     &,ST_ZVAL,ISPEC_SELECTED_REC,XI_RECEIVER,GAMMA_RECEIVER,           &
     &STATION_NAME,NETWORK_NAME,X_SOURCE,Z_SOURCE,COORG,KNODS,NGNOD,    &
     &NPGEO,X_FINAL_RECEIVER,Z_FINAL_RECEIVER)
              INTEGER(KIND=4) :: NPGEO
              INTEGER(KIND=4) :: NGNOD
              INTEGER(KIND=4), INTENT(IN) :: NPROC
              INTEGER(KIND=4) :: NREC
              INTEGER(KIND=4) :: NGLOB
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: IBOOL(5,5,NSPEC)
              REAL(KIND=8) :: COORD(2,NGLOB)
              REAL(KIND=8) :: XIGLL(5)
              REAL(KIND=8) :: ZIGLL(5)
              INTEGER(KIND=4) :: NRECLOC
              INTEGER(KIND=4) :: RECLOC(NREC)
              INTEGER(KIND=4), INTENT(INOUT) :: WHICH_PROC_RECEIVER(NREC&
     &)
              INTEGER(KIND=4), INTENT(IN) :: MYRANK
              REAL(KIND=8) :: ST_XVAL(NREC)
              REAL(KIND=8) :: ST_ZVAL(NREC)
              INTEGER(KIND=4) :: ISPEC_SELECTED_REC(NREC)
              REAL(KIND=8) :: XI_RECEIVER(NREC)
              REAL(KIND=8) :: GAMMA_RECEIVER(NREC)
              CHARACTER(LEN=32) :: STATION_NAME(NREC)
              CHARACTER(LEN=8) :: NETWORK_NAME(NREC)
              REAL(KIND=8) :: X_SOURCE
              REAL(KIND=8) :: Z_SOURCE
              REAL(KIND=8) :: COORG(2,NPGEO)
              INTEGER(KIND=4) :: KNODS(NGNOD,NSPEC)
              REAL(KIND=8) :: X_FINAL_RECEIVER(NREC)
              REAL(KIND=8) :: Z_FINAL_RECEIVER(NREC)
            END SUBROUTINE LOCATE_RECEIVERS
          END INTERFACE 
        END MODULE LOCATE_RECEIVERS__genmod
