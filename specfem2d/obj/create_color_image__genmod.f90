        !COMPILER-GENERATED INTERFACE MODULE: Fri May 22 16:58:46 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CREATE_COLOR_IMAGE__genmod
          INTERFACE 
            SUBROUTINE CREATE_COLOR_IMAGE
              USE SPECFEM_PAR, ONLY :                                   &
     &          IMAGE_COLOR_DATA,                                       &
     &          IGLOB_IMAGE_COLOR,                                      &
     &          NX_IMAGE_COLOR,                                         &
     &          NZ_IMAGE_COLOR,                                         &
     &          IT,                                                     &
     &          ISNAPSHOT_NUMBER,                                       &
     &          CUTSNAPS,                                               &
     &          IMAGE_COLOR_VP_DISPLAY,                                 &
     &          USE_SNAPSHOT_NUMBER_IN_FILENAME,                        &
     &          POWER_DISPLAY_COLOR,                                    &
     &          DRAW_SOURCES_AND_RECEIVERS,                             &
     &          NSOURCES,                                               &
     &          P_SV,                                                   &
     &          NREC,                                                   &
     &          IX_IMAGE_COLOR_SOURCE,                                  &
     &          IY_IMAGE_COLOR_SOURCE,                                  &
     &          IX_IMAGE_COLOR_RECEIVER,                                &
     &          IY_IMAGE_COLOR_RECEIVER,                                &
     &          USE_CONSTANT_MAX_AMPLITUDE,                             &
     &          CONSTANT_MAX_AMPLITUDE_TO_USE
            END SUBROUTINE CREATE_COLOR_IMAGE
          END INTERFACE 
        END MODULE CREATE_COLOR_IMAGE__genmod
