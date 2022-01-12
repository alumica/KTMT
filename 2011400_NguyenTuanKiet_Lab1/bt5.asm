.model small
.stack 100h
.data
    tb1 db "Nhap ky tu thu nhat: $"
    tb2 db 0Dh, 0Ah, "Nhap ky tu thu hai: $"
    tb3 db 0Dh, 0Ah, "Ky tu tong: $"
    kt1 db ?
    kt2 db ?
.code
main proc                           
    mov ax, @data
    mov ds, ax
    
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov kt1, al
    
    lea dx, tb2
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov kt2, al
    
    lea dx, tb3
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov al, kt1
    add al, kt2
    mov dl, al
    int 21h
    
main endp
end main