#include "common.h"
#include "map.h"

ApiStatus HidePlayerShadow(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 hideShadow = get_variable(script, *args++);

    if (hideShadow) {
        disable_player_shadow();
    } else {
        enable_player_shadow();
    }
    return ApiStatus_DONE2;
}

ApiStatus DisablePlayerPhysics(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 disable = get_variable(script, *args++);

    if (disable) {
        disable_player_static_collisions();
    } else {
        enable_player_static_collisions();
    }
    return ApiStatus_DONE2;
}

ApiStatus DisablePlayerInput(ScriptInstance* script, s32 isInitialCall) {
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode* args = script->ptrReadPos;
    s32 enable = get_variable(script, *args++);

    if (enable) {
        disable_player_input();
        func_800EF628();
        func_800E97B8();
        func_800E984C();
        if (playerStatus->actionState == ActionState_SPIN) {
            playerStatus->animFlags |= 0x40000;
        }
        D_8009A650[0] |= 0x40;
    } else {
        enable_player_input();
        func_800EF600();
        func_800E01DC();
        D_8009A650[0] &= ~0x40;
        func_800E983C();
    }
    return ApiStatus_DONE2;
}

ApiStatus SetPlayerPos(ScriptInstance* script, s32 isInitialCall) {
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode* args = script->ptrReadPos;
    f32 x = get_variable(script, *args++);
    f32 y = get_variable(script, *args++);
    f32 z = get_variable(script, *args++);

    gPlayerNpcPtr->pos.x = x;
    gPlayerNpcPtr->pos.y = y;
    gPlayerNpcPtr->pos.z = z;

    playerStatus->position.x = gPlayerNpcPtr->pos.x;
    playerStatus->position.y = gPlayerNpcPtr->pos.y;
    playerStatus->position.z = gPlayerNpcPtr->pos.z;

    return ApiStatus_DONE2;
}

ApiStatus SetPlayerCollisionSize(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 height = get_variable(script, *args++);
    s32 radius = get_variable(script, *args);
    Npc* player = gPlayerNpcPtr;
    PlayerStatus* playerStatus = &gPlayerStatus;

    player->collisionHeight = height;
    player->collisionRadius = radius;

    playerStatus->colliderHeight = player->collisionHeight;
    playerStatus->colliderDiameter = player->collisionRadius;

    return ApiStatus_DONE2;
}

ApiStatus SetPlayerSpeed(ScriptInstance* script, s32 isInitialCall) {
    gPlayerNpcPtr->moveSpeed = get_float_variable(script, *script->ptrReadPos);
    return ApiStatus_DONE2;
}

ApiStatus SetPlayerJumpscale(ScriptInstance* script, s32 isInitialCall) {
    gPlayerNpcPtr->jumpScale = get_float_variable(script, *script->ptrReadPos);
    return ApiStatus_DONE2;
}

#ifdef NON_MATCHING
ApiStatus SetPlayerAnimation(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    PlayerAnim animation;

    animation = get_variable(script, *args);

    gPlayerNpcPtr->currentAnim = animation;
    gPlayerAnimation = animation;

    if (animation == 0x80003) {
        exec_ShakeCam1(0, 0, 2);
    }

    return ApiStatus_DONE2;
}
#else
INCLUDE_ASM(s32, "code_F5750", SetPlayerAnimation, ScriptInstance* script, s32 isInitialCall);
#endif

ApiStatus SetPlayerActionState(ScriptInstance* script, s32 isInitialCall) {
    set_action_state(get_variable(script, *script->ptrReadPos));
    return ApiStatus_DONE2;
}

ApiStatus SetPlayerAnimationSpeed(ScriptInstance* script, s32 isInitialCall) {
    gPlayerNpcPtr->animationSpeed = get_float_variable(script, *script->ptrReadPos);
    return ApiStatus_DONE2;
}

ApiStatus PlayerMoveTo(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    PlayerStatus* playerStatus = PLAYER_STATUS;

    if (isInitialCall) {
        f32 targetX = get_variable(script, *args++);
        f32 targetZ = get_variable(script, *args++);
        f32 moveSpeed;

        script->functionTemp[0].s = get_variable(script, *args++);
        playerStatus->targetYaw = atan2(playerStatus->position.x, playerStatus->position.z, targetX, targetZ);

        if (script->functionTemp[0].s == 0) {
            script->functionTemp[0].s = dist2D(playerStatus->position.x, playerStatus->position.z, targetX,
                                               targetZ) / gPlayerNpcPtr->moveSpeed;
            moveSpeed = gPlayerNpcPtr->moveSpeed;
        } else {
            moveSpeed = dist2D(playerStatus->position.x, playerStatus->position.z, targetX, targetZ) / script->functionTemp[0].s;
        }
        move_player(script->functionTemp[0].s, playerStatus->targetYaw, moveSpeed);
    }

    // functionTemp 0 is the time left
    script->functionTemp[0].s--;
    return script->functionTemp[0].s < 0;
}

ApiStatus func_802D1270(ScriptInstance *script, s32 isInitialCall) {
    Bytecode* curPos = script->ptrReadPos;
    PlayerStatus* playerStatus = &gPlayerStatus; 

    if (isInitialCall) {
        f32 temp_f0;
        s32 temp_a0;
        f32 temp_f24 = get_variable(script, *curPos++);
        f32 temp_f22 = get_variable(script, *curPos++);
        f32 temp_f20 = get_float_variable(script, *curPos++);

        playerStatus->targetYaw = atan2(playerStatus->position.x, playerStatus->position.z, temp_f24, temp_f22);
        temp_f0 = dist2D(playerStatus->position.x, playerStatus->position.z, temp_f24, temp_f22);
        temp_a0 = (temp_f0 / temp_f20);
        script->functionTemp[0].s = temp_a0;
        move_player(temp_a0, playerStatus->targetYaw, temp_f0 / temp_a0);
    }
    script->functionTemp[0].s--;
    return (script->functionTemp[0].s < 0) * ApiStatus_DONE2;
}

ApiStatus func_802D1380(ScriptInstance *script, s32 isInitialCall) {
    Bytecode* curPos = script->ptrReadPos;
    PlayerStatus* playerStatus = &gPlayerStatus;

    if (isInitialCall) {
        f32 temp_f22 = get_variable(script, *curPos++);
        f32 temp_f20 = get_variable(script, *curPos++);
        Npc** playerNpc = &gPlayerNpcPtr;
        (*playerNpc)->duration = get_variable(script, *curPos++);
        playerStatus->targetYaw = atan2(playerStatus->position.x, playerStatus->position.z, temp_f22, temp_f20);

        if ((*playerNpc)->duration != 0) {
            (*playerNpc)->moveSpeed = dist2D(playerStatus->position.x, playerStatus->position.z, temp_f22, temp_f20) / (f32) (*playerNpc)->duration;
        } else {
            (*playerNpc)->duration = dist2D(playerStatus->position.x, playerStatus->position.z, temp_f22, temp_f20) / (*playerNpc)->moveSpeed;
            if ((*playerNpc)->duration == 0) {
                (*playerNpc)->duration = 1;
            }
        }

        move_player(gPlayerNpcPtr->duration, playerStatus->targetYaw, gPlayerNpcPtr->moveSpeed);
    }
    return ApiStatus_DONE1;
}

f32 func_800E3514(f32 arg0, s32 arg1);

#ifdef NON_MATCHING
// regalloc + small reordering
ApiStatus player_jump(ScriptInstance *script, s32 isInitialCall, s32 arg2) {
    Npc** playerNpc;
    Npc** playerNpc2;
    Npc** playerNpc3;
    f32 dist;
    f32 temp_f0_4;
    f32 temp_f0_5;
    f32 temp_f0_6;
    s32 temp_v0;
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode *curPos = script->ptrReadPos;
    s32 phi_a0;
    f32 temp_f22;
    f32 temp_f24;
    f32 temp_f20;

    if (isInitialCall) {
        script->functionTemp[0].s = 0;
    }

    if (script->functionTemp[0].s == 0) {
        temp_f22 = get_variable(script, *curPos++);
        temp_f24 = get_variable(script, *curPos++);
        temp_f20 = get_variable(script, *curPos++);
        temp_v0 = get_variable(script, *curPos++);
        playerNpc = &gPlayerNpcPtr;
        (*playerNpc)->pos.x = playerStatus->position.x;
        (*playerNpc)->pos.y = playerStatus->position.y;
        (*playerNpc)->pos.z = playerStatus->position.z;
        (*playerNpc)->moveToPos.x = temp_f22;
        (*playerNpc)->moveToPos.z = temp_f20;
        (*playerNpc)->moveToPos.y = temp_f24;
        (*playerNpc)->duration = temp_v0;
        
        (*playerNpc)->yaw = playerStatus->targetYaw;
        dist = dist2D((*playerNpc)->pos.x, (*playerNpc)->pos.y, (*playerNpc)->moveToPos.x, (*playerNpc)->moveToPos.z);
        if (dist > 1.0) {
            (*playerNpc)->yaw = atan2((*playerNpc)->pos.x, (*playerNpc)->pos.z, (*playerNpc)->moveToPos.x, (*playerNpc)->moveToPos.z);
        }

        temp_f24 = ((*playerNpc)->moveToPos.y - (*playerNpc)->pos.y);

        if ((*playerNpc)->duration == 0) {
            (*playerNpc)->duration = dist / (*playerNpc)->moveSpeed;
        } else {
            (*playerNpc)->moveSpeed = dist / (*playerNpc)->duration;
        }

        gPlayerNpcPtr->jumpVelocity = (gPlayerNpcPtr->jumpScale * (gPlayerNpcPtr->duration - 1) * 0.5f) + (temp_f24 / gPlayerNpcPtr->duration);
        playerStatus->flags |= 8;
        playerStatus->animFlags |= 0x10000000;

        if (arg2 == 0) {
            if ((playerStatus->animFlags & 0x4000) == 0) {
                phi_a0 = 0x60009;
                if ((playerStatus->animFlags & 1) == 0) {
                    phi_a0 = 0x10007;
                }
            } else {
                phi_a0 = 0x90005;
            }
            func_800DFEFC(phi_a0);
            play_sound_at_player(0x2081, 0);
        }
        script->functionTemp[0].s = 1;
    }

    playerNpc2 = &gPlayerNpcPtr;

    npc_move_heading((*playerNpc2), (*playerNpc2)->moveSpeed, (*playerNpc2)->yaw);

    temp_f0_5 = (*playerNpc2)->jumpVelocity;
    temp_f0_5 = temp_f0_5 - (*playerNpc2)->jumpScale;
    temp_f0_6 = (*playerNpc2)->pos.y += (*playerNpc2)->jumpVelocity;
    (*playerNpc2)->jumpVelocity = temp_f0_5;
    if ((arg2 == 0) && (temp_f0_6 > 0.0f) && (temp_f0_6 <= 0.0f)) {
        if (!(playerStatus->animFlags & 0x4000)) {
            phi_a0 = 0x6000A;
            if (!(playerStatus->animFlags & 1)) {
                phi_a0 = 0x10008;
            }
        } else {
            phi_a0 = 0x90005;
        }
        func_800DFEFC(phi_a0);
    }

    playerNpc3 = &gPlayerNpcPtr;

    playerStatus->position.x = (*playerNpc3)->pos.x;
    playerStatus->position.y = (*playerNpc3)->pos.y;
    playerStatus->position.z = (*playerNpc3)->pos.z;

    if (arg2 == 0) {
        playerStatus->targetYaw = (*playerNpc3)->yaw;
    }
    (*playerNpc3)->duration--;

    if ((*playerNpc3)->duration == 0) {
        playerStatus->flags = playerStatus->flags & ~8;
        playerStatus->animFlags &= ~0x10000000;

        if (arg2 == 0) {
            if ((playerStatus->animFlags & 0x4000) == 0) {
                phi_a0 = 0x6000B;
                if ((playerStatus->animFlags & 1) == 0) {
                    phi_a0 = 0x10009;
                }
            } else {
                phi_a0 = 0x10003;
            }
            func_800DFEFC(phi_a0);
            func_8003D660(gPlayerNpcPtr, 2);
        }

        if((arg2 == 0) || (arg2 == 2)) {
                s32 subroutine_arg4;
                temp_f24 = func_800E3514(gPlayerNpcPtr->jumpVelocity, &subroutine_arg4);
                if (subroutine_arg4 >= 0) {
                    playerStatus->position.y = temp_f24;
                    func_800E315C(subroutine_arg4);
                    func_800EFD08();
                }
                return 1;
        } else {
            return 1;
        }
    }
    return 0;
}
#else
INCLUDE_ASM(s32, "code_F5750", player_jump, ScriptInstance* script, s32 isInitialCall, s32 arg2);
#endif

ApiStatus PlayerJump(ScriptInstance* script, s32 isInitialCall) {
    return player_jump(script, isInitialCall, 0);
}

ApiStatus PlayerJump1(ScriptInstance* script, s32 isInitialCall) {
    return player_jump(script, isInitialCall, 1);
}

ApiStatus PlayerJump2(ScriptInstance* script, s32 isInitialCall) {
    return player_jump(script, isInitialCall, 2);
}

ApiStatus InterpPlayerYaw(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    PlayerStatus* playerStatus = PLAYER_STATUS;
    f32* initialYaw = &script->functionTemp[1].f;
    f32* deltaYaw = &script->functionTemp[2].f;
    s32* time = &script->functionTemp[3].s;

    if (isInitialCall) {
        Npc** player = &gPlayerNpcPtr;

        (*player)->yaw = playerStatus->targetYaw;
        *initialYaw = (*player)->yaw;
        *deltaYaw = get_float_variable(script, *args++) - *initialYaw;
        *time = get_variable(script, *args++);
        (*player)->duration = 0;

        if (*deltaYaw < -180.0f) {
            *deltaYaw += 360.0f;
        }
        if (*deltaYaw > 180.0f) {
            *deltaYaw -= 360.0f;
        }
    }

    if (*time > 0) {
        Npc** player = &gPlayerNpcPtr;

        (*player)->duration++;
        (*player)->yaw = *initialYaw + ((*deltaYaw * (*player)->duration) / *time);
        (*player)->yaw = clamp_angle((*player)->yaw);
        playerStatus->targetYaw = (*player)->yaw;

        return !((*player)->duration < *time);
    } else {
        Npc** player = &gPlayerNpcPtr;

        (*player)->yaw += *deltaYaw;
        (*player)->yaw = clamp_angle((*player)->yaw);
        playerStatus->targetYaw = (*player)->yaw;

        return ApiStatus_DONE2;
    }
}

INCLUDE_ASM(s32, "code_F5750", PlayerFaceNpc, ScriptInstance* script, s32 isInitialCall);

ApiStatus GetPlayerTargetYaw(ScriptInstance* script, s32 isInitialCall) {
    set_variable(script, *script->ptrReadPos, gPlayerStatus.targetYaw);
    return ApiStatus_DONE2;
}

ApiStatus SetPlayerFlagBits(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    PlayerStatus* playerStatus = &gPlayerStatus;
    PlayerStatus* playerStatus2 = &gPlayerStatus;
    Bytecode bits = *args++;
    Bytecode a1 = *args;

    if (get_variable(script, a1)) {
        playerStatus->flags |= bits;
    } else {
        playerStatus2->flags &= ~bits;
    }

    return ApiStatus_DONE2;
}

ApiStatus GetPlayerActionState(ScriptInstance* script, s32 isInitialCall) {
    Bytecode outVar = *script->ptrReadPos;
    set_variable(script, outVar, gPlayerActionState);
    return ApiStatus_DONE2;
}

ApiStatus GetPlayerPos(ScriptInstance* script, s32 isInitialCall) {
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode* args = script->ptrReadPos;
    Bytecode outVar1 = *args++;
    Bytecode outVar2 = *args++;
    Bytecode outVar3 = *args++;

    set_variable(script, outVar1, playerStatus->position.x);
    set_variable(script, outVar2, playerStatus->position.y);
    set_variable(script, outVar3, playerStatus->position.z);
    return ApiStatus_DONE2;
}

ApiStatus GetPlayerAnimation(ScriptInstance* script, s32 isInitialCall) {
    Bytecode outVar = *script->ptrReadPos;

    set_variable(script, outVar, gPlayerAnimation);
    return ApiStatus_DONE2;
}

ApiStatus FullyRestoreHPandFP(ScriptInstance* script, s32 isInitialCall) {
    PlayerData* playerData = &gPlayerData;

    playerData->curHP = playerData->curMaxHP;
    playerData->curFP = playerData->curMaxFP;
    return ApiStatus_DONE2;
}

ApiStatus FullyRestoreSP(ScriptInstance* script, s32 isInitialCall) {
    PlayerData* playerData = &gPlayerData;

    playerData->specialBarsFilled = playerData->maxStarPower * 256;
    return ApiStatus_DONE2;
}

ApiStatus EnablePartner(ScriptInstance* script, s32 isInitialCall) {
    s32 partnerIdx = get_variable(script, *script->ptrReadPos) - 1;
    PartnerData* partner = &gPlayerData.partners[partnerIdx];

    partner->enabled = TRUE;
    return ApiStatus_DONE2;
}

ApiStatus DisablePartner(ScriptInstance* script, s32 isInitialCall) {
    s32 partnerIdx = get_variable(script, *script->ptrReadPos) - 1;
    PartnerData* partner = &gPlayerData.partners[partnerIdx];

    partner->enabled = FALSE;
    return ApiStatus_DONE2;
}

ApiStatus UseEntryHeading(ScriptInstance *script, s32 isInitialCall) {
    f32 temp_f20;
    f32 temp_f22;
    f32 temp_f2;
    s32 temp_f8;
    s32 temp_f8_2;
    Bytecode *curPos = script->ptrReadPos;
    MapConfig* config = get_current_map_header();
    s32 temp_s3 = get_variable(script, *curPos++);
    s32 temp_v0 = get_variable(script, *curPos++);
    GameStatus *temp_a1 = *gGameStatusPtr;
    PlayerStatus* playerStatus = &gPlayerStatus;
    f32 subroutine_arg4;
    f32 subroutine_arg5;

    temp_f8 = GET_MAP_ENTRY(config, temp_a1->entryID)->x;
    script->varTable[1] = temp_f8;
    script->varTable[2] = GET_MAP_ENTRY(config, temp_a1->entryID)->y;
    temp_f8_2 = GET_MAP_ENTRY(config, temp_a1->entryID)->z;
    script->varTable[3] = temp_f8_2;
    temp_f20 = temp_f8;
    temp_f22 = temp_f8_2;
    sin_cos_deg(clamp_angle(GET_MAP_ENTRY(config, temp_a1->entryID)->yaw + 180.0f), &subroutine_arg4, &subroutine_arg5);
    temp_f2 = (*gGameStatusPtr)->exitAngle * 0.3f;
    playerStatus->position.x = (temp_f20 + (temp_s3 * subroutine_arg4)) - (temp_f2 * subroutine_arg5);
    playerStatus->position.z = (temp_f22 - (temp_s3 * subroutine_arg5)) - (temp_f2 * subroutine_arg4);
    //TODO: vartable is an array of X32
    ((X32*)script->varTable)[5].f = dist2D(playerStatus->position.x, playerStatus->position.z, temp_f20, temp_f22) / temp_v0;
    playerStatus->flags |= 0x4000000;
    return ApiStatus_DONE2;
}

ApiStatus func_802D2148(void) {
    gPlayerStatus.flags &= ~0x4000000;
    return ApiStatus_DONE2;
}

INCLUDE_ASM(s32, "code_F5750", UseExitHeading, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(s32, "code_F5750", func_802D23F8);

ApiStatus func_802D244C(void) {
    if ((gCollisionStatus.currentFloor >= 0) && (func_802D23F8() != 0)) {
        return ApiStatus_DONE2;
    }
    return ApiStatus_BLOCK;
}

s32 func_802D2484(void) {
    return (~gCollisionStatus.currentFloor < 0) * ApiStatus_DONE2;
}

ApiStatus func_802D249C(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 val = 0;
    if (gCollisionStatus.currentFloor >= 0) {
        val = func_802D23F8() != 0;
    }
    set_variable(script, *args, val);

    return ApiStatus_DONE2;
}

ApiStatus func_802D24F4(ScriptInstance* script, s32 isInitialCall) {
    return (gPlayerStatus.moveFrames == 0) * ApiStatus_DONE2;
}

ApiStatus func_802D2508(void) {
    return (!(gPlayerStatus.flags & 0x2000)) * 2;
}

extern u16 D_802DB5B0;

INCLUDE_ASM(s32, "code_F5750", func_802D2520);

ApiStatus func_802D286C(ScriptInstance *script) {
    s32 temp = *script->ptrReadPos;
    D_802DB5B0 = temp;
    return ApiStatus_DONE2;
}

s32 func_802D2884(ScriptInstance *script, s32 isInitialCall) {
    PlayerStatus* playerStatus = &gPlayerStatus;
    Bytecode *args = script->ptrReadPos;
    f32* temp_s5 = &script->functionTemp[1].f;
    f32* temp_s1 = &script->functionTemp[2].f;
    s32* temp_s4 = &script->functionTemp[3].s;
    f32 phi_f2;
    Npc** playerNpc;


    if (isInitialCall) {
        f32 temp_f20 = get_float_variable(script, *args++);
        f32 temp_f0 = get_float_variable(script, *args++);

        script->functionTemp[1].f = gPlayerNpcPtr->yaw = playerStatus->targetYaw;
        if ((playerStatus->position.x != temp_f20) || (playerStatus->position.z != temp_f0)) {
            phi_f2 = atan2(playerStatus->position.x, playerStatus->position.z, temp_f20, temp_f0);
        } else {
            phi_f2 = playerStatus->targetYaw;
        }
        *temp_s1 = phi_f2 - *temp_s5;
        *temp_s4 = get_variable(script, *args++);
        gPlayerNpcPtr->duration = 0;

        if (*temp_s1 < -180.0f) {
            *temp_s1 = (f32) (*temp_s1 + 360.0f);
        }

        if (*temp_s1 > 180.0f) {
            *temp_s1 = (f32) (*temp_s1 - 360.0f);
        }
    }

    if (*temp_s4 > 0) {
        playerNpc = &gPlayerNpcPtr;
        (*playerNpc)->duration++;
        (*playerNpc)->yaw = *temp_s5 + ((*temp_s1 * (*playerNpc)->duration) / *temp_s4);
        playerStatus->targetYaw = (*playerNpc)->yaw = clamp_angle((*playerNpc)->yaw);
        return ((*playerNpc)->duration < *temp_s4) ^ 1;
    }
    playerNpc = &gPlayerNpcPtr;
    (*playerNpc)->yaw += *temp_s1;
    playerStatus->targetYaw = (*playerNpc)->yaw = clamp_angle((*playerNpc)->yaw);
    return ApiStatus_DONE2;
}

ApiStatus DisablePulseStone(ScriptInstance* script, s32 isInitialCall) {
    PlayerStatus* playerStatus = &gPlayerStatus;
    PlayerStatus* playerStatus2 = &gPlayerStatus;

    if (get_variable(script, *script->ptrReadPos)) {
        playerStatus->animFlags &= ~0x80;
    } else {
        playerStatus2->animFlags |= 0x80;
    }

    return ApiStatus_DONE2;
}

ApiStatus GetCurrentPartner(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    Bytecode a0 = *args;
    PlayerData* playerData = &gPlayerData;
    s32 currentPartner = 0;

    if (D_8010EBB0[0] != 0) {
        currentPartner = playerData->currentPartner;
    }

    set_variable(script, a0, currentPartner);
    return ApiStatus_DONE2;
}

ApiStatus func_802D2B50(void) {
    PlayerStatus* playerStatus = &gPlayerStatus;

    playerStatus->animFlags |= 8;
    return ApiStatus_DONE2;
}

ApiStatus func_802D2B6C(void) {
    PlayerStatus* playerStatus = &gPlayerStatus;

    playerStatus->animFlags |= 4;
    return ApiStatus_DONE2;
}

ApiStatus Disable8bitMario(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    PlayerStatus* playerStatus = &gPlayerStatus;
    PlayerStatus* playerStatus2 = &gPlayerStatus;

    if (get_variable(script, *args)) {
        playerStatus->colliderHeight = 37;
        playerStatus->colliderDiameter = 26;
        playerStatus->animFlags &= ~0x4000;
    } else {
        playerStatus2->colliderHeight = 19;
        playerStatus2->colliderDiameter = 26;
        playerStatus2->animFlags |= 0x44004;
    }

    return ApiStatus_DONE2;
}

ApiStatus func_802D2C14(ScriptInstance *script) {
    func_800EF3D4(get_variable(script, *script->ptrReadPos));
    return ApiStatus_DONE2;
}

ApiStatus func_802D2C40(ScriptInstance *script) {
    Bytecode* curPos = script->ptrReadPos;
    f32 x = get_variable(script, *curPos++);
    PlayerStatus* playerStatus = &gPlayerStatus;
    f32 y;
    f32 z;

    playerStatus->extraVelocity.x = x;
    y = get_variable(script, *curPos++);
    playerStatus->extraVelocity.y = y;
    z = get_variable(script, *curPos++);
    playerStatus->extraVelocity.z = z;

    return ApiStatus_DONE2;
}

ApiStatus PlaySoundAtPlayer(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    s32 var = get_variable(script, *args++);
    s32 var2 = get_variable(script, *args++);

    play_sound_at_player(var, var2);
    return ApiStatus_DONE2;
}

INCLUDE_ASM(void, "code_F5750", func_802D2D30, u8 r, u8 g, u8 b, u8 a, u16 arg4, u16 arg5, u16 arg6, u16 arg7);

void func_802D2ED4(s32 arg0, s32 arg1, s32 arg2, s32 arg3, u16 arg4, u16 arg5, u16 arg6, u16 arg7) {
    u16 a6 = (arg4 + arg6);
    u16 a7 = (arg5 + arg7);
    func_802D2D30(arg0, arg1, arg2, arg3, arg4, arg5, a6, a7);
}

// potential file split? Funcs after here seem really different.
INCLUDE_ASM(s32, "code_F5750", func_802D2F34);

INCLUDE_ASM(s32, "code_F5750", func_802D2FCC);

INCLUDE_ASM(s32, "code_F5750", func_802D3028);

INCLUDE_ASM(s32, "code_F5750", func_802D31E0);

INCLUDE_ASM(s32, "code_F5750", func_802D3398);

INCLUDE_ASM(s32, "code_F5750", func_802D33D4);

INCLUDE_ASM(s32, "code_F5750", func_802D3474);

INCLUDE_ASM(s32, "code_F5750", func_802D354C);

INCLUDE_ASM(s32, "code_F5750", func_802D3624);

INCLUDE_ASM(s32, "code_F5750", func_802D3674);

INCLUDE_ASM(s32, "code_F5750", func_802D36E0);

INCLUDE_ASM(s32, "code_F5750", func_802D378C);

INCLUDE_ASM(s32, "code_F5750", func_802D3840);

INCLUDE_ASM(s32, "code_F5750", func_802D38EC);

INCLUDE_ASM(s32, "code_F5750", func_802D3998);

INCLUDE_ASM(s32, "code_F5750", func_802D39FC);

INCLUDE_ASM(s32, "code_F5750", func_802D3A60);

INCLUDE_ASM(s32, "code_F5750", func_802D3C58);

INCLUDE_ASM(s32, "code_F5750", func_802D3EB8);

INCLUDE_ASM(s32, "code_F5750", func_802D3F74);

INCLUDE_ASM(s32, "code_F5750", func_802D3FC8);

INCLUDE_ASM(s32, "code_F5750", func_802D4050);

INCLUDE_ASM(s32, "code_F5750", func_802D4164);

INCLUDE_ASM(s32, "code_F5750", func_802D417C);

INCLUDE_ASM(s32, "code_F5750", func_802D420C);

INCLUDE_ASM(s32, "code_F5750", func_802D42AC);

INCLUDE_ASM(s32, "code_F5750", func_802D4364);

INCLUDE_ASM(s32, "code_F5750", func_802D43AC);

INCLUDE_ASM(s32, "code_F5750", func_802D43D0);

INCLUDE_ASM(s32, "code_F5750", func_802D43F4);

INCLUDE_ASM(s32, "code_F5750", func_802D4434);

INCLUDE_ASM(s32, "code_F5750", func_802D4488);

INCLUDE_ASM(s32, "code_F5750", func_802D4560);
