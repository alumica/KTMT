.model small
.stack
.data  
    tb1 db 'Nhap mot so: $'  
.code
    mov ax, @data
    mov ds, ax
    xor bx, bx
    mov ah, 9
    lea dx, tb1
    int 21h
    mov ah, 1 
n2:
    int 21h
    cmp al, 13
    je n8 
    and al, 0Fh
    shl bx, 1
    or bl, al
    jmp n2
n8:
    
    mov ah, 4Ch
    int 21h    
end    