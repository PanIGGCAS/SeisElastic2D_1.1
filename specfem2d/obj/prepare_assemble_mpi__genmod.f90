        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:12 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PREPARE_ASSEMBLE_MPI__genmod
          INTERFACE 
            SUBROUTINE PREPARE_ASSEMBLE_MPI
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSPEC,                                                  &
     &          IBOOL,                                                  &
     &          KNODS,                                                  &
     &          NGNOD,                                                  &
     &          NGLOB,                                                  &
     &          ELASTIC,                                                &
     &          POROELASTIC,                                            &
     &          NINTERFACE,                                             &
     &          MY_NELMNTS_NEIGHBOURS,                                  &
     &          MY_INTERFACES,                                          &
     &          IBOOL_INTERFACES_ACOUSTIC,                              &
     &          IBOOL_INTERFACES_ELASTIC,                               &
     &          IBOOL_INTERFACES_POROELASTIC,                           &
     &          NIBOOL_INTERFACES_ACOUSTIC,                             &
     &          NIBOOL_INTERFACES_ELASTIC,                              &
     &          NIBOOL_INTERFACES_POROELASTIC,                          &
     &          INUM_INTERFACES_ACOUSTIC,                               &
     &          INUM_INTERFACES_ELASTIC,                                &
     &          INUM_INTERFACES_POROELASTIC,                            &
     &          NINTERFACE_ACOUSTIC,                                    &
     &          NINTERFACE_ELASTIC,                                     &
     &          NINTERFACE_POROELASTIC,                                 &
     &          MASK_ISPEC_INNER_OUTER,                                 &
     &          NIBOOL_INTERFACES_EXT_MESH,                             &
     &          IBOOL_INTERFACES_EXT_MESH_INIT
            END SUBROUTINE PREPARE_ASSEMBLE_MPI
          END INTERFACE 
        END MODULE PREPARE_ASSEMBLE_MPI__genmod
