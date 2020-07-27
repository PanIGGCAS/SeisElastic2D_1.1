        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:43 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE RECOMPUTE_JACOBIAN__genmod
          INTERFACE 
            SUBROUTINE RECOMPUTE_JACOBIAN(XI,GAMMA,X,Z,XIX,XIZ,GAMMAX,  &
     &GAMMAZ,JACOBIAN,COORG,KNODS,ISPEC,NGNOD,NSPEC,NPGEO,              &
     &STOP_IF_NEGATIVE_JACOBIAN)
              INTEGER(KIND=4) :: NPGEO
              INTEGER(KIND=4) :: NSPEC
              INTEGER(KIND=4) :: NGNOD
              REAL(KIND=8) :: XI
              REAL(KIND=8) :: GAMMA
              REAL(KIND=8) :: X
              REAL(KIND=8) :: Z
              REAL(KIND=8) :: XIX
              REAL(KIND=8) :: XIZ
              REAL(KIND=8) :: GAMMAX
              REAL(KIND=8) :: GAMMAZ
              REAL(KIND=8) :: JACOBIAN
              REAL(KIND=8) :: COORG(2,NPGEO)
              INTEGER(KIND=4) :: KNODS(NGNOD,NSPEC)
              INTEGER(KIND=4) :: ISPEC
              LOGICAL(KIND=4) :: STOP_IF_NEGATIVE_JACOBIAN
            END SUBROUTINE RECOMPUTE_JACOBIAN
          END INTERFACE 
        END MODULE RECOMPUTE_JACOBIAN__genmod
