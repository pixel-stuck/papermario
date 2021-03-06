.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_8005E12C
/* 3952C 8005E12C 27BDFF98 */  addiu     $sp, $sp, -0x68
/* 39530 8005E130 AFB20040 */  sw        $s2, 0x40($sp)
/* 39534 8005E134 0080902D */  daddu     $s2, $a0, $zero
/* 39538 8005E138 27A50018 */  addiu     $a1, $sp, 0x18
/* 3953C 8005E13C 27A6001C */  addiu     $a2, $sp, 0x1c
/* 39540 8005E140 AFBF0044 */  sw        $ra, 0x44($sp)
/* 39544 8005E144 AFB1003C */  sw        $s1, 0x3c($sp)
/* 39548 8005E148 AFB00038 */  sw        $s0, 0x38($sp)
/* 3954C 8005E14C F7BA0060 */  sdc1      $f26, 0x60($sp)
/* 39550 8005E150 F7B80058 */  sdc1      $f24, 0x58($sp)
/* 39554 8005E154 F7B60050 */  sdc1      $f22, 0x50($sp)
/* 39558 8005E158 F7B40048 */  sdc1      $f20, 0x48($sp)
/* 3955C 8005E15C 8E510020 */  lw        $s1, 0x20($s2)
/* 39560 8005E160 27A20024 */  addiu     $v0, $sp, 0x24
/* 39564 8005E164 AFA20010 */  sw        $v0, 0x10($sp)
/* 39568 8005E168 8E24028C */  lw        $a0, 0x28c($s1)
/* 3956C 8005E16C 0C017784 */  jal       get_npc_pos
/* 39570 8005E170 27A70020 */   addiu    $a3, $sp, 0x20
/* 39574 8005E174 8E230288 */  lw        $v1, 0x288($s1)
/* 39578 8005E178 24020001 */  addiu     $v0, $zero, 1
/* 3957C 8005E17C 106200A4 */  beq       $v1, $v0, .L8005E410
/* 39580 8005E180 28620002 */   slti     $v0, $v1, 2
/* 39584 8005E184 50400005 */  beql      $v0, $zero, .L8005E19C
/* 39588 8005E188 24020002 */   addiu    $v0, $zero, 2
/* 3958C 8005E18C 10600015 */  beqz      $v1, .L8005E1E4
/* 39590 8005E190 00000000 */   nop      
/* 39594 8005E194 08017A20 */  j         .L8005E880
/* 39598 8005E198 00000000 */   nop      
.L8005E19C:
/* 3959C 8005E19C 10620104 */  beq       $v1, $v0, .L8005E5B0
/* 395A0 8005E1A0 2402000A */   addiu    $v0, $zero, 0xa
/* 395A4 8005E1A4 1062014C */  beq       $v1, $v0, .L8005E6D8
/* 395A8 8005E1A8 00000000 */   nop      
/* 395AC 8005E1AC 08017A20 */  j         .L8005E880
/* 395B0 8005E1B0 00000000 */   nop      
.L8005E1B4:
/* 395B4 8005E1B4 8E220290 */  lw        $v0, 0x290($s1)
/* 395B8 8005E1B8 C658000C */  lwc1      $f24, 0xc($s2)
/* 395BC 8005E1BC 8C420010 */  lw        $v0, 0x10($v0)
/* 395C0 8005E1C0 080178ED */  j         .L8005E3B4
/* 395C4 8005E1C4 AE420028 */   sw       $v0, 0x28($s2)
.L8005E1C8:
/* 395C8 8005E1C8 AE400018 */  sw        $zero, 0x18($s2)
/* 395CC 8005E1CC 8E220290 */  lw        $v0, 0x290($s1)
/* 395D0 8005E1D0 C658000C */  lwc1      $f24, 0xc($s2)
/* 395D4 8005E1D4 8C420010 */  lw        $v0, 0x10($v0)
/* 395D8 8005E1D8 AE420028 */  sw        $v0, 0x28($s2)
/* 395DC 8005E1DC 080178EC */  j         .L8005E3B0
/* 395E0 8005E1E0 2402000A */   addiu    $v0, $zero, 0xa
.L8005E1E4:
/* 395E4 8005E1E4 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 395E8 8005E1E8 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 395EC 8005E1EC 8FA60018 */  lw        $a2, 0x18($sp)
/* 395F0 8005E1F0 8E220284 */  lw        $v0, 0x284($s1)
/* 395F4 8005E1F4 8FA70020 */  lw        $a3, 0x20($sp)
/* 395F8 8005E1F8 C642003C */  lwc1      $f2, 0x3c($s2)
/* 395FC 8005E1FC C6260294 */  lwc1      $f6, 0x294($s1)
/* 39600 8005E200 00021100 */  sll       $v0, $v0, 4
/* 39604 8005E204 02228021 */  addu      $s0, $s1, $v0
/* 39608 8005E208 46006006 */  mov.s     $f0, $f12
/* 3960C 8005E20C C6160004 */  lwc1      $f22, 4($s0)
/* 39610 8005E210 C614000C */  lwc1      $f20, 0xc($s0)
/* 39614 8005E214 46007106 */  mov.s     $f4, $f14
/* 39618 8005E218 E7A00028 */  swc1      $f0, 0x28($sp)
/* 3961C 8005E21C E7A2002C */  swc1      $f2, 0x2c($sp)
/* 39620 8005E220 E7A40030 */  swc1      $f4, 0x30($sp)
/* 39624 8005E224 0C00A7B5 */  jal       dist2D
/* 39628 8005E228 E6460018 */   swc1     $f6, 0x18($s2)
/* 3962C 8005E22C C62202A0 */  lwc1      $f2, 0x2a0($s1)
/* 39630 8005E230 4600103E */  c.le.s    $f2, $f0
/* 39634 8005E234 00000000 */  nop       
/* 39638 8005E238 45000003 */  bc1f      .L8005E248
/* 3963C 8005E23C E7A00034 */   swc1     $f0, 0x34($sp)
/* 39640 8005E240 C6200298 */  lwc1      $f0, 0x298($s1)
/* 39644 8005E244 E6400018 */  swc1      $f0, 0x18($s2)
.L8005E248:
/* 39648 8005E248 8E220290 */  lw        $v0, 0x290($s1)
/* 3964C 8005E24C 8C430014 */  lw        $v1, 0x14($v0)
/* 39650 8005E250 8E420000 */  lw        $v0, ($s2)
/* 39654 8005E254 30421000 */  andi      $v0, $v0, 0x1000
/* 39658 8005E258 14400004 */  bnez      $v0, .L8005E26C
/* 3965C 8005E25C AE430028 */   sw       $v1, 0x28($s2)
/* 39660 8005E260 8E220290 */  lw        $v0, 0x290($s1)
/* 39664 8005E264 8C420008 */  lw        $v0, 8($v0)
/* 39668 8005E268 AE420028 */  sw        $v0, 0x28($s2)
.L8005E26C:
/* 3966C 8005E26C C7AC0028 */  lwc1      $f12, 0x28($sp)
/* 39670 8005E270 C7AE0030 */  lwc1      $f14, 0x30($sp)
/* 39674 8005E274 4406B000 */  mfc1      $a2, $f22
/* 39678 8005E278 4407A000 */  mfc1      $a3, $f20
/* 3967C 8005E27C 0C00A7B5 */  jal       dist2D
/* 39680 8005E280 00000000 */   nop      
/* 39684 8005E284 C7AC0028 */  lwc1      $f12, 0x28($sp)
/* 39688 8005E288 C7AE0030 */  lwc1      $f14, 0x30($sp)
/* 3968C 8005E28C 4406B000 */  mfc1      $a2, $f22
/* 39690 8005E290 4407A000 */  mfc1      $a3, $f20
/* 39694 8005E294 0C00A720 */  jal       atan2
/* 39698 8005E298 E7A00034 */   swc1     $f0, 0x34($sp)
/* 3969C 8005E29C C6440018 */  lwc1      $f4, 0x18($s2)
/* 396A0 8005E2A0 C7A20034 */  lwc1      $f2, 0x34($sp)
/* 396A4 8005E2A4 4602203C */  c.lt.s    $f4, $f2
/* 396A8 8005E2A8 00000000 */  nop       
/* 396AC 8005E2AC 45000020 */  bc1f      .L8005E330
/* 396B0 8005E2B0 46000606 */   mov.s    $f24, $f0
/* 396B4 8005E2B4 C7AC0028 */  lwc1      $f12, 0x28($sp)
/* 396B8 8005E2B8 C7AE0030 */  lwc1      $f14, 0x30($sp)
/* 396BC 8005E2BC 8FA60018 */  lw        $a2, 0x18($sp)
/* 396C0 8005E2C0 0C00A7B5 */  jal       dist2D
/* 396C4 8005E2C4 8FA70020 */   lw       $a3, 0x20($sp)
/* 396C8 8005E2C8 E7A00034 */  swc1      $f0, 0x34($sp)
/* 396CC 8005E2CC C62202A0 */  lwc1      $f2, 0x2a0($s1)
/* 396D0 8005E2D0 4600103C */  c.lt.s    $f2, $f0
/* 396D4 8005E2D4 00000000 */  nop       
/* 396D8 8005E2D8 45010036 */  bc1t      .L8005E3B4
/* 396DC 8005E2DC 00000000 */   nop      
/* 396E0 8005E2E0 C622029C */  lwc1      $f2, 0x29c($s1)
/* 396E4 8005E2E4 4600103C */  c.lt.s    $f2, $f0
/* 396E8 8005E2E8 00000000 */  nop       
/* 396EC 8005E2EC 45000010 */  bc1f      .L8005E330
/* 396F0 8005E2F0 00000000 */   nop      
/* 396F4 8005E2F4 46020001 */  sub.s     $f0, $f0, $f2
/* 396F8 8005E2F8 E6400018 */  swc1      $f0, 0x18($s2)
/* 396FC 8005E2FC C6220294 */  lwc1      $f2, 0x294($s1)
/* 39700 8005E300 4600103C */  c.lt.s    $f2, $f0
/* 39704 8005E304 00000000 */  nop       
/* 39708 8005E308 4503002A */  bc1tl     .L8005E3B4
/* 3970C 8005E30C E6420018 */   swc1     $f2, 0x18($s2)
/* 39710 8005E310 3C013FF0 */  lui       $at, 0x3ff0
/* 39714 8005E314 44811800 */  mtc1      $at, $f3
/* 39718 8005E318 44801000 */  mtc1      $zero, $f2
/* 3971C 8005E31C 46000021 */  cvt.d.s   $f0, $f0
/* 39720 8005E320 46220000 */  add.d     $f0, $f0, $f2
/* 39724 8005E324 46200020 */  cvt.s.d   $f0, $f0
/* 39728 8005E328 080178ED */  j         .L8005E3B4
/* 3972C 8005E32C E6400018 */   swc1     $f0, 0x18($s2)
.L8005E330:
/* 39730 8005E330 8E230284 */  lw        $v1, 0x284($s1)
/* 39734 8005E334 8E220280 */  lw        $v0, 0x280($s1)
/* 39738 8005E338 5062FF9E */  beql      $v1, $v0, .L8005E1B4
/* 3973C 8005E33C AE400018 */   sw       $zero, 0x18($s2)
/* 39740 8005E340 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39744 8005E344 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39748 8005E348 8FA60018 */  lw        $a2, 0x18($sp)
/* 3974C 8005E34C 0C00A7B5 */  jal       dist2D
/* 39750 8005E350 8FA70020 */   lw       $a3, 0x20($sp)
/* 39754 8005E354 C622029C */  lwc1      $f2, 0x29c($s1)
/* 39758 8005E358 4602003E */  c.le.s    $f0, $f2
/* 3975C 8005E35C 00000000 */  nop       
/* 39760 8005E360 4501FF99 */  bc1t      .L8005E1C8
/* 39764 8005E364 E7A00034 */   swc1     $f0, 0x34($sp)
/* 39768 8005E368 8E220284 */  lw        $v0, 0x284($s1)
/* 3976C 8005E36C 24420001 */  addiu     $v0, $v0, 1
/* 39770 8005E370 AE220284 */  sw        $v0, 0x284($s1)
/* 39774 8005E374 28420028 */  slti      $v0, $v0, 0x28
/* 39778 8005E378 50400001 */  beql      $v0, $zero, .L8005E380
/* 3977C 8005E37C AE200284 */   sw       $zero, 0x284($s1)
.L8005E380:
/* 39780 8005E380 8E220284 */  lw        $v0, 0x284($s1)
/* 39784 8005E384 00021100 */  sll       $v0, $v0, 4
/* 39788 8005E388 02228021 */  addu      $s0, $s1, $v0
/* 3978C 8005E38C C6160004 */  lwc1      $f22, 4($s0)
/* 39790 8005E390 8E420000 */  lw        $v0, ($s2)
/* 39794 8005E394 C614000C */  lwc1      $f20, 0xc($s0)
/* 39798 8005E398 30421000 */  andi      $v0, $v0, 0x1000
/* 3979C 8005E39C 1040FFB3 */  beqz      $v0, .L8005E26C
/* 397A0 8005E3A0 00000000 */   nop      
/* 397A4 8005E3A4 82020000 */  lb        $v0, ($s0)
/* 397A8 8005E3A8 1040FFB0 */  beqz      $v0, .L8005E26C
/* 397AC 8005E3AC 24020001 */   addiu    $v0, $zero, 1
.L8005E3B0:
/* 397B0 8005E3B0 AE220288 */  sw        $v0, 0x288($s1)
.L8005E3B4:
/* 397B4 8005E3B4 8E420000 */  lw        $v0, ($s2)
/* 397B8 8005E3B8 30421000 */  andi      $v0, $v0, 0x1000
/* 397BC 8005E3BC 14400008 */  bnez      $v0, .L8005E3E0
/* 397C0 8005E3C0 00000000 */   nop      
/* 397C4 8005E3C4 C6400018 */  lwc1      $f0, 0x18($s2)
/* 397C8 8005E3C8 3C013F00 */  lui       $at, 0x3f00
/* 397CC 8005E3CC 44811000 */  mtc1      $at, $f2
/* 397D0 8005E3D0 00000000 */  nop       
/* 397D4 8005E3D4 46020002 */  mul.s     $f0, $f0, $f2
/* 397D8 8005E3D8 00000000 */  nop       
/* 397DC 8005E3DC E6400018 */  swc1      $f0, 0x18($s2)
.L8005E3E0:
/* 397E0 8005E3E0 8E450018 */  lw        $a1, 0x18($s2)
/* 397E4 8005E3E4 4406C000 */  mfc1      $a2, $f24
/* 397E8 8005E3E8 0240202D */  daddu     $a0, $s2, $zero
/* 397EC 8005E3EC 0C00EA95 */  jal       npc_move_heading
/* 397F0 8005E3F0 AE46000C */   sw       $a2, 0xc($s2)
/* 397F4 8005E3F4 8E420000 */  lw        $v0, ($s2)
/* 397F8 8005E3F8 24035000 */  addiu     $v1, $zero, 0x5000
/* 397FC 8005E3FC 30425000 */  andi      $v0, $v0, 0x5000
/* 39800 8005E400 1443011F */  bne       $v0, $v1, .L8005E880
/* 39804 8005E404 24020001 */   addiu    $v0, $zero, 1
/* 39808 8005E408 08017A20 */  j         .L8005E880
/* 3980C 8005E40C AE220288 */   sw       $v0, 0x288($s1)
.L8005E410:
/* 39810 8005E410 8E230284 */  lw        $v1, 0x284($s1)
/* 39814 8005E414 8E220280 */  lw        $v0, 0x280($s1)
/* 39818 8005E418 10620119 */  beq       $v1, $v0, .L8005E880
/* 3981C 8005E41C 24620001 */   addiu    $v0, $v1, 1
/* 39820 8005E420 AE220284 */  sw        $v0, 0x284($s1)
/* 39824 8005E424 28420028 */  slti      $v0, $v0, 0x28
/* 39828 8005E428 50400001 */  beql      $v0, $zero, .L8005E430
/* 3982C 8005E42C AE200284 */   sw       $zero, 0x284($s1)
.L8005E430:
/* 39830 8005E430 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39834 8005E434 8E220284 */  lw        $v0, 0x284($s1)
/* 39838 8005E438 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 3983C 8005E43C 3C014000 */  lui       $at, 0x4000
/* 39840 8005E440 44810000 */  mtc1      $at, $f0
/* 39844 8005E444 00021100 */  sll       $v0, $v0, 4
/* 39848 8005E448 02228021 */  addu      $s0, $s1, $v0
/* 3984C 8005E44C C6160004 */  lwc1      $f22, 4($s0)
/* 39850 8005E450 C614000C */  lwc1      $f20, 0xc($s0)
/* 39854 8005E454 C6020008 */  lwc1      $f2, 8($s0)
/* 39858 8005E458 A640008E */  sh        $zero, 0x8e($s2)
/* 3985C 8005E45C E6400014 */  swc1      $f0, 0x14($s2)
/* 39860 8005E460 E6560060 */  swc1      $f22, 0x60($s2)
/* 39864 8005E464 E6540068 */  swc1      $f20, 0x68($s2)
/* 39868 8005E468 E6420064 */  swc1      $f2, 0x64($s2)
/* 3986C 8005E46C C6200298 */  lwc1      $f0, 0x298($s1)
/* 39870 8005E470 4406B000 */  mfc1      $a2, $f22
/* 39874 8005E474 4407A000 */  mfc1      $a3, $f20
/* 39878 8005E478 0C00A7B5 */  jal       dist2D
/* 3987C 8005E47C E6400018 */   swc1     $f0, 0x18($s2)
/* 39880 8005E480 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39884 8005E484 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39888 8005E488 8E460060 */  lw        $a2, 0x60($s2)
/* 3988C 8005E48C 8E470068 */  lw        $a3, 0x68($s2)
/* 39890 8005E490 0C00A720 */  jal       atan2
/* 39894 8005E494 E6400010 */   swc1     $f0, 0x10($s2)
/* 39898 8005E498 C6480010 */  lwc1      $f8, 0x10($s2)
/* 3989C 8005E49C C6440064 */  lwc1      $f4, 0x64($s2)
/* 398A0 8005E4A0 C642003C */  lwc1      $f2, 0x3c($s2)
/* 398A4 8005E4A4 E640000C */  swc1      $f0, 0xc($s2)
/* 398A8 8005E4A8 46022101 */  sub.s     $f4, $f4, $f2
/* 398AC 8005E4AC 46004186 */  mov.s     $f6, $f8
/* 398B0 8005E4B0 E7A80034 */  swc1      $f8, 0x34($sp)
/* 398B4 8005E4B4 4604303C */  c.lt.s    $f6, $f4
/* 398B8 8005E4B8 00000000 */  nop       
/* 398BC 8005E4BC 45000002 */  bc1f      .L8005E4C8
/* 398C0 8005E4C0 E7A4002C */   swc1     $f4, 0x2c($sp)
/* 398C4 8005E4C4 E7A40034 */  swc1      $f4, 0x34($sp)
.L8005E4C8:
/* 398C8 8005E4C8 C620029C */  lwc1      $f0, 0x29c($s1)
/* 398CC 8005E4CC C7A20034 */  lwc1      $f2, 0x34($sp)
/* 398D0 8005E4D0 4600103C */  c.lt.s    $f2, $f0
/* 398D4 8005E4D4 00000000 */  nop       
/* 398D8 8005E4D8 4500000A */  bc1f      .L8005E504
/* 398DC 8005E4DC 00000000 */   nop      
/* 398E0 8005E4E0 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 398E4 8005E4E4 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 398E8 8005E4E8 8FA60018 */  lw        $a2, 0x18($sp)
/* 398EC 8005E4EC 8FA70020 */  lw        $a3, 0x20($sp)
/* 398F0 8005E4F0 8E420000 */  lw        $v0, ($s2)
/* 398F4 8005E4F4 AE40001C */  sw        $zero, 0x1c($s2)
/* 398F8 8005E4F8 34420200 */  ori       $v0, $v0, 0x200
/* 398FC 8005E4FC 080179B1 */  j         .L8005E6C4
/* 39900 8005E500 AE420000 */   sw       $v0, ($s2)
.L8005E504:
/* 39904 8005E504 C6400018 */  lwc1      $f0, 0x18($s2)
/* 39908 8005E508 46001003 */  div.s     $f0, $f2, $f0
/* 3990C 8005E50C 4600028D */  trunc.w.s $f10, $f0
/* 39910 8005E510 44025000 */  mfc1      $v0, $f10
/* 39914 8005E514 00000000 */  nop       
/* 39918 8005E518 A642008E */  sh        $v0, 0x8e($s2)
/* 3991C 8005E51C 00021400 */  sll       $v0, $v0, 0x10
/* 39920 8005E520 00021403 */  sra       $v0, $v0, 0x10
/* 39924 8005E524 2842000A */  slti      $v0, $v0, 0xa
/* 39928 8005E528 10400002 */  beqz      $v0, .L8005E534
/* 3992C 8005E52C 2402000A */   addiu    $v0, $zero, 0xa
/* 39930 8005E530 A642008E */  sh        $v0, 0x8e($s2)
.L8005E534:
/* 39934 8005E534 8642008E */  lh        $v0, 0x8e($s2)
/* 39938 8005E538 C6420014 */  lwc1      $f2, 0x14($s2)
/* 3993C 8005E53C 44823000 */  mtc1      $v0, $f6
/* 39940 8005E540 00000000 */  nop       
/* 39944 8005E544 468031A0 */  cvt.s.w   $f6, $f6
/* 39948 8005E548 46061082 */  mul.s     $f2, $f2, $f6
/* 3994C 8005E54C 00000000 */  nop       
/* 39950 8005E550 46061082 */  mul.s     $f2, $f2, $f6
/* 39954 8005E554 00000000 */  nop       
/* 39958 8005E558 3C013F00 */  lui       $at, 0x3f00
/* 3995C 8005E55C 44810000 */  mtc1      $at, $f0
/* 39960 8005E560 00000000 */  nop       
/* 39964 8005E564 46001082 */  mul.s     $f2, $f2, $f0
/* 39968 8005E568 00000000 */  nop       
/* 3996C 8005E56C 2404FDFF */  addiu     $a0, $zero, -0x201
/* 39970 8005E570 C7A4002C */  lwc1      $f4, 0x2c($sp)
/* 39974 8005E574 46003206 */  mov.s     $f8, $f6
/* 39978 8005E578 C6400010 */  lwc1      $f0, 0x10($s2)
/* 3997C 8005E57C 46022100 */  add.s     $f4, $f4, $f2
/* 39980 8005E580 46080003 */  div.s     $f0, $f0, $f8
/* 39984 8005E584 E6400018 */  swc1      $f0, 0x18($s2)
/* 39988 8005E588 46062103 */  div.s     $f4, $f4, $f6
/* 3998C 8005E58C E644001C */  swc1      $f4, 0x1c($s2)
/* 39990 8005E590 8E230290 */  lw        $v1, 0x290($s1)
/* 39994 8005E594 8E420000 */  lw        $v0, ($s2)
/* 39998 8005E598 8C630004 */  lw        $v1, 4($v1)
/* 3999C 8005E59C 00441024 */  and       $v0, $v0, $a0
/* 399A0 8005E5A0 AE420000 */  sw        $v0, ($s2)
/* 399A4 8005E5A4 24020002 */  addiu     $v0, $zero, 2
/* 399A8 8005E5A8 08017A1F */  j         .L8005E87C
/* 399AC 8005E5AC AE430028 */   sw       $v1, 0x28($s2)
.L8005E5B0:
/* 399B0 8005E5B0 C640001C */  lwc1      $f0, 0x1c($s2)
/* 399B4 8005E5B4 C6420014 */  lwc1      $f2, 0x14($s2)
/* 399B8 8005E5B8 46020001 */  sub.s     $f0, $f0, $f2
/* 399BC 8005E5BC C642003C */  lwc1      $f2, 0x3c($s2)
/* 399C0 8005E5C0 46001080 */  add.s     $f2, $f2, $f0
/* 399C4 8005E5C4 4480B000 */  mtc1      $zero, $f22
/* 399C8 8005E5C8 00000000 */  nop       
/* 399CC 8005E5CC 4616003E */  c.le.s    $f0, $f22
/* 399D0 8005E5D0 E640001C */  swc1      $f0, 0x1c($s2)
/* 399D4 8005E5D4 45000004 */  bc1f      .L8005E5E8
/* 399D8 8005E5D8 E642003C */   swc1     $f2, 0x3c($s2)
/* 399DC 8005E5DC 8E220290 */  lw        $v0, 0x290($s1)
/* 399E0 8005E5E0 8C420008 */  lw        $v0, 8($v0)
/* 399E4 8005E5E4 AE420028 */  sw        $v0, 0x28($s2)
.L8005E5E8:
/* 399E8 8005E5E8 8E450018 */  lw        $a1, 0x18($s2)
/* 399EC 8005E5EC 8E46000C */  lw        $a2, 0xc($s2)
/* 399F0 8005E5F0 0C00EA95 */  jal       npc_move_heading
/* 399F4 8005E5F4 0240202D */   daddu    $a0, $s2, $zero
/* 399F8 8005E5F8 C640001C */  lwc1      $f0, 0x1c($s2)
/* 399FC 8005E5FC 4616003E */  c.le.s    $f0, $f22
/* 39A00 8005E600 00000000 */  nop       
/* 39A04 8005E604 4500009E */  bc1f      .L8005E880
/* 39A08 8005E608 27A50028 */   addiu    $a1, $sp, 0x28
/* 39A0C 8005E60C 46000005 */  abs.s     $f0, $f0
/* 39A10 8005E610 46000021 */  cvt.d.s   $f0, $f0
/* 39A14 8005E614 27A6002C */  addiu     $a2, $sp, 0x2c
/* 39A18 8005E618 27A20034 */  addiu     $v0, $sp, 0x34
/* 39A1C 8005E61C 3C014020 */  lui       $at, 0x4020
/* 39A20 8005E620 4481A800 */  mtc1      $at, $f21
/* 39A24 8005E624 4480A000 */  mtc1      $zero, $f20
/* 39A28 8005E628 C6420038 */  lwc1      $f2, 0x38($s2)
/* 39A2C 8005E62C 46340000 */  add.d     $f0, $f0, $f20
/* 39A30 8005E630 E7A20028 */  swc1      $f2, 0x28($sp)
/* 39A34 8005E634 C642003C */  lwc1      $f2, 0x3c($s2)
/* 39A38 8005E638 C6440040 */  lwc1      $f4, 0x40($s2)
/* 39A3C 8005E63C 46200020 */  cvt.s.d   $f0, $f0
/* 39A40 8005E640 46001080 */  add.s     $f2, $f2, $f0
/* 39A44 8005E644 E7A40030 */  swc1      $f4, 0x30($sp)
/* 39A48 8005E648 E7A00034 */  swc1      $f0, 0x34($sp)
/* 39A4C 8005E64C E7A2002C */  swc1      $f2, 0x2c($sp)
/* 39A50 8005E650 AFA20010 */  sw        $v0, 0x10($sp)
/* 39A54 8005E654 8E440080 */  lw        $a0, 0x80($s2)
/* 39A58 8005E658 0C0372DF */  jal       func_800DCB7C
/* 39A5C 8005E65C 27A70030 */   addiu    $a3, $sp, 0x30
/* 39A60 8005E660 10400087 */  beqz      $v0, .L8005E880
/* 39A64 8005E664 00000000 */   nop      
/* 39A68 8005E668 C640001C */  lwc1      $f0, 0x1c($s2)
/* 39A6C 8005E66C C7A20034 */  lwc1      $f2, 0x34($sp)
/* 39A70 8005E670 46000005 */  abs.s     $f0, $f0
/* 39A74 8005E674 46000021 */  cvt.d.s   $f0, $f0
/* 39A78 8005E678 46340000 */  add.d     $f0, $f0, $f20
/* 39A7C 8005E67C 460010A1 */  cvt.d.s   $f2, $f2
/* 39A80 8005E680 4620103E */  c.le.d    $f2, $f0
/* 39A84 8005E684 00000000 */  nop       
/* 39A88 8005E688 4500007D */  bc1f      .L8005E880
/* 39A8C 8005E68C 00000000 */   nop      
/* 39A90 8005E690 C7AC0028 */  lwc1      $f12, 0x28($sp)
/* 39A94 8005E694 C7AE0030 */  lwc1      $f14, 0x30($sp)
/* 39A98 8005E698 8FA60018 */  lw        $a2, 0x18($sp)
/* 39A9C 8005E69C 8E220290 */  lw        $v0, 0x290($s1)
/* 39AA0 8005E6A0 8FA70020 */  lw        $a3, 0x20($sp)
/* 39AA4 8005E6A4 C7A0002C */  lwc1      $f0, 0x2c($sp)
/* 39AA8 8005E6A8 8C43000C */  lw        $v1, 0xc($v0)
/* 39AAC 8005E6AC 8E420000 */  lw        $v0, ($s2)
/* 39AB0 8005E6B0 E656001C */  swc1      $f22, 0x1c($s2)
/* 39AB4 8005E6B4 E640003C */  swc1      $f0, 0x3c($s2)
/* 39AB8 8005E6B8 34420200 */  ori       $v0, $v0, 0x200
/* 39ABC 8005E6BC AE420000 */  sw        $v0, ($s2)
/* 39AC0 8005E6C0 AE430028 */  sw        $v1, 0x28($s2)
.L8005E6C4:
/* 39AC4 8005E6C4 0C00A720 */  jal       atan2
/* 39AC8 8005E6C8 00000000 */   nop      
/* 39ACC 8005E6CC E640000C */  swc1      $f0, 0xc($s2)
/* 39AD0 8005E6D0 08017A20 */  j         .L8005E880
/* 39AD4 8005E6D4 AE200288 */   sw       $zero, 0x288($s1)
.L8005E6D8:
/* 39AD8 8005E6D8 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39ADC 8005E6DC C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39AE0 8005E6E0 8FA60018 */  lw        $a2, 0x18($sp)
/* 39AE4 8005E6E4 8E220284 */  lw        $v0, 0x284($s1)
/* 39AE8 8005E6E8 8FA70020 */  lw        $a3, 0x20($sp)
/* 39AEC 8005E6EC C642003C */  lwc1      $f2, 0x3c($s2)
/* 39AF0 8005E6F0 00021100 */  sll       $v0, $v0, 4
/* 39AF4 8005E6F4 02228021 */  addu      $s0, $s1, $v0
/* 39AF8 8005E6F8 46006006 */  mov.s     $f0, $f12
/* 39AFC 8005E6FC C6160004 */  lwc1      $f22, 4($s0)
/* 39B00 8005E700 C614000C */  lwc1      $f20, 0xc($s0)
/* 39B04 8005E704 46007106 */  mov.s     $f4, $f14
/* 39B08 8005E708 E7A00028 */  swc1      $f0, 0x28($sp)
/* 39B0C 8005E70C E7A2002C */  swc1      $f2, 0x2c($sp)
/* 39B10 8005E710 0C00A7B5 */  jal       dist2D
/* 39B14 8005E714 E7A40030 */   swc1     $f4, 0x30($sp)
/* 39B18 8005E718 C622029C */  lwc1      $f2, 0x29c($s1)
/* 39B1C 8005E71C 4602003E */  c.le.s    $f0, $f2
/* 39B20 8005E720 00000000 */  nop       
/* 39B24 8005E724 45010056 */  bc1t      .L8005E880
/* 39B28 8005E728 E7A00034 */   swc1     $f0, 0x34($sp)
/* 39B2C 8005E72C 3C0142B4 */  lui       $at, 0x42b4
/* 39B30 8005E730 4481D000 */  mtc1      $at, $f26
.L8005E734:
/* 39B34 8005E734 82020000 */  lb        $v0, ($s0)
/* 39B38 8005E738 14400028 */  bnez      $v0, .L8005E7DC
/* 39B3C 8005E73C 00000000 */   nop      
/* 39B40 8005E740 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39B44 8005E744 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39B48 8005E748 4406B000 */  mfc1      $a2, $f22
/* 39B4C 8005E74C 4407A000 */  mfc1      $a3, $f20
/* 39B50 8005E750 0C00A720 */  jal       atan2
/* 39B54 8005E754 00000000 */   nop      
/* 39B58 8005E758 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39B5C 8005E75C C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39B60 8005E760 8FA60018 */  lw        $a2, 0x18($sp)
/* 39B64 8005E764 8FA70020 */  lw        $a3, 0x20($sp)
/* 39B68 8005E768 0C00A720 */  jal       atan2
/* 39B6C 8005E76C 46000606 */   mov.s    $f24, $f0
/* 39B70 8005E770 4600C306 */  mov.s     $f12, $f24
/* 39B74 8005E774 0C00A70A */  jal       get_clamped_angle_diff
/* 39B78 8005E778 46000386 */   mov.s    $f14, $f0
/* 39B7C 8005E77C 46000005 */  abs.s     $f0, $f0
/* 39B80 8005E780 461A003C */  c.lt.s    $f0, $f26
/* 39B84 8005E784 00000000 */  nop       
/* 39B88 8005E788 4501000F */  bc1t      .L8005E7C8
/* 39B8C 8005E78C 00000000 */   nop      
/* 39B90 8005E790 8E230284 */  lw        $v1, 0x284($s1)
/* 39B94 8005E794 8E220280 */  lw        $v0, 0x280($s1)
/* 39B98 8005E798 1062000B */  beq       $v1, $v0, .L8005E7C8
/* 39B9C 8005E79C 24620001 */   addiu    $v0, $v1, 1
/* 39BA0 8005E7A0 AE220284 */  sw        $v0, 0x284($s1)
/* 39BA4 8005E7A4 28420028 */  slti      $v0, $v0, 0x28
/* 39BA8 8005E7A8 50400001 */  beql      $v0, $zero, .L8005E7B0
/* 39BAC 8005E7AC AE200284 */   sw       $zero, 0x284($s1)
.L8005E7B0:
/* 39BB0 8005E7B0 8E220284 */  lw        $v0, 0x284($s1)
/* 39BB4 8005E7B4 00021100 */  sll       $v0, $v0, 4
/* 39BB8 8005E7B8 02228021 */  addu      $s0, $s1, $v0
/* 39BBC 8005E7BC C6160004 */  lwc1      $f22, 4($s0)
/* 39BC0 8005E7C0 080179CD */  j         .L8005E734
/* 39BC4 8005E7C4 C614000C */   lwc1     $f20, 0xc($s0)
.L8005E7C8:
/* 39BC8 8005E7C8 82020000 */  lb        $v0, ($s0)
/* 39BCC 8005E7CC 14400003 */  bnez      $v0, .L8005E7DC
/* 39BD0 8005E7D0 00000000 */   nop      
/* 39BD4 8005E7D4 08017A20 */  j         .L8005E880
/* 39BD8 8005E7D8 AE200288 */   sw       $zero, 0x288($s1)
.L8005E7DC:
/* 39BDC 8005E7DC 3C0142B4 */  lui       $at, 0x42b4
/* 39BE0 8005E7E0 4481D000 */  mtc1      $at, $f26
.L8005E7E4:
/* 39BE4 8005E7E4 82020000 */  lb        $v0, ($s0)
/* 39BE8 8005E7E8 10400024 */  beqz      $v0, .L8005E87C
/* 39BEC 8005E7EC 24020001 */   addiu    $v0, $zero, 1
/* 39BF0 8005E7F0 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39BF4 8005E7F4 C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39BF8 8005E7F8 4406B000 */  mfc1      $a2, $f22
/* 39BFC 8005E7FC 4407A000 */  mfc1      $a3, $f20
/* 39C00 8005E800 0C00A720 */  jal       atan2
/* 39C04 8005E804 00000000 */   nop      
/* 39C08 8005E808 C64C0038 */  lwc1      $f12, 0x38($s2)
/* 39C0C 8005E80C C64E0040 */  lwc1      $f14, 0x40($s2)
/* 39C10 8005E810 8FA60018 */  lw        $a2, 0x18($sp)
/* 39C14 8005E814 8FA70020 */  lw        $a3, 0x20($sp)
/* 39C18 8005E818 0C00A720 */  jal       atan2
/* 39C1C 8005E81C 46000606 */   mov.s    $f24, $f0
/* 39C20 8005E820 4600C306 */  mov.s     $f12, $f24
/* 39C24 8005E824 0C00A70A */  jal       get_clamped_angle_diff
/* 39C28 8005E828 46000386 */   mov.s    $f14, $f0
/* 39C2C 8005E82C 46000005 */  abs.s     $f0, $f0
/* 39C30 8005E830 461A003C */  c.lt.s    $f0, $f26
/* 39C34 8005E834 00000000 */  nop       
/* 39C38 8005E838 45010010 */  bc1t      .L8005E87C
/* 39C3C 8005E83C 24020001 */   addiu    $v0, $zero, 1
/* 39C40 8005E840 8E230284 */  lw        $v1, 0x284($s1)
/* 39C44 8005E844 8E220280 */  lw        $v0, 0x280($s1)
/* 39C48 8005E848 1062000B */  beq       $v1, $v0, .L8005E878
/* 39C4C 8005E84C 24620001 */   addiu    $v0, $v1, 1
/* 39C50 8005E850 AE220284 */  sw        $v0, 0x284($s1)
/* 39C54 8005E854 28420028 */  slti      $v0, $v0, 0x28
/* 39C58 8005E858 50400001 */  beql      $v0, $zero, .L8005E860
/* 39C5C 8005E85C AE200284 */   sw       $zero, 0x284($s1)
.L8005E860:
/* 39C60 8005E860 8E220284 */  lw        $v0, 0x284($s1)
/* 39C64 8005E864 00021100 */  sll       $v0, $v0, 4
/* 39C68 8005E868 02228021 */  addu      $s0, $s1, $v0
/* 39C6C 8005E86C C6160004 */  lwc1      $f22, 4($s0)
/* 39C70 8005E870 080179F9 */  j         .L8005E7E4
/* 39C74 8005E874 C614000C */   lwc1     $f20, 0xc($s0)
.L8005E878:
/* 39C78 8005E878 24020001 */  addiu     $v0, $zero, 1
.L8005E87C:
/* 39C7C 8005E87C AE220288 */  sw        $v0, 0x288($s1)
.L8005E880:
/* 39C80 8005E880 8FBF0044 */  lw        $ra, 0x44($sp)
/* 39C84 8005E884 8FB20040 */  lw        $s2, 0x40($sp)
/* 39C88 8005E888 8FB1003C */  lw        $s1, 0x3c($sp)
/* 39C8C 8005E88C 8FB00038 */  lw        $s0, 0x38($sp)
/* 39C90 8005E890 D7BA0060 */  ldc1      $f26, 0x60($sp)
/* 39C94 8005E894 D7B80058 */  ldc1      $f24, 0x58($sp)
/* 39C98 8005E898 D7B60050 */  ldc1      $f22, 0x50($sp)
/* 39C9C 8005E89C D7B40048 */  ldc1      $f20, 0x48($sp)
/* 39CA0 8005E8A0 03E00008 */  jr        $ra
/* 39CA4 8005E8A4 27BD0068 */   addiu    $sp, $sp, 0x68
/* 39CA8 8005E8A8 00000000 */  nop       
/* 39CAC 8005E8AC 00000000 */  nop       
