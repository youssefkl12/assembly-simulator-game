

;for the sake of the sript the planes will appear each turn
^j::
;enter the names of the players and intial points
;p1

Send, yk
sleep, 1000
Send,{Enter}
Send, 40
sleep, 1000
Send,{Enter}

;p2
Send, yklk

sleep, 1000
Send,{Enter}
Send, 40
sleep, 1000
Send,{Enter}
sleep, 1000

;choose the game mode
Send,{F2}
sleep, 1000
;choose game level

Send,1
sleep, 1000
;choose the forbidden charcter for player 1 and 2

Send,1
Send,{Enter}
sleep, 1000
Send,2
Send,{Enter}
send,{F4}

;enter the game 

;test mov operation and number to register p1    command 1
sleep, 1000
send, mov ax,3345
sleep, 1000
Send,{Enter}

;test mov operation and number to register p2    command 1
sleep, 1000
send, mov ax,2445
sleep, 1000
Send,{Enter}


;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test mov operation and register to register p1    command 2

send, and ax,cx
sleep, 1000
Send,{Enter}

;test and operation and register to register p2    command 2
sleep, 1000
send, and ax,cx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test or operation and register to register p1    command 3


send, or ax,bx
sleep, 1000
Send,{Enter}

;test or operation and register to register p2    command 3
sleep, 1000
send, or ax,bx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test xor operation and register to register p1    command 4
send, xor ax,cx
sleep, 1000
Send,{Enter}

;test xor operation and register to register p2    command 4
sleep, 1000
send, xor ax,cx
sleep, 1000
Send,{Enter}

;gun game will appear
send,{Enter}
sleep, 2000
sleep, 5000
send,{Enter}

;test add operation and register to register p1    command 5


send, add ax,bx
sleep, 1000
Send,{Enter}

;test add operation and register to register p2    command 5
sleep, 1000
send, add ax,bx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000


;test adc operation and register to register p1    command 6


send, adc ax,bx
sleep, 1000
Send,{Enter}

;test adc operation and register to register p2    command 6
sleep, 1000
send, adc ax,bx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test sub operation and register to register p1    command 7

;invalid register name
send, sub ac,bx
sleep, 1000
Send,{Enter}

;test sub operation and register to register p2    command 7
sleep, 1000
send,sub ax,bx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000


;test sbb operation and register to register p1    command 8


send, sbb ax,bx
sleep, 1000
Send,{Enter}

;test sbb operation and register to register p2    command 8
sleep, 1000
send,sbb ax,bx
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test nop operation and register to register p1    command 9


send, nop
sleep, 1000
Send,{Enter}

;test nop operation and register to register p2    command 9
sleep, 1000
send,nop
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000

;test clc operation and register to register p1    command 10
send, clc
sleep, 1000
Send,{Enter}


;test clc operation and register to register p2    command 10
sleep, 1000
send,clc 
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000


;testing power ups


;clear all registers  p1  power up 1
send, 1
sleep, 1000
Send,{Enter}


;excute on your register p2    power up 2
sleep, 1000
send,2
sleep, 1000
Send,{Enter}
send,mov cx,sp

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 4000
send,{Enter}


;change foebbiden char  p1  power up 3
send, 3
sleep, 1000
Send,{Enter}
sleep, 1000
send,l
sleep, 1000
Send,{Enter}


;excute on both register p2    power up 4
sleep, 1000
send,4
sleep, 1000
Send,{Enter}
send,mov cx,sp

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 4000
send,{Enter}
;errors 


;invalid addressing mode
send, mov bx,[cx]
sleep, 1000
Send,{Enter}
sleep, 1000


;size missmatch
sleep, 1000
send,mov ah,ax
sleep, 1000
Send,{Enter}


;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 4000


;memeory to memory
send, mov 1111,1111
sleep, 1000
Send,{Enter}
sleep, 1000


;size missmatch
sleep, 1000
send,mov ah,ax
sleep, 1000
Send,{Enter}


;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 4000
;send,{Enter}



;////////////////////////////////

;test sbb operation and register to register p1    command 11


send, ror ax,5
sleep, 1000
Send,{Enter}

;test sbb operation and register to register p2    command 12
sleep, 1000
send,rol ax,2
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000


;test shl operation and register to register p1    command 13


send, shl ax,5
sleep, 1000
Send,{Enter}

;test shr operation and register to register p2    command 14
sleep, 1000
send,shr ax,2
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000




;test nop operation and register to register p1    command 15
send, dec bx
sleep, 1000
Send,{Enter}


;test nop operation and register to register p2    command 15
sleep, 1000
send,dec ax 
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 4000
Send,{Enter}


;test nop operation and register to register p1    command 16
send, inc bx
sleep, 1000
Send,{Enter}


;test nop operation and register to register p2    command 16
sleep, 1000
send,inc ax 
sleep, 1000
Send,{Enter}

;gun game will appear
sleep, 2000
send,{Enter}
sleep, 2000
sleep, 1000









return