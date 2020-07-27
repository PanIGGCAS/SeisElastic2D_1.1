        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:24 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SHIFT_VELOCITIES_FROM_F0__genmod
          INTERFACE 
            SUBROUTINE SHIFT_VELOCITIES_FROM_F0(VP,VS,RHO,MU,LAMBDA)
              REAL(KIND=8), INTENT(INOUT) :: VP
              REAL(KIND=8), INTENT(INOUT) :: VS
              REAL(KIND=8), INTENT(IN) :: RHO
              REAL(KIND=8), INTENT(OUT) :: MU
              REAL(KIND=8), INTENT(OUT) :: LAMBDA
            END SUBROUTINE SHIFT_VELOCITIES_FROM_F0
          END INTERFACE 
        END MODULE SHIFT_VELOCITIES_FROM_F0__genmod
