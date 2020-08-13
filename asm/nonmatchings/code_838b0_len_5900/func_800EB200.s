.set noat # allow manual use of $at
.set noreorder # don't insert nops after branches


glabel func_800EB200
/* 0846B0 800EB200 3C058011 */  lui   $a1, 0x8011
/* 0846B4 800EB204 24A5EFC8 */  addiu $a1, $a1, -0x1038
/* 0846B8 800EB208 3C038011 */  lui   $v1, 0x8011
/* 0846BC 800EB20C 8C63CFD8 */  lw    $v1, -0x3028($v1)
/* 0846C0 800EB210 3C068011 */  lui   $a2, 0x8011
/* 0846C4 800EB214 24C6EBB0 */  addiu $a2, $a2, -0x1450
/* 0846C8 800EB218 1064000D */  beq   $v1, $a0, .L800EB250
/* 0846CC 800EB21C 24020001 */   addiu $v0, $zero, 1
/* 0846D0 800EB220 3C018011 */  lui   $at, 0x8011
/* 0846D4 800EB224 AC22CFE0 */  sw    $v0, -0x3020($at)
/* 0846D8 800EB228 3C018011 */  lui   $at, 0x8011
/* 0846DC 800EB22C AC24CFE4 */  sw    $a0, -0x301c($at)
/* 0846E0 800EB230 A0C00000 */  sb    $zero, ($a2)
/* 0846E4 800EB234 10600008 */  beqz  $v1, .L800EB258
/* 0846E8 800EB238 A0C00001 */   sb    $zero, 1($a2)
/* 0846EC 800EB23C 10800009 */  beqz  $a0, .L800EB264
/* 0846F0 800EB240 24020004 */   addiu $v0, $zero, 4
/* 0846F4 800EB244 24020002 */  addiu $v0, $zero, 2
/* 0846F8 800EB248 3C018011 */  lui   $at, 0x8011
/* 0846FC 800EB24C AC22CFE8 */  sw    $v0, -0x3018($at)
.L800EB250:
/* 084700 800EB250 03E00008 */  jr    $ra
/* 084704 800EB254 00000000 */   nop   

.L800EB258:
/* 084708 800EB258 14800006 */  bnez  $a0, .L800EB274
/* 08470C 800EB25C 24020006 */   addiu $v0, $zero, 6
/* 084710 800EB260 24020004 */  addiu $v0, $zero, 4
.L800EB264:
/* 084714 800EB264 3C018011 */  lui   $at, 0x8011
/* 084718 800EB268 AC22CFE8 */  sw    $v0, -0x3018($at)
/* 08471C 800EB26C 03E00008 */  jr    $ra
/* 084720 800EB270 00000000 */   nop   

.L800EB274:
/* 084724 800EB274 C4A00028 */  lwc1  $f0, 0x28($a1)
/* 084728 800EB278 C4A2002C */  lwc1  $f2, 0x2c($a1)
/* 08472C 800EB27C C4A40030 */  lwc1  $f4, 0x30($a1)
/* 084730 800EB280 3C018011 */  lui   $at, 0x8011
/* 084734 800EB284 AC22CFE8 */  sw    $v0, -0x3018($at)
/* 084738 800EB288 3C018010 */  lui   $at, 0x8010
/* 08473C 800EB28C E420833C */  swc1  $f0, -0x7cc4($at)
/* 084740 800EB290 3C018010 */  lui   $at, 0x8010
/* 084744 800EB294 E4228340 */  swc1  $f2, -0x7cc0($at)
/* 084748 800EB298 3C018010 */  lui   $at, 0x8010
/* 08474C 800EB29C 03E00008 */  jr    $ra
/* 084750 800EB2A0 E4248344 */   swc1  $f4, -0x7cbc($at)

/* 084754 800EB2A4 3C038011 */  lui   $v1, 0x8011
/* 084758 800EB2A8 8C63CFD8 */  lw    $v1, -0x3028($v1)
/* 08475C 800EB2AC 1064000C */  beq   $v1, $a0, .L800EB2E0
/* 084760 800EB2B0 24020001 */   addiu $v0, $zero, 1
/* 084764 800EB2B4 3C018011 */  lui   $at, 0x8011
/* 084768 800EB2B8 AC22CFE0 */  sw    $v0, -0x3020($at)
/* 08476C 800EB2BC 3C018011 */  lui   $at, 0x8011
/* 084770 800EB2C0 AC24CFE4 */  sw    $a0, -0x301c($at)
/* 084774 800EB2C4 10600008 */  beqz  $v1, .L800EB2E8
/* 084778 800EB2C8 00000000 */   nop   
/* 08477C 800EB2CC 10800009 */  beqz  $a0, .L800EB2F4
/* 084780 800EB2D0 24020005 */   addiu $v0, $zero, 5
/* 084784 800EB2D4 24020003 */  addiu $v0, $zero, 3
/* 084788 800EB2D8 3C018011 */  lui   $at, 0x8011
/* 08478C 800EB2DC AC22CFE8 */  sw    $v0, -0x3018($at)
.L800EB2E0:
/* 084790 800EB2E0 03E00008 */  jr    $ra
/* 084794 800EB2E4 00000000 */   nop   

.L800EB2E8:
/* 084798 800EB2E8 14800006 */  bnez  $a0, .L800EB304
/* 08479C 800EB2EC 24020007 */   addiu $v0, $zero, 7
/* 0847A0 800EB2F0 24020005 */  addiu $v0, $zero, 5
.L800EB2F4:
/* 0847A4 800EB2F4 3C018011 */  lui   $at, 0x8011
/* 0847A8 800EB2F8 AC22CFE8 */  sw    $v0, -0x3018($at)
/* 0847AC 800EB2FC 03E00008 */  jr    $ra
/* 0847B0 800EB300 00000000 */   nop   

.L800EB304:
/* 0847B4 800EB304 3C018011 */  lui   $at, 0x8011
/* 0847B8 800EB308 AC22CFE8 */  sw    $v0, -0x3018($at)
/* 0847BC 800EB30C 03E00008 */  jr    $ra
/* 0847C0 800EB310 00000000 */   nop   
