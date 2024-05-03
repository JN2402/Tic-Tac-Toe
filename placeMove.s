.arch   armv6
.fpu    vfp
.syntax unified
.text   
.align  2
.global placeMove.s
.type   placeMove, %function

main:
@prologu
push    {fp, lr}
add     fp, sp, #4

@remember that tiles are read right to left under the hood
tile1: 
    cmp    r1, #1 @The player chose tile 1
    bne    tile2
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x10 @player 0 chose the tile
    orrne  r0, 0x20 @player 2 chose the tile
    b      epilogue 

tile2: 
    cmp    r1, #2 @tile 2 is chosen
    bne    tile3
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x4 @player 0 chose the tile
    orrne  r0, 0x8 @player 1 chose the tile
    b      epilogue

tile3: 
    cmp    r1, #3 @tile 3 is chose
    bne    tile4
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x01 @player 0 chose the tile
    orrne  r0, 0x02 @player 1 chose the tile
    b      epilogue

tile4:
    cmp    r1, #4 @tile 3 is chosen
    bne    tile5
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x400 @player 0 chose the tile
    orrne  r0, 0x800 @player 1 chose the tile
    b      epilogue

tile5:
    cmp    r1, #5 @tile 5 is chosen
    bne    tile6
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x100 @player 0 chose the tile
    orrne  r0, 0x200 @player 1 chose the tile
    b      epilogue

tile6:
    cmp    r1, #6 @tile 6 is chosen
    bne    tile7
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x40 @player 0 chose the tile
    orrne  r0, 0x80 @player 1 chose the tile
    b      epilogue

tile7:
    cmp    r1, #7 @tile 7
    bne    tile8
    cmp    r2, #0 @is this player 0? 
    orreq  r0, 0x10000 @player 0 chose the tile
    orrne  r0, 0x20000 @player 1 chose the tile
    b      epilogue

tile8:
    cmp    r1, #8 @tile 8
    bne    tile9
    cmp    r2, #0 @is this player 0?
    orreq  r0, 0x4000 @player 0 chose the tile
    orrne  r0, 0x8000 @player 1 chose the tile
    b      epilogue

tile9:
    cmp    r1, #9 @tile 9
    bne    epilogue
    cmp    r2, #0 @is this player 0?
    orreq  r0 0x1000 @player 0 chose the tile
    orrne  r0, 0x2000 @player 1 chose the tile

epilogue:
    sub     sp, fp, #4
    pop     {fp, pc}
