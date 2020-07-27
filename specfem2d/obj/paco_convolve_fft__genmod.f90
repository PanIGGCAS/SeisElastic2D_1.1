        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:06 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PACO_CONVOLVE_FFT__genmod
          INTERFACE 
            SUBROUTINE PACO_CONVOLVE_FFT(FIELD,LABEL,NSTEP,DT,NFREC,    &
     &OUTPUT_FIELD,TP,TS)
              INTEGER(KIND=4) :: NFREC
              INTEGER(KIND=4) :: NSTEP
              COMPLEX(KIND=8) :: FIELD(NFREC+1)
              INTEGER(KIND=4) :: LABEL
              REAL(KIND=8) :: DT
              REAL(KIND=8) :: OUTPUT_FIELD(NSTEP)
              REAL(KIND=8) :: TP
              REAL(KIND=8) :: TS
            END SUBROUTINE PACO_CONVOLVE_FFT
          END INTERFACE 
        END MODULE PACO_CONVOLVE_FFT__genmod
