        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:08 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PARSE_KERNEL_NAMES__genmod
          INTERFACE 
            SUBROUTINE PARSE_KERNEL_NAMES(KERNEL_NAMES_COMMA_DELIMITED, &
     &KERNEL_NAMES,NKER)
              CHARACTER(LEN=1023), INTENT(IN) ::                        &
     &KERNEL_NAMES_COMMA_DELIMITED
              CHARACTER(LEN=1023), INTENT(INOUT) :: KERNEL_NAMES(255)
              INTEGER(KIND=4), INTENT(OUT) :: NKER
            END SUBROUTINE PARSE_KERNEL_NAMES
          END INTERFACE 
        END MODULE PARSE_KERNEL_NAMES__genmod
