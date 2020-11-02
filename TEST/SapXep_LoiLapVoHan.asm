MACRO HTCHUOI STRING
    MOV AH,09H
    LEA DX,STRING
    INT 21H
HTCHUOI ENDM

.MODEL SMALL
.STACK 100
.DATA
    MSG1 DB 'CHUOI DA SAP XEP !',10,13
    ARR DB '1','4','7','8','10','12','45','$'
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,ARR
        DEC BX
    LAP:MOV SI,DX
        MOV CX,BX
        MOV DI,SI
        MOV AL,[DI]
    TIMMAX:INC SI
         CMP [SI],AL
         JNG TIEP
         MOV DI,SI
         MOV AL,[DI]
     TIEP:LOOP TIMMAX
          CALL DOICHO
          DEC BX
          JNZ LAP   
          
          MOV AH,4CH
          INT 21H
        MAIN ENDP
    
    DOICHO PROC
        PUSH AX
        MOV AL,[SI]
        XCHG AL,[DI]
        MOV [SI],AL
        POP AX
        RET
    DOICHO ENDP 
    