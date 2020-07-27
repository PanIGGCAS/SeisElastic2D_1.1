        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:19 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SAVE_GNUPLOT_FILE__genmod
          INTERFACE 
            SUBROUTINE SAVE_GNUPLOT_FILE(NGNOD,NX,NZ,X,Z)
              INTEGER(KIND=4) :: NZ
              INTEGER(KIND=4) :: NX
              INTEGER(KIND=4) :: NGNOD
              REAL(KIND=8) :: X(0:NX,0:NZ)
              REAL(KIND=8) :: Z(0:NX,0:NZ)
            END SUBROUTINE SAVE_GNUPLOT_FILE
          END INTERFACE 
        END MODULE SAVE_GNUPLOT_FILE__genmod
