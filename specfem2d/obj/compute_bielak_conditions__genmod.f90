        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:29 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE COMPUTE_BIELAK_CONDITIONS__genmod
          INTERFACE 
            SUBROUTINE COMPUTE_BIELAK_CONDITIONS(COORD,IGLOB,NGLOB,IT,  &
     &DELTAT,DXUX,DXUZ,DZUX,DZUZ,VELOC_HORIZ,VELOC_VERT,X0_SOURCE,      &
     &Z0_SOURCE,A_PLANE,B_PLANE,C_PLANE,ANGLESOURCE,ANGLESOURCE_REFL,   &
     &C_INC,C_REFL,TIME_OFFSET,F0)
              INTEGER(KIND=4), INTENT(IN) :: NGLOB
              REAL(KIND=8), INTENT(IN) :: COORD(2,NGLOB)
              INTEGER(KIND=4), INTENT(IN) :: IGLOB
              INTEGER(KIND=4), INTENT(IN) :: IT
              REAL(KIND=8), INTENT(IN) :: DELTAT
              REAL(KIND=8), INTENT(OUT) :: DXUX
              REAL(KIND=8), INTENT(OUT) :: DXUZ
              REAL(KIND=8), INTENT(OUT) :: DZUX
              REAL(KIND=8), INTENT(OUT) :: DZUZ
              REAL(KIND=8), INTENT(OUT) :: VELOC_HORIZ
              REAL(KIND=8), INTENT(OUT) :: VELOC_VERT
              REAL(KIND=8) :: X0_SOURCE
              REAL(KIND=8) :: Z0_SOURCE
              REAL(KIND=8) :: A_PLANE(2)
              REAL(KIND=8) :: B_PLANE(2)
              REAL(KIND=8) :: C_PLANE(2)
              REAL(KIND=8) :: ANGLESOURCE
              REAL(KIND=8) :: ANGLESOURCE_REFL
              REAL(KIND=8) :: C_INC
              REAL(KIND=8) :: C_REFL
              REAL(KIND=8) :: TIME_OFFSET
              REAL(KIND=8) :: F0
            END SUBROUTINE COMPUTE_BIELAK_CONDITIONS
          END INTERFACE 
        END MODULE COMPUTE_BIELAK_CONDITIONS__genmod
