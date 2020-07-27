        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:45 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_ELASTIC__genmod
          INTERFACE 
            SUBROUTINE UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_ELASTIC(&
     &DELTAT,DELTATOVER2,DELTATSQUAREOVER2,ACCEL_ELASTIC,VELOC_ELASTIC, &
     &DISPL_ELASTIC,DISPL_ELASTIC_OLD,PML_BOUNDARY_CONDITIONS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NGLOB_ELASTIC,                                          &
     &          ATTENUATION_VISCOELASTIC_SOLID
              REAL(KIND=8) :: DELTAT
              REAL(KIND=8) :: DELTATOVER2
              REAL(KIND=8) :: DELTATSQUAREOVER2
              REAL(KIND=4) :: ACCEL_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: VELOC_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC(3,NGLOB_ELASTIC)
              REAL(KIND=4) :: DISPL_ELASTIC_OLD(3,NGLOB_ELASTIC)
              LOGICAL(KIND=4) :: PML_BOUNDARY_CONDITIONS
            END SUBROUTINE                                              &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_ELASTIC
          END INTERFACE 
        END MODULE                                                      &
     &UPDATE_DISPLACEMENT_PRECONDITION_NEWMARK_ELASTIC__genmod
