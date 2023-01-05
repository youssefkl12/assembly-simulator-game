.286
drawnotificationbar MACRO color
LOCAL next
LOCAL AGAIN
LOCAL startagain
mov cx,0
mov dx,180
mov al,color
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,320
 je startagain
 jne AGAIN 
 startagain: mov cx,0
             inc dx
             cmp dx,201
             je next
             mov al,color
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawnotificationbar 
;///////////////////////////////
takestringp1 MACRO  si,con,msg4
LOCAL compare
LOCAL myloop
LOCAL go
mov cx,0
mov ah,1
int 21h
myloop: cmp al,41h
jnc go
mov ah,9
mov dx,offset msg4   
int 21h
mov ah,1
int 21h
jmp myloop
go:mov dl,al
mov [si],dl
add si,1
inc cx
compare: cmp cx,con
je nextdis
mov ah,0
int 16h
cmp al,0Dh
je nextdis
mov ah,2
mov dl,al
int 21h
mov [si],dl
add si,1
inc cx
jmp compare
ENDM takestringp1
;///////////////////////////////
takestringp2 MACRO  si,con,msg4
LOCAL compare
LOCAL myloop
LOCAL go
mov cx,0
mov ah,1
int 21h
myloop: cmp al,41h
jnc go
mov ah,9
mov dx,offset msg4   
int 21h
mov ah,1
int 21h
jmp myloop
go:mov dl,al
mov [si],dl
add si,1
inc cx
compare: cmp cx,con
je nextdis2
mov ah,0
int 16h
cmp al,0Dh
je nextdis2
mov ah,2
mov dl,al
int 21h
mov [si],dl
add si,1
inc cx
jmp compare
ENDM takestringp2
;//////////////////////////////
drawrectangles MACRO xcordstart,xcordend,ycordstart,ycordend,color
LOCAL AGAIN
LOCAL startagain
LOCAL next
mov cx,xcordstart
mov dx,ycordstart
mov al,color
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,xcordend
 je startagain
 jne AGAIN
 startagain: mov cx,xcordstart
             inc dx
             cmp dx,ycordend
             je next
             mov al,color
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawrectangles
;///////////////////////////////
takenumber MACRO 
    mov ah,1
    int 21h
    mov cl,16
    sub al,30h
    mov ah,0
    mul cl
    mov bl,al
    mov ah,1
    int 21h
    sub al,30h
    add al,bl
ENDM takenumber
;==================================

;///////////////////////////////
takenumber4digits MACRO 
   mov ah,1
    int 21h
    mov cx,4096
    sub ax,30h
    mov ah,0
    mul cx
    mov bx,ax       
    mov ah,1
    int 21h
    sub ax,30h
    mov cx,256
    mov ah,0
    mul cx
    add bx,ax 
    mov ah,1
    int 21h 
    sub ax,30h
    mov cx,16
    mov ah,0
    mul cx
    add bx,ax
    mov ah,1
    int 21h 
    sub ax,30h
    mov ah,0
    add bx,ax 
ENDM takenumber4digits
;///////////////////////////////
textdisf MACRO regf1,regf2,regf3,regf4
mov ah,2
mov dl,01d
mov dh,06d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf1
int 21h
mov ah,2
mov dh,08d
mov dl,01d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf2
int 21h
mov ah,2
mov dh,10d
mov dl,01d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf3
int 21h
mov ah,2
mov dh,12d
mov dl,01d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf4
int 21h
ENDM textdisf
;/////////////////////////////////////

textdisf2 MACRO regf5 ,regf6,regf7,regf8
mov ah,2
mov dh,06d
mov dl,15d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf5
int 21h
mov ah,2
mov dh,08d
mov dl,15d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf6
int 21h
mov ah,2
mov dh,10d
mov dl,15d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf7
int 21h
mov ah,2
mov dh,12d
mov dl,15d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf8
int 21h
ENDM textdisf2
;///////////////////////////////////
textdiss1 MACRO regf1,regf2,regf3,regf4
mov ah,2
mov dl,21d
mov dh,06d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf1
int 21h
mov ah,2
mov dh,08d
mov dl,21d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf2
int 21h
mov ah,2
mov dh,10d
mov dl,21d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf3
int 21h
mov ah,2
mov dh,12d
mov dl,21d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf4
int 21h
ENDM textdiss1
;//////////////////////////////////
textdiss2 MACRO regf5 ,regf6,regf7,regf8
mov ah,2
mov dh,06d
mov dl,35d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf5
int 21h
mov ah,2
mov dh,08d
mov dl,35d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf6
int 21h
mov ah,2
mov dh,10d
mov dl,35d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf7
int 21h
mov ah,2
mov dh,12d
mov dl,35d
int 10h
mov ah, 9
mov bl,0FAh
mov dx,offset regf8
int 21h
ENDM textdiss2
;///////////////////////////////////////

;//////////////////////////////////////////////////
drawmemoryf MACRO xcordstart,xcordend,ycordstart,ycordend,color
LOCAL next
LOCAL AGAIN
LOCAL startagain
mov cx,xcordstart
mov dx,ycordstart
mov al,color
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,xcordend
 je startagain
 jne AGAIN 
 startagain: mov cx,xcordstart
             inc dx
             cmp dx,ycordend
             je next
             mov al,color
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawmemoryf
;///////////////////////////////////////////////////////////////
drawmemorys MACRO xcordstart,xcordend,ycordstart,ycordend,color
LOCAL next
LOCAL AGAIN
LOCAL startagain
mov cx,xcordstart
mov dx,ycordstart
mov al,color
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,xcordend
 je startagain
 jne AGAIN 
 startagain: mov cx,xcordstart
             inc dx
             cmp dx,ycordend
             je next
             mov al,color
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawmemorys
;///////////////////////////////////////////////////////////////
drawbordershorizontal MACRO xcordstart,xcordend,ycord,color
LOCAL back2
mov cx,xcordstart 
mov dx,ycord
mov al,color 
mov ah,0ch 
back2:int 10h
inc cx
cmp cx,xcordend
jnz back2 
ENDM drawbordershorizontal
;/////////////////////////////////////////////////////////////////
drawbordersvertical MACRO xcord,ycordstart,ycordend,color
LOCAL back2
mov cx,xcord 
mov dx,ycordstart
mov al,color 
mov ah,0ch 
back2:int 10h
dec dx
cmp dx,ycordend
jnz back2 
ENDM drawbordersvertical
;//////////////////////////////////////////
drawfirstsquare MACRO
    LOCAL AGAIN
    LOCAL startagain
    LOCAL next
mov cx,20
mov dx,160
mov al,1
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,35
 je startagain
 jne AGAIN
 startagain: mov cx,20
            inc dx
             cmp dx,175
             je next
             mov al,1
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawfirstsquare
;///////////////////////////
drawsecondsquare MACRO
    LOCAL AGAIN
    LOCAL startagain
    LOCAL next
mov cx,40
mov dx,160
mov al,14
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,55
 je startagain
 jne AGAIN
 startagain: mov cx,40
            inc dx
             cmp dx,175
             je next
             mov al,14 
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawsecondsquare
;/////////////////////////////////////////////////////////////////////////
drawthirdsquare MACRO
    LOCAL AGAIN
    LOCAL startagain
    LOCAL next
mov cx,60
mov dx,160
mov al,4
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,75
 je startagain
 jne AGAIN
 startagain: mov cx,60
            inc dx
             cmp dx,175
             je next
             mov al,4 
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawthirdsquare
;////////////////////////////////
drawfourthsquare MACRO
    LOCAL AGAIN
    LOCAL startagain
    LOCAL next
mov cx,80
mov dx,160
mov al,1
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,95
 je startagain
 jne AGAIN
 startagain: mov cx,80
            inc dx
             cmp dx,175
             je next
             mov al,1 
             mov ah,0ch
             jmp AGAIN
             next:  
ENDM drawfourthsquare
;///////////////////////////
drawfifthsquare MACRO
    LOCAL AGAIN
    LOCAL startagain
    LOCAL next
mov cx,100
mov dx,160
mov al,2
mov ah,0ch 
AGAIN: int 10h 
 inc cx
 cmp cx,115
 je startagain
 jne AGAIN
 startagain: mov cx,100
            inc dx
             cmp dx,175
             je next
             mov al,2 
             mov ah,0ch
             jmp AGAIN
             next: 
ENDM drawfifthsquare
;///////////////////////////////////////////
convertdectohex16 MACRO 
LOCAL exit
LOCAL label1
LOCAL print1
LOCAL continue
;initialize count
	mov cx,0 
	mov dx, 0 
	label1:
;if
	    ;ax is zero
		cmp ax,0 
		je print1

;initialize bx to 16
 mov bx, 16

;divide it by 16
;to convert it to Hexadecimal
	div bx

;push it in the stack
	push dx

;increment the count
	inc cx

;set dx to 0
	xor dx,dx
	
		jmp label1
			print1:
;check if count
;is greater than zero
	cmp cx,0 
	je exit

;pop the top of stack
	pop dx

;compare the value
;with 9 
cmp dx, 9 
jle continue

;if
;value is greater than 9
;then add 7 so that after
;adding 48 it represents A
;for example 10 + 7 + 48 = 65
;which is ASCII value of A
	add dx,7

	continue:

;add 48 so that it
;represents the ASCII
;value of digits
	add dx,48

;interrupt to print a;character
	mov ah,02h 
	int 21h

;decrease the count
	dec cx
  jmp print1
exit: hlt 
ENDM convertdectohex16
;///////////////////////////////////////////
DisplayNumber4digits MACRO Parm1
    LOCAL go
    LOCAL next
       mov ax,Parm1
       pushA
        mov dx,0
       mov bx,4096
       DIV bx
       add ax,30h
       mov cx,ax
       pushA
       mov ah,2
       mov dx,cx      
       int 21h
        popA 
       mov ax,dx ;remainder
       mov dx,0
       mov bx,256
       DIV bx
       add ax,30h
       mov cx,ax
       pushA
       mov ah,2
       mov dx,cx      
       int 21h
       popA 
       mov ax,dx ;remainder
       mov dx,0
       mov bx,16
       DIV bl
       add al,30h
       mov bl,al
       pushA
       mov ah,2
       mov dl,bl
       int 21h 
       popA
       add ah,30h
       mov dh,ah
       mov ah,2
       mov dl,dh
       int 21h
       popA   
      next:
ENDM DisplayNumber4digits
;//////////////////////////////////////
displaynumberinregisters MACRO variable,xcord,ycord
mov ah,2
mov dl,xcord
mov dh,ycord
int 10h
DisplayNumber4digits variable
ENDM displaynumberinregisters
;///////////////////////////////////////////////
DisplayNumber2digits MACRO parm
    LOCAL go
    LOCAL next
       mov al,parm
       cmp al,00h
       je go
       CBW 
     convertdectohex16
      jmp next
      go:
       pushA
       mov ah,0
       mov bl,10
       DIV bl
       add al,30h
       mov cl,al ;
       add ah,30h
       mov al,ah;,dx ;remainder
       pushA
       mov ah,2
       mov dl,cl
       int 21h
       popA
       mov ah,2
       mov dl,al
       int 21h
       popA  
       next: 
ENDM DisplayNumber2digits
;///////////////////////////////////////////////
Displayinitialpoint MACRO parm
    LOCAL go
    LOCAL next
       mov al,parm
       pushA
       mov ah,0
       mov bl,10
       DIV bl
       add al,30h
       mov cl,al ;
       add ah,30h
       mov al,ah;,dx ;remainder
       pushA
       mov ah,2
       mov dl,cl
       int 21h
       popA
       mov ah,2
       mov dl,al
       int 21h
       popA  
       next: 
ENDM Displayinitialpoint
;///////////////////////////////////////////////
displaynumberinmemory MACRO variable,xcord,ycord
mov ah,2
mov dl,xcord
mov dh,ycord
int 10h
DisplayNumber2digits variable
ENDM displaynumberinmemory
;////////////////////////////////////////////////
displayplayername MACRO p1name ,xcord,ycord
mov ah,2
mov dl,xcord
mov dh,ycord
int 10h
mov ah,9
mov dx,offset p1name+2
int 21h
ENDM displayplayername
;////////////////////////////////////////////////
displayplayername2 MACRO p1name ,xcord,ycord
mov ah,2
mov dl,xcord
mov dh,ycord
int 10h
mov ah,2
mov dl,p1name+2
int 21h
ENDM displayplayername2
;/////////////////////////////////////////////////
takecommandplayer1 MACRO  si
mov ah,2
mov dl,3d
mov dh,17d
int 10h
mov ah,0Ah 
mov dx,si
int 21h
ENDM takecommandplayer1
;//////////////////////////////////////////////////////
takecommandplayer2 MACRO  si
mov ah,2
mov dl,23d
mov dh,17d
int 10h
mov ah,0Ah 
mov dx,si
int 21h
ENDM takecommandplayer2
;//////////////////////////////////////////////////////////
DISPLAYSTRING MACRO STR
    mov ah,09
    mov dx,offset STR
    int 21h
ENDM DISPLAYSTRING

decide macro reg1,reg2
local player2
local done 
mov al,Turns  
cmp al,byte ptr 1
jne player2
lea bx,word ptr reg1
player2:  
cmp al,byte ptr 2
jnz done  
lea bx,word ptr reg2
done:
mov destinationaddress,bx
endm decide

decide1 macro reg1,reg2
local player2
local done   
mov al,Turns  
cmp al,1
jne player2
lea bx,reg1
player2:  
cmp al,2
jne done  
lea bx,reg2 
done:
mov destinationaddress,bx 
endm decide1

decide2 macro reg1,reg2
local player2
local done 
mov al,Turns  
cmp al,1
jne player2
lea bx,reg1
inc bx
player2:  
cmp al,2
jnz done  
lea bx,reg2
inc bx
done: 
mov destinationaddress,bx
endm decide2

decide3 macro reg1,reg2
local player2
local done 
mov al,Turns  
cmp al,1
jne player2
lea dx,word ptr reg1
player2:  
cmp al,2
jnz done  
lea dx,word ptr reg2
done:  
mov sourceaddress,dx
endm decide3

decide4 macro reg1,reg2
local player2
local done   
mov al,Turns  
cmp al,1
jne player2
lea dx,reg1
player2:  
cmp al,2
jne done  
lea dx,reg2
done:   
mov sourceaddress,dx
endm decide4

decide5 macro reg1,reg2
local player2
local done 
mov al,Turns  
cmp al,1
jne player2
lea dx,reg1
inc dx
player2:  
cmp al,2
jnz done  
lea dx,reg2
inc dx
done:      
mov sourceaddress,dx
endm decide5



asscitohex MACRO Input1,output,value
local x0 
local x1
local x2
local x3
local x4
local x5
local x6
local x7
local x8
local x9
local xA
local xB
local xC
local xD
local xE
local xF
local end
local loop1
local loop2
local loop3
local loop4
    mov cx,value
    mov si, offset Input1
;input db,output dw
    mov dl,cl

translate:
    cmp [si],byte ptr 30h
    je x0
    cmp [si],byte ptr 31h
    je x1
    cmp [si],byte ptr 32h
    je x2
    cmp [si],byte ptr 33h
    je x3
    cmp [si],byte ptr 34h
    je x4
    cmp [si],byte ptr 35h
    je x5
    cmp [si],byte ptr 36h
    je x6
    cmp [si],byte ptr 37h
    je x7
    cmp [si],byte ptr 38h
    je x8
    cmp [si],byte ptr 39h
    je x9
    cmp [si],byte ptr 61h
    je xA
    cmp [si],byte ptr 62h
    je xB
    cmp [si],byte ptr 63h
    je xC
    cmp [si],byte ptr 64h
    je xD
    cmp [si],byte ptr 65h
    je xE
    cmp [si],byte ptr 66h
    je xF
    jmp NONE
    x0:
        mov [si],byte ptr 00h
        jmp NONE
    x1:
        mov [si],byte ptr 01h 
        jmp NONE
     
    x2:
        mov [si],byte ptr 02h    
            jmp NONE
      
    x3:
        mov [si],byte ptr 03h 
            jmp NONE
      
    x4:
        mov [si],byte ptr 04h 
            jmp NONE
       
    x5:
        mov [si],byte ptr 05h 
            jmp NONE
      
    x6:
        mov [si],byte ptr 06h 
            jmp NONE
       
    x7:
        mov [si],byte ptr 07h 
            jmp NONE
      
    x8:
        mov [si],byte ptr 08h 
            jmp NONE
    
    x9:
        mov [si],byte ptr 09h 
            jmp NONE
     
    xA:
        mov [si],byte ptr 0Ah 
            jmp NONE
      
    xB:
        mov [si],byte ptr 0Bh 
            jmp NONE
     
    xC:
        mov [si],byte ptr 0Ch 
            jmp NONE
   
    xD:
        mov [si],byte ptr 0Dh 
            jmp NONE
     
    xE:
        mov [si],byte ptr 0Eh 
            jmp NONE
      
    xF:
        mov [si],byte ptr 0Fh 
          
    
    NONE:

    
inc si
dec cx
jnz translate
mov ax,0 
mov si, offset Input1
cmp dl,1
jz loop1
cmp dl,2
jz loop2
cmp dl,3
jz loop3
cmp dl,4
jz loop4
loop1:
mov al,[si]
add output,ax
jmp end
loop2:
mov al,[si]
mov bx,1000h
mul bx
shr ax,8
add output,ax
mov ax,00
inc si
mov al,[si]
mov bx,100h
mul bx
shr ax,8
add output,ax
jmp end
loop3:
mov al,[si]
mov bx,1000h
mul bx 
shr ax,4
add output,ax
mov ax,00
inc si
mov al,[si]
mov bx,100h
mul bx
shr ax,4
add output,ax
mov ax,00
inc si
mov al,[si]
mov bx,10h
mul bx
shr ax,4
add output,ax
jmp end
loop4:
mov al,[si]
mov bx,1000h
mul bx 
add output,ax
mov ax,00
inc si
mov al,[si]
mov bx,100h
mul bx
add output,ax
mov ax,00
inc si
mov al,[si]
mov bx,10h
mul bx
add output,ax
mov ax,00
inc si
mov al,[si]
add output,ax
jmp end


end:


                    
ENDM asscitohex
          
takenumberdec MACRO 
    mov ah,1
    int 21h
    mov cl,10
    sub al,30h
    mov ah,0
    mul cl
    mov bl,al
    mov ah,1
    int 21h
    sub al,30h
    add al,bl
ENDM takenumberdec