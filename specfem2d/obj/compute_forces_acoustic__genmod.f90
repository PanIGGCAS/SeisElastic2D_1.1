        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:31 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_ACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_ACOUSTIC(                         &
     &POTENTIAL_DOT_DOT_ACOUSTIC,POTENTIAL_DOT_ACOUSTIC,                &
     &POTENTIAL_ACOUSTIC,POTENTIAL_ACOUSTIC_OLD,PML_BOUNDARY_CONDITIONS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          NELEMABS,                                               &
     &          IT,                                                     &
     &          ANYABS,                                                 &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          NUMABS,                                                 &
     &          ACOUSTIC,                                               &
     &          CODEABS,                                                &
     &          CODEABS_CORNER,                                         &
     &          STAGE_TIME_SCHEME,                                      &
     &          I_STAGE,                                                &
     &          DENSITY,                                                &
     &          POROELASTCOEF,                                          &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          VPEXT,                                                  &
     &          RHOEXT,                                                 &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          AXISYM,                                                 &
     &          COORD,                                                  &
     &          IS_ON_THE_AXIS,                                         &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIMEBARWGLJ_XX,                                       &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          IBEGIN_EDGE1,                                           &
     &          IEND_EDGE1,                                             &
     &          IBEGIN_EDGE3,                                           &
     &          IEND_EDGE3,                                             &
     &          IBEGIN_EDGE4,                                           &
     &          IEND_EDGE4,                                             &
     &          IBEGIN_EDGE2,                                           &
     &          IEND_EDGE2,                                             &
     &          SAVE_FORWARD,                                           &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          B_ABSORB_ACOUSTIC_LEFT,                                 &
     &          B_ABSORB_ACOUSTIC_RIGHT,                                &
     &          B_ABSORB_ACOUSTIC_BOTTOM,                               &
     &          B_ABSORB_ACOUSTIC_TOP,                                  &
     &          IS_PML,                                                 &
     &          NSPEC_PML,                                              &
     &          SPEC_TO_PML,                                            &
     &          REGION_CPML,                                            &
     &          K_X_STORE,                                              &
     &          K_Z_STORE,                                              &
     &          D_X_STORE,                                              &
     &          D_Z_STORE,                                              &
     &          ALPHA_X_STORE,                                          &
     &          ALPHA_Z_STORE,                                          &
     &          RMEMORY_POTENTIAL_ACOUSTIC,                             &
     &          RMEMORY_ACOUSTIC_DUX_DX,                                &
     &          RMEMORY_ACOUSTIC_DUX_DZ,                                &
     &          RMEMORY_POTENTIAL_ACOUSTIC_LDDRK,                       &
     &          ALPHA_LDDRK,                                            &
     &          BETA_LDDRK,                                             &
     &          C_LDDRK,                                                &
     &          RMEMORY_ACOUSTIC_DUX_DX_LDDRK,                          &
     &          RMEMORY_ACOUSTIC_DUX_DZ_LDDRK,                          &
     &          DELTAT,                                                 &
     &          STACEY_BOUNDARY_CONDITIONS
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_DOT_ACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_ACOUSTIC(NGLOB)
              REAL(KIND=4) :: POTENTIAL_ACOUSTIC_OLD(NGLOB)
              LOGICAL(KIND=4) :: PML_BOUNDARY_CONDITIONS
            END SUBROUTINE COMPUTE_FORCES_ACOUSTIC
          END INTERFACE 
        END MODULE COMPUTE_FORCES_ACOUSTIC__genmod
