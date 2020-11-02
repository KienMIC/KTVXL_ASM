.MODEL SMALL
.DATA
    ST1 DB 21 DUP(?)
    XD DB 13,10,"$"
.CODE
    MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            LEA BX,ST1 
            MOV CX,0
            
            IN_STR:
                MOV AH,01H
                INT 21H
                CMP AL,13
                JE EXIT_IN
                MOV [BX],AL
                INC BX
                ;Gioi han ky tu
                INC CX
                CMP CX,20
                JE  EXIT_IN
                ;
                JMP IN_STR
            EXIT_IN:
                MOV [BX],'$'
                LEA DX,XD
                MOV AH,09H
                INT 21H
                
                LEA DX,ST1
                MOV AH,09H
                INT 21H    
                
                MOV AH,4CH
                INT 21H
MAIN ENDP
    END