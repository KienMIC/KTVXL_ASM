MACRO HTCHUOI STRING
    MOV AH,9
    LEA DX,STRING
    INT 21H
HTCHUOI ENDM

.MODEL SMALL
.DATA
        MSG1 DB 13,10,'NHAP a = $'
        MSG2 DB 13,10,'NHAP b = $'
        MSG3 DB 13,10,'HIEU 2 SO DA NHAP LA : $'
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        HTCHUOI MSG1
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        HTCHUOI MSG2
        
        MOV AH,1
        INT 21H
        MOV CL,AL
        
        HTCHUOI MSG3
        
        CMP BL,CL
        JAE THOAT
        XCHG BL,CL
        
        MOV AH,2
        MOV DL,'-'
        INT 21H
        
     THOAT:
        SUB BL,CL
        ADD BL,30H
        MOV AH,2
        MOV DL,BL
        INT 21H
        INT 20H
MAIN ENDP
        