.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80240158_D57588
/* D57588 80240158 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* D5758C 8024015C AFB00040 */  sw        $s0, 0x40($sp)
/* D57590 80240160 3C108011 */  lui       $s0, %hi(gPlayerStatus)
/* D57594 80240164 2610EFC8 */  addiu     $s0, $s0, %lo(gPlayerStatus)
/* D57598 80240168 AFB20048 */  sw        $s2, 0x48($sp)
/* D5759C 8024016C AFBF004C */  sw        $ra, 0x4c($sp)
/* D575A0 80240170 AFB10044 */  sw        $s1, 0x44($sp)
/* D575A4 80240174 8E020000 */  lw        $v0, ($s0)
/* D575A8 80240178 821100BE */  lb        $s1, 0xbe($s0)
/* D575AC 8024017C 30420001 */  andi      $v0, $v0, 1
/* D575B0 80240180 10400061 */  beqz      $v0, .L80240308
/* D575B4 80240184 27B20020 */   addiu    $s2, $sp, 0x20
/* D575B8 80240188 8E0400CC */  lw        $a0, 0xcc($s0)
/* D575BC 8024018C 0C044181 */  jal       get_shadow_by_index
/* D575C0 80240190 00000000 */   nop      
/* D575C4 80240194 0C048B77 */  jal       func_80122DDC
/* D575C8 80240198 84440008 */   lh       $a0, 8($v0)
/* D575CC 8024019C 8C430000 */  lw        $v1, ($v0)
/* D575D0 802401A0 34630200 */  ori       $v1, $v1, 0x200
/* D575D4 802401A4 AC430000 */  sw        $v1, ($v0)
/* D575D8 802401A8 8E050028 */  lw        $a1, 0x28($s0)
/* D575DC 802401AC 8E06002C */  lw        $a2, 0x2c($s0)
/* D575E0 802401B0 27A20030 */  addiu     $v0, $sp, 0x30
/* D575E4 802401B4 AFA20010 */  sw        $v0, 0x10($sp)
/* D575E8 802401B8 27A20034 */  addiu     $v0, $sp, 0x34
/* D575EC 802401BC AFA20014 */  sw        $v0, 0x14($sp)
/* D575F0 802401C0 C6000030 */  lwc1      $f0, 0x30($s0)
/* D575F4 802401C4 3C04800A */  lui       $a0, 0x800a
/* D575F8 802401C8 8484A634 */  lh        $a0, -0x59cc($a0)
/* D575FC 802401CC 46000007 */  neg.s     $f0, $f0
/* D57600 802401D0 44070000 */  mfc1      $a3, $f0
/* D57604 802401D4 27A20038 */  addiu     $v0, $sp, 0x38
/* D57608 802401D8 0C00B94E */  jal       get_screen_coords
/* D5760C 802401DC AFA20018 */   sw       $v0, 0x18($sp)
/* D57610 802401E0 8E0400A4 */  lw        $a0, 0xa4($s0)
/* D57614 802401E4 0C090014 */  jal       UnkFunc2
/* D57618 802401E8 00000000 */   nop      
/* D5761C 802401EC C6020080 */  lwc1      $f2, 0x80($s0)
/* D57620 802401F0 3C014307 */  lui       $at, 0x4307
/* D57624 802401F4 44810000 */  mtc1      $at, $f0
/* D57628 802401F8 00000000 */  nop       
/* D5762C 802401FC 4602003C */  c.lt.s    $f0, $f2
/* D57630 80240200 00000000 */  nop       
/* D57634 80240204 4500000B */  bc1f      .L80240234
/* D57638 80240208 24040002 */   addiu    $a0, $zero, 2
/* D5763C 8024020C 3C014361 */  lui       $at, 0x4361
/* D57640 80240210 44810000 */  mtc1      $at, $f0
/* D57644 80240214 00000000 */  nop       
/* D57648 80240218 4600103C */  c.lt.s    $f2, $f0
/* D5764C 8024021C 00000000 */  nop       
/* D57650 80240220 45000004 */  bc1f      .L80240234
/* D57654 80240224 00000000 */   nop      
/* D57658 80240228 0C090021 */  jal       func_80240084_D574B4
/* D5765C 8024022C 0040202D */   daddu    $a0, $v0, $zero
/* D57660 80240230 24040002 */  addiu     $a0, $zero, 2
.L80240234:
/* D57664 80240234 3C063F80 */  lui       $a2, 0x3f80
/* D57668 80240238 0C0B76A3 */  jal       func_802DDA8C
/* D5766C 8024023C 0040282D */   daddu    $a1, $v0, $zero
/* D57670 80240240 8E020000 */  lw        $v0, ($s0)
/* D57674 80240244 3C030002 */  lui       $v1, 2
/* D57678 80240248 00431024 */  and       $v0, $v0, $v1
/* D5767C 8024024C 54400022 */  bnel      $v0, $zero, .L802402D8
/* D57680 80240250 24110011 */   addiu    $s1, $zero, 0x11
/* D57684 80240254 9203000E */  lbu       $v1, 0xe($s0)
/* D57688 80240258 3C02802E */  lui       $v0, 0x802e
/* D5768C 8024025C 90429D70 */  lbu       $v0, -0x6290($v0)
/* D57690 80240260 10620018 */  beq       $v1, $v0, .L802402C4
/* D57694 80240264 2C6200FE */   sltiu    $v0, $v1, 0xfe
/* D57698 80240268 1040000B */  beqz      $v0, .L80240298
/* D5769C 8024026C 24110011 */   addiu    $s1, $zero, 0x11
/* D576A0 80240270 24040002 */  addiu     $a0, $zero, 2
/* D576A4 80240274 2405FFFF */  addiu     $a1, $zero, -1
/* D576A8 80240278 24060007 */  addiu     $a2, $zero, 7
/* D576AC 8024027C 0060102D */  daddu     $v0, $v1, $zero
/* D576B0 80240280 0000382D */  daddu     $a3, $zero, $zero
/* D576B4 80240284 AFA00010 */  sw        $zero, 0x10($sp)
/* D576B8 80240288 AFA00014 */  sw        $zero, 0x14($sp)
/* D576BC 8024028C AFA0001C */  sw        $zero, 0x1c($sp)
/* D576C0 80240290 080900AF */  j         .L802402BC
/* D576C4 80240294 AFA20018 */   sw       $v0, 0x18($sp)
.L80240298:
/* D576C8 80240298 2411000D */  addiu     $s1, $zero, 0xd
/* D576CC 8024029C 24040002 */  addiu     $a0, $zero, 2
/* D576D0 802402A0 2405FFFF */  addiu     $a1, $zero, -1
/* D576D4 802402A4 0000302D */  daddu     $a2, $zero, $zero
/* D576D8 802402A8 00C0382D */  daddu     $a3, $a2, $zero
/* D576DC 802402AC AFA00010 */  sw        $zero, 0x10($sp)
/* D576E0 802402B0 AFA00014 */  sw        $zero, 0x14($sp)
/* D576E4 802402B4 AFA00018 */  sw        $zero, 0x18($sp)
/* D576E8 802402B8 AFA0001C */  sw        $zero, 0x1c($sp)
.L802402BC:
/* D576EC 802402BC 0C0B77B9 */  jal       func_802DDEE4
/* D576F0 802402C0 00000000 */   nop      
.L802402C4:
/* D576F4 802402C4 9202000E */  lbu       $v0, 0xe($s0)
/* D576F8 802402C8 3C01802E */  lui       $at, 0x802e
/* D576FC 802402CC A0229D70 */  sb        $v0, -0x6290($at)
/* D57700 802402D0 080900B9 */  j         .L802402E4
/* D57704 802402D4 0240202D */   daddu    $a0, $s2, $zero
.L802402D8:
/* D57708 802402D8 3C01802E */  lui       $at, 0x802e
/* D5770C 802402DC A0209D70 */  sb        $zero, -0x6290($at)
/* D57710 802402E0 0240202D */  daddu     $a0, $s2, $zero
.L802402E4:
/* D57714 802402E4 AC910000 */  sw        $s1, ($a0)
/* D57718 802402E8 AC900008 */  sw        $s0, 8($a0)
/* D5771C 802402EC 8FA20038 */  lw        $v0, 0x38($sp)
/* D57720 802402F0 3C038024 */  lui       $v1, 0x8024
/* D57724 802402F4 24630320 */  addiu     $v1, $v1, 0x320
/* D57728 802402F8 AC83000C */  sw        $v1, 0xc($a0)
/* D5772C 802402FC 00021023 */  negu      $v0, $v0
/* D57730 80240300 0C047644 */  jal       queue_render_task
/* D57734 80240304 AC820004 */   sw       $v0, 4($a0)
.L80240308:
/* D57738 80240308 8FBF004C */  lw        $ra, 0x4c($sp)
/* D5773C 8024030C 8FB20048 */  lw        $s2, 0x48($sp)
/* D57740 80240310 8FB10044 */  lw        $s1, 0x44($sp)
/* D57744 80240314 8FB00040 */  lw        $s0, 0x40($sp)
/* D57748 80240318 03E00008 */  jr        $ra
/* D5774C 8024031C 27BD0050 */   addiu    $sp, $sp, 0x50
