        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:42 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_GRADIENT_ATTENUATION__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_GRADIENT_ATTENUATION(DISPL_ELASTIC,      &
     &DUX_DXL,DUZ_DXL,DUX_DZL,DUZ_DZL,XIX,XIZ,GAMMAX,GAMMAZ,IBOOL,      &
     &ELASTIC,HPRIME_XX,HPRIME_ZZ,NSPEC,NGLOB)
              INTEGER(KIND=4) :: NGLOB
              INTEGER(KIND=4) :: NSPEC
              REAL(KIND=4) :: DISPL_ELASTIC(3,NGLOB)
              REAL(KIND=4) :: DUX_DXL(5,5,NSPEC)
              REAL(KIND=4) :: DUZ_DXL(5,5,NSPEC)
              REAL(KIND=4) :: DUX_DZL(5,5,NSPEC)
              REAL(KIND=4) :: DUZ_DZL(5,5,NSPEC)
              REAL(KIND=4) :: XIX(5,5,NSPEC)
              REAL(KIND=4) :: XIZ(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAX(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAZ(5,5,NSPEC)
              INTEGER(KIND=4) :: IBOOL(5,5,NSPEC)
              LOGICAL(KIND=4) :: ELASTIC(NSPEC)
              REAL(KIND=4) :: HPRIME_XX(5,5)
              REAL(KIND=4) :: HPRIME_ZZ(5,5)
            END SUBROUTINE COMPUTE_GRADIENT_ATTENUATION
          END INTERFACE 
        END MODULE COMPUTE_GRADIENT_ATTENUATION__genmod
