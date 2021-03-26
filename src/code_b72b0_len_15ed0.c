#include "common.h"

extern s32 D_80151318; // VirtualModelCount
extern VirtualModel** D_80154370; // VirtualModelList
extern s32 D_80154378; // entity fog enabled
extern s32 D_8015437C; // entity fog red
extern s32 D_80154380; // entity fog green
extern s32 D_80154384; // entity fog blue
extern s32 D_80154388; // entity fog alpha
extern s32 D_8015438C; // entity fog dist min
extern s32 D_80154390; // entity fog dist max
extern s32 D_8014C260[];

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", clear_virtual_models);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", init_virtual_models);

s32 load_virtual_model(s32* arg0) {
    VirtualModel* model;
    VirtualModel** phi_v1;
    s32* numModels;
    s32 i;
    GameStatus* gameStatus;
    s32* temp;

    for(i = 0; i < 0x100; i++)
    {
        if (D_80154370[i] == 0) {
            break;
        }
    }
    ASSERT(i < 0x100);

    D_80154370[i] = model = heap_malloc(sizeof(VirtualModel));
    numModels = &D_80151318;
    (*numModels)++;
    ASSERT(model != NULL);

    model->flags = 0x17;
    model->unk_04 = 1;
    model->unk_14 = NULL;
    model->virtualModelData = arg0;
    model->unk_08 = 1.0f;
    model->unk_0C = 1.0f;

    if (arg0 == NULL) {
        model->virtualModelData = D_8014C260;
    }

    temp = model->virtualModelData;
    gameStatus = GAME_STATUS;
    model->unk_5C = 0;
    model->unk_60 = 0;
    model->loopPoint = temp;


    if ((*gameStatus).isBattle) {
        i |= 0x800;
    }

    return i;
}

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80120DE4);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80120F04);

#ifdef NON_MATCHING
// needs rodata
s32 func_80120FB8(VirtualModel* virtualModel) {
    u32 temp;
    s32* temp2;
    u32* modelData = virtualModel->virtualModelData;

    switch(*modelData++) {
        case 0:
            func_80122E94(virtualModel);
            return 1;
        case 1:
            virtualModel->unk_08 = *modelData++;
            virtualModel->unk_14 = (s32*)(*modelData++);
            virtualModel->virtualModelData = modelData;
            break;
        case 2:
            virtualModel->virtualModelData = virtualModel->loopPoint;
            return 1;
        case 3:
            virtualModel->loopPoint = modelData;
            virtualModel->virtualModelData = modelData;
            return 1;
        case 4:
            virtualModel->unk_04 = ((u8*)modelData)[3];
            virtualModel->virtualModelData = ++modelData;
            return 1;
        case 5:
            virtualModel->flags |= *modelData++;
            virtualModel->virtualModelData = modelData;
            return 1;
        case 6:
            virtualModel->flags &= ~(*modelData++);
            virtualModel->virtualModelData = modelData;
            return 1;
        case 7:
            temp2 = virtualModel->unk_14;
            virtualModel->unk_08 = *modelData++;
            temp2[0] = *modelData++;
            temp2[1] = *modelData++;
            temp2[2] = *modelData++;
            temp2[3] = *modelData++;
            virtualModel->virtualModelData = modelData;
            break;
    }

    return 0;
}
#else
INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80120FB8);
#endif

void func_80121140(Matrix4f* arg0) {
    guMtxIdentF(arg0->mtx);
    arg0->mtx[0][0] = 1.0f;
    arg0->mtx[1][1] = 1.0f;
    arg0->mtx[2][2] = -1.0f;
    arg0->mtx[3][3] = 1.0f;
}

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80121184);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80121CE8);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80121EB8);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122088);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122188);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122288);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122D7C);

VirtualModel* func_80122DDC(s32 arg0) {
    return D_80154370[arg0 & ~0x800];
}

// frees model by index
void func_80122DFC(s32 virtualModelIndex) {
    s32 maskedIndex = virtualModelIndex & ~0x800;
    VirtualModel* temp_v1;
    VirtualModel*** modelList = &D_80154370;
    s32* modelCount;

    temp_v1 = (*modelList)[maskedIndex];
    if (temp_v1 != NULL) {
        if (temp_v1->flags) {
            if ((temp_v1->flags & 0x400)) {
                heap_free(temp_v1->unk_14);
            }
            heap_free((*modelList)[maskedIndex]);
            (*modelList)[maskedIndex] = NULL;
            modelCount = &D_80151318;
            (*modelCount)--;
        }
    }
}

// frees model by pointer
void func_80122E94(VirtualModel* arg0) {
    VirtualModel** phi_v1 = D_80154370;
    s32 i;

    for(i = 0; i < 0x100; i++) {
        if (phi_v1[i] == arg0) {
            break;
        }
    }

    if (i < 0x100) {
        func_80122DFC(i);
    }
}

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122EE8);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122F24);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122F64);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122F8C);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80122FB8);

void enable_entity_fog(void) {
    D_80154378 = 1;
}

void disable_entity_fog(void) {
    D_80154378 = 0;
}

void set_entity_fog_dist(s32 min, s32 max) {
    D_8015438C = min;
    D_80154390 = max;
}

void set_entity_fog_color(s32 r, s32 g, s32 b, s32 a) {
    D_8015437C = r;
    D_80154380 = g;
    D_80154384 = b;
    D_80154388 = a;
}

s32 is_entity_fog_enabled(void) {
    return D_80154378;
}

void get_entity_fog_distance(s32* start, s32* end) {
    *start = D_8015438C;
    *end = D_80154390;
}

void get_entity_fog_color(s32* r, s32* g, s32* b, s32* a) {
    *r = D_8015437C;
    *g = D_80154380;
    *b = D_80154384;
    *a = D_80154388;
}

void stub_dynamic_entity_delegate(void) {
}

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", clear_dynamic_entity_list);

void init_dynamic_entity_list(void) {
    if (!GAME_STATUS->isBattle) {
        gCurrentDynamicEntityListPtr = gWorldDynamicEntityList;
    } else {
        gCurrentDynamicEntityListPtr = gBattleDynamicEntityList;
    }
}

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", bind_dynamic_entity_3);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", bind_dynamic_entity_7);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", bind_dynamic_entity_B);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", update_dynamic_entities);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", render_dynamic_entities);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_801234E0);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_80123550);

INCLUDE_ASM(s32, "code_b72b0_len_15ed0", func_801235C0);

s32 get_dynamic_entity(s32 arg0) {
    return (*gCurrentDynamicEntityListPtr)[arg0 & ~0x800];
}
