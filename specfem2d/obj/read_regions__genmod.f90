        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:18 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE READ_REGIONS__genmod
          INTERFACE 
            SUBROUTINE READ_REGIONS(NBREGION,NB_MATERIALS,ICODEMAT,CP,CS&
     &,RHO_S,QKAPPA,QMU,ANISO3,ANISO4,ANISO5,ANISO6,ANISO7,ANISO8,ANISO9&
     &,ANISO10,ANISO11,NELMNTS,NUM_MATERIAL,NXREAD,NZREAD)
              INTEGER(KIND=4) :: NELMNTS
              INTEGER(KIND=4) :: NB_MATERIALS
              INTEGER(KIND=4) :: NBREGION
              INTEGER(KIND=4) :: ICODEMAT(NB_MATERIALS)
              REAL(KIND=8) :: CP(NB_MATERIALS)
              REAL(KIND=8) :: CS(NB_MATERIALS)
              REAL(KIND=8) :: RHO_S(NB_MATERIALS)
              REAL(KIND=8) :: QKAPPA(NB_MATERIALS)
              REAL(KIND=8) :: QMU(NB_MATERIALS)
              REAL(KIND=8) :: ANISO3(NB_MATERIALS)
              REAL(KIND=8) :: ANISO4(NB_MATERIALS)
              REAL(KIND=8) :: ANISO5(NB_MATERIALS)
              REAL(KIND=8) :: ANISO6(NB_MATERIALS)
              REAL(KIND=8) :: ANISO7(NB_MATERIALS)
              REAL(KIND=8) :: ANISO8(NB_MATERIALS)
              REAL(KIND=8) :: ANISO9(NB_MATERIALS)
              REAL(KIND=8) :: ANISO10(NB_MATERIALS)
              REAL(KIND=8) :: ANISO11(NB_MATERIALS)
              INTEGER(KIND=4) :: NUM_MATERIAL(NELMNTS)
              INTEGER(KIND=4) :: NXREAD
              INTEGER(KIND=4) :: NZREAD
            END SUBROUTINE READ_REGIONS
          END INTERFACE 
        END MODULE READ_REGIONS__genmod
