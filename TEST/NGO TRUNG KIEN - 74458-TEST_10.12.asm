;NGO TRUNG KIEN - 74458 - VXL N01
;CAU 5 : CAI DAT CHUONG TRINH NHAP 2 CHUOI VAO TU BAN PHIM (CHUOI 1 
;TOI DA 30 KY TU,CHUOI 2 TOI DA 5 KY TU). CHEN CHUOI 2 VAO CHUOI 1 TAI VI TRI THU 2 TINH TU TRAI SANG PHAI CUA CHUOI 1

MACRO HTCHUOI STRING
    MOV AH,9
    LEA DX,STRING
    INT 21H
HTCHUOI ENDM

.MODEL SMALL
.DATA
    MSG1 DB 'NHAP CHUOI 1 (TOI DA 30 KY TU>:$'
    MSG2 DB 13,10,'NHAP CHUOI 2 (TOI DA 5 KY TU):$'
    MSG3 DB 13,10,'CHUOI1+CHUOI2:'
    STR1 DB 30,?,31 DUP('$')
    STR2 DB 5,?,6 DUP('$')
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    HTCHUOI MSG1
    
     LEA BX,STR1    
     MOV CX,0 
     CALL NHAPCHUOI30
     
    HTCHUOI MSG2
    
    LEA BX,STR2    
    XOR CX,CX
    CALL NHAPCHUOI5
    
    HTCHUOI MSG3
     
    
    HTCHUOI STR2
    
    MOV AH,4CH
    INT 21H
MAIN ENDP 
    
NHAPCHUOI30 PROC
    IN_STR:
        MOV AH,01H
        INT 21H
        CMP AL,13
        JE EXIT_IN
        MOV [BX],AL
        INC BX
        INC CX
        CMP CX,30   
        JE  EXIT_IN:
        JMP IN_STR
    EXIT_IN:
        MOV [BX],'$'
           
        RET
    NHAPCHUOI30 ENDP
    
NHAPCHUOI5 PROC
    IN_STR1:
        MOV AH,01H
        INT 21H
        CMP AL,13
        JE EXIT_IN1
        MOV [BX],AL
        INC BX
        INC CX
        CMP CX,5   
        JE  EXIT_IN1:
        JMP IN_STR1
    EXIT_IN1:
        MOV [BX],'$'    
        RET
    NHAPCHUOI5 ENDP            