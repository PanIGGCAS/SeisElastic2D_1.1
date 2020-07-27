        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:06 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE SINTER__genmod
          INTERFACE 
            SUBROUTINE SINTER(V,OUTPUT_FIELD,NSTEP,CR,RAIZ,NFREC,LABEL, &
     &DT)
              INTEGER(KIND=4) :: NFREC
              INTEGER(KIND=4) :: NSTEP
              COMPLEX(KIND=8) :: V(NFREC+1)
              REAL(KIND=8) :: OUTPUT_FIELD(NSTEP)
              COMPLEX(KIND=8) :: CR(2*NFREC)
              REAL(KIND=8) :: RAIZ
              INTEGER(KIND=4) :: LABEL
              REAL(KIND=8) :: DT
            END SUBROUTINE SINTER
          END INTERFACE 
        END MODULE SINTER__genmod
