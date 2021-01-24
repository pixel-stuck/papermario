#include "common.h"
#include "nu/nusys.h"

void gfxRetrace_Callback(void);
void gfxPreNMI_Callback(void);

void boot_main(void) {

    if (osTvType == OS_TV_NTSC) {
        osViSetMode(&osViModeTable[56]);
        osViSetSpecialFeatures(OS_VI_GAMMA_OFF | OS_VI_GAMMA_DITHER_OFF | OS_VI_DIVOT_ON | OS_VI_DITHER_FILTER_ON);
    } else if (osTvType == OS_TV_MPAL) {
        osViSetMode(&osViModeTable[57]);
        osViSetSpecialFeatures(OS_VI_GAMMA_OFF | OS_VI_GAMMA_DITHER_OFF | OS_VI_DIVOT_ON | OS_VI_DITHER_FILTER_ON);
    } else {
        PANIC();
    }
    nuGfxDisplayOff();
    crash_create_monitor();
    func_80025C60();
    nuGfxInitEX2();
    GAME_STATUS->contBitPattern = nuContInit();
    func_8002D160();
    func_802B2000();
    func_802B203C();
    nuGfxFuncSet(gfxRetrace_Callback);
    nuGfxPreNMIFuncSet(gfxPreNMI_Callback);
    {
        // Required to match
        s32* randSeed = &gRandSeed;
        (*randSeed) += osGetCount();
    }
    nuGfxDisplayOn();

    while (TRUE) {}
}

INCLUDE_ASM(void, "code_1370_len_7d0", gfxRetrace_Callback, void);

INCLUDE_ASM(s32, "code_1370_len_7d0", func_80026164);

INCLUDE_ASM(void, "code_1370_len_7d0", gfxPreNMI_Callback, void);
