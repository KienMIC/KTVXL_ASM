MACRO HTCHUOI STRING
    MOV AH,9
    LEA DX,STRING
    INT 21H
HTCHUOI ENDM

.MODEL SMALL
.DATA
        MSG1 DB 13,10,'NHAP a = $'
        MSG2 DB 13,10,'NHAP b = $'
        MSG3 DB 13,10,'TONG 2 SO DA NHAP LA : $'
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
        ADD BL,AL
        
        HTCHUOI MSG3
        
        SUB BL,30H
        CMP BL,39H
        JBE THOAT
        SUB BL,10
        MOV AH,2
        MOV DL,'1'
        INT 21H
        
     THOAT:
        MOV DL,BL
        MOV AH,2
        INT 21H
        INT 20H
MAIN ENDP
        