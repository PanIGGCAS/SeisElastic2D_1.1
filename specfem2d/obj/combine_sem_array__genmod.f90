        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:08 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMBINE_SEM_ARRAY__genmod
          INTERFACE 
            SUBROUTINE COMBINE_SEM_ARRAY(KERNEL_NAME,KERNEL_PATHS,      &
     &OUTPUT_DIR,NPATH,NSPEC,MYRANK)
              CHARACTER(LEN=1023) :: KERNEL_NAME
              CHARACTER(LEN=1023) :: KERNEL_PATHS(65535)
              CHARACTER(LEN=1023) :: OUTPUT_DIR
              INTEGER(KIND=4) :: NPATH
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: MYRANK
            END SUBROUTINE COMBINE_SEM_ARRAY
          END INTERFACE 
        END MODULE COMBINE_SEM_ARRAY__genmod
