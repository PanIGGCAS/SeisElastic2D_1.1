        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:04 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE POLY_DERIV_GLJ__genmod
          INTERFACE 
            FUNCTION POLY_DERIV_GLJ(I,J,ZGLJ,NZ)
              INTEGER(KIND=4) :: NZ
              INTEGER(KIND=4) :: I
              INTEGER(KIND=4) :: J
              REAL(KIND=8) :: ZGLJ(0:NZ-1)
              REAL(KIND=8) :: POLY_DERIV_GLJ
            END FUNCTION POLY_DERIV_GLJ
          END INTERFACE 
        END MODULE POLY_DERIV_GLJ__genmod
