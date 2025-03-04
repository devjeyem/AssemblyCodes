.model small
.stack 64  

.data  
    input dw 23     
    output dw ?

.code
    main proc near
    mov AX,@data
    mov DS,AX
    mov ES,AX

    mov AX, input   ;move input to AX 
    mov CX, 0       ;set count to 0
    
    loop1:
        cmp AX,1    ;check if AX contains 1
        je endloop  ;if so, jump out of loop  
        
        inc CX      ;increment
        
        ;check if odd
        test AX, 1  ;bitwise
        jnz odd               
        
        ;if even
        shr AX, 1   ;divide by 2 when shifting right once
        jnz loop1
              
    odd: 
        mov DX, 3
        mul DX      ;AX=AX*DX
        add AX, 1
        jnz loop1   ;back to loop if result is not 0
    
    endloop:
        mov output, CX
        mov AX,4C00H
        int 21H
    
    main endp