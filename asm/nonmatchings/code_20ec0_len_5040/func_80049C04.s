.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80049C04
/* 25004 80049C04 27BDFFA8 */  addiu     $sp, $sp, -0x58
/* 25008 80049C08 AFB40048 */  sw        $s4, 0x48($sp)
/* 2500C 80049C0C 0080A02D */  daddu     $s4, $a0, $zero
/* 25010 80049C10 AFBF004C */  sw        $ra, 0x4c($sp)
/* 25014 80049C14 AFB30044 */  sw        $s3, 0x44($sp)
/* 25018 80049C18 AFB20040 */  sw        $s2, 0x40($sp)
/* 2501C 80049C1C AFB1003C */  sw        $s1, 0x3c($sp)
/* 25020 80049C20 AFB00038 */  sw        $s0, 0x38($sp)
/* 25024 80049C24 F7B40050 */  sdc1      $f20, 0x50($sp)
/* 25028 80049C28 8E920148 */  lw        $s2, 0x148($s4)
/* 2502C 80049C2C 00A0982D */  daddu     $s3, $a1, $zero
/* 25030 80049C30 86440008 */  lh        $a0, 8($s2)
/* 25034 80049C34 0C00EABB */  jal       get_npc_unsafe
/* 25038 80049C38 00C0882D */   daddu    $s1, $a2, $zero
/* 2503C 80049C3C 8E630014 */  lw        $v1, 0x14($s3)
/* 25040 80049C40 0460004F */  bltz      $v1, .L80049D80
/* 25044 80049C44 0040802D */   daddu    $s0, $v0, $zero
/* 25048 80049C48 0220202D */  daddu     $a0, $s1, $zero
/* 2504C 80049C4C AFA00010 */  sw        $zero, 0x10($sp)
/* 25050 80049C50 8E660024 */  lw        $a2, 0x24($s3)
/* 25054 80049C54 8E670028 */  lw        $a3, 0x28($s3)
/* 25058 80049C58 0C01242D */  jal       func_800490B4
/* 2505C 80049C5C 0240282D */   daddu    $a1, $s2, $zero
/* 25060 80049C60 10400047 */  beqz      $v0, .L80049D80
/* 25064 80049C64 00000000 */   nop      
/* 25068 80049C68 3C02800F */  lui       $v0, %hi(gPlayerStatusPtr)
/* 2506C 80049C6C 8C427B30 */  lw        $v0, %lo(gPlayerStatusPtr)($v0)
/* 25070 80049C70 C60C0038 */  lwc1      $f12, 0x38($s0)
/* 25074 80049C74 C602003C */  lwc1      $f2, 0x3c($s0)
/* 25078 80049C78 C6040040 */  lwc1      $f4, 0x40($s0)
/* 2507C 80049C7C 46006006 */  mov.s     $f0, $f12
/* 25080 80049C80 8C460028 */  lw        $a2, 0x28($v0)
/* 25084 80049C84 8C470030 */  lw        $a3, 0x30($v0)
/* 25088 80049C88 46002386 */  mov.s     $f14, $f4
/* 2508C 80049C8C E7A00028 */  swc1      $f0, 0x28($sp)
/* 25090 80049C90 E7A2002C */  swc1      $f2, 0x2c($sp)
/* 25094 80049C94 0C00A720 */  jal       atan2
/* 25098 80049C98 E7A40030 */   swc1     $f4, 0x30($sp)
/* 2509C 80049C9C C6620018 */  lwc1      $f2, 0x18($s3)
/* 250A0 80049CA0 46000506 */  mov.s     $f20, $f0
/* 250A4 80049CA4 E7B40014 */  swc1      $f20, 0x14($sp)
/* 250A8 80049CA8 E7A20010 */  swc1      $f2, 0x10($sp)
/* 250AC 80049CAC 860200A8 */  lh        $v0, 0xa8($s0)
/* 250B0 80049CB0 27A50028 */  addiu     $a1, $sp, 0x28
/* 250B4 80049CB4 44820000 */  mtc1      $v0, $f0
/* 250B8 80049CB8 00000000 */  nop       
/* 250BC 80049CBC 46800020 */  cvt.s.w   $f0, $f0
/* 250C0 80049CC0 E7A00018 */  swc1      $f0, 0x18($sp)
/* 250C4 80049CC4 860200A6 */  lh        $v0, 0xa6($s0)
/* 250C8 80049CC8 27A6002C */  addiu     $a2, $sp, 0x2c
/* 250CC 80049CCC 44820000 */  mtc1      $v0, $f0
/* 250D0 80049CD0 00000000 */  nop       
/* 250D4 80049CD4 46800020 */  cvt.s.w   $f0, $f0
/* 250D8 80049CD8 E7A0001C */  swc1      $f0, 0x1c($sp)
/* 250DC 80049CDC 8E040080 */  lw        $a0, 0x80($s0)
/* 250E0 80049CE0 0C037711 */  jal       func_800DDC44
/* 250E4 80049CE4 27A70030 */   addiu    $a3, $sp, 0x30
/* 250E8 80049CE8 14400025 */  bnez      $v0, .L80049D80
/* 250EC 80049CEC 0200202D */   daddu    $a0, $s0, $zero
/* 250F0 80049CF0 240502F4 */  addiu     $a1, $zero, 0x2f4
/* 250F4 80049CF4 3C060020 */  lui       $a2, 0x20
/* 250F8 80049CF8 0C012530 */  jal       func_800494C0
/* 250FC 80049CFC E614000C */   swc1     $f20, 0xc($s0)
/* 25100 80049D00 0000202D */  daddu     $a0, $zero, $zero
/* 25104 80049D04 0200282D */  daddu     $a1, $s0, $zero
/* 25108 80049D08 0000302D */  daddu     $a2, $zero, $zero
/* 2510C 80049D0C 84A300A8 */  lh        $v1, 0xa8($a1)
/* 25110 80049D10 3C013F80 */  lui       $at, 0x3f80
/* 25114 80049D14 44810000 */  mtc1      $at, $f0
/* 25118 80049D18 3C014000 */  lui       $at, 0x4000
/* 2511C 80049D1C 44811000 */  mtc1      $at, $f2
/* 25120 80049D20 3C01C1A0 */  lui       $at, 0xc1a0
/* 25124 80049D24 44812000 */  mtc1      $at, $f4
/* 25128 80049D28 2402000F */  addiu     $v0, $zero, 0xf
/* 2512C 80049D2C AFA2001C */  sw        $v0, 0x1c($sp)
/* 25130 80049D30 44833000 */  mtc1      $v1, $f6
/* 25134 80049D34 00000000 */  nop       
/* 25138 80049D38 468031A0 */  cvt.s.w   $f6, $f6
/* 2513C 80049D3C 44073000 */  mfc1      $a3, $f6
/* 25140 80049D40 27A20034 */  addiu     $v0, $sp, 0x34
/* 25144 80049D44 AFA20020 */  sw        $v0, 0x20($sp)
/* 25148 80049D48 E7A00010 */  swc1      $f0, 0x10($sp)
/* 2514C 80049D4C E7A20014 */  swc1      $f2, 0x14($sp)
/* 25150 80049D50 0C01BFA4 */  jal       fx_emote
/* 25154 80049D54 E7A40018 */   swc1     $f4, 0x18($sp)
/* 25158 80049D58 8E420018 */  lw        $v0, 0x18($s2)
/* 2515C 80049D5C 9442002A */  lhu       $v0, 0x2a($v0)
/* 25160 80049D60 30420001 */  andi      $v0, $v0, 1
/* 25164 80049D64 10400003 */  beqz      $v0, .L80049D74
/* 25168 80049D68 2402000A */   addiu    $v0, $zero, 0xa
/* 2516C 80049D6C 08012786 */  j         .L80049E18
/* 25170 80049D70 AE820070 */   sw       $v0, 0x70($s4)
.L80049D74:
/* 25174 80049D74 2402000C */  addiu     $v0, $zero, 0xc
/* 25178 80049D78 08012786 */  j         .L80049E18
/* 2517C 80049D7C AE820070 */   sw       $v0, 0x70($s4)
.L80049D80:
/* 25180 80049D80 8602008C */  lh        $v0, 0x8c($s0)
/* 25184 80049D84 14400024 */  bnez      $v0, .L80049E18
/* 25188 80049D88 00000000 */   nop      
/* 2518C 80049D8C 9602008E */  lhu       $v0, 0x8e($s0)
/* 25190 80049D90 2442FFFF */  addiu     $v0, $v0, -1
/* 25194 80049D94 A602008E */  sh        $v0, 0x8e($s0)
/* 25198 80049D98 00021400 */  sll       $v0, $v0, 0x10
/* 2519C 80049D9C 1C40001E */  bgtz      $v0, .L80049E18
/* 251A0 80049DA0 00000000 */   nop      
/* 251A4 80049DA4 8E820074 */  lw        $v0, 0x74($s4)
/* 251A8 80049DA8 2442FFFF */  addiu     $v0, $v0, -1
/* 251AC 80049DAC 10400019 */  beqz      $v0, .L80049E14
/* 251B0 80049DB0 AE820074 */   sw       $v0, 0x74($s4)
/* 251B4 80049DB4 8E420018 */  lw        $v0, 0x18($s2)
/* 251B8 80049DB8 9442002A */  lhu       $v0, 0x2a($v0)
/* 251BC 80049DBC 30420010 */  andi      $v0, $v0, 0x10
/* 251C0 80049DC0 14400007 */  bnez      $v0, .L80049DE0
/* 251C4 80049DC4 00000000 */   nop      
/* 251C8 80049DC8 C600000C */  lwc1      $f0, 0xc($s0)
/* 251CC 80049DCC 3C014334 */  lui       $at, 0x4334
/* 251D0 80049DD0 44816000 */  mtc1      $at, $f12
/* 251D4 80049DD4 0C00A6C9 */  jal       clamp_angle
/* 251D8 80049DD8 460C0300 */   add.s    $f12, $f0, $f12
/* 251DC 80049DDC E600000C */  swc1      $f0, 0xc($s0)
.L80049DE0:
/* 251E0 80049DE0 8E640008 */  lw        $a0, 8($s3)
/* 251E4 80049DE4 000417C2 */  srl       $v0, $a0, 0x1f
/* 251E8 80049DE8 00822021 */  addu      $a0, $a0, $v0
/* 251EC 80049DEC 00042043 */  sra       $a0, $a0, 1
/* 251F0 80049DF0 0C00A67F */  jal       rand_int
/* 251F4 80049DF4 24840001 */   addiu    $a0, $a0, 1
/* 251F8 80049DF8 8E630008 */  lw        $v1, 8($s3)
/* 251FC 80049DFC 000327C2 */  srl       $a0, $v1, 0x1f
/* 25200 80049E00 00641821 */  addu      $v1, $v1, $a0
/* 25204 80049E04 00031843 */  sra       $v1, $v1, 1
/* 25208 80049E08 00621821 */  addu      $v1, $v1, $v0
/* 2520C 80049E0C 08012786 */  j         .L80049E18
/* 25210 80049E10 A603008E */   sh       $v1, 0x8e($s0)
.L80049E14:
/* 25214 80049E14 AE800070 */  sw        $zero, 0x70($s4)
.L80049E18:
/* 25218 80049E18 8FBF004C */  lw        $ra, 0x4c($sp)
/* 2521C 80049E1C 8FB40048 */  lw        $s4, 0x48($sp)
/* 25220 80049E20 8FB30044 */  lw        $s3, 0x44($sp)
/* 25224 80049E24 8FB20040 */  lw        $s2, 0x40($sp)
/* 25228 80049E28 8FB1003C */  lw        $s1, 0x3c($sp)
/* 2522C 80049E2C 8FB00038 */  lw        $s0, 0x38($sp)
/* 25230 80049E30 D7B40050 */  ldc1      $f20, 0x50($sp)
/* 25234 80049E34 03E00008 */  jr        $ra
/* 25238 80049E38 27BD0058 */   addiu    $sp, $sp, 0x58
