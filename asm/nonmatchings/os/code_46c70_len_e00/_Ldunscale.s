.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel _Ldunscale
/* 4741C 8006C01C 94A30000 */  lhu       $v1, ($a1)
/* 47420 8006C020 30627FF0 */  andi      $v0, $v1, 0x7ff0
/* 47424 8006C024 00023902 */  srl       $a3, $v0, 4
/* 47428 8006C028 00E03021 */  addu      $a2, $a3, $zero
/* 4742C 8006C02C 240207FF */  addiu     $v0, $zero, 0x7ff
/* 47430 8006C030 14C20011 */  bne       $a2, $v0, .L8006C078
/* 47434 8006C034 00A04021 */   addu     $t0, $a1, $zero
/* 47438 8006C038 A4800000 */  sh        $zero, ($a0)
/* 4743C 8006C03C 94A20000 */  lhu       $v0, ($a1)
/* 47440 8006C040 3042000F */  andi      $v0, $v0, 0xf
/* 47444 8006C044 14400019 */  bnez      $v0, .L8006C0AC
/* 47448 8006C048 24020002 */   addiu    $v0, $zero, 2
/* 4744C 8006C04C 94A20002 */  lhu       $v0, 2($a1)
/* 47450 8006C050 14400016 */  bnez      $v0, .L8006C0AC
/* 47454 8006C054 24020002 */   addiu    $v0, $zero, 2
/* 47458 8006C058 94A20004 */  lhu       $v0, 4($a1)
/* 4745C 8006C05C 14400013 */  bnez      $v0, .L8006C0AC
/* 47460 8006C060 24020002 */   addiu    $v0, $zero, 2
/* 47464 8006C064 94A20006 */  lhu       $v0, 6($a1)
/* 47468 8006C068 14400010 */  bnez      $v0, .L8006C0AC
/* 4746C 8006C06C 24020002 */   addiu    $v0, $zero, 2
/* 47470 8006C070 0801B02B */  j         .L8006C0AC
/* 47474 8006C074 24020001 */   addiu    $v0, $zero, 1
.L8006C078:
/* 47478 8006C078 18C00007 */  blez      $a2, .L8006C098
/* 4747C 8006C07C 2402FFFF */   addiu    $v0, $zero, -1
/* 47480 8006C080 3063800F */  andi      $v1, $v1, 0x800f
/* 47484 8006C084 34633FF0 */  ori       $v1, $v1, 0x3ff0
/* 47488 8006C088 A5030000 */  sh        $v1, ($t0)
/* 4748C 8006C08C 24E3FC02 */  addiu     $v1, $a3, -0x3fe
/* 47490 8006C090 0801B02B */  j         .L8006C0AC
/* 47494 8006C094 A4830000 */   sh       $v1, ($a0)
.L8006C098:
/* 47498 8006C098 04C00003 */  bltz      $a2, .L8006C0A8
/* 4749C 8006C09C 00001021 */   addu     $v0, $zero, $zero
/* 474A0 8006C0A0 0801B02B */  j         .L8006C0AC
/* 474A4 8006C0A4 A4800000 */   sh       $zero, ($a0)
.L8006C0A8:
/* 474A8 8006C0A8 24020002 */  addiu     $v0, $zero, 2
.L8006C0AC:
/* 474AC 8006C0AC 03E00008 */  jr        $ra
/* 474B0 8006C0B0 00000000 */   nop
