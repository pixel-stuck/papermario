.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80268AF8
/* 1973D8 80268AF8 3C03802A */  lui       $v1, 0x802a
/* 1973DC 80268AFC 8463FC2A */  lh        $v1, -0x3d6($v1)
/* 1973E0 80268B00 27BDFFE8 */  addiu     $sp, $sp, -0x18
/* 1973E4 80268B04 2C620018 */  sltiu     $v0, $v1, 0x18
/* 1973E8 80268B08 10400061 */  beqz      $v0, .L80268C90
/* 1973EC 80268B0C AFBF0010 */   sw       $ra, 0x10($sp)
/* 1973F0 80268B10 00031080 */  sll       $v0, $v1, 2
/* 1973F4 80268B14 3C01802A */  lui       $at, 0x802a
/* 1973F8 80268B18 00220821 */  addu      $at, $at, $v0
/* 1973FC 80268B1C 8C22D700 */  lw        $v0, -0x2900($at)
/* 197400 80268B20 00400008 */  jr        $v0
/* 197404 80268B24 00000000 */   nop      
/* 197408 80268B28 0C0AA551 */  jal       func_802A9544
/* 19740C 80268B2C 00000000 */   nop      
/* 197410 80268B30 0809A324 */  j         .L80268C90
/* 197414 80268B34 00000000 */   nop      
/* 197418 80268B38 0C0AA675 */  jal       func_802A99D4
/* 19741C 80268B3C 00000000 */   nop      
/* 197420 80268B40 0809A324 */  j         .L80268C90
/* 197424 80268B44 00000000 */   nop      
/* 197428 80268B48 0C0AA5BD */  jal       func_802A96F4
/* 19742C 80268B4C 00000000 */   nop      
/* 197430 80268B50 0809A324 */  j         .L80268C90
/* 197434 80268B54 00000000 */   nop      
/* 197438 80268B58 0C0AA5AE */  jal       func_802A96B8
/* 19743C 80268B5C 00000000 */   nop      
/* 197440 80268B60 0809A324 */  j         .L80268C90
/* 197444 80268B64 00000000 */   nop      
/* 197448 80268B68 0C0AA5D1 */  jal       func_802A9744
/* 19744C 80268B6C 00000000 */   nop      
/* 197450 80268B70 0809A324 */  j         .L80268C90
/* 197454 80268B74 00000000 */   nop      
/* 197458 80268B78 0C0AA529 */  jal       func_802A94A4
/* 19745C 80268B7C 00000000 */   nop      
/* 197460 80268B80 0809A324 */  j         .L80268C90
/* 197464 80268B84 00000000 */   nop      
/* 197468 80268B88 0C0AA536 */  jal       func_802A94D8
/* 19746C 80268B8C 00000000 */   nop      
/* 197470 80268B90 0809A324 */  j         .L80268C90
/* 197474 80268B94 00000000 */   nop      
/* 197478 80268B98 0C0AA5B7 */  jal       func_802A96DC
/* 19747C 80268B9C 00000000 */   nop      
/* 197480 80268BA0 0809A324 */  j         .L80268C90
/* 197484 80268BA4 00000000 */   nop      
/* 197488 80268BA8 0C0AA60D */  jal       func_802A9834
/* 19748C 80268BAC 00000000 */   nop      
/* 197490 80268BB0 0809A324 */  j         .L80268C90
/* 197494 80268BB4 00000000 */   nop      
/* 197498 80268BB8 0C0AA557 */  jal       func_802A955C
/* 19749C 80268BBC 00000000 */   nop      
/* 1974A0 80268BC0 0809A324 */  j         .L80268C90
/* 1974A4 80268BC4 00000000 */   nop      
/* 1974A8 80268BC8 0C0AA5BB */  jal       func_802A96EC
/* 1974AC 80268BCC 00000000 */   nop      
/* 1974B0 80268BD0 0809A324 */  j         .L80268C90
/* 1974B4 80268BD4 00000000 */   nop      
/* 1974B8 80268BD8 0C0AA599 */  jal       func_802A9664
/* 1974BC 80268BDC 00000000 */   nop      
/* 1974C0 80268BE0 0809A324 */  j         .L80268C90
/* 1974C4 80268BE4 00000000 */   nop      
/* 1974C8 80268BE8 0C0AA5BB */  jal       func_802A96EC
/* 1974CC 80268BEC 00000000 */   nop      
/* 1974D0 80268BF0 0809A324 */  j         .L80268C90
/* 1974D4 80268BF4 00000000 */   nop      
/* 1974D8 80268BF8 0C0AA613 */  jal       func_802A984C
/* 1974DC 80268BFC 00000000 */   nop      
/* 1974E0 80268C00 0809A324 */  j         .L80268C90
/* 1974E4 80268C04 00000000 */   nop      
/* 1974E8 80268C08 0C0AA58D */  jal       func_802A9634
/* 1974EC 80268C0C 00000000 */   nop      
/* 1974F0 80268C10 0809A324 */  j         .L80268C90
/* 1974F4 80268C14 00000000 */   nop      
/* 1974F8 80268C18 0C0AA634 */  jal       func_802A98D0
/* 1974FC 80268C1C 00000000 */   nop      
/* 197500 80268C20 0809A324 */  j         .L80268C90
/* 197504 80268C24 00000000 */   nop      
/* 197508 80268C28 0C0AA5FE */  jal       func_802A97F8
/* 19750C 80268C2C 00000000 */   nop      
/* 197510 80268C30 0809A324 */  j         .L80268C90
/* 197514 80268C34 00000000 */   nop      
/* 197518 80268C38 0C0AA62C */  jal       func_802A98B0
/* 19751C 80268C3C 00000000 */   nop      
/* 197520 80268C40 0809A324 */  j         .L80268C90
/* 197524 80268C44 00000000 */   nop      
/* 197528 80268C48 0C0AA5CF */  jal       func_802A973C
/* 19752C 80268C4C 00000000 */   nop      
/* 197530 80268C50 0809A324 */  j         .L80268C90
/* 197534 80268C54 00000000 */   nop      
/* 197538 80268C58 0C0AA5EB */  jal       func_802A97AC
/* 19753C 80268C5C 00000000 */   nop      
/* 197540 80268C60 0809A324 */  j         .L80268C90
/* 197544 80268C64 00000000 */   nop      
/* 197548 80268C68 0C0AA5FF */  jal       func_802A97FC
/* 19754C 80268C6C 00000000 */   nop      
/* 197550 80268C70 0809A324 */  j         .L80268C90
/* 197554 80268C74 00000000 */   nop      
/* 197558 80268C78 0C0AA805 */  jal       func_802AA014
/* 19755C 80268C7C 00000000 */   nop      
/* 197560 80268C80 0809A324 */  j         .L80268C90
/* 197564 80268C84 00000000 */   nop      
/* 197568 80268C88 0C0AA5C6 */  jal       func_802A9718
/* 19756C 80268C8C 00000000 */   nop      
.L80268C90:
/* 197570 80268C90 8FBF0010 */  lw        $ra, 0x10($sp)
/* 197574 80268C94 03E00008 */  jr        $ra
/* 197578 80268C98 27BD0018 */   addiu    $sp, $sp, 0x18
