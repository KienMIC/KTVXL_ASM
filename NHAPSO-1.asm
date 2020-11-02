MACRO DISPLAY STRING
    LEA DX,STRING
    MOV AH,09H
    INT 21H
DISPLAY ENDM
.MODEL SMALL
.DATA
    TB1 DB "NHAP SO:$"
    TB2 DB 13,10,"SO VUA NHAP LA:$"
    TICH DW 0   
    DDAI DW 0
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        DISPLAY TB1
        MOV AX,0
        MOV BX,10
        IN_VALUE:
        	MOV AH,01
        	INT 21H
        	CMP AL,13
        	JE EXIT_IN_VALUE
        	SUB AL,'0'
        	MOV AH,0
        	MOV DX,AX  
        	PUSH DX
        	MOV AX,TICH;
            MUL BX; AX*10->DX:AX    
            POP DX
            ADD AX,DX
            MOV TICH,AX
            JMP IN_VALUE
        EXIT_IN_VALUE: 
        
    
        DISPLAY TB2
        MOV AX,TICH 
        MOV DX,0
        CALL DISPLAY_NUMBER
        
        
        MOV AH,4CH
        INT 21H
    MAIN ENDP 
    DISPLAY_NUMBER PROC
        MOV DDAI,0        
        MOV BX,10
        PHANTICH: ;2560
            DIV BX ; DX:AX/BH => DX= DU; AX=THUONG
            ;MOV DX,0
            ;MOV DL,AH
            PUSH DX 
            MOV DX,0
            INC DDAI
            ;MOV AH,0
            CMP AX,0
            JNE PHANTICH
            MOV CX,DDAI
 
        HIENTHI:
            MOV DX,0
            POP DX
            ADD DL,'0'
            MOV AH,2
            INT 21H
        LOOP HIENTHI
        RET
    DISPLAY_NUMBER ENDP  
END    