#include "common.h"

ApiStatus _show_message(ScriptInstance* script, s32 isInitialCall, s32 arg2);

ApiStatus SpeakToPlayer(ScriptInstance* script, s32 isInitialCall) {
    return _show_message(script, isInitialCall, 0);
}

ApiStatus EndSpeech(ScriptInstance* script, s32 isInitialCall) {
    return _show_message(script, isInitialCall, 1);
}

ApiStatus ContinueSpeech(ScriptInstance* script, s32 isInitialCall) {
    return _show_message(script, isInitialCall, 2);
}

ApiStatus SpeakToNpc(ScriptInstance* script, s32 isInitialCall) {
    return _show_message(script, isInitialCall, 3);
}

ApiStatus _show_message(ScriptInstance *script, s32 isInitialCall, s32 messageType) {
    Npc *temp_s0_9;
    Npc *phi_s0_2;
    f32 *phi_s1;
    s32 phi_a1;
    Npc *phi_s5 = NULL;
    s32 outX;
    s32 outY;
    s32 outZ;
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode* curPos = script->ptrReadPos;


    if (isInitialCall) {
        s32 temp_s0_7;
        s32 temp_s0_8;
        s32 temp_fp;
        f32 yaw;
        s32* temp_802DAE50;
        s32* temp_802DAE54;
        s32* temp_802DB264 = &D_802DB264;

        *temp_802DB264 = 0;
        temp_fp = get_variable(script, *curPos++);
        script->varTable[13] = get_variable(script, *curPos++);
        script->varTable[14] = get_variable(script, *curPos++);
        script->functionTemp[1].s = get_variable(script, *curPos++);
        temp_802DAE54 = &D_802DAE54;
        temp_802DAE50 = &D_802DAE50;
        *temp_802DAE54 = 0;
        *temp_802DAE50 = 0;
        if (script->functionTemp[1].s & 0x100) {
            *temp_802DAE50 = get_variable(script, *curPos++);
            *temp_802DAE54 = get_variable(script, *curPos++);
        }

        switch(messageType) {
            case 0:
                gCurrentPrintContext = load_string(get_variable(script, *curPos++), temp_802DB264);
                break;
            case 1:
                close_message(gCurrentPrintContext);
                break;
            case 2:
                load_message_to_printer(get_variable(script, *curPos++), gCurrentPrintContext);
                break;
            case 3:
                temp_s0_7 = get_variable(script, *curPos++);
                temp_s0_8 = get_variable(script, *curPos++);
                phi_s5 = resolve_npc(script, temp_s0_7);
                gCurrentPrintContext = load_string(temp_s0_8, temp_802DB264);
                break;
        }

        if (temp_fp == -2) {
            get_screen_coords(gCurrentCameraID, playerStatus->position.x, playerStatus->position.y + playerStatus->colliderHeight, playerStatus->position.z, &outX, &outY, &outZ);
            script->functionTemp[3].s = playerStatus->anim;
            yaw = playerStatus->targetYaw;
            phi_s0_2 = -2;
        } else {
            s32* currentCameraID = &gCurrentCameraID;
            Npc* temp_v0 = resolve_npc(script, temp_fp);
            get_screen_coords(*currentCameraID, temp_v0->pos.x, temp_v0->pos.y + temp_v0->collisionHeight, temp_v0->pos.z, &outX, &outY, &outZ);
            script->functionTemp[3].s = temp_v0->currentAnim;
            yaw = temp_v0->yaw;
            phi_s0_2 = temp_v0;
        }

        script->varTable[15] = yaw;
        clamp_printer_coords(gCurrentPrintContext, outX + D_802DAE50, outY + D_802DAE54);
        script->varTable[12] = phi_s0_2;

        if (script->varTable[12] != -2) {
            f32 temp_f0;
            f32 temp_f20;

            if (messageType == 3) {
                phi_s1 = &phi_s5->yaw;
                temp_f20 = atan2(phi_s0_2->pos.x, phi_s0_2->pos.z, phi_s5->pos.x, phi_s5->pos.z);
            } else {
                phi_s1 = &playerStatus->targetYaw;
                temp_f20 = atan2(phi_s0_2->pos.x, phi_s0_2->pos.z, playerStatus->position.x, playerStatus->position.z);
            }

            temp_f0 = clamp_angle(temp_f20 + 180.0f);

            switch(script->functionTemp[1].s & 0xF) {
                case 0:
                    phi_s0_2->yaw = temp_f20;
                    *phi_s1 = temp_f0;
                    break;
                case 1:
                    phi_s0_2->yaw = temp_f0;
                    *phi_s1 = temp_f0;
                    break;
                case 2:
                    phi_s0_2->yaw = temp_f20;
                    *phi_s1 = temp_f20;
                    break;
                case 3:
                    phi_s0_2->yaw = temp_f0;
                    *phi_s1 = temp_f20;
                    break;
                case 4:
                    phi_s0_2->yaw = temp_f20;
                    break;
                case 5:
                    break;
            }
        }
    }

    temp_s0_9 = script->varTable[12];
    if (temp_s0_9 != -2) {
        s32* currentCameraID = &gCurrentCameraID;
        get_screen_coords(*currentCameraID, temp_s0_9->pos.x, temp_s0_9->pos.y + temp_s0_9->collisionHeight, temp_s0_9->pos.z, &outX, &outY, &outZ);
        if (script->varTable[13] != -1) {
            phi_a1 = script->varTable[13];
            if ((gCurrentPrintContext->stateFlags & 0x80) == 0) {
                phi_a1 = script->varTable[14];
            }
            set_npc_animation(temp_s0_9, phi_a1);
        }
    } else {
        get_screen_coords(gCurrentCameraID, playerStatus->position.x, playerStatus->position.y + playerStatus->colliderHeight, playerStatus->position.z, &outX, &outY, &outZ);
        if (script->varTable[13] != -1) {
            if (gCurrentPrintContext->stateFlags & 0x80) {
                playerStatus->anim = script->varTable[13];
            } else {
                playerStatus->anim = script->varTable[14];
            }
        }
    }

    if (!(script->functionTemp[1].s & 0x200)) {
        clamp_printer_coords(gCurrentPrintContext, outX + D_802DAE50, outY + D_802DAE54);
    }

    if (!(gCurrentPrintContext->stateFlags & 0x40)) {
        if (D_802DB264 == 1) {
            if (script->varTable[13] != -1) {
                if (temp_s0_9 != -2) {
                    set_npc_animation(temp_s0_9, script->functionTemp[3].s);
                } else {
                    playerStatus->anim = script->functionTemp[3].s;
                }
            }
            if (script->functionTemp[1].s & 0x10) {
                temp_s0_9->yaw = script->varTable[15];
            }
            return ApiStatus_DONE1;
        }
        return ApiStatus_BLOCK;
    }
    return ApiStatus_DONE1;
}

ApiStatus ShowMessageAtScreenPos(ScriptInstance *script, s32 isInitialCall) {
    Bytecode *curPos;

    curPos = script->ptrReadPos;
    if (isInitialCall != 0) {
        s32 stringID = get_variable(script, *curPos++);
        s32 x = get_variable(script, *curPos++);
        s32 y = get_variable(script, *curPos++);
        s32* temp_802DB264 = &D_802DB264;
        *temp_802DB264 = 0;
        gCurrentPrintContext = load_string(stringID, temp_802DB264);
        clamp_printer_coords(gCurrentPrintContext, x, y);
    }

    if ((gCurrentPrintContext->stateFlags & 0x40)){
        return ApiStatus_DONE1;
    } 
    
    if (D_802DB264 != 1) {
        return ApiStatus_BLOCK;
    }

    script->varTable[0] = gCurrentPrintContext->unk_4E8;
    return ApiStatus_DONE1;
}


ApiStatus ShowMessageAtWorldPos(ScriptInstance *script, s32 isInitialCall) {
    Bytecode *curPos;

    curPos = script->ptrReadPos;
    if (isInitialCall != 0) {
        s32 xOut;
        s32 yOut;
        s32 zOut;
        s32 stringID = get_variable(script, *curPos++);
        s32 x = get_variable(script, *curPos++);
        s32 y = get_variable(script, *curPos++);
        s32 z = get_variable(script, *curPos++);
        PrintContext** currentPrintContext = &gCurrentPrintContext;
        s32* currentCameraID = &gCurrentCameraID;
        s32* temp_802DB264 = &D_802DB264;

        *temp_802DB264 = 0;
        *currentPrintContext = load_string(stringID, temp_802DB264);
        get_screen_coords(*currentCameraID, x, y, z, &xOut, &yOut, &zOut);
        clamp_printer_coords(*currentPrintContext, xOut, yOut);
    }

    if ((gCurrentPrintContext->stateFlags & 0x40)){
        return ApiStatus_DONE1;
    } 
    
    if (D_802DB264 != 1) {
        return ApiStatus_BLOCK;
    }

    script->varTable[0] = gCurrentPrintContext->unk_4E8;
    return ApiStatus_DONE1;
}

ApiStatus CloseMessage(ScriptInstance* script, s32 isInitialCall) {
    if (isInitialCall) {
        close_message(gCurrentPrintContext);
    }

    if (gCurrentPrintContext->stateFlags & 0x40) {
        return ApiStatus_DONE1;
    } else if (D_802DB264 != 1) {
        return ApiStatus_BLOCK;
    } else {
        script->varTable[0] = gCurrentPrintContext->unk_4E8;
        return ApiStatus_DONE1;
    }
}

ApiStatus SwitchMessage(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;

    if (isInitialCall) {
        load_message_to_printer(get_variable(script, *args), gCurrentPrintContext);
    }

    if (gCurrentPrintContext->stateFlags & 0x40) {
        return ApiStatus_DONE1;
    } else if (D_802DB264 != 1) {
        return ApiStatus_BLOCK;
    } else {
        script->varTable[0] = gCurrentPrintContext->unk_4E8;
        return ApiStatus_DONE1;
    }
}

s32 ShowChoice(ScriptInstance *script, s32 isInitialCall) {
    s32 temp_a0;
    u8 temp_v0;
    PrintContext** context;
    Bytecode* curPos = script->ptrReadPos;

    if (isInitialCall != 0) {
        s32 temp_a0 = get_variable(script, *curPos++);

        script->functionTemp[1].s = 0;
        D_802DB268 = load_string(temp_a0, &script->functionTemp[1].s);
    }

    context = &D_802DB268;
    script->varTable[0] = gCurrentPrintContext->unk_4E8 = (*context)->unk_4E8;
    if (((*context)->stateFlags & 0x40)) {
        return ApiStatus_DONE1;
    }
    return script->functionTemp[1].s == ApiStatus_DONE1;
}

ApiStatus CloseChoice(ScriptInstance* script, s32 isInitialCall) {
    close_message(D_802DB268);
    return ApiStatus_DONE1;
}

ApiStatus CancelMessage(ScriptInstance* script, s32 isInitialCall) {
    cancel_message(gCurrentPrintContext);
    return ApiStatus_DONE2;
}

ApiStatus CancelMessageAndBlock(ScriptInstance* script, s32 isInitialCall) {
    cancel_message(gCurrentPrintContext);
    return ApiStatus_BLOCK;
}

ApiStatus SetMessageImages(ScriptInstance* script, s32 isInitialCall) {
    set_message_images(*script->ptrReadPos);
    return ApiStatus_DONE2;
}

ApiStatus func_802D0C94(ScriptInstance* script, s32 initialCall) {
    if (get_variable(script, *script->ptrReadPos) == 0) {
        D_8009A650[0] |= 0x10;
    } else {
        D_8009A650[0] &= ~0x10;
    }
    return ApiStatus_DONE2;
}

ApiStatus SetMessageString(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 string = get_variable(script, *args++);
    s32 index = get_variable(script, *args++);

    set_message_string(string, index);
    return ApiStatus_DONE2;
}

ApiStatus SetMessageValue(ScriptInstance* script, s32 initialCall) {
    Bytecode* ptrReadPos = script->ptrReadPos;
    s32 value = get_variable(script, *ptrReadPos++);
    s32 index = get_variable(script, *ptrReadPos);

    set_message_value(value, index);
    return ApiStatus_DONE2;
}
