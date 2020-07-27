        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:06 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DEFINE_SHAPE_FUNCTIONS__genmod
          INTERFACE 
            SUBROUTINE DEFINE_SHAPE_FUNCTIONS(SHAPE2D,DERSHAPE2D,XI,    &
     &GAMMA,NGNOD)
              INTEGER(KIND=4) :: NGNOD
              REAL(KIND=8) :: SHAPE2D(NGNOD)
              REAL(KIND=8) :: DERSHAPE2D(2,NGNOD)
              REAL(KIND=8) :: XI
              REAL(KIND=8) :: GAMMA
            END SUBROUTINE DEFINE_SHAPE_FUNCTIONS
          END INTERFACE 
        END MODULE DEFINE_SHAPE_FUNCTIONS__genmod
