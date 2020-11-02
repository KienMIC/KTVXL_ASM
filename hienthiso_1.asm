.MODEL SMALL
.DATA
    DDAI DW 0
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AX,2560
        CALL DISPLAY_NUMBER
        
     ;   MOV AX,349  
      ;  CALL DISPLAY_NUMBER
        
      
        
        MOV AH,4CH
        INT 21H
    MAIN ENDP 
    
    DISPLAY_NUMBER PROC
        MOV DDAI,0        
        MOV BH,10
        PHANTICH:
            DIV BH ; AX/BH => AH= DU; AL=THUONG
            MOV DX,0
            MOV DL,AH
            PUSH DX
            INC DDAI
            MOV AH,0
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