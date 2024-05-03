@isMoveLegal
.arch armv6
.syntax unified
.fpu vfp


.section  .rodata
.align 2
.include  "constants.s"

.text
.align 2
.global isValid
.type isValid, %function

isValid:
push  {fp, lr}
add   fp,sp,#4


mov r0,#0   @assume that it is false


cmp r1,#0
blt  epilogue

cmp r1, #9
bgt  epilogue


cmp r1,#1
ldr r2, =0x3
b  isBlank

isBlank:
    ands  r3,r0,r2
    cmp r2,r1
    moveq r0, #1


    epilogue:
    sub sp,fp,#4
    pop{fp,pc}