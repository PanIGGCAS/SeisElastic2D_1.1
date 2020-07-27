        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 17:00:07 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CREATE_MESH_QUALITY_DATA_2D__genmod
          INTERFACE 
            SUBROUTINE CREATE_MESH_QUALITY_DATA_2D(X,Y,Z,IBOOL,ISPEC,   &
     &NSPEC,NPOIN,NGNOD,EQUIANGLE_SKEWNESS,EDGE_ASPECT_RATIO,           &
     &DIAGONAL_ASPECT_RATIO,DISTMIN,DISTMAX)
              INTEGER(KIND=4) :: NGNOD
              INTEGER(KIND=4) :: NPOIN
              INTEGER(KIND=4) :: NSPEC
              REAL(KIND=8) :: X(NPOIN)
              REAL(KIND=8) :: Y(NPOIN)
              REAL(KIND=8) :: Z(NPOIN)
              INTEGER(KIND=4) :: IBOOL(NGNOD,NSPEC)
              INTEGER(KIND=4) :: ISPEC
              REAL(KIND=8) :: EQUIANGLE_SKEWNESS
              REAL(KIND=8) :: EDGE_ASPECT_RATIO
              REAL(KIND=8) :: DIAGONAL_ASPECT_RATIO
              REAL(KIND=8) :: DISTMIN
              REAL(KIND=8) :: DISTMAX
            END SUBROUTINE CREATE_MESH_QUALITY_DATA_2D
          END INTERFACE 
        END MODULE CREATE_MESH_QUALITY_DATA_2D__genmod
