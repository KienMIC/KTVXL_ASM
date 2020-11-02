MACRO HTCHUOI STRING 
    MOV AH,9
    LEA DX,STRING
    INT 21H
HTCHUOI ENDM

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'NHAP a = $'
    MSG2 DB 13,10,'NHAP b = $'
    MSG3 DB 13,10,'NHAP c = $'
    a DB 0
    b DB 0
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        HTCHUOI MSG1
        
        NHAP1:
            MOV AH,1
            INT 21H
            CMP AL,13
            JE NHAP2
            SUB AL,30H
            MOV DL,AL
            MOV AL,a
            MOV BL,10
            MUL BL
            ADD AL,DL
            MOV a,AL
            JMP NHAP1
         NHAP2:
            HTCHUOI MSG2
            NHAP:
                MOV AH,1
                INT 21H
                CMP AL,13
                JE TICH
                SUB AL,30H
                MOV AL,DL
                MOV AL,b
                MOV BL,10
                MUL BL
                ADD AL,DL
                MOV b,AL
                JMP NHAP
                TICH:
                    MOV AL,a
                    MUL b
                    MOV BX,AX
                    JMP TICH
                    HTCHUOI MSG3
                    MOV AX,BX
                    MOV BX,10
                    XOR CX,CX
                    CHIA:XOR DX,DX
                    DIV BX
                    PUSH DX
                    INC CX
                    CMP AX,0
                    JA CHIA
                    MOV AH,2
                    LAYRA:
                        POP DX
                        ADD DL,30H
                        INT 21H
                        LOOP LAYRA
MAIN ENDP
                    
                    
                
                
                
        
        
    