.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80240128_D7CC78
/* D7CC78 80240128 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* D7CC7C 8024012C AFB00040 */  sw        $s0, 0x40($sp)
/* D7CC80 80240130 3C108011 */  lui       $s0, %hi(gPlayerStatus)
/* D7CC84 80240134 2610EFC8 */  addiu     $s0, $s0, %lo(gPlayerStatus)
/* D7CC88 80240138 AFB20048 */  sw        $s2, 0x48($sp)
/* D7CC8C 8024013C AFBF004C */  sw        $ra, 0x4c($sp)
/* D7CC90 80240140 AFB10044 */  sw        $s1, 0x44($sp)
/* D7CC94 80240144 8E020000 */  lw        $v0, ($s0)
/* D7CC98 80240148 821100BE */  lb        $s1, 0xbe($s0)
/* D7CC9C 8024014C 30420001 */  andi      $v0, $v0, 1
/* D7CCA0 80240150 10400061 */  beqz      $v0, .L802402D8
/* D7CCA4 80240154 27B20020 */   addiu    $s2, $sp, 0x20
/* D7CCA8 80240158 8E0400CC */  lw        $a0, 0xcc($s0)
/* D7CCAC 8024015C 0C044181 */  jal       get_shadow_by_index
/* D7CCB0 80240160 00000000 */   nop      
/* D7CCB4 80240164 0C048B77 */  jal       func_80122DDC
/* D7CCB8 80240168 84440008 */   lh       $a0, 8($v0)
/* D7CCBC 8024016C 8C430000 */  lw        $v1, ($v0)
/* D7CCC0 80240170 34630200 */  ori       $v1, $v1, 0x200
/* D7CCC4 80240174 AC430000 */  sw        $v1, ($v0)
/* D7CCC8 80240178 8E050028 */  lw        $a1, 0x28($s0)
/* D7CCCC 8024017C 8E06002C */  lw        $a2, 0x2c($s0)
/* D7CCD0 80240180 27A20030 */  addiu     $v0, $sp, 0x30
/* D7CCD4 80240184 AFA20010 */  sw        $v0, 0x10($sp)
/* D7CCD8 80240188 27A20034 */  addiu     $v0, $sp, 0x34
/* D7CCDC 8024018C AFA20014 */  sw        $v0, 0x14($sp)
/* D7CCE0 80240190 C6000030 */  lwc1      $f0, 0x30($s0)
/* D7CCE4 80240194 3C04800A */  lui       $a0, 0x800a
/* D7CCE8 80240198 8484A634 */  lh        $a0, -0x59cc($a0)
/* D7CCEC 8024019C 46000007 */  neg.s     $f0, $f0
/* D7CCF0 802401A0 44070000 */  mfc1      $a3, $f0
/* D7CCF4 802401A4 27A20038 */  addiu     $v0, $sp, 0x38
/* D7CCF8 802401A8 0C00B94E */  jal       get_screen_coords
/* D7CCFC 802401AC AFA20018 */   sw       $v0, 0x18($sp)
/* D7CD00 802401B0 8E0400A4 */  lw        $a0, 0xa4($s0)
/* D7CD04 802401B4 0C090008 */  jal       UnkFunc2
/* D7CD08 802401B8 00000000 */   nop      
/* D7CD0C 802401BC C6020080 */  lwc1      $f2, 0x80($s0)
/* D7CD10 802401C0 3C014307 */  lui       $at, 0x4307
/* D7CD14 802401C4 44810000 */  mtc1      $at, $f0
/* D7CD18 802401C8 00000000 */  nop       
/* D7CD1C 802401CC 4602003C */  c.lt.s    $f0, $f2
/* D7CD20 802401D0 00000000 */  nop       
/* D7CD24 802401D4 4500000B */  bc1f      .L80240204
/* D7CD28 802401D8 24040002 */   addiu    $a0, $zero, 2
/* D7CD2C 802401DC 3C014361 */  lui       $at, 0x4361
/* D7CD30 802401E0 44810000 */  mtc1      $at, $f0
/* D7CD34 802401E4 00000000 */  nop       
/* D7CD38 802401E8 4600103C */  c.lt.s    $f2, $f0
/* D7CD3C 802401EC 00000000 */  nop       
/* D7CD40 802401F0 45000004 */  bc1f      .L80240204
/* D7CD44 802401F4 00000000 */   nop      
/* D7CD48 802401F8 0C090015 */  jal       func_80240054_D7CBA4
/* D7CD4C 802401FC 0040202D */   daddu    $a0, $v0, $zero
/* D7CD50 80240200 24040002 */  addiu     $a0, $zero, 2
.L80240204:
/* D7CD54 80240204 3C063F80 */  lui       $a2, 0x3f80
/* D7CD58 80240208 0C0B76A3 */  jal       func_802DDA8C
/* D7CD5C 8024020C 0040282D */   daddu    $a1, $v0, $zero
/* D7CD60 80240210 8E020000 */  lw        $v0, ($s0)
/* D7CD64 80240214 3C030002 */  lui       $v1, 2
/* D7CD68 80240218 00431024 */  and       $v0, $v0, $v1
/* D7CD6C 8024021C 54400022 */  bnel      $v0, $zero, .L802402A8
/* D7CD70 80240220 24110011 */   addiu    $s1, $zero, 0x11
/* D7CD74 80240224 9203000E */  lbu       $v1, 0xe($s0)
/* D7CD78 80240228 3C02802E */  lui       $v0, 0x802e
/* D7CD7C 8024022C 90429D70 */  lbu       $v0, -0x6290($v0)
/* D7CD80 80240230 10620018 */  beq       $v1, $v0, .L80240294
/* D7CD84 80240234 2C6200FE */   sltiu    $v0, $v1, 0xfe
/* D7CD88 80240238 1040000B */  beqz      $v0, .L80240268
/* D7CD8C 8024023C 24110011 */   addiu    $s1, $zero, 0x11
/* D7CD90 80240240 24040002 */  addiu     $a0, $zero, 2
/* D7CD94 80240244 2405FFFF */  addiu     $a1, $zero, -1
/* D7CD98 80240248 24060007 */  addiu     $a2, $zero, 7
/* D7CD9C 8024024C 0060102D */  daddu     $v0, $v1, $zero
/* D7CDA0 80240250 0000382D */  daddu     $a3, $zero, $zero
/* D7CDA4 80240254 AFA00010 */  sw        $zero, 0x10($sp)
/* D7CDA8 80240258 AFA00014 */  sw        $zero, 0x14($sp)
/* D7CDAC 8024025C AFA0001C */  sw        $zero, 0x1c($sp)
/* D7CDB0 80240260 080900A3 */  j         .L8024028C
/* D7CDB4 80240264 AFA20018 */   sw       $v0, 0x18($sp)
.L80240268:
/* D7CDB8 80240268 2411000D */  addiu     $s1, $zero, 0xd
/* D7CDBC 8024026C 24040002 */  addiu     $a0, $zero, 2
/* D7CDC0 80240270 2405FFFF */  addiu     $a1, $zero, -1
/* D7CDC4 80240274 0000302D */  daddu     $a2, $zero, $zero
/* D7CDC8 80240278 00C0382D */  daddu     $a3, $a2, $zero
/* D7CDCC 8024027C AFA00010 */  sw        $zero, 0x10($sp)
/* D7CDD0 80240280 AFA00014 */  sw        $zero, 0x14($sp)
/* D7CDD4 80240284 AFA00018 */  sw        $zero, 0x18($sp)
/* D7CDD8 80240288 AFA0001C */  sw        $zero, 0x1c($sp)
.L8024028C:
/* D7CDDC 8024028C 0C0B77B9 */  jal       func_802DDEE4
/* D7CDE0 80240290 00000000 */   nop      
.L80240294:
/* D7CDE4 80240294 9202000E */  lbu       $v0, 0xe($s0)
/* D7CDE8 80240298 3C01802E */  lui       $at, 0x802e
/* D7CDEC 8024029C A0229D70 */  sb        $v0, -0x6290($at)
/* D7CDF0 802402A0 080900AD */  j         .L802402B4
/* D7CDF4 802402A4 0240202D */   daddu    $a0, $s2, $zero
.L802402A8:
/* D7CDF8 802402A8 3C01802E */  lui       $at, 0x802e
/* D7CDFC 802402AC A0209D70 */  sb        $zero, -0x6290($at)
/* D7CE00 802402B0 0240202D */  daddu     $a0, $s2, $zero
.L802402B4:
/* D7CE04 802402B4 AC910000 */  sw        $s1, ($a0)
/* D7CE08 802402B8 AC900008 */  sw        $s0, 8($a0)
/* D7CE0C 802402BC 8FA20038 */  lw        $v0, 0x38($sp)
/* D7CE10 802402C0 3C038024 */  lui       $v1, 0x8024
/* D7CE14 802402C4 246302F0 */  addiu     $v1, $v1, 0x2f0
/* D7CE18 802402C8 AC83000C */  sw        $v1, 0xc($a0)
/* D7CE1C 802402CC 00021023 */  negu      $v0, $v0
/* D7CE20 802402D0 0C047644 */  jal       queue_render_task
/* D7CE24 802402D4 AC820004 */   sw       $v0, 4($a0)
.L802402D8:
/* D7CE28 802402D8 8FBF004C */  lw        $ra, 0x4c($sp)
/* D7CE2C 802402DC 8FB20048 */  lw        $s2, 0x48($sp)
/* D7CE30 802402E0 8FB10044 */  lw        $s1, 0x44($sp)
/* D7CE34 802402E4 8FB00040 */  lw        $s0, 0x40($sp)
/* D7CE38 802402E8 03E00008 */  jr        $ra
/* D7CE3C 802402EC 27BD0050 */   addiu    $sp, $sp, 0x50
