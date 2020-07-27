        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:29 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_ARRAYS_SOURCE__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_ARRAYS_SOURCE(ISPEC_SELECTED_SOURCE,     &
     &XI_SOURCE,GAMMA_SOURCE,SOURCEARRAY,MXX,MZZ,MXZ,XIX,XIZ,GAMMAX,    &
     &GAMMAZ,XIGLL,ZIGLL,NSPEC)
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: ISPEC_SELECTED_SOURCE
              REAL(KIND=8) :: XI_SOURCE
              REAL(KIND=8) :: GAMMA_SOURCE
              REAL(KIND=4) :: SOURCEARRAY(2,5,5)
              REAL(KIND=8) :: MXX
              REAL(KIND=8) :: MZZ
              REAL(KIND=8) :: MXZ
              REAL(KIND=4) :: XIX(5,5,NSPEC)
              REAL(KIND=4) :: XIZ(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAX(5,5,NSPEC)
              REAL(KIND=4) :: GAMMAZ(5,5,NSPEC)
              REAL(KIND=8) :: XIGLL(5)
              REAL(KIND=8) :: ZIGLL(5)
            END SUBROUTINE COMPUTE_ARRAYS_SOURCE
          END INTERFACE 
        END MODULE COMPUTE_ARRAYS_SOURCE__genmod
