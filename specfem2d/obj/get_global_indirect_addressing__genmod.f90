        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:50 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_GLOBAL_INDIRECT_ADDRESSING__genmod
          INTERFACE 
            SUBROUTINE GET_GLOBAL_INDIRECT_ADDRESSING(NSPEC,NGLOB,IBOOL,&
     &COPY_IBOOL_ORI,INTEGER_MASK_IBOOL)
              INTEGER(KIND=4) :: NGLOB
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: IBOOL(5,5,NSPEC)
              INTEGER(KIND=4) :: COPY_IBOOL_ORI(5,5,NSPEC)
              INTEGER(KIND=4) :: INTEGER_MASK_IBOOL(NGLOB)
            END SUBROUTINE GET_GLOBAL_INDIRECT_ADDRESSING
          END INTERFACE 
        END MODULE GET_GLOBAL_INDIRECT_ADDRESSING__genmod
