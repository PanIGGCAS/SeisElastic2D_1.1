        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:11 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PML_INIT__genmod
          INTERFACE 
            SUBROUTINE PML_INIT
              USE SPECFEM_PAR, ONLY :                                   &
     &          MYRANK,                                                 &
     &          SIMULATION_TYPE,                                        &
     &          SAVE_FORWARD,                                           &
     &          NSPEC,                                                  &
     &          NGLOB,                                                  &
     &          IBOOL,                                                  &
     &          ANYABS,                                                 &
     &          NELEMABS,                                               &
     &          CODEABS,                                                &
     &          NUMABS,                                                 &
     &          NELEM_PML_THICKNESS,                                    &
     &          NSPEC_PML,                                              &
     &          IS_PML,                                                 &
     &          WHICH_PML_ELEM,                                         &
     &          SPEC_TO_PML,                                            &
     &          REGION_CPML,                                            &
     &          IER,                                                    &
     &          PML_INTERIOR_INTERFACE,                                 &
     &          NGLOB_INTERFACE,                                        &
     &          MASK_IBOOL,                                             &
     &          READ_EXTERNAL_MESH
            END SUBROUTINE PML_INIT
          END INTERFACE 
        END MODULE PML_INIT__genmod
