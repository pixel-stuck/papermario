.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel play_hit_sound
/* 1A58E4 80277004 44850000 */  mtc1      $a1, $f0
/* 1A58E8 80277008 44861000 */  mtc1      $a2, $f2
/* 1A58EC 8027700C 44872000 */  mtc1      $a3, $f4
/* 1A58F0 80277010 27BDFFE0 */  addiu     $sp, $sp, -0x20
/* 1A58F4 80277014 AFBF0018 */  sw        $ra, 0x18($sp)
/* 1A58F8 80277018 94820192 */  lhu       $v0, 0x192($a0)
/* 1A58FC 8027701C 8FA40030 */  lw        $a0, 0x30($sp)
/* 1A5900 80277020 30430700 */  andi      $v1, $v0, 0x700
/* 1A5904 80277024 2C820006 */  sltiu     $v0, $a0, 6
/* 1A5908 80277028 1040004A */  beqz      $v0, .L80277154
/* 1A590C 8027702C 00041080 */   sll      $v0, $a0, 2
/* 1A5910 80277030 3C01802A */  lui       $at, 0x802a
/* 1A5914 80277034 00220821 */  addu      $at, $at, $v0
/* 1A5918 80277038 8C22D990 */  lw        $v0, -0x2670($at)
/* 1A591C 8027703C 00400008 */  jr        $v0
/* 1A5920 80277040 00000000 */   nop      
/* 1A5924 80277044 0809DC50 */  j         .L80277140
/* 1A5928 80277048 2404010C */   addiu    $a0, $zero, 0x10c
/* 1A592C 8027704C 0809DC50 */  j         .L80277140
/* 1A5930 80277050 2404010D */   addiu    $a0, $zero, 0x10d
/* 1A5934 80277054 24020100 */  addiu     $v0, $zero, 0x100
/* 1A5938 80277058 1062000B */  beq       $v1, $v0, .L80277088
/* 1A593C 8027705C 28620101 */   slti     $v0, $v1, 0x101
/* 1A5940 80277060 50400005 */  beql      $v0, $zero, .L80277078
/* 1A5944 80277064 24020200 */   addiu    $v0, $zero, 0x200
/* 1A5948 80277068 10600035 */  beqz      $v1, .L80277140
/* 1A594C 8027706C 240400E1 */   addiu    $a0, $zero, 0xe1
/* 1A5950 80277070 0809DC55 */  j         .L80277154
/* 1A5954 80277074 00000000 */   nop      
.L80277078:
/* 1A5958 80277078 10620031 */  beq       $v1, $v0, .L80277140
/* 1A595C 8027707C 240400E9 */   addiu    $a0, $zero, 0xe9
/* 1A5960 80277080 0809DC55 */  j         .L80277154
/* 1A5964 80277084 00000000 */   nop      
.L80277088:
/* 1A5968 80277088 0809DC50 */  j         .L80277140
/* 1A596C 8027708C 240400E9 */   addiu    $a0, $zero, 0xe9
/* 1A5970 80277090 24020100 */  addiu     $v0, $zero, 0x100
/* 1A5974 80277094 1062000B */  beq       $v1, $v0, .L802770C4
/* 1A5978 80277098 28620101 */   slti     $v0, $v1, 0x101
/* 1A597C 8027709C 50400005 */  beql      $v0, $zero, .L802770B4
/* 1A5980 802770A0 24020200 */   addiu    $v0, $zero, 0x200
/* 1A5984 802770A4 10600026 */  beqz      $v1, .L80277140
/* 1A5988 802770A8 240400E2 */   addiu    $a0, $zero, 0xe2
/* 1A598C 802770AC 0809DC55 */  j         .L80277154
/* 1A5990 802770B0 00000000 */   nop      
.L802770B4:
/* 1A5994 802770B4 10620022 */  beq       $v1, $v0, .L80277140
/* 1A5998 802770B8 240400EA */   addiu    $a0, $zero, 0xea
/* 1A599C 802770BC 0809DC55 */  j         .L80277154
/* 1A59A0 802770C0 00000000 */   nop      
.L802770C4:
/* 1A59A4 802770C4 0809DC50 */  j         .L80277140
/* 1A59A8 802770C8 240400EA */   addiu    $a0, $zero, 0xea
/* 1A59AC 802770CC 24020100 */  addiu     $v0, $zero, 0x100
/* 1A59B0 802770D0 1062000B */  beq       $v1, $v0, .L80277100
/* 1A59B4 802770D4 28620101 */   slti     $v0, $v1, 0x101
/* 1A59B8 802770D8 50400005 */  beql      $v0, $zero, .L802770F0
/* 1A59BC 802770DC 24020200 */   addiu    $v0, $zero, 0x200
/* 1A59C0 802770E0 10600017 */  beqz      $v1, .L80277140
/* 1A59C4 802770E4 240400E3 */   addiu    $a0, $zero, 0xe3
/* 1A59C8 802770E8 0809DC55 */  j         .L80277154
/* 1A59CC 802770EC 00000000 */   nop      
.L802770F0:
/* 1A59D0 802770F0 10620013 */  beq       $v1, $v0, .L80277140
/* 1A59D4 802770F4 240400EB */   addiu    $a0, $zero, 0xeb
/* 1A59D8 802770F8 0809DC55 */  j         .L80277154
/* 1A59DC 802770FC 00000000 */   nop      
.L80277100:
/* 1A59E0 80277100 0809DC50 */  j         .L80277140
/* 1A59E4 80277104 240400EB */   addiu    $a0, $zero, 0xeb
/* 1A59E8 80277108 24020100 */  addiu     $v0, $zero, 0x100
/* 1A59EC 8027710C 1062000B */  beq       $v1, $v0, .L8027713C
/* 1A59F0 80277110 28620101 */   slti     $v0, $v1, 0x101
/* 1A59F4 80277114 50400005 */  beql      $v0, $zero, .L8027712C
/* 1A59F8 80277118 24020200 */   addiu    $v0, $zero, 0x200
/* 1A59FC 8027711C 10600008 */  beqz      $v1, .L80277140
/* 1A5A00 80277120 2404037A */   addiu    $a0, $zero, 0x37a
/* 1A5A04 80277124 0809DC55 */  j         .L80277154
/* 1A5A08 80277128 00000000 */   nop      
.L8027712C:
/* 1A5A0C 8027712C 10620004 */  beq       $v1, $v0, .L80277140
/* 1A5A10 80277130 2404037B */   addiu    $a0, $zero, 0x37b
/* 1A5A14 80277134 0809DC55 */  j         .L80277154
/* 1A5A18 80277138 00000000 */   nop      
.L8027713C:
/* 1A5A1C 8027713C 2404037B */  addiu     $a0, $zero, 0x37b
.L80277140:
/* 1A5A20 80277140 44060000 */  mfc1      $a2, $f0
/* 1A5A24 80277144 44071000 */  mfc1      $a3, $f2
/* 1A5A28 80277148 0000282D */  daddu     $a1, $zero, $zero
/* 1A5A2C 8027714C 0C052757 */  jal       play_sound_at_position
/* 1A5A30 80277150 E7A40010 */   swc1     $f4, 0x10($sp)
.L80277154:
/* 1A5A34 80277154 8FBF0018 */  lw        $ra, 0x18($sp)
/* 1A5A38 80277158 03E00008 */  jr        $ra
/* 1A5A3C 8027715C 27BD0020 */   addiu    $sp, $sp, 0x20
