        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:20 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SPLINE_CONSTRUCTION__genmod
          INTERFACE 
            SUBROUTINE SPLINE_CONSTRUCTION(XPOINT,YPOINT,NPOINT,        &
     &TANGENT_FIRST_POINT,TANGENT_LAST_POINT,SPLINE_COEFFICIENTS)
              INTEGER(KIND=4), INTENT(IN) :: NPOINT
              REAL(KIND=8), INTENT(IN) :: XPOINT(NPOINT)
              REAL(KIND=8), INTENT(IN) :: YPOINT(NPOINT)
              REAL(KIND=8), INTENT(IN) :: TANGENT_FIRST_POINT
              REAL(KIND=8), INTENT(IN) :: TANGENT_LAST_POINT
              REAL(KIND=8), INTENT(OUT) :: SPLINE_COEFFICIENTS(NPOINT)
            END SUBROUTINE SPLINE_CONSTRUCTION
          END INTERFACE 
        END MODULE SPLINE_CONSTRUCTION__genmod
