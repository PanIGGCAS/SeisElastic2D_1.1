        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:59:54 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE WRITE_OUTPUT_SU__genmod
          INTERFACE 
            SUBROUTINE WRITE_OUTPUT_SU(X_SOURCE,Z_SOURCE,IREC,          &
     &BUFFER_BINARY,NUMBER_OF_COMPONENTS)
              USE SPECFEM_PAR, ONLY :                                   &
     &          NSTEP,                                                  &
     &          NREC,                                                   &
     &          DELTAT,                                                 &
     &          SEISMOTYPE,                                             &
     &          ST_XVAL,                                                &
     &          NSTEP_BETWEEN_OUTPUT_SEISMOS,                           &
     &          SEISMO_OFFSET,                                          &
     &          SEISMO_CURRENT,                                         &
     &          P_SV,                                                   &
     &          ST_ZVAL,                                                &
     &          SUBSAMP_SEISMOS
              INTEGER(KIND=4) :: NUMBER_OF_COMPONENTS
              REAL(KIND=8) :: X_SOURCE
              REAL(KIND=8) :: Z_SOURCE
              INTEGER(KIND=4) :: IREC
              REAL(KIND=8) :: BUFFER_BINARY(NSTEP_BETWEEN_OUTPUT_SEISMOS&
     &/SUBSAMP_SEISMOS,NREC,NUMBER_OF_COMPONENTS)
            END SUBROUTINE WRITE_OUTPUT_SU
          END INTERFACE 
        END MODULE WRITE_OUTPUT_SU__genmod
