.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel render_effects
/* 352F4 80059EF4 27BDFFE0 */  addiu     $sp, $sp, -0x20
/* 352F8 80059EF8 AFB10014 */  sw        $s1, 0x14($sp)
/* 352FC 80059EFC 0000882D */  daddu     $s1, $zero, $zero
/* 35300 80059F00 AFB00010 */  sw        $s0, 0x10($sp)
/* 35304 80059F04 3C10800B */  lui       $s0, %hi(D_800B4398)
/* 35308 80059F08 26104398 */  addiu     $s0, $s0, %lo(D_800B4398)
/* 3530C 80059F0C AFBF0018 */  sw        $ra, 0x18($sp)
.L80059F10:
/* 35310 80059F10 8E040000 */  lw        $a0, ($s0)
/* 35314 80059F14 50800017 */  beql      $a0, $zero, .L80059F74
/* 35318 80059F18 26310001 */   addiu    $s1, $s1, 1
/* 3531C 80059F1C 8C830000 */  lw        $v1, ($a0)
/* 35320 80059F20 30620001 */  andi      $v0, $v1, 1
/* 35324 80059F24 50400013 */  beql      $v0, $zero, .L80059F74
/* 35328 80059F28 26310001 */   addiu    $s1, $s1, 1
/* 3532C 80059F2C 30620008 */  andi      $v0, $v1, 8
/* 35330 80059F30 50400010 */  beql      $v0, $zero, .L80059F74
/* 35334 80059F34 26310001 */   addiu    $s1, $s1, 1
/* 35338 80059F38 3C028007 */  lui       $v0, %hi(gGameStatusPtr)
/* 3533C 80059F3C 8C42419C */  lw        $v0, %lo(gGameStatusPtr)($v0)
/* 35340 80059F40 80420070 */  lb        $v0, 0x70($v0)
/* 35344 80059F44 10400005 */  beqz      $v0, .L80059F5C
/* 35348 80059F48 30620004 */   andi     $v0, $v1, 4
/* 3534C 80059F4C 50400009 */  beql      $v0, $zero, .L80059F74
/* 35350 80059F50 26310001 */   addiu    $s1, $s1, 1
/* 35354 80059F54 080167D9 */  j         .L80059F64
/* 35358 80059F58 00000000 */   nop
.L80059F5C:
/* 3535C 80059F5C 54400005 */  bnel      $v0, $zero, .L80059F74
/* 35360 80059F60 26310001 */   addiu    $s1, $s1, 1
.L80059F64:
/* 35364 80059F64 8C820010 */  lw        $v0, 0x10($a0)
/* 35368 80059F68 8C420014 */  lw        $v0, 0x14($v0)
/* 3536C 80059F6C 0040F809 */  jalr      $v0
/* 35370 80059F70 26310001 */   addiu    $s1, $s1, 1
.L80059F74:
/* 35374 80059F74 2A220060 */  slti      $v0, $s1, 0x60
/* 35378 80059F78 1440FFE5 */  bnez      $v0, .L80059F10
/* 3537C 80059F7C 26100004 */   addiu    $s0, $s0, 4
/* 35380 80059F80 8FBF0018 */  lw        $ra, 0x18($sp)
/* 35384 80059F84 8FB10014 */  lw        $s1, 0x14($sp)
/* 35388 80059F88 8FB00010 */  lw        $s0, 0x10($sp)
/* 3538C 80059F8C 03E00008 */  jr        $ra
/* 35390 80059F90 27BD0020 */   addiu    $sp, $sp, 0x20