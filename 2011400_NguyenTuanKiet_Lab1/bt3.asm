.model small
.stack 100h
.data
    tb1 db "Hay nhap mot ky tu: $"
    tb2 db 0Dh, 0Ah, "Ky tu dung truoc: $"
    tb3 db 0Dh, 0Ah, "Ky tu dung sau: $"    
    kt db ?
.code
main proc                            
    mov ax, @data
    mov ds, ax   
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov kt, al
    lea dx, tb2
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, kt
    dec dl
    int 21h
    
    lea dx, tb3
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, kt
    inc dl
    int 21h
main endp
end main
