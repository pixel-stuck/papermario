.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel pause_badges_update
/* 13C95C 8024961C 27BDFFE8 */  addiu     $sp, $sp, -0x18
/* 13C960 80249620 3C038027 */  lui       $v1, 0x8027
/* 13C964 80249624 8C630280 */  lw        $v1, 0x280($v1)
/* 13C968 80249628 3C048027 */  lui       $a0, 0x8027
/* 13C96C 8024962C 24840288 */  addiu     $a0, $a0, 0x288
/* 13C970 80249630 AFBF0014 */  sw        $ra, 0x14($sp)
/* 13C974 80249634 AFB00010 */  sw        $s0, 0x10($sp)
/* 13C978 80249638 00031040 */  sll       $v0, $v1, 1
/* 13C97C 8024963C 00431021 */  addu      $v0, $v0, $v1
/* 13C980 80249640 00021080 */  sll       $v0, $v0, 2
/* 13C984 80249644 00443021 */  addu      $a2, $v0, $a0
/* 13C988 80249648 90C30002 */  lbu       $v1, 2($a2)
/* 13C98C 8024964C 3C028027 */  lui       $v0, 0x8027
/* 13C990 80249650 8C420378 */  lw        $v0, 0x378($v0)
/* 13C994 80249654 14600002 */  bnez      $v1, .L80249660
/* 13C998 80249658 0043001A */   div      $zero, $v0, $v1
/* 13C99C 8024965C 0007000D */  break     7
.L80249660:
/* 13C9A0 80249660 2401FFFF */   addiu    $at, $zero, -1
/* 13C9A4 80249664 14610004 */  bne       $v1, $at, .L80249678
/* 13C9A8 80249668 3C018000 */   lui      $at, 0x8000
/* 13C9AC 8024966C 14410002 */  bne       $v0, $at, .L80249678
/* 13C9B0 80249670 00000000 */   nop      
/* 13C9B4 80249674 0006000D */  break     6
.L80249678:
/* 13C9B8 80249678 00001012 */   mflo     $v0
/* 13C9BC 8024967C 90C30001 */  lbu       $v1, 1($a2)
/* 13C9C0 80249680 00432023 */  subu      $a0, $v0, $v1
/* 13C9C4 80249684 28820002 */  slti      $v0, $a0, 2
/* 13C9C8 80249688 14400005 */  bnez      $v0, .L802496A0
/* 13C9CC 8024968C 00000000 */   nop      
/* 13C9D0 80249690 90C20003 */  lbu       $v0, 3($a2)
/* 13C9D4 80249694 2C420009 */  sltiu     $v0, $v0, 9
/* 13C9D8 80249698 10400005 */  beqz      $v0, .L802496B0
/* 13C9DC 8024969C 00000000 */   nop      
.L802496A0:
/* 13C9E0 802496A0 3C018027 */  lui       $at, 0x8027
/* 13C9E4 802496A4 AC200394 */  sw        $zero, 0x394($at)
/* 13C9E8 802496A8 080925BF */  j         .L802496FC
/* 13C9EC 802496AC 00000000 */   nop      
.L802496B0:
/* 13C9F0 802496B0 90C30003 */  lbu       $v1, 3($a2)
/* 13C9F4 802496B4 2462FFFE */  addiu     $v0, $v1, -2
/* 13C9F8 802496B8 0082102A */  slt       $v0, $a0, $v0
/* 13C9FC 802496BC 14400005 */  bnez      $v0, .L802496D4
/* 13CA00 802496C0 2462FFF8 */   addiu    $v0, $v1, -8
/* 13CA04 802496C4 3C018027 */  lui       $at, 0x8027
/* 13CA08 802496C8 AC220394 */  sw        $v0, 0x394($at)
/* 13CA0C 802496CC 080925BF */  j         .L802496FC
/* 13CA10 802496D0 00000000 */   nop      
.L802496D4:
/* 13CA14 802496D4 3C058027 */  lui       $a1, 0x8027
/* 13CA18 802496D8 24A50394 */  addiu     $a1, $a1, 0x394
/* 13CA1C 802496DC 8CA20000 */  lw        $v0, ($a1)
/* 13CA20 802496E0 00821823 */  subu      $v1, $a0, $v0
/* 13CA24 802496E4 28620007 */  slti      $v0, $v1, 7
/* 13CA28 802496E8 10400003 */  beqz      $v0, .L802496F8
/* 13CA2C 802496EC 2482FFFA */   addiu    $v0, $a0, -6
/* 13CA30 802496F0 1C600002 */  bgtz      $v1, .L802496FC
/* 13CA34 802496F4 2482FFFF */   addiu    $v0, $a0, -1
.L802496F8:
/* 13CA38 802496F8 ACA20000 */  sw        $v0, ($a1)
.L802496FC:
/* 13CA3C 802496FC 90C20002 */  lbu       $v0, 2($a2)
/* 13CA40 80249700 3C058027 */  lui       $a1, 0x8027
/* 13CA44 80249704 8CA50394 */  lw        $a1, 0x394($a1)
/* 13CA48 80249708 00A20018 */  mult      $a1, $v0
/* 13CA4C 8024970C 3C048027 */  lui       $a0, 0x8027
/* 13CA50 80249710 8C840280 */  lw        $a0, 0x280($a0)
/* 13CA54 80249714 00002812 */  mflo      $a1
/* 13CA58 80249718 0C091C5A */  jal       pause_badges_get_pos_y
/* 13CA5C 8024971C 00000000 */   nop      
/* 13CA60 80249720 3C108027 */  lui       $s0, 0x8027
/* 13CA64 80249724 2610038C */  addiu     $s0, $s0, 0x38c
/* 13CA68 80249728 8E040000 */  lw        $a0, ($s0)
/* 13CA6C 8024972C 3C018027 */  lui       $at, 0x8027
/* 13CA70 80249730 AC220390 */  sw        $v0, 0x390($at)
/* 13CA74 80249734 0C090D1B */  jal       pause_interp_vertical_scroll
/* 13CA78 80249738 00442023 */   subu     $a0, $v0, $a0
/* 13CA7C 8024973C 8E030000 */  lw        $v1, ($s0)
/* 13CA80 80249740 00621821 */  addu      $v1, $v1, $v0
/* 13CA84 80249744 AE030000 */  sw        $v1, ($s0)
/* 13CA88 80249748 8FBF0014 */  lw        $ra, 0x14($sp)
/* 13CA8C 8024974C 8FB00010 */  lw        $s0, 0x10($sp)
/* 13CA90 80249750 03E00008 */  jr        $ra
/* 13CA94 80249754 27BD0018 */   addiu    $sp, $sp, 0x18
