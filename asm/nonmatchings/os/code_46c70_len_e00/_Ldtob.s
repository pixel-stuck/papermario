.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel _Ldtob
/* 46FD0 8006BBD0 27BDFF80 */  addiu     $sp, $sp, -0x80
/* 46FD4 8006BBD4 AFB30054 */  sw        $s3, 0x54($sp)
/* 46FD8 8006BBD8 00809821 */  addu      $s3, $a0, $zero
/* 46FDC 8006BBDC AFB1004C */  sw        $s1, 0x4c($sp)
/* 46FE0 8006BBE0 27B10018 */  addiu     $s1, $sp, 0x18
/* 46FE4 8006BBE4 AFBF0060 */  sw        $ra, 0x60($sp)
/* 46FE8 8006BBE8 AFB5005C */  sw        $s5, 0x5c($sp)
/* 46FEC 8006BBEC AFB40058 */  sw        $s4, 0x58($sp)
/* 46FF0 8006BBF0 AFB20050 */  sw        $s2, 0x50($sp)
/* 46FF4 8006BBF4 AFB00048 */  sw        $s0, 0x48($sp)
/* 46FF8 8006BBF8 F7B80078 */  sdc1      $f24, 0x78($sp)
/* 46FFC 8006BBFC F7B60070 */  sdc1      $f22, 0x70($sp)
/* 47000 8006BC00 F7B40068 */  sdc1      $f20, 0x68($sp)
/* 47004 8006BC04 8E630024 */  lw        $v1, 0x24($s3)
/* 47008 8006BC08 D6740000 */  ldc1      $f20, ($s3)
/* 4700C 8006BC0C 04610003 */  bgez      $v1, .L8006BC1C
/* 47010 8006BC10 00A0A821 */   addu     $s5, $a1, $zero
/* 47014 8006BC14 0801AF12 */  j         .L8006BC48
/* 47018 8006BC18 24020006 */   addiu    $v0, $zero, 6
.L8006BC1C:
/* 4701C 8006BC1C 1460000C */  bnez      $v1, .L8006BC50
/* 47020 8006BC20 27A40038 */   addiu    $a0, $sp, 0x38
/* 47024 8006BC24 00051600 */  sll       $v0, $a1, 0x18
/* 47028 8006BC28 00021603 */  sra       $v0, $v0, 0x18
/* 4702C 8006BC2C 38430067 */  xori      $v1, $v0, 0x67
/* 47030 8006BC30 2C630001 */  sltiu     $v1, $v1, 1
/* 47034 8006BC34 38420047 */  xori      $v0, $v0, 0x47
/* 47038 8006BC38 2C420001 */  sltiu     $v0, $v0, 1
/* 4703C 8006BC3C 00621825 */  or        $v1, $v1, $v0
/* 47040 8006BC40 10600003 */  beqz      $v1, .L8006BC50
/* 47044 8006BC44 24020001 */   addiu    $v0, $zero, 1
.L8006BC48:
/* 47048 8006BC48 AE620024 */  sw        $v0, 0x24($s3)
/* 4704C 8006BC4C 27A40038 */  addiu     $a0, $sp, 0x38
.L8006BC50:
/* 47050 8006BC50 0C01B007 */  jal       _Ldunscale
/* 47054 8006BC54 02602821 */   addu     $a1, $s3, $zero
/* 47058 8006BC58 00021400 */  sll       $v0, $v0, 0x10
/* 4705C 8006BC5C 00021C03 */  sra       $v1, $v0, 0x10
/* 47060 8006BC60 18600010 */  blez      $v1, .L8006BCA4
/* 47064 8006BC64 24020002 */   addiu    $v0, $zero, 2
/* 47068 8006BC68 3C06800A */  lui       $a2, %hi(D_80099E1C)
/* 4706C 8006BC6C 24C69E1C */  addiu     $a2, $a2, %lo(D_80099E1C)
/* 47070 8006BC70 8E670008 */  lw        $a3, 8($s3)
/* 47074 8006BC74 14620003 */  bne       $v1, $v0, .L8006BC84
/* 47078 8006BC78 24020003 */   addiu    $v0, $zero, 3
/* 4707C 8006BC7C 3C06800A */  lui       $a2, %hi(D_80099E18)
/* 47080 8006BC80 24C69E18 */  addiu     $a2, $a2, %lo(D_80099E18)
.L8006BC84:
/* 47084 8006BC84 AE620014 */  sw        $v0, 0x14($s3)
/* 47088 8006BC88 80C20000 */  lb        $v0, ($a2)
/* 4708C 8006BC8C 80C30001 */  lb        $v1, 1($a2)
/* 47090 8006BC90 80C40002 */  lb        $a0, 2($a2)
/* 47094 8006BC94 A0E20000 */  sb        $v0, ($a3)
/* 47098 8006BC98 A0E30001 */  sb        $v1, 1($a3)
/* 4709C 8006BC9C 0801AFFB */  j         .L8006BFEC
/* 470A0 8006BCA0 A0E40002 */   sb       $a0, 2($a3)
.L8006BCA4:
/* 470A4 8006BCA4 14600003 */  bnez      $v1, .L8006BCB4
/* 470A8 8006BCA8 00003821 */   addu     $a3, $zero, $zero
/* 470AC 8006BCAC 0801AFF2 */  j         .L8006BFC8
/* 470B0 8006BCB0 A7A00038 */   sh       $zero, 0x38($sp)
.L8006BCB4:
/* 470B4 8006BCB4 44800000 */  mtc1      $zero, $f0
/* 470B8 8006BCB8 44800800 */  mtc1      $zero, $f1
/* 470BC 8006BCBC 00000000 */  nop
/* 470C0 8006BCC0 4620A03C */  c.lt.d    $f20, $f0
/* 470C4 8006BCC4 00000000 */  nop
/* 470C8 8006BCC8 00000000 */  nop
/* 470CC 8006BCCC 45030001 */  bc1tl     .L8006BCD4
/* 470D0 8006BCD0 4620A507 */   neg.d    $f20, $f20
.L8006BCD4:
/* 470D4 8006BCD4 87A30038 */  lh        $v1, 0x38($sp)
/* 470D8 8006BCD8 24027597 */  addiu     $v0, $zero, 0x7597
/* 470DC 8006BCDC 00620018 */  mult      $v1, $v0
/* 470E0 8006BCE0 00001812 */  mflo      $v1
/* 470E4 8006BCE4 3C0214F8 */  lui       $v0, 0x14f8
/* 470E8 8006BCE8 3442B589 */  ori       $v0, $v0, 0xb589
/* 470EC 8006BCEC 00620018 */  mult      $v1, $v0
/* 470F0 8006BCF0 00031FC3 */  sra       $v1, $v1, 0x1f
/* 470F4 8006BCF4 00004010 */  mfhi      $t0
/* 470F8 8006BCF8 00081343 */  sra       $v0, $t0, 0xd
/* 470FC 8006BCFC 00431023 */  subu      $v0, $v0, $v1
/* 47100 8006BD00 2443FFFC */  addiu     $v1, $v0, -4
/* 47104 8006BD04 00031400 */  sll       $v0, $v1, 0x10
/* 47108 8006BD08 00021403 */  sra       $v0, $v0, 0x10
/* 4710C 8006BD0C 04410013 */  bgez      $v0, .L8006BD5C
/* 47110 8006BD10 A7A30038 */   sh       $v1, 0x38($sp)
/* 47114 8006BD14 00021023 */  negu      $v0, $v0
/* 47118 8006BD18 24420003 */  addiu     $v0, $v0, 3
/* 4711C 8006BD1C 2403FFFC */  addiu     $v1, $zero, -4
/* 47120 8006BD20 00431824 */  and       $v1, $v0, $v1
/* 47124 8006BD24 00031023 */  negu      $v0, $v1
/* 47128 8006BD28 1860001F */  blez      $v1, .L8006BDA8
/* 4712C 8006BD2C A7A20038 */   sh       $v0, 0x38($sp)
/* 47130 8006BD30 3C04800A */  lui       $a0, %hi(D_80099DD0)
/* 47134 8006BD34 24849DD0 */  addiu     $a0, $a0, %lo(D_80099DD0)
.L8006BD38:
/* 47138 8006BD38 30620001 */  andi      $v0, $v1, 1
/* 4713C 8006BD3C 10400003 */  beqz      $v0, .L8006BD4C
/* 47140 8006BD40 00031843 */   sra      $v1, $v1, 1
/* 47144 8006BD44 D4800000 */  ldc1      $f0, ($a0)
/* 47148 8006BD48 4620A502 */  mul.d     $f20, $f20, $f0
.L8006BD4C:
/* 4714C 8006BD4C 1C60FFFA */  bgtz      $v1, .L8006BD38
/* 47150 8006BD50 24840008 */   addiu    $a0, $a0, 8
/* 47154 8006BD54 0801AF6A */  j         .L8006BDA8
/* 47158 8006BD58 00000000 */   nop
.L8006BD5C:
/* 4715C 8006BD5C 18400012 */  blez      $v0, .L8006BDA8
/* 47160 8006BD60 2402FFFC */   addiu    $v0, $zero, -4
/* 47164 8006BD64 3C01800A */  lui       $at, %hi(D_80099E20)
/* 47168 8006BD68 D4229E20 */  ldc1      $f2, %lo(D_80099E20)($at)
/* 4716C 8006BD6C 00621024 */  and       $v0, $v1, $v0
/* 47170 8006BD70 00021C00 */  sll       $v1, $v0, 0x10
/* 47174 8006BD74 00031C03 */  sra       $v1, $v1, 0x10
/* 47178 8006BD78 1860000A */  blez      $v1, .L8006BDA4
/* 4717C 8006BD7C A7A20038 */   sh       $v0, 0x38($sp)
/* 47180 8006BD80 3C04800A */  lui       $a0, %hi(D_80099DD0)
/* 47184 8006BD84 24849DD0 */  addiu     $a0, $a0, %lo(D_80099DD0)
.L8006BD88:
/* 47188 8006BD88 30620001 */  andi      $v0, $v1, 1
/* 4718C 8006BD8C 10400003 */  beqz      $v0, .L8006BD9C
/* 47190 8006BD90 00031843 */   sra      $v1, $v1, 1
/* 47194 8006BD94 D4800000 */  ldc1      $f0, ($a0)
/* 47198 8006BD98 46201082 */  mul.d     $f2, $f2, $f0
.L8006BD9C:
/* 4719C 8006BD9C 1C60FFFA */  bgtz      $v1, .L8006BD88
/* 471A0 8006BDA0 24840008 */   addiu    $a0, $a0, 8
.L8006BDA4:
/* 471A4 8006BDA4 4622A503 */  div.d     $f20, $f20, $f2
.L8006BDA8:
/* 471A8 8006BDA8 8E640024 */  lw        $a0, 0x24($s3)
/* 471AC 8006BDAC 00151600 */  sll       $v0, $s5, 0x18
/* 471B0 8006BDB0 00021603 */  sra       $v0, $v0, 0x18
/* 471B4 8006BDB4 24030066 */  addiu     $v1, $zero, 0x66
/* 471B8 8006BDB8 14430004 */  bne       $v0, $v1, .L8006BDCC
/* 471BC 8006BDBC 24920006 */   addiu    $s2, $a0, 6
/* 471C0 8006BDC0 87A30038 */  lh        $v1, 0x38($sp)
/* 471C4 8006BDC4 2482000A */  addiu     $v0, $a0, 0xa
/* 471C8 8006BDC8 00439021 */  addu      $s2, $v0, $v1
.L8006BDCC:
/* 471CC 8006BDCC 2A420014 */  slti      $v0, $s2, 0x14
/* 471D0 8006BDD0 50400001 */  beql      $v0, $zero, .L8006BDD8
/* 471D4 8006BDD4 24120013 */   addiu    $s2, $zero, 0x13
.L8006BDD8:
/* 471D8 8006BDD8 24020030 */  addiu     $v0, $zero, 0x30
/* 471DC 8006BDDC A2220000 */  sb        $v0, ($s1)
/* 471E0 8006BDE0 26310001 */  addiu     $s1, $s1, 1
/* 471E4 8006BDE4 4480C000 */  mtc1      $zero, $f24
/* 471E8 8006BDE8 4480C800 */  mtc1      $zero, $f25
/* 471EC 8006BDEC 3C01800A */  lui       $at, %hi(D_80099E28)
/* 471F0 8006BDF0 D4369E28 */  ldc1      $f22, %lo(D_80099E28)($at)
/* 471F4 8006BDF4 24140030 */  addiu     $s4, $zero, 0x30
.L8006BDF8:
/* 471F8 8006BDF8 4634C03C */  c.lt.d    $f24, $f20
/* 471FC 8006BDFC 24030001 */  addiu     $v1, $zero, 1
/* 47200 8006BE00 00000000 */  nop
/* 47204 8006BE04 45010002 */  bc1t      .L8006BE10
/* 47208 8006BE08 0012102A */   slt      $v0, $zero, $s2
/* 4720C 8006BE0C 00001821 */  addu      $v1, $zero, $zero
.L8006BE10:
/* 47210 8006BE10 00431024 */  and       $v0, $v0, $v1
/* 47214 8006BE14 10400021 */  beqz      $v0, .L8006BE9C
/* 47218 8006BE18 2652FFF8 */   addiu    $s2, $s2, -8
/* 4721C 8006BE1C 4620A00D */  trunc.w.d $f0, $f20
/* 47220 8006BE20 44050000 */  mfc1      $a1, $f0
/* 47224 8006BE24 00000000 */  nop
/* 47228 8006BE28 1A400006 */  blez      $s2, .L8006BE44
/* 4722C 8006BE2C 26310008 */   addiu    $s1, $s1, 8
/* 47230 8006BE30 44850000 */  mtc1      $a1, $f0
/* 47234 8006BE34 00000000 */  nop
/* 47238 8006BE38 46800021 */  cvt.d.w   $f0, $f0
/* 4723C 8006BE3C 4620A001 */  sub.d     $f0, $f20, $f0
/* 47240 8006BE40 46360502 */  mul.d     $f20, $f0, $f22
.L8006BE44:
/* 47244 8006BE44 18A00010 */  blez      $a1, .L8006BE88
/* 47248 8006BE48 24100008 */   addiu    $s0, $zero, 8
/* 4724C 8006BE4C 2610FFFF */  addiu     $s0, $s0, -1
.L8006BE50:
/* 47250 8006BE50 0600000D */  bltz      $s0, .L8006BE88
/* 47254 8006BE54 27A40040 */   addiu    $a0, $sp, 0x40
/* 47258 8006BE58 0C01B588 */  jal       ldiv
/* 4725C 8006BE5C 2406000A */   addiu    $a2, $zero, 0xa
/* 47260 8006BE60 8FA20044 */  lw        $v0, 0x44($sp)
/* 47264 8006BE64 2631FFFF */  addiu     $s1, $s1, -1
/* 47268 8006BE68 24420030 */  addiu     $v0, $v0, 0x30
/* 4726C 8006BE6C A2220000 */  sb        $v0, ($s1)
/* 47270 8006BE70 8FA50040 */  lw        $a1, 0x40($sp)
/* 47274 8006BE74 1CA0FFF6 */  bgtz      $a1, .L8006BE50
/* 47278 8006BE78 2610FFFF */   addiu    $s0, $s0, -1
/* 4727C 8006BE7C 0801AFA3 */  j         .L8006BE8C
/* 47280 8006BE80 00000000 */   nop
.L8006BE84:
/* 47284 8006BE84 A2340000 */  sb        $s4, ($s1)
.L8006BE88:
/* 47288 8006BE88 2610FFFF */  addiu     $s0, $s0, -1
.L8006BE8C:
/* 4728C 8006BE8C 0603FFFD */  bgezl     $s0, .L8006BE84
/* 47290 8006BE90 2631FFFF */   addiu    $s1, $s1, -1
/* 47294 8006BE94 0801AF7E */  j         .L8006BDF8
/* 47298 8006BE98 26310008 */   addiu    $s1, $s1, 8
.L8006BE9C:
/* 4729C 8006BE9C 2623FFFF */  addiu     $v1, $s1, -1
/* 472A0 8006BEA0 27A20018 */  addiu     $v0, $sp, 0x18
/* 472A4 8006BEA4 00629023 */  subu      $s2, $v1, $v0
/* 472A8 8006BEA8 97A20038 */  lhu       $v0, 0x38($sp)
/* 472AC 8006BEAC 83A30019 */  lb        $v1, 0x19($sp)
/* 472B0 8006BEB0 24420007 */  addiu     $v0, $v0, 7
/* 472B4 8006BEB4 A7A20038 */  sh        $v0, 0x38($sp)
/* 472B8 8006BEB8 24020030 */  addiu     $v0, $zero, 0x30
/* 472BC 8006BEBC 14620009 */  bne       $v1, $v0, .L8006BEE4
/* 472C0 8006BEC0 27B10019 */   addiu    $s1, $sp, 0x19
/* 472C4 8006BEC4 24030030 */  addiu     $v1, $zero, 0x30
.L8006BEC8:
/* 472C8 8006BEC8 97A20038 */  lhu       $v0, 0x38($sp)
/* 472CC 8006BECC 26310001 */  addiu     $s1, $s1, 1
/* 472D0 8006BED0 2442FFFF */  addiu     $v0, $v0, -1
/* 472D4 8006BED4 A7A20038 */  sh        $v0, 0x38($sp)
/* 472D8 8006BED8 82220000 */  lb        $v0, ($s1)
/* 472DC 8006BEDC 1043FFFA */  beq       $v0, $v1, .L8006BEC8
/* 472E0 8006BEE0 2652FFFF */   addiu    $s2, $s2, -1
.L8006BEE4:
/* 472E4 8006BEE4 8E650024 */  lw        $a1, 0x24($s3)
/* 472E8 8006BEE8 00151600 */  sll       $v0, $s5, 0x18
/* 472EC 8006BEEC 00022603 */  sra       $a0, $v0, 0x18
/* 472F0 8006BEF0 24020066 */  addiu     $v0, $zero, 0x66
/* 472F4 8006BEF4 14820005 */  bne       $a0, $v0, .L8006BF0C
/* 472F8 8006BEF8 38830065 */   xori     $v1, $a0, 0x65
/* 472FC 8006BEFC 87A30038 */  lh        $v1, 0x38($sp)
/* 47300 8006BF00 24A20001 */  addiu     $v0, $a1, 1
/* 47304 8006BF04 0801AFC8 */  j         .L8006BF20
/* 47308 8006BF08 00433821 */   addu     $a3, $v0, $v1
.L8006BF0C:
/* 4730C 8006BF0C 2C630001 */  sltiu     $v1, $v1, 1
/* 47310 8006BF10 38820045 */  xori      $v0, $a0, 0x45
/* 47314 8006BF14 2C420001 */  sltiu     $v0, $v0, 1
/* 47318 8006BF18 00621825 */  or        $v1, $v1, $v0
/* 4731C 8006BF1C 00A33821 */  addu      $a3, $a1, $v1
.L8006BF20:
/* 47320 8006BF20 00071400 */  sll       $v0, $a3, 0x10
/* 47324 8006BF24 00021403 */  sra       $v0, $v0, 0x10
/* 47328 8006BF28 0242102A */  slt       $v0, $s2, $v0
/* 4732C 8006BF2C 54400001 */  bnel      $v0, $zero, .L8006BF34
/* 47330 8006BF30 02403821 */   addu     $a3, $s2, $zero
.L8006BF34:
/* 47334 8006BF34 00071400 */  sll       $v0, $a3, 0x10
/* 47338 8006BF38 00022403 */  sra       $a0, $v0, 0x10
/* 4733C 8006BF3C 18800022 */  blez      $a0, .L8006BFC8
/* 47340 8006BF40 0092102A */   slt      $v0, $a0, $s2
/* 47344 8006BF44 10400008 */  beqz      $v0, .L8006BF68
/* 47348 8006BF48 24030030 */   addiu    $v1, $zero, 0x30
/* 4734C 8006BF4C 02241021 */  addu      $v0, $s1, $a0
/* 47350 8006BF50 80420000 */  lb        $v0, ($v0)
/* 47354 8006BF54 28420035 */  slti      $v0, $v0, 0x35
/* 47358 8006BF58 38420001 */  xori      $v0, $v0, 1
/* 4735C 8006BF5C 00021023 */  negu      $v0, $v0
/* 47360 8006BF60 30420039 */  andi      $v0, $v0, 0x39
/* 47364 8006BF64 34430030 */  ori       $v1, $v0, 0x30
.L8006BF68:
/* 47368 8006BF68 2485FFFF */  addiu     $a1, $a0, -1
/* 4736C 8006BF6C 02252021 */  addu      $a0, $s1, $a1
/* 47370 8006BF70 80820000 */  lb        $v0, ($a0)
/* 47374 8006BF74 54430008 */  bnel      $v0, $v1, .L8006BF98
/* 47378 8006BF78 24020039 */   addiu    $v0, $zero, 0x39
/* 4737C 8006BF7C 00403021 */  addu      $a2, $v0, $zero
.L8006BF80:
/* 47380 8006BF80 2484FFFF */  addiu     $a0, $a0, -1
/* 47384 8006BF84 80820000 */  lb        $v0, ($a0)
/* 47388 8006BF88 24E7FFFF */  addiu     $a3, $a3, -1
/* 4738C 8006BF8C 1046FFFC */  beq       $v0, $a2, .L8006BF80
/* 47390 8006BF90 24A5FFFF */   addiu    $a1, $a1, -1
/* 47394 8006BF94 24020039 */  addiu     $v0, $zero, 0x39
.L8006BF98:
/* 47398 8006BF98 14620004 */  bne       $v1, $v0, .L8006BFAC
/* 4739C 8006BF9C 02251821 */   addu     $v1, $s1, $a1
/* 473A0 8006BFA0 90620000 */  lbu       $v0, ($v1)
/* 473A4 8006BFA4 24420001 */  addiu     $v0, $v0, 1
/* 473A8 8006BFA8 A0620000 */  sb        $v0, ($v1)
.L8006BFAC:
/* 473AC 8006BFAC 04A10007 */  bgez      $a1, .L8006BFCC
/* 473B0 8006BFB0 02602021 */   addu     $a0, $s3, $zero
/* 473B4 8006BFB4 97A20038 */  lhu       $v0, 0x38($sp)
/* 473B8 8006BFB8 2631FFFF */  addiu     $s1, $s1, -1
/* 473BC 8006BFBC 24E70001 */  addiu     $a3, $a3, 1
/* 473C0 8006BFC0 24420001 */  addiu     $v0, $v0, 1
/* 473C4 8006BFC4 A7A20038 */  sh        $v0, 0x38($sp)
.L8006BFC8:
/* 473C8 8006BFC8 02602021 */  addu      $a0, $s3, $zero
.L8006BFCC:
/* 473CC 8006BFCC 00152E00 */  sll       $a1, $s5, 0x18
/* 473D0 8006BFD0 87A20038 */  lh        $v0, 0x38($sp)
/* 473D4 8006BFD4 00052E03 */  sra       $a1, $a1, 0x18
/* 473D8 8006BFD8 02203021 */  addu      $a2, $s1, $zero
/* 473DC 8006BFDC 00073C00 */  sll       $a3, $a3, 0x10
/* 473E0 8006BFE0 00073C03 */  sra       $a3, $a3, 0x10
/* 473E4 8006BFE4 0C01B02D */  jal       _Genld
/* 473E8 8006BFE8 AFA20010 */   sw       $v0, 0x10($sp)
.L8006BFEC:
/* 473EC 8006BFEC 8FBF0060 */  lw        $ra, 0x60($sp)
/* 473F0 8006BFF0 8FB5005C */  lw        $s5, 0x5c($sp)
/* 473F4 8006BFF4 8FB40058 */  lw        $s4, 0x58($sp)
/* 473F8 8006BFF8 8FB30054 */  lw        $s3, 0x54($sp)
/* 473FC 8006BFFC 8FB20050 */  lw        $s2, 0x50($sp)
/* 47400 8006C000 8FB1004C */  lw        $s1, 0x4c($sp)
/* 47404 8006C004 8FB00048 */  lw        $s0, 0x48($sp)
/* 47408 8006C008 D7B80078 */  ldc1      $f24, 0x78($sp)
/* 4740C 8006C00C D7B60070 */  ldc1      $f22, 0x70($sp)
/* 47410 8006C010 D7B40068 */  ldc1      $f20, 0x68($sp)
/* 47414 8006C014 03E00008 */  jr        $ra
/* 47418 8006C018 27BD0080 */   addiu    $sp, $sp, 0x80
