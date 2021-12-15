.model small
.stack 100h
.data 
    tb1 db 'Hay nhap mot chuoi ky tu (ket thuc bang Enter): $'
    tb2 db 13, 10, 'Chuoi nguoc: $'
    
.code 
main proc        
    mov ax, @data
    mov ds, ax
    
    xor bx, bx
    xor cx, cx
    mov ah, 9
    lea dx, tb1
    int 21h    
                        
    repeat:        
        ;nhap mot ky tu
        mov ah, 1        
        int 21h                
        cmp al, 13
        je endr 
        mov bl, al     
        push bx
        inc cx        
        jmp repeat
              
    endr:
        mov ah, 9
        lea dx, tb2
        int 21h 
    
    print:        
        pop bx
        mov dl, bl
        mov ah, 2 
        int 21h
    loop print
      
    mov ah, 4Ch
    int 21h 
main endp            
end main