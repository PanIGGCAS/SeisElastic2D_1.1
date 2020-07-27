        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:08 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE STRTOK__genmod
          INTERFACE 
            SUBROUTINE STRTOK(SOURCE_STRING,DELIMITER,TOKEN)
              CHARACTER(LEN=1023), INTENT(IN) :: SOURCE_STRING
              CHARACTER(LEN=1), INTENT(IN) :: DELIMITER
              CHARACTER(LEN=1023), INTENT(OUT) :: TOKEN
            END SUBROUTINE STRTOK
          END INTERFACE 
        END MODULE STRTOK__genmod
