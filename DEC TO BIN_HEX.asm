MACRO DISPLAY STRING
    LEA DX,STRING
    MOV AH,09H
    INT 21H
DISPLAY ENDM
.MODEL SMALL
.DATA
    TB1 DB "NHAP SO :$"
    TB2 DB 13,10,"SO VUA NHAP LA:$"  
    XD DB 13,10,'$'
    TICH DW 0   
    DDAI DW 0
    DEM DW 0
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
        
        MOV BX,TICH
        MOV CX,8  
        DISPLAY XD
        LAP1:                                                                                                                                                                                                                                                                                                                         
            MOV DL,0
            SHL BL,1
            ADC DL,0
            ADD DL,'0'
            MOV AH,02H  
            INT 21H           
        LOOP LAP1
        
        DISPLAY XD
        MOV BX,TICH
        MOV BH,BL
        MOV CL,4
        LAP2:
            MOV BL,BH
            AND BL,0F0h
            SHR BL,CL
            CMP BL,10
            JAE TIEP1
            ADD BL,'0'
            JMP TIEP2
            TIEP1:  
                SUB BL,10
                ADD BL,'A'
            TIEP2:
                MOV DL,BL
                MOV AH,02H
                INT 21H   
                ROR BH,CL
                INC DEM
                CMP DEM,2
                JE THOAT1
            JMP LAP2
            THOAT1: 
                
                         
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