HTCHUOI MACRO STR
    LEA DX,STR
    MOV AH,09H
    INT 21H
HTCHUOI ENDM    
.MODEL SMALL
.DATA
    STR1 DB 21 DUP(?)
    STR2 DB 21 DUP(?)      
    XD DB 13,10,"$"     
    DDAI1 DW 0
    DDAI2 DW 0
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        LEA BX,STR1    
        ;MOV BX,OFFSET STR1
        MOV CX,0 
        CALL NHAPCHUOI
        MOV DDAI1,CX   
        
        HTCHUOI XD
        
        ;LEA BX,STR2    
        ;MOV CX,0 
        ;CALL NHAPCHUOI
        ;MOV DDAI2,CX
        
        HTCHUOI XD
       
        ;HTCHUOI STR1 

        ;HTCHUOI XD
       
        ;HTCHUOI STR2
        
        LEA BX,STR1
        MOV CX,DDAI1
        MOV DL,0
        KTRA1:
            MOV AH,[BX]
            CMP AH,'A'
            JNE TTUC1
            MOV [BX],"+"
            INC DL
            TTUC1:
            INC BX
            LOOP KTRA1
        PUSH DX
        HTCHUOI XD
        HTCHUOI STR1  
        POP DX                  
                
       
        
        MOV AH,4CH
        INT 21H
    MAIN ENDP
    
    ;Chuong trinh con nhap 1 chuoi
    ;Input: BX=offset cua mang chuoi se luu chuoi duoc nhap 
    ;       CX=0
    ;Output: chuoi nhap tu ban phim duoc luu, kthuc "$"
    ;       CX=do dai thuc te cua chuoi
    NHAPCHUOI PROC
        IN_STR:
            MOV AH,01H
            INT 21H
            CMP AL,13
            JE EXIT_IN
            MOV [BX],AL
            INC BX
            INC CX
            CMP CX,20   ; SO KY TU TOI DA :20 KTU
            JE  EXIT_IN:
            JMP IN_STR
        EXIT_IN:
        MOV [BX],'$'    
        RET
    NHAPCHUOI ENDP        
	

END                       
                          