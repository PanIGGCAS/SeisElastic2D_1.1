        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:20 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE VALUE_SPLINE__genmod
          INTERFACE 
            FUNCTION VALUE_SPLINE(X,XINTERFACE,ZINTERFACE,              &
     &COEFS_INTERFACE,NPOINTS_INTERFACE)
              INTEGER(KIND=4) :: NPOINTS_INTERFACE
              REAL(KIND=8) :: X
              REAL(KIND=8) :: XINTERFACE(NPOINTS_INTERFACE)
              REAL(KIND=8) :: ZINTERFACE(NPOINTS_INTERFACE)
              REAL(KIND=8) :: COEFS_INTERFACE(NPOINTS_INTERFACE)
              REAL(KIND=8) :: VALUE_SPLINE
            END FUNCTION VALUE_SPLINE
          END INTERFACE 
        END MODULE VALUE_SPLINE__genmod
