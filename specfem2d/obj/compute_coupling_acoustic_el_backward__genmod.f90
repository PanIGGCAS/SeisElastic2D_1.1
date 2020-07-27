        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:30 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_COUPLING_ACOUSTIC_EL_BACKWARD__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL_BACKWARD(           &
     &B_DISPL_ELASTIC,B_POTENTIAL_DOT_DOT_ACOUSTIC)
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
     &          NGLOB_ACOUSTIC,                                         &
     &          NGLOB_ELASTIC
              REAL(KIND=4) :: B_DISPL_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: B_POTENTIAL_DOT_DOT_ACOUSTIC(             &
     &NGLOB_ACOUSTIC)
            END SUBROUTINE COMPUTE_COUPLING_ACOUSTIC_EL_BACKWARD
          END INTERFACE 
        END MODULE COMPUTE_COUPLING_ACOUSTIC_EL_BACKWARD__genmod
