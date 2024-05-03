@is winner

.arch armv6
.syntax unified
.fpu vfp


.section  .rodata
.align 2
.include  "constants.s"

.text
.align 2
.global isWinner
.type isWinner, %function

isWinner:
    push  {fp, lr}
    add fp,sp,#4
 @check computer @21
    ldr r1, =0x15
    ands r2, r0, r1
    cmp r2, r1
    beq returnTrue

    @check player top row @42
    ldr r1, =0x2a
    ands r2, r0, r1
    cmp r2, r1
    beq returnTrue
 @check computer middle row @1344
    ldr r1, =0x540
    ands r2, r0, r1
    cmp r2, r1
    beq returnTrue

    @check player middle row @2688
    ldr r1, = 0x80
    ands r2, r0, r1
    cmp r2, r1
    beq returnTrue

    @check last row computer @ 86016
    ldr r1, = 0x15000
    ands r2,r0,r1
    cmp r2,r1
    beq returnTrue

    @check last row player
    ldr r1, = 0x2a000
    ands r2,r0,r1
    cmp r2, r1
    beq returnTrue

   @check horizontal 1 computer
   ldr r1, = 0x2082
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check horizontal 1 player
   ldr r1, = 0x1040
   ands r2, r0,r1
   cmp r2,r1
   beq returnTrue

   @check horizontal 2 computer
   ldr r1, = 0x8208
   ands r2, r0,r1
   cmp r2,r1
   beq returnTrue

   @check horrizontal 2 player
   ldr r1, = 0x8208
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check horizontal 3 computer
   ldr r1, = 0x20820
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check horizontal 3 player
   ldr r1, =0x10410
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check diagnol 1 computer
   ldr r1, = 0x20202
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check diagnol 1.2 player
   ldr r1, = 0x10101
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue

   @check diagnol 2.1 computer
   ldr r1, = 0x220
   ands r2, r0, r1
   cmp r2,r1
   beq returnTrue

   @check diagnol 2.2
   ldr r1, = 0x110
   ands r2,r0,r1
   cmp r2,r1
   beq returnTrue
  
  
    returnFalse:
    mov r0,#0
    b epilogue
   returnTrue:
   mov r0,#1

   epilogue:
   sub sp,fp, #4
   pop {fp,pc}


