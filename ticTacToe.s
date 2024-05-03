
@Comp Org final project
@Is a work in progress
.arch armv6
.section .rodata
.align 2
.sytntax unified
.fpu vfp

promptMsg:
.asciz "Enter your move %d:"

scanfFormat:
.asciz "%d"

inputStorage:
.asciz "%d"

errorMsg:
.asciz "Illegal move \n"

winnerMsg:
.asciz "Winner! \n"

tieMsg:
.asciz "The game has ended in a tie. \n"

welcomeMsg:
.asciz "Let's play Tic-Tac-Toe! \n"

.text
.global main
.type main, %function

main:
    @prologue
    push {r4, fp, lr}
    add fp, sp, #4

startGame:

mov r4, #0 @clears the board

ldr r0, .addrWelcomeMsg
bl  printf

playerSelection:
@alternate between players
@select a turn
@if computer move, branch to computer move
@else fall through to player move

playerMove:
@if it is the user's turn
ldr  r0, .addrPromptMsg @output statement for move prompt 
bl   printf
@scanf for the user input
ldr  r0, .addrScanfFormat
ldr  r1, .addrInputStorage
bl   scanf
@if valid
ldr  r0, .addrInputStorage
bl   legalMove
@bl to movement function
b    playerSelection

@else report invalid and branch back to prompt. 
ldr   r0, .addrErrorMsg
bl printf
b  playerMove

computerMove:
@ see what the next open space is
@ branch and link to isValid
@ ifValid place move
b   playerSelection
@else 
@redetremine my life choices because the computer shouldn't mess that up 

@Game has ended, start a new game
b   startGame


addrPromptMsg:
.align 2
.word promptMsg

addrScanfFormat:
.word scanfFormat

addrErrorMsg:
.word errorMsg

addrWinnerMsg:
.word winnerMsg

addrTieMsg:
.word tieMsg

addrWelcomeMsg:
.word wecomeMsg

addrInputStorage:
.word inputStorage

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Functions here will hopefully go in seperate files

@determine win move or tie move
winningMove:
@ call to r0 the winningMove(current board, move) function to determine if the game has been won or tied
@if last move resulted in a win
@declare win 
ldr r0, .addrWinnerMsg
bl   printf
b   startGame
tieMove:
@else if didTie(current board, move)
ldr r0, .addrTieMsg
bl  printf
b   startGame

move:
@place the move with bit masking
@output the new board
@go back to chosing who's turn it is
b   playerSelection
