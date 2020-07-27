        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:40 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_FORCES_VISCOELASTIC_BACKWARD__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_FORCES_VISCOELASTIC_BACKWARD(            &
     &B_ACCEL_ELASTIC,B_DISPL_ELASTIC,B_DISPL_ELASTIC_OLD,              &
     &PML_BOUNDARY_CONDITIONS,E1,E11,E13)
              USE SPECFEM_PAR, ONLY :                                   &
     &          P_SV,                                                   &
     &          NGLOB,                                                  &
     &          NSPEC,                                                  &
     &          NELEMABS,                                               &
     &          IT,                                                     &
     &          NSTEP,                                                  &
     &          ASSIGN_EXTERNAL_MODEL,                                  &
     &          ATTENUATION_VISCOELASTIC_SOLID,                         &
     &          NSPEC_ALLOCATE,                                         &
     &          N_SLS,                                                  &
     &          IBOOL,                                                  &
     &          KMATO,                                                  &
     &          NUMABS,                                                 &
     &          ELASTIC,                                                &
     &          CODEABS,                                                &
     &          POROELASTCOEF,                                          &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          VPEXT,                                                  &
     &          VSEXT,                                                  &
     &          RHOEXT,                                                 &
     &          C11EXT,                                                 &
     &          C13EXT,                                                 &
     &          C15EXT,                                                 &
     &          C33EXT,                                                 &
     &          C35EXT,                                                 &
     &          C55EXT,                                                 &
     &          C12EXT,                                                 &
     &          C23EXT,                                                 &
     &          C25EXT,                                                 &
     &          ANISOTROPIC,                                            &
     &          ANISOTROPY,                                             &
     &          E1_LDDRK,                                               &
     &          E11_LDDRK,                                              &
     &          E13_LDDRK,                                              &
     &          ALPHA_LDDRK,                                            &
     &          BETA_LDDRK,                                             &
     &          E1_INITIAL_RK,                                          &
     &          E11_INITIAL_RK,                                         &
     &          E13_INITIAL_RK,                                         &
     &          E1_FORCE_RK,                                            &
     &          E11_FORCE_RK,                                           &
     &          E13_FORCE_RK,                                           &
     &          HPRIME_XX,                                              &
     &          HPRIMEWGLL_XX,                                          &
     &          HPRIME_ZZ,                                              &
     &          HPRIMEWGLL_ZZ,                                          &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          AXISYM,                                                 &
     &          IS_ON_THE_AXIS,                                         &
     &          HPRIMEBAR_XX,                                           &
     &          HPRIMEBARWGLJ_XX,                                       &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          INV_TAU_SIGMA_NU1,                                      &
     &          PHI_NU1,                                                &
     &          INV_TAU_SIGMA_NU2,                                      &
     &          PHI_NU2,                                                &
     &          DELTAT,                                                 &
     &          COORD,                                                  &
     &          B_ABSORB_ELASTIC_LEFT,                                  &
     &          B_ABSORB_ELASTIC_RIGHT,                                 &
     &          B_ABSORB_ELASTIC_BOTTOM,                                &
     &          B_ABSORB_ELASTIC_TOP,                                   &
     &          IB_LEFT,                                                &
     &          IB_RIGHT,                                               &
     &          IB_BOTTOM,                                              &
     &          IB_TOP,                                                 &
     &          STAGE_TIME_SCHEME,                                      &
     &          I_STAGE,                                                &
     &          IS_PML,                                                 &
     &          STACEY_BOUNDARY_CONDITIONS,                             &
     &          ACOUSTIC
              REAL(KIND=4) :: B_ACCEL_ELASTIC(3,NGLOB)
              REAL(KIND=4) :: B_DISPL_ELASTIC(3,NGLOB)
              REAL(KIND=4) :: B_DISPL_ELASTIC_OLD(3,NGLOB)
              LOGICAL(KIND=4) :: PML_BOUNDARY_CONDITIONS
              REAL(KIND=4) :: E1(5,5,NSPEC_ALLOCATE,N_SLS)
              REAL(KIND=4) :: E11(5,5,NSPEC_ALLOCATE,N_SLS)
              REAL(KIND=4) :: E13(5,5,NSPEC_ALLOCATE,N_SLS)
            END SUBROUTINE COMPUTE_FORCES_VISCOELASTIC_BACKWARD
          END INTERFACE 
        END MODULE COMPUTE_FORCES_VISCOELASTIC_BACKWARD__genmod
