#include "common.h"
#include "stdlib/stdarg.h"

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", update_entities);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", update_shadows);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8010FBC0);

#ifdef NON_MATCHING
// single instruction swap.
// reloads from *curPos in case 1 rather than just reusing the register
u8 func_8010FBD8(Entity* entity) {
    u8 phi_a0 = 0;
    u32* curPos = entity->unk_18;

    switch (*curPos++) {
        case 0:
            entity->unk_09 = 0xFFu;
            entity->unk_1C = NULL;
            entity->unk_18 = NULL;
            phi_a0 = 0;
            break;
        case 1:
            entity->unk_18 = *curPos;
            entity->unk_2C[0] = *curPos++;
            entity->unk_09 = 1;
            phi_a0 = 1;
            break;
        case 2: 
        {
            void (*temp)(Entity* entity) = *curPos++;
            entity->unk_18 = curPos;
            temp(entity);
            phi_a0 = 1;
            break;
        }
        case 3:
            entity->unk_09 = ((u8*)curPos++)[3];
            entity->unk_1C = (s32) *curPos++;
            entity->unk_18 = curPos;
            phi_a0 = 0;
            break;
        case 4:
            entity->unk_18 = entity->unk_2C[*curPos++];
            phi_a0 = 1;
            break;
        case 5: 
        {
            s32 index = *curPos++;
            entity->unk_2C[index] = curPos;
            entity->unk_18 = curPos;
            phi_a0 = 1;
            break;
        }
        case 6:
            if (entity->boundScript != NULL) {
                entity->flags |= 0x1000000;
            }
            entity->unk_18 = curPos++;
            phi_a0 = 1;
            break;
        case 7:
            entity->flags |= *curPos++;
            entity->unk_18 = curPos;
            phi_a0 = 1;
            break;
        case 8:
        {
            entity->flags &= ~(*curPos++);
            entity->unk_18 = curPos;
            phi_a0 = 1;
            break;
        }
        case 9:
            play_sound(*curPos++);
            entity->unk_18 = curPos;
            phi_a0 = 1;
            break;
        default:
            entity->unk_18 = ++curPos;
            phi_a0 = 1;
            break;
    }
    return phi_a0;
}
#else
INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8010FBD8);
#endif

INCLUDE_ASM(void, "code_a5dd0_len_114e0", func_8010FD68, Entity* entity);

void func_8010FD98(s32 arg0, s32 alpha) {
    if (alpha >= 255) {
        gDPSetRenderMode(gMasterGfxPos++, G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);
        gDPSetCombineMode(gMasterGfxPos++, G_CC_MODULATEIA, G_CC_MODULATEIA);
    } else {
        gDPSetCombineLERP(gMasterGfxPos++, 0, 0, 0, TEXEL0, PRIMITIVE, 0, TEXEL0, 0, 0, 0, 0, TEXEL0, TEXEL0, 0, PRIMITIVE, 0);
        gDPSetPrimColor(gMasterGfxPos++, 0, 0, 0x00, 0x00, 0x00, alpha);
    }
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8010FE44);

void func_8010FE68(s32 alpha) {
    gDPSetCombineLERP(gMasterGfxPos++, 0, 0, 0, 0, PRIMITIVE, 0, TEXEL0, 0, 0, 0, 0, 0, TEXEL0, 0, PRIMITIVE, 0);
    gDPSetPrimColor(gMasterGfxPos++, 0, 0, 0x00, 0x00, 0x00, alpha);
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", render_entities);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", render_shadows);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", update_entity_transform_matrix);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", update_shadow_transform_matrix);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", update_entity_inverse_rotation_matrix);

Entity* get_entity_by_index(s32 index) {
    return (*gCurrentEntityListPtr)[index & 0xFFF];
}

Shadow* get_shadow_by_index(s32 index) {
    return (*gCurrentShadowListPtr)[index & 0xFFF];
}

EntityList* get_entity_list(void) {
    EntityList* ret;

    if (!GAME_STATUS->isBattle) {
        ret = &gWorldEntityList;
    } else {
        ret = &gBattleEntityList;
    }
    return ret;
}

ShadowList* get_shadow_list(void) {
    ShadowList* ret;

    if (!GAME_STATUS->isBattle) {
        ret = &gWorldShadowList;
    } else {
        ret = &gBattleShadowList;
    }
    return ret;
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80110678);

INCLUDE_ASM(u32, "code_a5dd0_len_114e0", get_entity_type, s32 arg0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", delete_entity);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", delete_entity_and_unload_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011085C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", entity_get_collision_flags);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_801109DC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", test_player_entity_aabb);

s32 is_player_action_state(ActionState actionState) {
    return actionState == gPlayerActionState;
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80110BCC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80110BF8);

extern s32 D_8015132C;
extern UNK_TYPE D_00E2B530;
extern UNK_TYPE D_00E2D730;
extern UNK_TYPE D_00E2F750;
extern UNK_TYPE D_00E31530;

void load_area_specific_entity_data(void) {
    s16 areaID;
    s32 temp_v0;
    s32 phi_a0;
    s32 phi_a1;

    if (!D_8015132C) {
        areaID = GAME_STATUS->areaID;
        if ((areaID == 0x11) || (areaID == 8)) {
            phi_a0 = &D_00E2D730;
            phi_a1 = &D_00E2F750;
        } else if ((areaID == 0xA) || (areaID == 0x10)) {
            phi_a0 = &D_00E2F750;
            phi_a1 = &D_00E31530;
        } else {
            phi_a0 = &D_00E2B530;
            phi_a1 = &D_00E2D730;
        }
        dma_copy(phi_a0, phi_a1, (void *)0x802BAE00);
        D_8015132C = TRUE;
    }
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", clear_entity_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80110E58);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80110F10);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_801110B4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", is_entity_data_loaded);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_simple_entity_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_split_entity_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80111790);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_801117DC);

// returns index into gCurrentEntityListPtr the new entity was loaded into, if an entity was loaded.
// Otherwise, -1 is returned.
#ifdef NON_MATCHING
s32 create_entity(StaticEntityData* arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, ...) {
    f32 temp_f22;
    f32 temp_f24;
    f32 temp_f26;
    Entity* temp_s0;
    s32 temp_v0_4;
    s32 phi_return;
    s32 i;
    EntityList** entityList;
    Entity* currentEntity;
    va_list ap;
    s32* temp2;
    s32 temp;
    u16 temp3;
    f32 a1;
    f32 a2;
    f32 a3;
    UNK_PTR tempPtr;
    u8 temp4;

    a1 = arg1;
    a2 = arg2;
    a3 = arg3;

    va_start(ap, arg4);


    load_area_specific_entity_data();

    temp2 = &D_8015C7D0[2];

    temp_f22 = (f32)arg1;
    temp_f24 = (f32)arg2;
    temp_f26 = (f32)arg3;



    *temp2-- = 0;
    *temp2-- = 0;
    *temp2 = 0;

    for (i = 3; i > 0; i--) {
        temp = va_arg(ap, s32);
        if (temp == 0x80000000) {
            break;
        }
        *temp2++ = temp;
    }

    va_end(ap);

    entityList = &gCurrentEntityListPtr;
    for (i = 0; i < 0x1E; i++) {
        currentEntity = (**entityList)[i];
        if (currentEntity == NULL) {
            break;
        }
    }

    if (i >= 0x1E) {
        return -1;
    }


    temp_s0 = heap_malloc(sizeof(Entity));
    (**entityList)[i] = temp_s0;
    mem_clear(temp_s0, sizeof(Entity));
    temp_s0->dataBuf = NULL;

    if (arg0->argSize != 0u) {
        temp_s0->dataBuf = heap_malloc(arg0->argSize);
        mem_clear(temp_s0->dataBuf, arg0->argSize);
    }

    temp_s0->unk_0A = arg0->entityType;
    temp_s0->listIndex = i;
    temp_s0->unk_24 = 0;
    temp_s0->buildMatrixOverride = NULL;
    temp_s0->static_data = arg0;
    tempPtr = arg0->unk_data_ptr1;
    temp_s0->unk_09 = (tempPtr != NULL);
    temp_s0->unk_18 = tempPtr;
    temp_s0->unk_2C = arg0->unk_data_ptr1;
    temp_s0->unk_1C = 0;
    temp_s0->unk_06 = 0;
    temp_s0->unk_07 = 0;
    temp_s0->unk_3C = NULL;

    // Set the new Entity's position
    temp_s0->position.x = temp_f22;
    temp_s0->position.y = temp_f24;
    temp_s0->position.z = temp_f26;

    // Set the new Entity's rotation
    temp_s0->rotation.x = 0.0f;
    temp_s0->rotation.y = arg4;
    temp_s0->rotation.z = 0.0f;

    // Set the new Entity's scale
    temp_s0->scale.x = 1.0f;
    temp_s0->scale.y = 1.0f;
    temp_s0->scale.z = 1.0f;

    temp_s0->flags = arg0->flags | 0x80000000;
    temp_s0->aabb[0] = arg0->unk_21[0];
    temp_s0->aabb[1] = arg0->unk_21[1];
    temp3 = arg0->unk_21[2];
    temp_s0->unk_05 = 1;
    temp_s0->unk_08 = 0xFF;
    temp_s0->alpha = 0xFF;
    temp_s0->virtualModelIndex = -1;
    temp_s0->shadowIndex = -1;
    temp_s0->vertexData = NULL;
    temp_s0->aabb[2] = temp3;
    if (!(arg0->flags & 8)) {
        if (arg0->dmaStart != 0) {
            load_simple_entity_data(temp_s0, arg0, i);
        }
        if (arg0->unk_04 != NULL) {
            temp_s0->virtualModelIndex = load_virtual_model(arg0->unk_04);
            func_80120F04(temp_s0->virtualModelIndex);
        }
    } else {
        load_split_entity_data(temp_s0, arg0, i);
    }
    if ((arg0->entityType != 1u) && (temp_s0->flags & 0x300)) {
        create_entity_shadow(temp_s0, temp_f22, temp_f24, temp_f26);
    }

    switch (arg0->entityType) {
        case 7:
        case 8:
        case 46:
        case 47:
        case 49:
            temp_s0->flags |= 0x4000;
        default:
            break;
    }

    if (arg0->unk_data_func != NULL) {
        arg0->unk_data_func(temp_s0);
    }
    update_entity_transform_matrix(temp_s0);

    return temp_s0->listIndex;

}
#else
INCLUDE_ASM(s32, "code_a5dd0_len_114e0", create_entity, StaticEntityData* data, s32 x, s32 y, s32 z, s32 rot, ...);
#endif

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", create_shadow_from_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", MakeEntity, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80111E9C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80111F2C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", AssignScript, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", AssignAreaFlag, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", AssignBlockFlag, ScriptInstance* script, s32 isInitialCall);

ApiStatus AssignFlag(ScriptInstance* script, s32 isInitialCall) {
    Bytecode* args = script->ptrReadPos;
    Trigger* trigger;

    if (isInitialCall == TRUE) {
        trigger = (Trigger*)get_entity_by_index(gLastCreatedEntityIndex)->dataBuf;
        trigger->flags.bytes.genericFlagIndex = get_variable_index(script, *args);
        return ApiStatus_DONE2;
    }

    return ApiStatus_DONE1;
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", AssignPanelFlag, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", AssignCrateFlag, ScriptInstance* script, s32 isInitialCall);

INCLUDE_ASM(void, "code_a5dd0_len_114e0", create_entity_shadow, Entity* entity, f32 x, f32 y, f32 z);

INCLUDE_ASM(Shadow*, "code_a5dd0_len_114e0", create_shadow_type, s32 type, f32 x, f32 y, f32 z);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112328);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112344);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_801125E8);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_standard_shadow_scale);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_npc_shadow_scale);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_peach_shadow_scale);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112B20);

void NOP_state(void) {
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112B98);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112BBC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", _set_game_mode);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112D84);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112DD4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112DFC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112E24);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112E4C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", step_current_game_mode);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112EEC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", render_ui);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80112FC4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", appendGfx_model);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80114B58);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_tile_header);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80115498);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", get_model_property);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", _load_model_textures);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_model_textures);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80115CA8);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", clear_model_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", init_model_data);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", calculate_model_sizes);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011620C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80116674);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80116698);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", render_models);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", appendGfx_model_group);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80117D00);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_80117E74);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011800C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_801180E8);

Model* get_model_from_list_index(s32 listIndex) {
    return (*gCurrentModelListPtr)[listIndex];
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_data_for_models);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", load_model_transforms);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", get_model_list_index_from_tree_index, s32 treeIndex);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B090);

INCLUDE_ASM(void, "code_a5dd0_len_114e0", get_model_center_and_size, s32 modelID, f32* centerX, f32* centerY,
            f32* centerZ, f32* sizeX, f32* sizeY, f32* sizeZ);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B1C0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B1D8);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B37C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B5D0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B660);

INCLUDE_ASM(void, "code_a5dd0_len_114e0", clone_model, u16 srcModelID, u16 newModelID);

INCLUDE_ASM(void, "code_a5dd0_len_114e0", func_8011B7C0, u16 arg0, s32 arg1, s32 arg2);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011B950);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BAE8);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", enable_world_fog);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", disable_world_fog);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_world_fog_dist);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_world_fog_color);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", is_world_fog_enabled);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", get_world_fog_distance);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", get_world_fog_color);

void set_tex_panner(Model* model, s8 texPannerID) {
    model->texPannerID = texPannerID;
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_main_pan_u);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_main_pan_v);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_aux_pan_u);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_aux_pan_v);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BC7C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BCB4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BCD0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BCEC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BE14);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", set_background_color_blend);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", get_background_color_blend);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BEB4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BF14);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BF98);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011BFD4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C028);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C0DC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C130);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C164);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C2B0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C2EC);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C32C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011C80C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011CFBC);

void func_8011D72C(Gfx** arg0, s32 treeIndex) {
    Model* model = get_model_from_list_index(get_model_list_index_from_tree_index(treeIndex & 0xFFFF));
    Model copied = *model;
    Gfx** gfxPos = &gMasterGfxPos;
    Gfx* oldGfxPos;
    s32 flag;

    if (*arg0 == *gfxPos) {
        flag = 1;
    }

    oldGfxPos = *gfxPos;
    *gfxPos = *arg0;

    copied.flags = 0x81;
    appendGfx_model(&copied);

    *arg0 = *gfxPos;

    if (flag == 0) {
        *gfxPos = oldGfxPos;
    }
}

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011D7E4);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011D82C);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011D890);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011D8D0);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", queue_render_task);

INCLUDE_ASM(s32, "code_a5dd0_len_114e0", func_8011D9B8);
