.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80051050
/* 2C450 80051050 00041100 */  sll       $v0, $a0, 4
/* 2C454 80051054 00441023 */  subu      $v0, $v0, $a0
/* 2C458 80051058 000210C0 */  sll       $v0, $v0, 3
/* 2C45C 8005105C 00441021 */  addu      $v0, $v0, $a0
/* 2C460 80051060 00021080 */  sll       $v0, $v0, 2
/* 2C464 80051064 3C03800A */  lui       $v1, 0x800a
/* 2C468 80051068 8C63A628 */  lw        $v1, -0x59d8($v1)
/* 2C46C 8005106C 24420024 */  addiu     $v0, $v0, 0x24
/* 2C470 80051070 00621821 */  addu      $v1, $v1, $v0
/* 2C474 80051074 8C620004 */  lw        $v0, 4($v1)
/* 2C478 80051078 10400008 */  beqz      $v0, .L8005109C
/* 2C47C 8005107C 0000202D */   daddu    $a0, $zero, $zero
/* 2C480 80051080 8C620008 */  lw        $v0, 8($v1)
/* 2C484 80051084 10400005 */  beqz      $v0, .L8005109C
/* 2C488 80051088 00000000 */   nop      
/* 2C48C 8005108C 90620024 */  lbu       $v0, 0x24($v1)
/* 2C490 80051090 10400002 */  beqz      $v0, .L8005109C
/* 2C494 80051094 24040001 */   addiu    $a0, $zero, 1
/* 2C498 80051098 24040002 */  addiu     $a0, $zero, 2
.L8005109C:
/* 2C49C 8005109C 03E00008 */  jr        $ra
/* 2C4A0 800510A0 0080102D */   daddu    $v0, $a0, $zero
