        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:30 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_ACOUSTIC_EL__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL(DISPL_ELASTIC,      &
     &DISPL_ELASTIC_OLD,POTENTIAL_DOT_DOT_ACOUSTIC,                     &
     &PML_BOUNDARY_CONDITIONS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NUM_FLUID_SOLID_EDGES,                                  &
     &          IBOOL,                                                  &
     &          WXGLL,                                                  &
     &          WZGLL,                                                  &
     &          XIX,                                                    &
     &          XIZ,                                                    &
     &          GAMMAX,                                                 &
     &          GAMMAZ,                                                 &
     &          JACOBIAN,                                               &
     &          IVALUE,                                                 &
     &          JVALUE,                                                 &
     &          IVALUE_INVERSE,                                         &
     &          JVALUE_INVERSE,                                         &
     &          FLUID_SOLID_ACOUSTIC_ISPEC,                             &
     &          FLUID_SOLID_ACOUSTIC_IEDGE,                             &
     &          FLUID_SOLID_ELASTIC_ISPEC,                              &
     &          FLUID_SOLID_ELASTIC_IEDGE,                              &
     &          AXISYM,                                                 &
     &          COORD,                                                  &
     &          IS_ON_THE_AXIS,                                         &
     &          XIGLJ,                                                  &
     &          WXGLJ,                                                  &
     &          NSPEC_PML,                                              &
     &          K_X_STORE,                                              &
     &          K_Z_STORE,                                              &
     &          D_X_STORE,                                              &
     &          D_Z_STORE,                                              &
     &          ALPHA_X_STORE,                                          &
     &          ALPHA_Z_STORE,                                          &
     &          IS_PML,                                                 &
     &          SPEC_TO_PML,                                            &
     &          REGION_CPML,                                            &
     &          RMEMORY_FSB_DISPL_ELASTIC,                              &
     &          TIMEVAL,                                                &
     &          DELTAT,                                                 &
     &          RMEMORY_FSB_DISPL_ELASTIC_LDDRK,                        &
     &          I_STAGE,                                                &
     &          STAGE_TIME_SCHEME,                                      &
     &          ALPHA_LDDRK,                                            &
     &          BETA_LDDRK,                                             &
     &          NGLOB_ACOUSTIC,                                         &
     &          NGLOB_ELASTIC
              REAL(KIND=4) :: DISPL_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC_OLD(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: POTENTIAL_DOT_DOT_ACOUSTIC(NGLOB_ACOUSTIC)
              LOGICAL(KIND=4) :: PML_BOUNDARY_CONDITIONS
            END SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_ACOUSTIC_EL__genmod
