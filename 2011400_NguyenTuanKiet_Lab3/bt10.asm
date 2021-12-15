.model small
.stack
.data  
.code
    xor bx, bx
    mov al, '3' ;vd: nhap so 3
    and al, 0Fh
    shl bx, 1
    or bl, al
    mov cx, 16
printLoop:
    rol bx, 1
    jc print1
    mov dl, '0'
    mov ah, 2
    int 21h
    jmp exit
print1:
    mov dl, '1'
    mov ah, 2
    int 21h
exit:
    dec cx
    cmp cx, 0
    jne printLoop
    
    mov ah, 4Ch
    int 21h    
end    