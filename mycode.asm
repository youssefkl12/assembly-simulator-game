
find macro string,alue
    lea di,string
    mov cx,byte ptr 4
    mov dx,cx
    compareloopbb:
    cmp [di],byte ptr 30h
    jb doneit
    inc di
    dec cx
    jnz compareloopbb
    doneit:
    sub dx,cx
    mov alue,dx
endm find
include mymacro.inc
.model small
.stack 64
.data
p1upclreg db 1;clear register playercounter 1
p2upclreg db 1;clear register player counter 2
p1chngforcharnum db 1; changes the forbbiden char counter p1
p2chngforcharnum db 1; changes the forbbiden char counter p2
p1excutesamecheck db 1; we will excute the comand proc twice with changing turns
p2excutesamecheck db 1; we will excute the comand proc twice with changing turns  

msg1 db 10,13,"Please enter your name : ","$"
msg2 db 10,13,"Initial Points : ","$"
msg3 db 10,13, "Press enter key to continue","$"
msg4 db 10,13,"Error,Please enter your name again : ","$"
msg5 db 10,13,'To Start Chatting Press F1','$'
 msg6 db 10,13,'To Start The Game Press F2','$'
 msg7 db 10,13,'To end the program Press ESC','$'
 msg8 db 10,13,"player one is the winner",'$'
 msg9 db 10,13,"player two is the winner",'$'
 msg10 db 10,13,"choose the level of the game : ",'$'
 msg11 db 10,13,"for Level 1 press 1 ",'$'
 msg12 db 10,13,"for Level 2 press 2",'$'
 msg13 db 10,13,"Please choose forbidden character (first player)[press enter to continue]: ",'$'
 msg14 db 10,13,"Error,please choose forbidden character again : ","$"
 msg15 db 10,13,"Please choose forbidden character (second player):[press f4 to continue] ",'$'
 msg16 db 10,13,"Please enter register values (first player)","$"


 commandp1 db 18,?,18 DUP('$')
 commandp2 db 18,?,18 DUP('$')
initialpoints1 db ?
initialpoints2 db ?
forbiddench1 db ?
forbiddench2 db ?
levelnumber db ?
con EQU 15
p1name db 20,?,20 DUP('$')
p2name db 20,?,20 DUP('$')
regf1 db "AX","$"
regf2 db "BX","$"
regf3 db "CX","$"
regf4 db "DX","$"
regf5 db "SI","$"
regf6 db "DI","$"
regf7 db "SP","$"
regf8 db "BP","$"
regs1 db "AX","$"
regs2 db "BX","$"
regs3 db "CX","$"
regs4 db "DX","$"
regs5 db "SI","$"
regs6 db "DI","$"
regs7 db "SP","$"
regs8 db "BP","$"
var dw 0105Eh
var2 db 00h
;///////////////////////////////////////plane variable
beg dw 45h
ending dw 46h
start dw 60h
row dw 95h
count dw 0
bullet dw ? 
bulletmotion dw 0
dp1 db 0  
movp1flag dw 0
;;;;;;;;;;;;;;;;;;
oldbeg dw ?
oldend dw ?
oldrow dw ? 
;;;;;;;;;;;;;;;;;;;;;;;;;     
beg2 dw 22ah
end2 dw 22bh
start2 dw 60h
row2 dw 95h
count2 dw 0
bullet2 dw ?          
bulletmotion2 dw 0
dp2 dw 0
movp2flag dw 0   
;;;;;;;;;;;;;;;;;
oldbeg2 dw ?
oldend2 dw ?
oldrow2 dw ?  
;//////////////////////////////////////
;ball ya rab
.386
;////////////////////////////////
begball dw 5h
endball dw 015h
rowball dw 72h  
countball dw 0h
countballloop dw 0h
;///////////////////////////
begballp2 dw 1f0h
endballp2 dw 200h
rowballp2 dw 72h  
countballp2 dw 0h
countballloopp2 dw 0h
color db 0,15,8,1  
colorchange dw 0 
                             ;kareem variables
;//////////////////////////////
;.386
;level
level db ?
;------------------
;PLAYER 1 VARIABLES
;commandp1 db 15,?,15 dup("$")
AXP1 DW 0000h
BXP1 DW 0000h
CXP1 DW 0000h
DXP1 DW 0000h
SIP1 DW 0000h
DIP1 DW 0000h
SPP1 DW 0000h
BPP1 DW 0000h
carryp1 db 00h
Memoryp1 db 16 dup(?)
;---------------------
;PLAYER 2 VARIABLES
;commandp2 15,?,15 dup(' ')
AXP2 DW 0000h
BXP2 DW 0000h
CXP2 DW 0000h
DXP2 DW 0000h
SIP2 DW 0000h
DIP2 DW 0000h
SPP2 DW 0000h
BPP2 DW 0000h
carryp2 db 00h
Memoryp2 db 16 dup(?) 
;--------------------
;allowed commands
movop db "mov"
addop db 'add'
adcop db 'adc'
andop db 'and'
clcop db 'clc'
decop db 'dec'
incop db 'inc'
xorop db 'xor'
nopop db 'nop'
orop  db 'or '
rolop db 'rol'
rorop db 'ror'
sbbop db 'sbb'
shlop db 'shl'
shrop db 'shr'
subop db 'sub'
;--------------------
;allowed sources and destinations
 axreg db 'ax'
 bxreg db 'bx'
 cxreg db 'cx'
 dxreg db 'dx'
 sireg db 'si'
 direg db 'di'
 spreg db 'sp'
 bpreg db 'bp'
 ahreg db 'ah'
 alreg db 'al'
 bhreg db 'bh'
 blreg db 'bl'
 chreg db 'ch'
 clreg db 'cl'
 dhreg db 'dh'
 dlreg db 'dl'
 me0 db '[0]'
 me1 db '[1]'
 me2 db '[2]'
 me3 db '[3]' 
 me4 db '[4]'
 me5 db '[5]' 
 me6 db '[6]'
 me7 db '[7]' 
 me8 db '[8]'
 me9 db '[9]' 
 mea db '[a]'
 meb db '[b]' 
 mec db '[c]'
 med db '[d]' 
 mee db '[e]'
 mef db '[f]'
 meABX db "[bx]"
 meADI db "[di]"
 meASI db "[si]"
;-------------------- 
;ERRORS
error1 db "Size mismatch",'$'
error2 db "invalid register name",'$'
error3 db "Memory to memory operation",'$'
error4 db "incorrect addresing mode",'$' 
;===========================
;commandp1 db 15,?,15 dup(" ")  
operation DB 3 dup(?)
destination db 4 dup(?)
source db 4 dup(?)
destinationaddress dw ?
sourceaddress dw ?
destinationtype db 00
sourcetype db 00
Turns db 01
indicator db 0
value dw 0000h
;/////////////////////////////////
.code
anding proc near;9
mov ah,destinationtype    
mov al,sourcetype
;16 bits
cmp ah,1
jnz andbitsreg
cmp al,1
jnz errorloop
pushf
mov cx,2
popf
andbitsreg:
cmp ah,2h
jnz andbitsmemory    
cmp al,dl
jz errorloop
pushf    
mov cx,1
popf
jz andpreform 
andbitsmemory:
mov di,destinationaddress
mov si,sourceaddress
andpreform:
mov ah,[di]
mov al,[si]
and ah,al
mov [di],ah
inc si
inc di
loop andpreform    
    ret
anding endp
;///////////////////////////////////////////////////
adding proc near;2
cmp sourcetype,0
mov indicator,4
jz errorloop
cmp destinationtype,0
mov indicator,4
jz errorloop
cmp destinationtype,1
mov indicator,1
jz fullregister
cmp destinationtype,2
mov indicator,1
jz halfregister





fullregister:
cmp sourcetype,3
mov indicator,1
jz errorloop
cmp sourcetype,2
mov indicator,1
jz errorloop
cmp sourcetype,4
jz diffrentadd
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
add [di],ah
inc si
inc di
mov ah,[si]
add [di],ah
jmp adddone
diffrentadd:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
add [di],ah
inc si
inc di
mov ah,[si]
add [di],ah
jmp adddone

halfregister:
cmp sourcetype,2
mov indicator,1
jb errorloop
cmp sourcetype,4
jz diffrentadd1
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
add [di],ah
jmp adddone
diffrentadd1:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
add [di],ah
jmp adddone











  adddone:   
    ret
adding endp
;///////////////////////////////////////////////////
moving proc near;1 
mov ah,destinationtype    
mov al,sourcetype
cmp al,1
mov indicator,2
jb errorloop
;16 bits
cmp ah,1
jnz bitsreg
cmp al,1
jnz number
pushf
mov cx,2
popf
jz preform
number:
cmp al,4
mov indicator,1
jnz errorloop
pushf
mov ax,word ptr sourceaddress
mov di,destinationaddress
mov [di],ax
popf
jz done



;8 bits
bitsreg:
cmp ah,2
jnz bitsmemory    
cmp al,2
mov indicator,1
jnz number2
pushf    
mov cx,1
popf
jz preform
number2:
cmp al,4
mov indicator,1
jnz test1
pushf
lea si,sourceaddress
mov di,destinationaddress
mov cx,2
repe movsb
popf
jz done
test1:
cmp al,2
mov indicator,1
jnz errorloop
pushf
mov cx,1
popf
jz preform




;memory 
bitsmemory:
cmp ah,3
jnz errorloop
cmp al,3
mov indicator,3
jz errorloop    
cmp al,2
mov indicator,2
jnz number2
pushf    
mov cx,1
popf
jz preform
cmp al,4
mov indicator,1
jnz test2
pushf
lea si,sourceaddress
mov di,destinationaddress
mov cx,2
repe movsb
popf
jz done
test2:
cmp al,2
mov indicator,1
jnz errorloop
pushf
mov cx,1
popf
jz preform


preform:    
mov di,destinationaddress
mov si,sourceaddress
repe movsb  
done:      
ret    
moving endp

;////////////////////////////////////

;//////////////////////////////////////////////
adcing proc near;3
cmp sourcetype,0
mov indicator,4
jz errorloop
cmp destinationtype,0
mov indicator,4
jz errorloop
cmp destinationtype,1
mov indicator,1
jz fullregister1
cmp destinationtype,2
mov indicator,1
jz halfregister1





fullregister1:
cmp sourcetype,3
mov indicator,1
jz errorloop
cmp sourcetype,2
mov indicator,1
jz errorloop
cmp sourcetype,4
jz diffrentadc
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
add [di],ah
inc si
inc di
mov ah,[si]
add [di],ah
jmp addcone
diffrentadc:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
add [di],ah
inc si
inc di
mov ah,[si]
add [di],ah
jmp addcone

halfregister1:
cmp sourcetype,2
mov indicator,1
jb errorloop
cmp sourcetype,4
jz diffrentadc1
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
add [di],ah
jmp addcone
diffrentadc1:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
add [di],ah
jmp addcone











  addcone:       
    ret
adcing endp

;////////////////////////////////////////
subtracting proc near;4
cmp sourcetype,0
mov indicator,4
jz errorloop
cmp destinationtype,0
mov indicator,4
jz errorloop
cmp destinationtype,1
mov indicator,1
jz fullregister2
cmp destinationtype,2
mov indicator,1
jz halfregister2





fullregister2:
cmp sourcetype,3
mov indicator,1
jz errorloop
cmp sourcetype,2
mov indicator,1
jz errorloop
cmp sourcetype,4
jz diffrentsub
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
sub [di],ah
inc si
inc di
mov ah,[si]
sub [di],ah
jmp subbone
diffrentsub:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
sub [di],ah
inc si
inc di
mov ah,[si]
sub [di],ah
jmp subbone

halfregister2:
cmp sourcetype,2
mov indicator,1
jb errorloop
cmp sourcetype,4
jz diffrentsub1
mov di,destinationaddress
mov si,sourceaddress
mov ah,[si]
sub [di],ah
jmp subbone
diffrentsub1:
mov di,destinationaddress
lea si,byte ptr sourceaddress
mov ah,[si]
sub [di],ah
jmp subbone











  subbone:   
subtracting endp





subwborrow proc near;5
mov ah,destinationtype    
mov al,sourcetype
;16 bits
cmp ah,1
jnz sbbbitsreg
cmp al,1
jnz errorloop
pushf
mov cx,2
popf
sbbbitsreg:
cmp ah,2h
jnz sbbbitsmemory    
cmp al,dl
jz errorloop
pushf    
mov cx,1
popf
jz sbbpreform 
sbbbitsmemory:
mov di,destinationaddress
mov si,sourceaddress
sbbpreform:
mov ah,[di]
mov al,[si]
sub ah,al
mov [di],ah
inc si
inc di
loop sbbpreform    
    ret    
    ret
subwborrow endp


clcing proc near;6
cmp Turns,1
jnz P2
mov carryp1,0
P2:
mov carryp2,0    
ret
clcing endp 


incrimenting proc near;7
incpreform:
mov di,destinationaddress
cmp destinationtype,1
jnz firsttry
pushf
inc [di]
adc [di]+1,0
popf
jz incdone
firsttry:
cmp destinationtype,2
jnz errorloop
pushf
inc [di]
popf
jz incdone
incdone:    
ret
incrimenting endp



decrimenting proc near;8
mov ah,sourcetype
cmp ah,0
jz  decpreform
mov indicator,4
jnz errorloop
decpreform:
mov si,destinationaddress
mov ah,[si]
sub ah,1
mov [si],ah 
inc si
mov al,destinationtype
cmp al,1
jz decdone
mov ah,[si]
sbb ah,0
mov [si],ah
decdone:     
    ret
decrimenting endp 




 
 
 
 
 
 
 
xoring proc near;11
mov ah,destinationtype    
mov al,sourcetype
;16 bits
cmp ah,1
jnz xorbitsreg
cmp al,1
jnz errorloop
pushf
mov cx,2
popf
xorbitsreg:
cmp ah,2h
jnz xorbitsmemory    
cmp al,dl
jz errorloop
pushf    
mov cx,1
popf
jz xorpreform 
xorbitsmemory:
mov di,destinationaddress
mov si,sourceaddress
xorpreform:
mov ah,[di]
mov al,[si]
xor ah,al
mov [di],ah
inc si
inc di
loop xorpreform    
    ret
xoring endp








oring proc near;10
mov ah,destinationtype    
mov al,sourcetype
;16 bits
cmp ah,1
jnz orbitsreg
cmp al,1
jnz errorloop
pushf
mov cx,2
popf
orbitsreg:
cmp ah,2h
jnz orbitsmemory    
cmp al,dl
jz errorloop
pushf    
mov cx,1
popf
jz orpreform 
orbitsmemory:
mov di,destinationaddress
mov si,sourceaddress
orpreform:
mov ah,[di]
mov al,[si]
or ah,al
mov [di],ah
inc si
inc di
loop orpreform    
    ret
oring endp 

nooperation proc near;16
nop    
    ret
nooperation endp

rotatingr proc near;12
;checks
mov indicator,2
mov ah,source
mov al,source+1
mov bx,"cl"
cmp ax,bx
jne errorloop
cmp sourcetype,3
je errorloop
;16 bits 
cmp destinationtype,1
jne rrdestination2
rrdestination1:
cmp sourcetype,1
je errorloop
rrsource2:
cmp sourcetype,2
ja rrsource3
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
inc si
mov ah,[si]
mov cl,[di]
ror ax,cl
mov [si],ah
dec si
mov [si],al
jmp rotationrdone

rrsource3:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
inc si
mov ah,[si]
mov cx,destinationaddress
ror ax,cl
mov [si],ah
dec si
mov [si],al
jmp rotationrdone

rrdestination2:
cmp sourcetype,1
je errorloop
rrsource21:
cmp sourcetype,2
ja rrsource31
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
mov cl,[di]
ror al,cl
mov [si],al
jmp rotationrdone

rrsource31:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
mov cx,destinationaddress
ror al,cl
mov [si],al
jmp rotationrdone





rotationrdone:
    ret
rotatingr endp 



rotatingl proc near;13
;checks
mov indicator,2
mov ah,source
mov al,source+1
mov bx,"cl"
cmp ax,bx
jne errorloop
cmp sourcetype,3
je errorloop
;16 bits 
cmp destinationtype,1
jne rldestination2
rldestination1:
cmp sourcetype,1
je errorloop
rlsource2:
cmp sourcetype,2
ja rlsource3
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
inc si
mov ah,[si]
mov cl,[di]
rol ax,cl
mov [si],ah
dec si
mov [si],al
jmp lrotationrdone

rlsource3:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
inc si
mov ah,[si]
mov cx,destinationaddress
rol ax,cl
mov [si],ah
dec si
mov [si],al
jmp lrotationrdone

rldestination2:
cmp sourcetype,1
je errorloop
rlsource21:
cmp sourcetype,2
ja rrsource31
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
mov cl,[di]
rol al,cl
mov [si],al
jmp lrotationrdone

rlsource31:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
mov cx,destinationaddress
rol al,cl
mov [si],al
jmp lrotationrdone





lrotationrdone:   
    ret
rotatingl endp 



shiftingl proc near;14
   mov indicator,2
mov ah,source
mov al,source+1
mov bx,"cl"
cmp ax,bx
jne errorloop
cmp sourcetype,3
je errorloop
;16 bits 
cmp destinationtype,1
jne sldestination2
sldestination1:
cmp sourcetype,1
je errorloop
slsource2:
cmp sourcetype,2
ja slsource3
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
inc si
mov ah,[si]
mov cl,[di]
shl ax,cl
mov [si],ah
dec si
mov [si],al
jmp lshiftdone

slsource3:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
inc si
mov ah,[si]
mov cx,destinationaddress
shl ax,cl
mov [si],ah
dec si
mov [si],al
jmp lshiftdone

sldestination2:
cmp sourcetype,1
je errorloop
slsource21:
cmp sourcetype,2
ja rrsource31
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
mov cl,[di]
shl al,cl
mov [si],al
jmp lshiftdone

slsource31:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
mov cx,destinationaddress
shl al,cl
mov [si],al
jmp lshiftdone





 lshiftdone:  
    ret
shiftingl endp 



shiftingr proc near;15
 mov indicator,2
mov ah,source
mov al,source+1
mov bx,"cl"
cmp ax,bx
jne errorloop
cmp sourcetype,3
je errorloop
;16 bits 
cmp destinationtype,1
jne srdestination2
srdestination1:
cmp sourcetype,1
je errorloop
srsource2:
cmp sourcetype,2
ja slsource3
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
inc si
mov ah,[si]
mov cl,[di]
shl ax,cl
mov [si],ah
dec si
mov [si],al
jmp rshiftdone

srsource3:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
inc si
mov ah,[si]
mov cx,destinationaddress
shl ax,cl
mov [si],ah
dec si
mov [si],al
jmp rshiftdone

srdestination2:
cmp sourcetype,1
je errorloop
srsource21:
cmp sourcetype,2
ja rrsource31
mov si,destinationaddress
mov di,sourceaddress
mov al,[si]
mov cl,[di]
shl al,cl
mov [si],al
jmp rshiftdone

srsource31:
cmp sourcetype,4
jne errorloop
mov si,destinationaddress
mov al,[si]
mov cx,destinationaddress
shl al,cl
mov [si],al
jmp rshiftdone





 rshiftdone:    
    ret
shiftingr endp 
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
com proc near
mov ax,@data
mov ds,ax
mov es,ax
mov ax,word ptr 0000
mov bl,Turns
cmp bl,2
jnz rko1
pushf
mov ah,2
mov dl,3d
mov dh,17d
int 10h
popf
je rko2
rko1:
mov ah,2
mov dl,23d
mov dh,17d
int 10h
rko2:
;/check for the power up of 4 excuting on both registers
mov ah,p1excutesamecheck
cmp ah,2
je p1excutesamejump
mov ah,p2excutesamecheck
cmp ah,2
je p2excutesamejump
;/////////////////////////////////////////////
mov ah,0Ah
lea dx,commandp1
int 21h

mov si,offset commandp1+2

;/////////////////////////////////////////////////////////////////////////////////////////////
;power ups
;player 1 power ups

cmp bl,2
jne p2up

; clear registers/press 1


cmp commandp1+2,'1'
jne up1clearreg
mov bl,p1upclreg
cmp p1upclreg,1
jne skippower
mov AXP1,0000h
mov BXP1 , 0000h
mov CXP1 , 0000h
mov DXP1 , 0000h
mov SIP1 , 0000h
mov DIP1 , 0000h
mov SPP1 , 0000h
mov BPP1 , 0000h
dec p1upclreg
sub initialpoints1,30d
ret
up1clearreg:
; excute on your register press2
cmp commandp1+2,'2'
jne up1exureg
mov Turns,byte ptr 1h

mov ah,2
mov dl,3d
mov dh,17d
int 10h

mov ah,0Ah
lea dx,commandp1
int 21h
mov si,offset commandp1+2
sub initialpoints2,5d
up1exureg:
; press 3 to change forbbiden char
cmp commandp1+2,'3'
jne up1chngeforbbid
mov bl,p1chngforcharnum 
cmp p1chngforcharnum,1
jne skippower

mov ah,2
mov dl,3d
mov dh,17d
int 10h

mov ah,0Ah
lea dx,commandp1
int 21h
mov al,commandp1+2
mov forbiddench1,al
dec p1chngforcharnum
sub initialpoints1,8d
ret
up1chngeforbbid:
; press 4 to cexcute on both regsters
cmp commandp1+2,'4'
jne p1excutesame
;//first take the command we want to excute
sub initialpoints2,3d
inc p1excutesamecheck
mov ah,2
mov dl,3d
mov dh,17d
int 10h

mov ah,0Ah
lea dx,commandp1
int 21h
 p1excutesamejump:
mov si,offset commandp1+2
p1excutesame:

;player2 power ups
; clear registers/press 1
p2up: 
cmp commandp1+2,'1'
jne up2clearreg
mov bl,p2upclreg
cmp p2upclreg,1
jne skippower
mov AXP2,0000h
mov BXP2 , 0000h
mov CXP2 , 0000h
mov DXP2 , 0000h
mov SIP2 , 0000h
mov DIP2 , 0000h
mov SPP2 , 0000h
mov BPP2 , 0000h
dec p2upclreg
sub initialpoints2,30d
ret

up2clearreg:
; excute on your register press2
cmp commandp1+2,'2'
jne up2exureg
mov ah,2
mov dl,23d
mov dh,17d
int 10h
mov Turns,byte ptr 2h
mov ah,0Ah
lea dx,commandp1
int 21h
mov si,offset commandp1+2
sub initialpoints2,5d
up2exureg:

; press 3 to change forbbiden char
cmp commandp1+2,'3'
jne up2chngeforbbid
mov bl,p2chngforcharnum 
cmp p2chngforcharnum,1
jne skippower

mov ah,2
mov dl,23d
mov dh,17d
int 10h

mov ah,0Ah
lea dx,commandp1
int 21h
mov al,commandp1+2
mov forbiddench2,al
dec p2chngforcharnum
sub initialpoints2,8d
ret
up2chngeforbbid:

; press 4 to cexcute on both regsters
cmp commandp1+2,'4'
jne p2excutesame
;//first take the command we want to excute
inc p2excutesamecheck
sub initialpoints2,3d
mov ah,2
mov dl,23d
mov dh,17d
int 10h

mov ah,0Ah
lea dx,commandp1
int 21h
 p2excutesamejump:
mov si,offset commandp1+2
p2excutesame:



skippower:
;///////////////////////////////////////////////////////////////////////////////////////////
;forbbiden character
mov ah,Turns
cmp ah,2 ;player 1 acts on registers numbered 2 so that is why hos turn is coded with 2
jne forbiddp2
mov si,offset commandp1+1
mov cx,9
mov al,forbiddench2
mov di,offset commandp1+2
repne scasb 
cmp cx,0
je skipforbbidp1
dec initialpoints1
ret
skipforbbidp1:


forbiddp2:
mov si,offset commandp1+1
mov cx,9
mov al,forbiddench1
mov di,offset commandp1+2
repne scasb 
cmp cx,0
je skipforbbidp2
dec initialpoints2
ret
skipforbbidp2:





;/////////////////////////////////////////////////////////////////////////////////////////////////////
mov si,offset commandp1+2
mov di,offset operation
mov cx,3
repe movsb

mov di,offset commandp1+2
mov al," "
mov cx,15
repne scasb 
mov si,di
 

lea di,destination
mov cx,4
repe movsb
mov di,offset commandp1+2
mov al,","
mov cx,9
repne scasb 
mov si,di
lea di,source
mov cx,4
repe movsb

;=================================================================
destAX:
mov si,offset destination
mov di,offset axreg
mov cx,2
compareloopAX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destBX
inc si
inc di
dec cx
jnz compareloopAX
pushf
decide AXP1,AXP2
mov destinationtype,1
popf
je srcAX 

destBX:
mov di,offset destination
mov si,offset bxreg
mov cx,2
compareloopBX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destCX
inc si
inc di
dec cx


jnz compareloopBX
pushf
decide  BXP1,BXP2
mov destinationtype,1
popf
je srcAX

destCX:
mov si,offset destination
mov di,offset cxreg
mov cx,2    ;16
compareloopCX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destDX
inc si
inc di
dec cx
jnz compareloopCX
pushf
decide CXP1,CXP2
mov destinationtype,1
popf
je srcAX

destDX:
lea si,destination
lea di,dxreg
mov cx,2    ;16
compareloopDX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destDI
inc si
inc di
dec cx
jnz compareloopDX
pushf

;/////////////////////
decide DXP1,DXP2
mov destinationtype,1
popf
je srcAX


destDI:
lea si,destination
lea di,direg
mov cx,2    ;16
compareloopDI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destSI
inc si
inc di
dec cx
jnz compareloopDI
pushf
decide DIP1,DIP2
mov destinationtype,1
popf
je srcAX



destSI:
lea si,destination
lea di,sireg
mov cx,2    ;16
compareloopSI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destBP
inc si
inc di
dec cx
jnz compareloopSI
pushf
decide SIP1,SIP2
mov destinationtype,1
popf
je srcAX
;/////////////////////////////////////


destBP:
lea si,destination
lea di,bpreg
mov cx,2    ;16
compareloopBP:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destSP
inc si
inc di
dec cx
jnz compareloopBP
pushf
decide BPP1,BPP2
mov destinationtype,1
popf
je srcAX


destSP:
lea si,destination
lea di,spreg
mov cx,2    ;16
compareloopSP:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destAH
inc si
inc di
dec cx
jnz compareloopSP
pushf
decide SPP1,SPP2
mov destinationtype,1
popf
je srcAX


destAH:
lea si,destination
lea di,ahreg
mov cx,2    ;16
compareloopAH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destAL
inc si
inc di
dec cx
jnz compareloopAH
pushf
decide2 AXP1,AXP2
mov destinationtype,2
popf
je srcAX
;/////////////////////////////////////////////////




destAL:
lea si,destination
lea di,alreg
mov cx,2    ;16
compareloopAL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destBH
inc si
inc di
dec cx
jnz compareloopAL
pushf
decide1 AXP1,AXP2
mov destinationtype,2
popf
je srcAX


destBH:
lea si,destination
lea di,bhreg
mov cx,2    ;16
compareloopBH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destBL
inc si
inc di
dec cx
jnz compareloopBH
pushf
decide2 BXP1,BXP2
mov destinationtype,2
popf
je srcAX


destBL:
lea si,destination
lea di,blreg
mov cx,2    ;16
compareloopBL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destCH
inc si
inc di
dec cx
jnz compareloopBL
mov destinationtype,2
pushf
decide1 BXP1,BXP2
mov destinationtype,2
popf
je srcAX



destCH:
lea si,destination
lea di,chreg
mov cx,2    ;16
compareloopCH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destCL
inc si
inc di
dec cx
jnz compareloopCH
pushf
decide2 CXP1,CXP2
mov destinationtype,2
popf
je srcAX
;/////////////////////////////////////




destCL:
lea si,destination
lea di,clreg
mov cx,2    ;16
compareloopCL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destDH
inc si
inc di
dec cx
jnz compareloopCL
pushf
decide1 CXP1,CXP2
mov destinationtype,2
popf
je srcAX


destDH:
lea si,destination
lea di,dhreg
mov cx,2    ;16
compareloopDH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destDL
inc si
inc di
dec cx
jnz compareloopDH
pushf
decide2 DXP1,DXP2
mov destinationtype,2
popf 
je srcAX


destDL:
lea si,destination
lea di,dlreg
mov cx,2    ;16
compareloopDL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest1
inc si
inc di
dec cx
jnz compareloopDL
pushf
decide1 DXP1,DXP2
mov destinationtype,2
popf
je srcAX
;//////////////////////////////////




dest0:
lea si,destination
lea di,me0
mov cx,3
compareloop0:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest1
inc si
inc di
dec cx
jnz compareloop0
pushf
decide memoryp1,memoryp2
mov destinationtype,3
popf
je srcAX


dest1:
lea di,destination
lea si,me1
mov cx,3
compareloop1:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest2
inc si
inc di
dec cx
jnz compareloop1
pushf
decide1 memoryp1[1],memoryp2[1]
mov destinationtype,3
popf
je srcAX

dest2:
lea si,destination
lea di,me2
mov cx,3    ;16
compareloop2:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest3
inc si
inc di
dec cx
jnz compareloop2
pushf
decide1 memoryp1[2],memoryp2[2]
mov destinationtype,3
popf
je srcAX

dest3:
lea si,destination
lea di,me3
mov cx,3    ;16
compareloop3:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest4
inc si
inc di
dec cx
jnz compareloop3
pushf
decide1 memoryp1[3],memoryp2[3]
mov destinationtype,3
popf
je srcAX


;////////////////////////////////////

dest4:
lea si,destination
lea di,me4
mov cx,3    ;16
compareloop4:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest5
inc si
inc di
dec cx
jnz compareloop4
pushf
decide1 memoryp1[4],memoryp2[4]
mov destinationtype,3
popf
je srcAX



dest5:
lea si,destination
lea di,me5
mov cx,3    ;16
compareloop5:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest6
inc si
inc di
dec cx
jnz compareloop5
pushf
decide1 memoryp1[5],memoryp2[5]
mov destinationtype,3
popf
je srcAX


dest6:
lea si,destination
lea di,me6
mov cx,3    ;16
compareloop6:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest7
inc si
inc di
dec cx
jnz compareloop6
pushf
decide1 memoryp1[6],memoryp2[6]
mov destinationtype,3
popf
je srcAX


dest7:
lea si,destination
lea di,me7
mov cx,3    ;16
compareloop7:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest8
inc si
inc di
dec cx
jnz compareloop7
pushf
decide1 memoryp1[7],memoryp2[7]
mov destinationtype,3
popf
je srcAX

;//////////////////////////////////////////////////



dest8:
lea si,destination
lea di,me8
mov cx,3    ;16
compareloop8:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz dest9
inc si
inc di
dec cx
jnz compareloop8
pushf
decide1 memoryp1[8],memoryp2[8]
mov destinationtype,3
popf
je srcAX


dest9:
lea si,destination
lea di,me9
mov cx,3    ;16
compareloop9:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz desta
inc si
inc di
dec cx
jnz compareloop9
pushf
decide1 memoryp1[9],memoryp2[9]
mov destinationtype,3
popf
je srcAX


desta:
lea si,destination
lea di,mea
mov cx,3    ;16
compareloopa:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destb
inc si
inc di
dec cx
jnz compareloopa
pushf
decide1 memoryp1[10],memoryp2[10]
mov destinationtype,3
popf
je srcAX
;//////////////////////////////////////////////


destb:
lea si,destination
lea di,meb
mov cx,3    ;16
compareloopb:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destc
inc si
inc di
dec cx
jnz compareloopb
pushf
decide1 memoryp1[11],memoryp2[11]
mov destinationtype,3
popf
je srcAX



destc:
lea si,destination
lea di,mec
mov cx,3    ;16
compareloopc:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destd
inc si
inc di
dec cx
jnz compareloopc
pushf
decide1 memoryp1[12],memoryp2[12]
mov destinationtype,3
popf
je srcAX



destd:
lea si,destination
lea di,med
mov cx,3    ;16
compareloopd:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz deste
inc si
inc di
dec cx
jnz compareloopd
pushf
decide1 memoryp1[13],memoryp2[13]
mov destinationtype,3
popf
je srcAX


deste:
lea si,destination
lea di,mee
mov cx,3    ;16
compareloope:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destf
inc si
inc di
dec cx
jnz compareloope
pushf
decide1 memoryp1[14],memoryp2[14]
mov destinationtype,3
popf
je srcAX


destf:
lea si,destination
lea di,mef
mov cx,3    ;16
compareloopf:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destABX
inc si
inc di
dec cx
jnz compareloopf
pushf
decide1 memoryp1[15],memoryp2[15]
mov destinationtype,3
popf
je srcAX
;////////////////////////////////////////////////// 

destABX:
lea si,destination
lea di,meABX
mov cx,4    ;16
compareloopABX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destADI
inc si
inc di
dec cx
jnz compareloopABX
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz t
mov ax,BXP1
mov destinationaddress,offset memoryp1
pushf
add destinationaddress,ax
popf
jz endtf
t:
mov ax,BXP2
mov destinationaddress,offset memoryp2
pushf
add destinationaddress,ax
endtf:
popf
je srcAX

destADI:
lea si,destination
lea di,meADI
mov cx,4    ;16
compareloopADI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz destASI
inc si
inc di
dec cx
jnz compareloopADI
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz tff
mov ax,DIP1
mov destinationaddress,offset memoryp1
pushf
add destinationaddress,ax
popf
jz endtff
tff:
mov ax,DIP2
mov destinationaddress,offset memoryp2
pushf
add destinationaddress,ax
endtff:
popf
je srcAX



destASI:
lea si,destination
lea di,meASI
mov cx,4    ;16
compareloopASI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz Turn
inc si
inc di
dec cx
jnz compareloopASI
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz tfff
mov ax,SIP1
mov destinationaddress,offset memoryp1
pushf
add destinationaddress,ax
popf
jz endtfff
tfff:
mov ax,SIP2
mov destinationaddress,offset memoryp2
pushf
add destinationaddress,ax
endtfff:
popf
je srcAX
;============================================================================================================================================================            
srcAX:
lea si,source
lea di,axreg
mov cx,2
compareloopsAX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcBX
inc si
inc di
dec cx
jnz compareloopsAX
pushf
decide3 AXP1,AXP2
mov sourcetype,1
popf
je Turn



srcBX:
lea di,source
lea si,bxreg
mov cx,2
compareloopsBX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcCX
inc si
inc di
dec cx
jnz compareloopsBX
pushf
decide3 BXP1,BXP2
mov sourcetype,1
popf
je Turn

;///////////////////////////////////////////
srcCX:
lea si,source
lea di,cxreg
mov cx,2    ;16
compareloopsCX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcDX
inc si
inc di
dec cx
jnz compareloopsCX
pushf
decide3 CXP1,CXP2
mov sourcetype,1
popf
je Turn

srcDX:
lea si,source
lea di,dxreg
mov cx,2    ;16
compareloopsDX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcDI
inc si
inc di
dec cx
jnz compareloopsDX
pushf
decide3 DXP1,DXP2
mov sourcetype,1
popf
je Turn


srcDI:
lea si,source
lea di,direg
mov cx,2    ;16
compareloopsDI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcSI
inc si
inc di
dec cx
jnz compareloopsDI
pushf
decide3 DIP1,DIP2
mov sourcetype,1
popf
je Turn
;/////////////////////////////////


srcSI:
lea si,source
lea di,sireg
mov cx,2    ;16
compareloopsSI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcBP
inc si
inc di
dec cx
jnz compareloopsSI
pushf
decide3 SIP1,SIP2
mov sourcetype,1
popf
je Turn


srcBP:
lea si,source
lea di,bpreg
mov cx,2    ;16
compareloopsBP:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcSP
inc si
inc di
dec cx
jnz compareloopsBP
pushf
decide3 BPP1,BPP2
mov sourcetype,1
popf
je Turn


srcSP:
lea si,source
lea di,spreg
mov cx,2    ;16
compareloopsSP:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcAH
inc si
inc di
dec cx
jnz compareloopsSP
pushf
decide3 SPP1,SPP2
mov sourcetype,1
popf
je Turn
;/////////////////////////


srcAH:
lea si,source
lea di,ahreg
mov cx,2    ;16
compareloopsAH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcAL
inc si
inc di
dec cx
jnz compareloopsAH
pushf
decide5 AXP1,AXP2
mov sourcetype,2
popf
je Turn


srcAL:
lea si,source
lea di,alreg
mov cx,2    ;16
compareloopsAL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcBH
inc si
inc di
dec cx
jnz compareloopsAL
pushf
decide4 AXP1,AXP2
mov sourcetype,2
popf
je Turn


srcBH:
lea si,source
lea di,bhreg
mov cx,2    ;16
compareloopsBH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcBL
inc si
inc di
dec cx
jnz compareloopsBH
pushf
decide5 BXP1,BXP2
mov sourcetype,2
popf
je Turn


srcBL:
lea si,source
lea di,blreg
mov cx,2    ;16
compareloopsBL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcCH
inc si
inc di
dec cx
jnz compareloopsBL
pushf
decide4 BXP1,BXP2
mov sourcetype,2
popf
je Turn

;//////////////////////////////////////////////////


srcCH:
lea si,source
lea di,chreg
mov cx,2    ;16
compareloopsCH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcCL
inc si
inc di
dec cx
jnz compareloopsCH
pushf
decide5 CXP1,CXP2
mov sourcetype,2
popf
je Turn



srcCL:
lea si,source
lea di,clreg
mov cx,2    ;16
compareloopsCL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcDH
inc si
inc di
dec cx
jnz compareloopsCL
pushf
decide4 CXP1,CXP2
mov sourcetype,2
popf
je Turn


srcDH:
lea si,source
lea di,dhreg
mov cx,2    ;16
compareloopsDH:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcDL
inc si
inc di
dec cx
jnz compareloopsDH
pushf
decide5 DXP1,DXP2
mov sourcetype,2
popf
je Turn



srcDL:
lea si,source
lea di,dlreg
mov cx,2    ;16
compareloopsDL:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src0
inc si
inc di
dec cx
jnz compareloopsDL
pushf
decide4 DXP1,DXP2
mov sourcetype,2
popf
je Turn

src0:
lea si,source
lea di,me0
mov cx,3
compareloops0:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src1
inc si
inc di
dec cx
jnz compareloops0
pushf
decide4 memoryp1,memoryp2
mov sourcetype,3
popf
je Turn


src1:
lea di,source
lea si,me1
mov cx,3
compareloops1:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src2
inc si
inc di
dec cx
jnz compareloops1
pushf
decide4 memoryp1[1],memoryp2[1]
mov sourcetype,3
popf
je Turn

src2:
lea si,source
lea di,me2
mov cx,3    ;16
compareloops2:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src3
inc si
inc di
dec cx
pushf
decide4 memoryp1[2],memoryp2[2]
mov sourcetype,3
popf
je Turn
;////////////////////////////////////

src3:
lea si,source
lea di,me3
mov cx,3    ;16
compareloops3:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src4
inc si
inc di
dec cx
jnz compareloops3
pushf
decide4 memoryp1[3],memoryp2[3]
mov sourcetype,3
popf
je Turn


src4:
lea si,source
lea di,me4
mov cx,3    ;16
compareloops4:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src5
inc si
inc di
dec cx
jnz compareloops4
pushf
decide4 memoryp1[4],memoryp2[4]
mov sourcetype,3
popf
je Turn



src5:
lea si,source
lea di,me5
mov cx,3    ;16
compareloops5:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src6
inc si
inc di
dec cx
jnz compareloops5
pushf
decide4 memoryp1[5],memoryp2[5]
mov sourcetype,3
popf
je Turn


src6:
lea si,source
lea di,me6
mov cx,3    ;16
compareloops6:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src7
inc si
inc di
dec cx
jnz compareloops6
pushf
decide4 memoryp1[6],memoryp2[6]
mov sourcetype,3
popf
je Turn


src7:
lea si,source
lea di,me7
mov cx,3    ;16
compareloops7:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src8
inc si
inc di
dec cx
jnz compareloops7
pushf
decide4 memoryp1[7],memoryp2[7]
mov sourcetype,3
popf
je Turn


src8:
lea si,source
lea di,me8
mov cx,3    ;16
compareloops8:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz src9
inc si
inc di
dec cx
jnz compareloops8
pushf
decide4 memoryp1[8],memoryp2[8]
mov sourcetype,3
popf
je Turn


src9:
lea si,source
lea di,me9
mov cx,3    ;16
compareloops9:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srca
inc si
inc di
dec cx
jnz compareloops9
pushf
decide4 memoryp1[9],memoryp2[9]
mov sourcetype,3
popf
je Turn


srca:
lea si,source
lea di,mea
mov cx,3    ;16
compareloopsa:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcb
inc si
inc di
dec cx
jnz compareloopsa
pushf
decide4 memoryp1[10],memoryp2[10]
mov sourcetype,3
popf
je Turn


srcb:
lea si,source
lea di,meb
mov cx,3    ;16
compareloopsb:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcc
inc si
inc di
dec cx
jnz compareloopsb
pushf
decide4 memoryp1[11],memoryp2[11]
mov sourcetype,3
popf
je Turn

;////////////////////////////////
srcc:
lea si,source
lea di,mec
mov cx,3    ;16
compareloopsc:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcd
inc si
inc di
dec cx
jnz compareloopsc
pushf
decide4 memoryp1[12],memoryp2[12]
mov sourcetype,3
popf
je Turn



srcd:
lea si,source
lea di,med
mov cx,3    ;16
compareloopsd:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srce
inc si
inc di
dec cx
jnz compareloopsd
pushf
decide4 memoryp1[13],memoryp2[13]
mov sourcetype,3
popf
je Turn


srce:
lea si,source
lea di,mee
mov cx,3    ;16
compareloopse:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcf
inc si
inc di
dec cx
jnz compareloopse
pushf
decide4 memoryp1[14],memoryp2[14]
mov sourcetype,3
popf
je Turn


srcf:
lea si,source
lea di,mef
mov cx,3    ;16
compareloopsf:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcABX
inc si
inc di
dec cx
jnz compareloopsf
pushf
decide4 memoryp1[15],memoryp2[15]
mov sourcetype,3
popf
je Turn


srcABX:
lea si,source
lea di,meABX
mov cx,4    ;16
compareloopsABX:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcADI
inc si
inc di
dec cx
jnz compareloopsABX
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz aa
mov ax,BXP1
mov sourceaddress,offset memoryp1
pushf
add sourceaddress,ax
popf
jz endtt
aa:
mov ax,BXP2
mov sourceaddress,offset memoryp2
pushf
add sourceaddress,ax
endtt:
popf
je Turn




srcADI:
lea si,source
lea di,meADI
mov cx,4    ;16
compareloopsADI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcASI
inc si
inc di
dec cx
jnz compareloopsADI
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz aaf
mov ax,DIP1
mov sourceaddress,offset memoryp1
pushf
add sourceaddress,ax
popf
jz endtt1
aaf:
mov ax,DIP2
mov sourceaddress,offset memoryp1
pushf
add sourceaddress,ax
endtt1:
popf
je Turn




srcASI:
lea si,source
lea di,meASI
mov cx,4    ;16
compareloopsASI:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz srcval
inc si
inc di
dec cx
jnz compareloopsASI
pushf
mov destinationtype,3
mov al,Turns
cmp al,1
jnz aaff
mov ax,SIP1
mov sourceaddress,offset memoryp1
pushf
add sourceaddress,ax
popf
jz endtt11
aaff:
mov ax,SIP2
mov sourceaddress,offset memoryp2
pushf
add sourceaddress,ax
endtt11:
popf
je Turn
;///////////////////////////////////////////


srcval:
lea si,source
mov cx,4
LOOPING:
mov dh,[si]
cmp dh,20h
jz Turn    ;16
pushf
mov sourcetype,4
lea si,source
find source,value
asscitohex source,sourceaddress,value
popf
je Turn
;=================================================================            

           
Turn:            
nextmov:
lea si,movop
lea di,operation
mov cx,3
compareloop:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextadd
inc si
inc di
dec cx
jnz compareloop
call moving
jmp end1 

nextadd:
lea si,addop
lea di,operation                       ;2
mov cx,3
compareloop11:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextadc
inc si
inc di
dec cx
jnz compareloop11
call adding
jmp end1
;///////////////////////////////


nextadc:
lea si,adcop
lea di,operation     ;3
mov cx,3
compareloop22:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextand
inc si
inc di
dec cx
jnz compareloop22
call adcing
jmp end1
  
  
nextand:
lea si,andop
lea di,operation     ;4
mov cx,3
compareloop33:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextclc
inc si
inc di
dec cx
jnz compareloop33
call anding
jmp end1

nextclc:
lea si,clcop
lea di,operation     ;5
mov cx,3
compareloop44:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextdec
inc si
inc di
dec cx
jnz compareloop44
call clcing 
jmp end1



nextdec:
lea si,decop
lea di,operation     ;6
mov cx,3
compareloop55:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextinc
inc si
inc di
dec cx
jnz compareloop55
call decrimenting 
jmp end1
     
     
nextinc:
lea si,incop
lea di,operation     ;7
mov cx,3
compareloop66:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextxor
inc si
inc di
dec cx
jnz compareloop66
call incrimenting 
jmp end1
;//////////////////////////////////////


nextxor:
lea si,xorop
lea di,operation     ;8
mov cx,3
compareloop77:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextnop
inc si
inc di
dec cx
jnz compareloop77
call xoring 
jz end1


nextnop:
lea di,nopop
lea si,operation    ;9
mov cx,3
compareloop15:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextor
inc si
inc di
dec cx
jnz compareloop15
call nooperation 
jz end1

nextor:
lea di,orop
lea si,operation    ;10
mov cx,3
compareloop88:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextrol
inc si
inc di
dec cx
jnz compareloop88
call oring 
jz end1

nextrol:
lea di,rolop
lea si,operation    ;11
mov cx,3
;/////////////////////////////////////


compareloop99:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextror
inc si
inc di
dec cx
jnz compareloop99
;call rotatingl 
jz end1
        
        
nextror:
lea di,rorop
lea si,operation    ;12
mov cx,3
compareloop10:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextsbb
inc si
inc di
dec cx
jnz compareloop10
call rotatingr 
jz end1

nextsbb:
lea di,sbbop
lea si,operation    ;13
mov cx,3
compareloop111:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextshl
inc si
inc di
dec cx
jnz compareloop111
call subwborrow 
jmp end1

nextshl:
lea di,shlop
lea si,operation    ;14
mov cx,3
compareloop12:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextshr
inc si
inc di
dec cx
jnz compareloop12
call shiftingl 
jz end1

nextshr:
lea di,shrop
lea si,operation     ;15
mov cx,3
compareloop13:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz nextsub
inc si
inc di
dec cx
jnz compareloop13
call shiftingr 
jz end1                   

nextsub:
lea di,subop
lea si,operation    ;16
mov cx,3
compareloop14:
mov ah,[si]
mov al,[di]
cmp ah,al
jnz skip
inc si
inc di
dec cx
jnz compareloop14
call subtracting 
jmp end1
;////////////////////////////////////////

errorloop:
mov al,indicator
cmp al,1 
jnz errors2
DISPLAYSTRING error1
cmp Turns,1
jnz losepointsa
pushf
sub initialpoints2,1
popf
jz finish
losepointsa:
sub initialpoints1,1
finish1:
ret
;=====================================================
errors2:
cmp al,2
jnz errors3
DISPLAYSTRING error2
cmp Turns,1
jnz losepointsb
pushf
sub initialpoints2,1
popf
jz finish2
losepointsb:
pushf
sub initialpoints1,1
popf
finish2:
ret
;=======================================================
errors3:
cmp al,3
jnz errors4
DISPLAYSTRING error3
cmp Turns,1
jnz losepointsd
pushf
sub initialpoints2,1
popf
jz finish3
losepointsd:
pushf
sub initialpoints1,1
popf
finish3:
ret
;=======================================================
errors4:
cmp al,4
DISPLAYSTRING error4
ret
cmp Turns,1
jnz losepointsc
pushf
sub initialpoints2,1
popf
jz finish4
losepointsc:
pushf
sub initialpoints1,1
popf
finish4:
displayed:
jmp skip
;================================================================









end1:
cmp Turns,1
jnz losepoints1
pushf
sub initialpoints2,3
popf
jz finish
losepoints1:
pushf
sub initialpoints1,3
popf
finish:
ret
skip:
ret




;adding:
;adcing:
;anding:
;clcing:
;decrimenting:
;incrimenting:
;xoring:
;nooperation:
;oring:
;subtracting:



com endp


    
;=============================================================================================================================
main proc far
mov ax,@data
mov ds,ax
mov es,ax
mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov si,offset p1name+2   
mov ah,9
mov dx, offset msg1   ; asking first player for his name
int 21h
takestringp1 si,con,msg4     ; taking first player`s name
nextdis:mov ah,9
mov dx, offset msg2     ; asking first player for his initial points
int 21h
takenumberdec 
mov initialpoints1,al         ; taking first player`s initial points
mov ah,9
mov dx, offset msg3        ; press enter key to continue
int 21h
mov ah,0
int 16h
go:cmp al,0Dh
je gotonextplayer             ; check if user pressed enter key , move to next screen
mov ah,0             
int 16h
jmp go                    ; if not , wait until user presses enter key
;//////////////////////////
gotonextplayer : mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov di,offset p2name+2   
mov ah,9
mov dx, offset msg1   ; asking second player for his name
int 21h
takestringp2 di,con,msg4     ; taking second player`s name
nextdis2:mov ah,9
mov dx, offset msg2     ; asking second player for his initial points
int 21h
takenumberdec  
mov initialpoints2, al           ; taking second player`s initial points
mov ah,9
mov dx, offset msg3        ; press enter key to continue
int 21h
mov ah,0
int 16h
go2:cmp al,0Dh
je gotonextscreen           ; check if user pressed enter key , move to next screen
mov ah,0             
int 16h
jmp go2             
;//////////////////////////
gotonextscreen: mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
 mov dx,offset msg5
    mov ah,9h
    int 21h 
    mov dx,offset msg6
    mov ah,9h
    int 21h
    mov dx,offset msg7
    mov ah,9h
    int 21h
     mov ah,0
     int 16h
     ;cmp ah,59
    ;go to chatting window
    cmp ah,60d
    ; start the game
    je gotochooselevel
   c1: cmp ah,01d
      je close
      mov ah,0 
      int 16h  
      jmp c1
 close: MOV AX, 4C00H
        INT 21H
;//////////////////////////
gotochooselevel:mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov ah,9 
mov dx,offset msg10 
int 21h
mov ah,9 
mov dx,offset msg11    ;asking user to choose level of the game
int 21h
mov ah,9 
mov dx,offset msg12 
int 21h
mov ah,0
int 16h
c: cmp al,31h       ;check if user pressed 1 for level 1
jne mo2
mo1:mov levelnumber,1
jmp chooseforbidden1
mo2: cmp al,32h          ;check if user pressed 2 for level 2
je mo3
mo3:mov levelnumber,2
jmp gototakev1
mov ah,0  
int 16h 
jmp c
;//////////////////////////
gototakev1: mov ax,0600h ;clear screen   ;take register values for first player in level 2
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov ah,9 
mov dx,offset msg16 ;asking first player to write register values
int 21h
mov dx,10
    mov ah,2
    int 21h
    
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf1 ;asking first player to write register values
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of AX from user
mov AXP1,bx
mov dx,10
    mov ah,2
    int 21h
    
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf2 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BX from user
mov BXP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf3 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BX from user
mov CXP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf4 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of DX from user
mov DXP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf5 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of SI from user
mov SIP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf6 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of DI from user
mov DIP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf7
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of SP from user
mov SPP1,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf8
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BP from user
mov BPP1,bx
mov ah,0 
int 16h
jmp gototakev2
;//////////////////////////
gototakev2: mov ax,0600h ;clear screen   ;take register values for first player in level 2
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov ah,9 
mov dx,offset msg16 ;asking second player to write register values
int 21h
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf1 ;asking first player to write register values
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of AX from user
mov AXP2,bx
mov dx,10
    mov ah,2
    int 21h
    
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf2 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BX from user
mov BXP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf3 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BX from user
mov CXP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf4 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of DX from user
mov DXP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf5 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of SI from user
mov SIP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf6 
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of DI from user
mov DIP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf7
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of SP from user
mov SPP2,bx
mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
mov ah,9 
mov dx,offset regf8
int 21h
mov ah,2 
mov dl,':'           
int 21h
takenumber4digits       ;taking value of BP from user
mov BPP2,bx
mov ah,0 
int 16h
jmp chooseforbidden1
chooseforbidden1:mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov ah,9 
mov dx,offset msg13 ;asking first player to choose forbidden character
int 21h
mov ah,1
int 21h
m:cmp al,30h 
jc n
cmp al,39h 
jc gotokey1
je gotokey1          ; character should be from 0-9 or from A to Z (not case sensitive)
cmp al,41h
jc n 
cmp al,5Ah 
jc gotokeych1
je gotokeych1
cmp al,61h
jc n 
cmp al,7Ah 
jc gotokeych1
je gotokeych1
n:mov ah,9 
  mov dx,offset msg14
  int 21h
  mov ah,1
  int 21h
  jmp m
;//////////////////////////
gotokey1:sub al,30h
         mov forbiddench1,al 
         mov ah,0   
         int 16h   
         jmp chooseforbidden2
 gotokeych1:mov forbiddench1,al
             mov ah,0   
             int 16h   
;//////////////////////////
chooseforbidden2:mov ax,0600h ;clear screen
mov bh,0fh
mov cx,0 
mov dl,79
mov dh,24
int 10h 
mov ah,02 ;set cursor position
mov bh,00h
mov dl,00h
mov dh,00h
int 10h 
mov ah,9 
mov dx,offset msg15 ;asking second player to choose forbidden character
int 21h
mov ah,1
int 21h
m1:cmp al,30h 
jc n1
cmp al,39h 
jc gotokey2
je gotokey2          ; character should be from 0-9 or from A to Z (not case sensitive)
cmp al,41h
jc n1 
cmp al,5Ah 
jc gotokeych2
je gotokeych2
cmp al,61h
jc n1 
cmp al,7Ah 
jc gotokeych2
je gotokeych2
n1:mov ah,9 
  mov dx,offset msg14
  int 21h
  mov ah,1
  int 21h
  jmp m
;//////////////////////////
gotokey2: sub al,30h
         mov forbiddench2,al
         mov ah,0 
         int 16h 
         jmp p1
gotokeych2:mov forbiddench2,al
    p1:  cmp ah,62d
         je gotovideo
         mov ah,0 
         int 16h 
         jmp p1
;////////////////////////////
mainloop:
gotovideo: mov ax, 13h ; change to video mode
int 10h 
mov cx,0
mov dx,0
mov al,3
mov ah,0ch 
back: int 10h 
inc cx       ; coloring background screen pixel by pixel
cmp cx,320
je startagain
jne back 
startagain: mov cx,0
inc dx
cmp dx,201
je next
mov al,3
mov ah,0ch
jmp back 

;//////////////////////////////////////////////////////////////////////////
next: drawnotificationbar 8d ; macro to draw notification bar
drawrectangles  28d,68d,46d,58d,14d ;draw AX register for first player
drawrectangles  28d,68d,62d,74d,14d ;draw BX register for first player
drawrectangles  28d,68d,78d,91d,14d ;draw CX register for first player
drawrectangles  28d,68d,94d,106d,14d ;draw DX register for first player
drawrectangles  76d,116d,46d,58d,14d ;draw SI register for first player
drawrectangles  76d,116d,62d,74d,14d ;draw DI register for first player
drawrectangles  76d,116d,78d,90d,14d ;draw SP register for first player
drawrectangles  76d,116d,94d,106d,14d ;draw BP register for first player
;////////////////////////////////////////////////////////////////////////////////////////////
drawrectangles  188d,228d,46d,58d,14d ;draw AX register for second player
drawrectangles  188d,228d,62d,74d,14d ;draw BX register for second player
drawrectangles  188d,228d,78d,90d,14d ;draw CX register for second player
drawrectangles  188d,228d,94d,106d,14d ;draw DX register for second player
drawrectangles  236d,276d,46d,58d,14d ;draw SI register for second player
drawrectangles  236d,276d,62d,74d,14d ;draw DI register for second player
drawrectangles  236d,276d,78d,90d,14d ;draw SP register for second player
drawrectangles  236d,276d,94d,106d,14d ;draw BP register for second player

;//////////////////////////////////////////////////////////////////////////////////////////////
textdisf regf1,regf2,regf3,regf4   ;print AX,BX,CX,DX register names for first player
textdisf2 regf5 ,regf6,regf7,regf8 ;print SI,DI,SP,BP register names for first player
textdiss1 regs1,regs2,regs3,regs4  ;print AX,BX,CX,DX register names for second player
textdiss2 regs5,regs6,regs7,regs8  ;print SI,DI,SP,BP register names for second player

;///////////////////////////////////////////////////////////////////////////////////////////////
drawfirstsquare
drawsecondsquare
drawthirdsquare
drawfourthsquare
drawfifthsquare
drawrectangles  199d,279d,10d,30d,4d ; draw username box for second player
drawrectangles  30d,110d,10d,30d,4d ;draw username box for first player
displayplayername p1name,06d,02d
cmp levelnumber,1
je g
cmp levelnumber,2
je dis1
g:mov ah,2
mov dl,12d          
mov dh,02d
int 10h
mov al,forbiddench1         ;display forbidden character for first player
cmp al,39h 
jc print1 
je print1
  mov ah,2 
  mov dl,forbiddench1
  int 21h  
  jmp dis1   
 print1: add al,30h
  mov ah,2 
  mov dl,al
  int 21h 
dis1: displayplayername p2name,28d,02d
cmp levelnumber,2
je dis2
mov ah,2
mov dl,33d
mov dh,02d
int 10h
mov al,forbiddench2   ;display forbidden character for second player
cmp al,39h 
jc print2 
je print2
  mov ah,2 
  mov dl,forbiddench2
  int 21h  
  jmp dis2  
 print2: add al,30h
  mov ah,2 
  mov dl,al
  int 21h 
dis2: drawrectangles  176d,288d,133d,148d,15d ; draw right command bar
drawrectangles  18d,130d,133d,148d,15d ; draw left command bar
drawrectangles  162d,301d,159d,179d,14d  ;draw right lower bar
pushA
mov al,initialpoints1
mov bl,initialpoints2
cmp al,bl
jc ini 
mov al,bl
mov initialpoints1,al
jmp d
ini: mov al,initialpoints1
     mov bl,al
     mov initialpoints2,bl
popA
displayplayername2 p1name,21d,21d
mov ah,2 
mov dl,':'
int 21h
Displayinitialpoint initialpoints1
displayplayername2 p2name,30d,21d
mov ah,2 
mov dl,':'
int 21h
Displayinitialpoint initialpoints2
d:drawmemoryf 143d,160d,00d,180d,8d ; draw memory for first player
drawmemorys 302d,320d,00d,180d,8d ; draw memory for second player
drawbordershorizontal 00d,143d,180d,15d ;draw borders 
drawbordersvertical 142d,179d,00d,15d  
drawbordersvertical 160d,179d,00d,15d  
drawbordershorizontal 160d,303d,180d,15d ;draw borders 
drawbordersvertical 302d,179d,00d,15d  
displaynumberinregisters AXP1,4d,6d ;display value of register AX for first player
displaynumberinregisters BXP1,4d,8d ;display value of register BX for first player
displaynumberinregisters CXP1,4d,10d ;display value of register CX for first player
displaynumberinregisters DXP1,4d,12d ;display value of register DX for first player
displaynumberinregisters SIP1,10d,6d ;display value of register SI for first player
displaynumberinregisters DIP1,10d,8d ;display value of register DI for first player
displaynumberinregisters SPP1,10d,10d ;display value of register SP for first player
displaynumberinregisters BPP1,10d,12d ;display value of register BP for first player
;////////////////////////////////////////////////////////////////////////////////////////
displaynumberinregisters AXP2,24d,6d ;display value of register AX for second player
displaynumberinregisters BXP2,24d,8d ;display value of register BX for second player
displaynumberinregisters CXP2,24d,10d ;display value of register CX for second player
displaynumberinregisters DXP2,24d,12d ;display value of register DX for second player
displaynumberinregisters SIP2,30d,6d ;display value of register SI for second player
displaynumberinregisters DIP2,30d,8d ;display value of register DI for second player
displaynumberinregisters SPP2,30d,10d ;display value of register SP for second player
displaynumberinregisters BPP2,30d,12d ;display value of register BP for second player
;/////////////////////////////////////////////////////////////////////////////////////////
displaynumberinmemory memoryp1,18d,0d ;memory values for first player
displaynumberinmemory memoryp1+1,18d,1d 
displaynumberinmemory memoryp1+2,18d,2d 
displaynumberinmemory memoryp1+3,18d,3d 
displaynumberinmemory memoryp1+4,18d,4d 
displaynumberinmemory memoryp1+5,18d,5d 
displaynumberinmemory memoryp1+6,18d,6d 
displaynumberinmemory memoryp1+7,18d,7d 
displaynumberinmemory memoryp1+8,18d,8d 
displaynumberinmemory memoryp1+9,18d,9d 
displaynumberinmemory memoryp1+10,18d,10d 
displaynumberinmemory memoryp1+11,18d,11d 
displaynumberinmemory memoryp1+12,18d,12d 
displaynumberinmemory memoryp1+13,18d,13d 
displaynumberinmemory memoryp1+14,18d,14d 
displaynumberinmemory memoryp1+15,18d,15d 
;//////////////////////////////////////////////////////////////////////////////////////////
displaynumberinmemory memoryp2,38d,0d ;memory values for first player
displaynumberinmemory memoryp2+1,38d,1d 
displaynumberinmemory memoryp2+2,38d,2d 
displaynumberinmemory memoryp2+3,38d,3d 
displaynumberinmemory memoryp2+4,38d,4d 
displaynumberinmemory memoryp2+5,38d,5d 
displaynumberinmemory memoryp2+6,38d,6d 
displaynumberinmemory memoryp2+7,38d,7d 
displaynumberinmemory memoryp2+8,38d,8d 
displaynumberinmemory memoryp2+9,38d,9d 
displaynumberinmemory memoryp2+10,38d,10d 
displaynumberinmemory memoryp2+11,38d,11d 
displaynumberinmemory memoryp2+12,38d,12d 
displaynumberinmemory memoryp2+13,38d,13d 
displaynumberinmemory memoryp2+14,38d,14d 
displaynumberinmemory memoryp2+15,38d,15d  
;/////////////////////////////////////////////////////////////////////////////////////////////
co: 
; takes command from first player
mov Turns,byte ptr 2h 
pusha       
call com
cmp initialpoints1,1
jb co1
popa
;power up 4 condition as if the check is equal 2 the commadn proc will excute again reversing the registers
mov ah,p1excutesamecheck
cmp ah,2
jne ignorep1
mov Turns,byte ptr 1h 
pusha       
call com
cmp initialpoints1,1
jb co1
popa
ignorep1:
mov p1excutesamecheck,1
; takes command from second player
displaynumberinregisters AXP1,4d,6d ;display value of register AX for first player
displaynumberinregisters BXP1,4d,8d ;display value of register BX for first player
displaynumberinregisters CXP1,4d,10d ;display value of register CX for first player
displaynumberinregisters DXP1,4d,12d ;display value of register DX for first player
displaynumberinregisters SIP1,10d,6d ;display value of register SI for first player
displaynumberinregisters DIP1,10d,8d ;display value of register DI for first player
displaynumberinregisters SPP1,10d,10d ;display value of register SP for first player
displaynumberinregisters BPP1,10d,12d ;display value of register BP for first player
;////////////////////////////////////////////////////////////////////////////////////////






mov Turns,byte ptr 1h
pusha
call com
popa
;power up 4 condition as if the check is equal 2 the commadn proc will excute again reversing the registers
mov ah,p2excutesamecheck
cmp ah,2
jne ignorep2
mov Turns,byte ptr 2h 
pusha       
call com
popa
ignorep2:
mov p2excutesamecheck,1

displaynumberinregisters AXP2,24d,6d ;display value of register AX for second player
displaynumberinregisters BXP2,24d,8d ;display value of register BX for second player
displaynumberinregisters CXP2,24d,10d ;display value of register CX for second player
displaynumberinregisters DXP2,24d,12d ;display value of register DX for second player
displaynumberinregisters SIP2,30d,6d ;display value of register SI for second player
displaynumberinregisters DIP2,30d,8d ;display value of register DI for second player
displaynumberinregisters SPP2,30d,10d ;display value of register SP for second player
displaynumberinregisters BPP2,30d,12d ;display value of register BP for second player
mov ah,2ch
int 21h
mov al,dl
mov ah,0
mov bl,2
div bl  
mov al,0
mov al,ah
cmp ah,0
je gunloop

jmp mainloop


;///////////////////////////////////////
gunloop:
mov ah,2ch
int 21h
mov al,dl
mov ah,0
mov bl,4
div bl  
mov al,0
mov al,ah
mov ah,0
mov colorchange,ax

mov si,offset color  
add si,ax
looop:     
;//////////////////////// ball p1

mov dx,rowball  ;row  

;mov row,dx

mov al,[si]    ;color
mov ah,0ch  ;draw pixel 

mov cx,begball
 drawball:
;dec cx

int 10h 
inc cx
cmp cx,endball 
jnz drawball

;dec beg
mov cx,begball
;inc end
inc dx
cmp countball,5 
jz enddraw
inc countball
jmp drawball
enddraw:
mov countball,0h      
;//////////////////////delet ball 
;mov ah,0h
;int 16h  
push dx  
mov dx ,1fffh;time on screen
balltime:

dec dx
cmp dx,0
jnz balltime
pop dx

push cx 
mov cx ,1fffh;time on screen
balltime2:
dec cx
cmp cx,0
jnz balltime2
pop cx



mov dx,rowball  ;row 
mov al,3    ;color background
mov ah,0ch  ;draw pixel 

mov cx,begball
 deletball:
;dec cx

int 10h 
inc cx
cmp cx,endball 
jnz deletball

;dec beg
mov cx,begball
;inc end
inc dx
cmp countball,5 
jz deletend
inc countball
jmp deletball
deletend:
mov countball,0h 
push cx
push dx
push ax
push bx
;////////////////////////////////////////////////////p2 ball
mov dx,rowballp2  ;row  

;mov row,dx
mov al,[si]   ;color
mov ah,0ch  ;draw pixel 

mov cx,begballp2
 drawballp2:
;dec cx

int 10h 
inc cx
cmp cx,endballp2 
jnz drawballp2

;dec beg
mov cx,begballp2
;inc end
inc dx
cmp countballp2,5 
jz enddrawp2
inc countballp2
jmp drawballp2
enddrawp2:
mov countballp2,0h      
;//////////////////////delet ball 
;mov ah,0h
;int 16h  
push dx  
mov dx ,1fffh;time on screen
balltimep2:

dec dx
cmp dx,0
jnz balltimep2
pop dx

push cx 
mov cx ,1fffh;time on screen
balltime2p2:
dec cx
cmp cx,0
jnz balltime2p2
pop cx


mov dx,rowballp2  ;row 
mov al,3    ;color background
mov ah,0ch  ;draw pixel 

mov cx,begballp2
 deletballp2:
;dec cx

int 10h 
inc cx
cmp cx,endballp2 
jnz deletballp2

;dec beg
mov cx,begballp2
;inc end
inc dx
cmp countballp2,5 
jz deletendp2
inc countballp2
jmp deletballp2
deletendp2:
mov countballp2,0h 
pop bx
pop ax
pop dx
pop cx



;/////////////////////////////

;int 21h
;draw the plane      p1
mov cx,beg ;column


mov dx,row  ;row  

;mov row,dx
mov al,5    ;color
mov ah,0ch  ;draw pixel
mov cx,beg

;dec cx
back9:
int 10h 
inc cx
cmp cx,ending
jnz back9

;dec beg
mov cx,beg
;inc end
inc dx
cmp count,5 
jz endd
inc count
jmp back9
endd:
;draw the plane      p2    
mov cx,beg2 ;column
mov dx,row2  ;row  
looop2:

;mov row2,dx
mov al,5    ;color
mov ah,0ch  ;draw pixel
mov cx,beg2

;dec cx
back92:
int 10h 
inc cx
cmp cx,end2 
jnz back92

;dec beg
mov cx,beg2
;inc end
inc dx
cmp count2,5 
jz enddp2
inc count2
jmp back92
enddp2:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;bullet animation p1  
push cx
push dx
push ax
push bx
;;;;;;;;;;;;;;;;;;;;;;  
mov ax,00
mov cx,beg 
mov dx,row
sub dx,0eh
mov  ah, 01h 
int  16h 

;;;;;;;check spacebar
cmp ax, 3920h
jne skipbar 
;;;;;;;;; 
drawbullet:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov bx,0
mov count,bx

mov ah,0ch
back3:
int 10h
mov al,3;background color   
  

;/////// calculate score p1
cmp dx,rowball
jne skipp1score
cmp cx,begball
jc skipp1score
cmp endball,cx
jc skipp1score


;black target
cmp colorchange,0 ;black target is for 4 points
jne red 
add initialpoints1,4
jmp endgame
;red target
red:
cmp colorchange,4
jne green ;red target is for 6 points
add initialpoints1,6
jmp endgame
;green target
green:
cmp colorchange,2 ;green target is for 8 points
jne blue 
add initialpoints1,8
jmp endgame
;blue target 
blue: 
cmp colorchange,1 ;blue target is for 10 points
jne nocolor
add initialpoints1,10
jmp endgame

nocolor:







;inc initialpoints1
jmp endgame
skipp1score:


;//////////////////////////////////////////

push dx
mov dx,1fffh ;bullet time on screen
zero:
dec dx
jnz zero
pop dx 
int 10h
mov al,5
dec dx
cmp dx,50 ;bullet height
jne back3
 pop bx
pop ax
pop dx
pop cx

endd3: 
;jmp skipall
  mov  ah, 00h 
int  16h 


skipbar:

;;;;;;;;;;;;;;;;;;;;bullet animation p2
push cx
push dx
push ax
push bx
;;;;;;;;;;;;;;;;;;;;;;  
mov ax,00
mov cx,beg2 
mov dx,row2
sub dx,0eh
mov  ah, 01h 
int  16h 

;;;;;;;check enter
cmp ax, 1c0dh   
jne skipbar2 
;;;;;;;;; 
drawbullet2:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov bx,0
mov count2,bx

mov ah,0ch
back32:
int 10h
mov al,3;background color 
 
 
;/////// calculate score p2
push dx
push cx
cmp dx,rowballp2
jne skipp2scorep2
cmp cx,begballp2
jc skipp2scorep2
cmp endballp2,cx
jc skipp2scorep2


;black target
cmp colorchange,0 ;black target is for 4 points
jne red2 
add initialpoints2,4
jmp endgame
;red target
red2:
cmp colorchange,4
jne green2 ;red target is for 6 points
add initialpoints2,6
jmp endgame
;green target
green2:
cmp colorchange,2 ;green target is for 8 points
jne blue2 
add initialpoints2,8
jmp endgame
;blue target 
blue2: 
cmp colorchange,1 ;blue target is for 10 points
jne nocolor2
add initialpoints2,10
jmp endgame

nocolor2:



jmp endgame
skipp2scorep2:
pop cx
pop dx





push dx
mov dx,1fffh ;bullet time on screen
zero2:
dec dx
jnz zero2
pop dx 
int 10h
mov al,5
dec dx
cmp dx,50;bullet height 
jne back32
 pop bx
pop ax
pop dx
pop cx

endd32: 
;jmp skipall
 mov  ah, 00h 
int  16h 

skipbar2:



 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;mov bx,start
;mov beg,bx
;mov end,bx 
mov bx,0
mov count2,bx
;;;;;;;;;;;;;;;;;;;;;;;  


;;;;;;;;;;;;;;;;;;;;;;;;;


mov  ah, 01h ;;add to variable the keypress
int  16h 
;;;;;;;;;;;;;;;;;;;;;;;;;;;; compare key press
cmp ah,48h 
je comparekeypressupp1 
 cmp ah,50h 
 je comparekeypressdownp1 
 cmp ah,4bh     
 je comparekeypressleftp1
 cmp ah,4dh 
jne comparekeypressrightp1
                                    
 
;;;;;;;;;;;;;;;;;;;;;;;delet the body p1  
 comparekeypressupp1: 
 comparekeypressdownp1:
 comparekeypressleftp1:
 push ax 
 mov  ah, 00h 
int  16h
pop ax                                              
           
 mov dp1,ah
 
inc movp1flag


push cx
push dx
push ax 
mov cx,beg 
mov al,3  ;;;;;;;;;background color         
 mov ah,0ch
 sub row,2
mov dx,row
mov bx,beg
mov oldbeg,bx 
dec oldbeg


back2:
int 10h 
inc cx
cmp cx,ending 
jnz back2

;dec beg
mov cx,oldbeg
;inc end
inc dx
cmp count,0ch ;bodyheight
jz endd2
inc count
jmp back2
endd2:  
pop ax
pop dx
pop cx
       
 comparekeypressrightp1:              
       
mov al,5
mov count ,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;compare key press p2  
mov  ah, 01h;;;;;;;;;add to variabkle 
int  16h     

cmp ax,1177h 
je comparekeypressupp2 
 cmp ax,1f73h 
 je comparekeypressdownp2 
 cmp ax,1e61h     
 je comparekeypressleftp2
 cmp ax,2064h 
jne comparekeypressrightp2                                              
                                              
 
 
 comparekeypressupp2: 
 comparekeypressdownp2:
 comparekeypressleftp2:       
 push ax
 mov  ah, 00h;;;;;;;;;add to variabkle 
int  16h
pop ax     

 mov dp2,ax
 
 inc movp2flag 







;;;;;;;;;;;;;;;;;;;;;;;delet the body p2   

push cx
push dx
push ax 
mov cx,beg2 
mov al,3  ;;;;;;;;;background color 



 mov ah,0ch
 sub row2,2
mov dx,row2
mov bx,beg2
mov oldbeg2,bx 
dec oldbeg2


back22:
int 10h 
inc cx
cmp cx,end2 
jnz back22

;dec beg
mov cx,oldbeg2
;inc end
inc dx
cmp count2,08h ;bodyheight
jz endd22 
inc count2
jmp back22
endd22:  
pop ax
pop dx
pop cx
       
comparekeypressrightp2:             
       
mov al,5
mov count2 ,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;movment player1 

mov cx,movp2flag
cmp cx,1
je skipp1 
push cx
push dx
push ax
push bx
mov  al, 00h 
mov cx,00
mov ah,dp1 
cmp ah,48h


;;uparrow

cmp ah,48h 
jne kup
sub row,5

kup:
;;down arrow

 cmp ah,50h 
jne kdown
;add dx,00fh 
add row,00fh
kdown: 
  
  

;;left arrow
 
cmp ah,4bh 
jne kleft

sub beg,10
sub ending,10
;mov dx,row
;add dx,2
add row,2
kleft:      
  
   
;; right arrow

cmp ah,4dh 
jne kright
add beg,10
add ending,10
add row,2
;mov dx,row
;add dx,2
kright:
       

skipp1:
dec movp2flag
pop bx
pop ax
pop dx
pop cx 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;movment player2  
mov cx,movp1flag
cmp cx,1
je  skipp2
push cx
push dx
push ax
push bx
mov  al, 00h 
mov cx,00
mov ax,dp2

;;uparrow

cmp ax,1177h 
jne kup2
sub row2,5

kup2:
;;down arrow

 cmp ax,1f73h  
jne kdown2
;add dx,00fh 
add row2,00fh
kdown2: 
     
  

;;left arrow
 
 cmp ax,1e61h      
jne kleft2

sub beg2,10
sub end2,10
;mov dx,row2
;add dx,2
add row2,2
kleft2:      
  
   
;; right arrow

cmp ax,2064h 
jne kright2
add beg2,10
add end2,10
;mov dx,row2
;add dx,2
add row2,2
kright2:  

pop bx
pop ax
pop dx
pop cx 
skipp2:
dec movp1flag
mov dp1,00
mov dp2,00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;mov ah,00
;int 10h 
;skipall: 
push cx
push dx
push ax
push bx
 ;;;;drawing all the boxes again





 


pop bx
pop ax
pop dx
pop cx
;add end the game when the ball dispeares
inc begball
inc endball  
inc begballp2
inc endballp2  
push dx
mov dx, endball
cmp dx,130
je endgame






jmp looop
endgame:
;/////////////////////////////////////////////////////////////////////////////////////////

;///////////////////////////////////////plane variable
mov beg  ,45h
mov ending  ,46h
mov start , 60h
mov row , 95h
mov count  ,0 
mov bulletmotion,  0
mov dp1 , 0  
mov movp1flag,  0
;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;     
mov beg2 ,22ah
mov end2  ,22bh
mov start2 , 60h
mov row2  ,95h
mov count2 , 0
        
mov bulletmotion2,  0
mov dp2  ,0
mov movp2flag,  0   
;;;;;;;;;;;;;;;;;

;//////////////////////////////////////
;ball ya rab

;////////////////////////////////
mov begball , 5h
mov endball , 015h
mov rowball  ,72h  
mov countball  ,0h
mov countballloop , 0h
;///////////////////////////
mov begballp2 , 1f0h
mov endballp2 , 200h
mov rowballp2 , 72h  
mov countballp2 , 0h
mov countballloopp2 , 0h

;//////////////////////////////






;rawnotificationbar 8d ; macro to draw notification bar
drawrectangles  28d,68d,46d,58d,14d ;draw AX register for first player
drawrectangles  28d,68d,62d,74d,14d ;draw BX register for first player
drawrectangles  28d,68d,78d,91d,14d ;draw CX register for first player
drawrectangles  28d,68d,94d,106d,14d ;draw DX register for first player
drawrectangles  76d,116d,46d,58d,14d ;draw SI register for first player
drawrectangles  76d,116d,62d,74d,14d ;draw DI register for first player
drawrectangles  76d,116d,78d,90d,14d ;draw SP register for first player
drawrectangles  76d,116d,94d,106d,14d ;draw BP register for first player
;////////////////////////////////////////////////////////////////////////////////////////////
drawrectangles  188d,228d,46d,58d,14d ;draw AX register for second player
drawrectangles  188d,228d,62d,74d,14d ;draw BX register for second player
drawrectangles  188d,228d,78d,90d,14d ;draw CX register for second player
drawrectangles  188d,228d,94d,106d,14d ;draw DX register for second player
drawrectangles  236d,276d,46d,58d,14d ;draw SI register for second player
drawrectangles  236d,276d,62d,74d,14d ;draw DI register for second player
drawrectangles  236d,276d,78d,90d,14d ;draw SP register for second player
drawrectangles  236d,276d,94d,106d,14d ;draw BP register for second player

;//////////////////////////////////////////////////////////////////////////////////////////////
textdisf regf1,regf2,regf3,regf4   ;print AX,BX,CX,DX register names for first player
textdisf2 regf5 ,regf6,regf7,regf8 ;print SI,DI,SP,BP register names for first player
textdiss1 regs1,regs2,regs3,regs4  ;print AX,BX,CX,DX register names for second player
textdiss2 regs5,regs6,regs7,regs8  ;print SI,DI,SP,BP register names for second player

;///////////////////////////////////////////////////////////////////////////////////////////////
drawfirstsquare
drawsecondsquare
drawthirdsquare
drawfourthsquare
drawfifthsquare
drawrectangles  199d,279d,10d,30d,4d ; draw username box for second player
drawrectangles  30d,110d,10d,30d,4d ;draw username box for first player
displayplayername p1name,06d,02d
displayplayername p2name,28d,02d
drawrectangles  176d,288d,133d,148d,15d ; draw right command bar
drawrectangles  18d,130d,133d,148d,15d ; draw left command bar
drawrectangles  162d,301d,159d,179d,14d  ;draw right lower bar
displayplayername p1name,21d,21d
mov ah,2 
mov dl,':'
int 21h
Displayinitialpoint initialpoints1
displayplayername p2name,30d,21d
mov ah,2 
mov dl,':'
int 21h
Displayinitialpoint initialpoints2
jmp mainloop
;//////////////////////////////////////////
cmp AXP1,0105Eh
je co1
cmp BXP1,0105Eh
je co1
cmp CXP1,0105Eh
je co1
cmp DXP1,0105Eh
je co1
cmp DIP1,0105Eh
je co1
cmp SIP1,0105Eh
je co1
cmp BPP1,0105Eh
je co1
cmp SPP1,0105Eh ; for player one
je co1
cmp AXP2,0105Eh
je co2
cmp BXP2,0105Eh
je co2
cmp CXP2,0105Eh
je co2
cmp DXP2,0105Eh
je co2
cmp SIP2,0105Eh
je co2
cmp DIP2,0105Eh
je co2
cmp BPP2,0105Eh
je co2
cmp SPP2,0105Eh ;for second player
je co2
jmp co
co1: mov ah,0 
     mov al,13h
     int 10h
     mov ah, 9
     mov dx, offset msg8
     int 21h
     mov ah,0
     int 16h
     jmp gotonextscreen
 co2:
     mov ah,0 
     mov al,13h
     int 10h
     mov ah, 9
     mov dx, offset msg9
     int 21h
     mov ah,0
     int 16h
     jmp gotonextscreen  
     MOV AX, 4C00H
     INT 21H
main endp

end main