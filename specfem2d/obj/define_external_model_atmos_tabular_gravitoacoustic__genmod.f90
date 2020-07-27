        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:47 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE                                                          &
     &DEFINE_EXTERNAL_MODEL_ATMOS_TABULAR_GRAVITOACOUSTIC__genmod
          INTERFACE 
            SUBROUTINE                                                  &
     &DEFINE_EXTERNAL_MODEL_ATMOS_TABULAR_GRAVITOACOUSTIC(COORD,        &
     &MATERIAL_ELEMENT,IBOOL,RHO,VP,VS,QKAPPA_ATTENUATION,              &
     &QMU_ATTENUATION,GRAVITY,NSQ,C11,C13,C15,C33,C35,C55,C12,C23,C25,  &
     &NSPEC,NGLOB)
              INTEGER(KIND=4), INTENT(IN) :: NGLOB
              INTEGER(KIND=4), INTENT(IN) :: NSPEC
              REAL(KIND=8), INTENT(IN) :: COORD(2,NGLOB)
              INTEGER(KIND=4), INTENT(IN) :: MATERIAL_ELEMENT(NSPEC)
              INTEGER(KIND=4), INTENT(IN) :: IBOOL(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: RHO(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: VP(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: VS(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: QKAPPA_ATTENUATION(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: QMU_ATTENUATION(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: GRAVITY(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: NSQ(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C11(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C13(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C15(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C33(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C35(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C55(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C12(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C23(5,5,NSPEC)
              REAL(KIND=4), INTENT(OUT) :: C25(5,5,NSPEC)
            END SUBROUTINE                                              &
     &DEFINE_EXTERNAL_MODEL_ATMOS_TABULAR_GRAVITOACOUSTIC
          END INTERFACE 
        END MODULE                                                      &
     &DEFINE_EXTERNAL_MODEL_ATMOS_TABULAR_GRAVITOACOUSTIC__genmod
