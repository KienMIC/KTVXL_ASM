MACRO HTCHUOI STRING
    MOV AH,09H
    LEA DX,STRING
    INT 21H
ENDM

.MODEL SMALL
.DATA
    MSG1 DB 'NHAP a = $'
    MSG2 DB 13,10,'NHAP b = $'
    MSG3 DB 13,10,'TRUNG BINH CONG CUA a VA b la: $'
    MSG4 DB '.5$'
    MSG5 DB '.0$'
.CODE 
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    HTCHUOI MSG1
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    
    HTCHUOI MSG2
    
    MOV AH,1
    INT 21H
    ADD BL,AL
    SUB BL,60H
    
    MOV CL,BL
    SHR CL,1
    ADD CL,30H
    
    HTCHUOI MSG3
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    TEST BL,1
    JNE  SOLE
    HTCHUOI MSG5
    JMP THOAT
SOLE:
    HTCHUOI MSG4
THOAT:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP    
    
   
    
    
    

    