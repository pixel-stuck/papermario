.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel set_cam_zoffset
/* 17CEC0 8024E5E0 3C028028 */  lui       $v0, %hi(D_80280CE0)
/* 17CEC4 8024E5E4 80420CE0 */  lb        $v0, %lo(D_80280CE0)($v0)
/* 17CEC8 8024E5E8 14400003 */  bnez      $v0, .L8024E5F8
/* 17CECC 8024E5EC 00000000 */   nop
/* 17CED0 8024E5F0 3C01802A */  lui       $at, %hi(D_8029F286)
/* 17CED4 8024E5F4 A424F286 */  sh        $a0, %lo(D_8029F286)($at)
.L8024E5F8:
/* 17CED8 8024E5F8 03E00008 */  jr        $ra
/* 17CEDC 8024E5FC 00000000 */   nop
