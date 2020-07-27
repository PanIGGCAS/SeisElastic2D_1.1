        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:51 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GET_POROELASTIC_VELOCITIES__genmod
          INTERFACE 
            SUBROUTINE GET_POROELASTIC_VELOCITIES(CPISQUARE,CPIISQUARE, &
     &CSSQUARE,H_BIOT,C_BIOT,M_BIOT,MUL_FR,PHIL,TORTL,RHOL_S,RHOL_F,    &
     &ETAL_F,PERM,FI,F0,Q0,W_C,ATTENUATION_PORO_FLUID_PART)
              REAL(KIND=8) :: CPISQUARE
              REAL(KIND=8) :: CPIISQUARE
              REAL(KIND=8) :: CSSQUARE
              REAL(KIND=8) :: H_BIOT
              REAL(KIND=8) :: C_BIOT
              REAL(KIND=8) :: M_BIOT
              REAL(KIND=8) :: MUL_FR
              REAL(KIND=8) :: PHIL
              REAL(KIND=8) :: TORTL
              REAL(KIND=8) :: RHOL_S
              REAL(KIND=8) :: RHOL_F
              REAL(KIND=8) :: ETAL_F
              REAL(KIND=8) :: PERM
              REAL(KIND=8) :: FI
              REAL(KIND=8) :: F0
              REAL(KIND=8) :: Q0
              REAL(KIND=8) :: W_C
              LOGICAL(KIND=4) :: ATTENUATION_PORO_FLUID_PART
            END SUBROUTINE GET_POROELASTIC_VELOCITIES
          END INTERFACE 
        END MODULE GET_POROELASTIC_VELOCITIES__genmod
