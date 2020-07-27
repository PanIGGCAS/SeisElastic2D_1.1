        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:33 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_GRAVITOACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_GRAVITOACOUSTIC(                  &
     &POTENTIAL_DOT_DOT_GRAVITOACOUSTIC,POTENTIAL_DOT_GRAVITOACOUSTIC,  &
     &POTENTIAL_GRAVITOACOUSTIC,POTENTIAL_DOT_DOT_GRAVITO,              &
     &POTENTIAL_GRAVITO,IS_BACKWARD_FIELD,PML_BOUNDARY_CONDITIONS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          CODEABS,                                                &
     &          GRAVITOACOUSTIC,                                        &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          NELEMABS,                                               &
     &          NUMAT,                                                  &
     &          IT,                                                     &
     &          NSTEP,                                                  &
     &          ANYABS,                                                 &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          NUMABS,                                                 &
     &          RMASS_INVERSE_GRAVITO,                                  &
     &          DENSITY,                                                &
     &          POROELASTCOEF,                                          &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          VPEXT,                                                  &
     &          RHOEXT,                                                 &
     &          GRAVITYEXT,                                             &
     &          NSQEXT,                                                 &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          IBEGIN_EDGE1,                                           &
     &          IEND_EDGE1,                                             &
     &          IBEGIN_EDGE3,                                           &
     &          IEND_EDGE3,                                             &
     &          IBEGIN_EDGE4,                                           &
     &          IEND_EDGE4,                                             &
     &          IBEGIN_EDGE2,                                           &
     &          IEND_EDGE2,                                             &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          NSPEC_LEFT,                                             &
     &          NSPEC_RIGHT,                                            &
     &          NSPEC_BOTTOM,                                           &
     &          NSPEC_TOP,                                              &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          B_ABSORB_ACOUSTIC_LEFT,                                 &
     &          B_ABSORB_ACOUSTIC_RIGHT,                                &
     &          B_ABSORB_ACOUSTIC_BOTTOM,                               &
     &          B_ABSORB_ACOUSTIC_TOP,                                  &
     &          IS_PML
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_GRAVITOACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_DOT_GRAVITOACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_GRAVITOACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_GRAVITO(NGLOB)
              REAL(KIND=4) :: POTENTIAL_GRAVITO(NGLOB)
              LOGICAL(KIND=4) :: IS_BACKWARD_FIELD
              LOGICAL(KIND=4) :: PML_BOUNDARY_CONDITIONS
            END SUBROUTINE COMPUTE_FORCES_GRAVITOACOUSTIC
          END INTERFACE 
        END MODULE COMPUTE_FORCES_GRAVITOACOUSTIC__genmod
