        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:52 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IS_IN_CONVEX_QUADRILATERAL__genmod
          INTERFACE 
            SUBROUTINE IS_IN_CONVEX_QUADRILATERAL(ELMNT_COORDS,X_COORD, &
     &Z_COORD,IS_IN)
              REAL(KIND=8) :: ELMNT_COORDS(2,4)
              REAL(KIND=8), INTENT(IN) :: X_COORD
              REAL(KIND=8), INTENT(IN) :: Z_COORD
              LOGICAL(KIND=4), INTENT(OUT) :: IS_IN
            END SUBROUTINE IS_IN_CONVEX_QUADRILATERAL
          END INTERFACE 
        END MODULE IS_IN_CONVEX_QUADRILATERAL__genmod
