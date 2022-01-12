.model small
.stack 100h
.data 
    tb1 db "Hay nhap mot ky tu: $"
    tb2t db 0Dh, 0Ah, "Ky tu dung truoc: $"
    tb2 db ", da nhap: $"
    tb2s db ", dung sau: $"
    kt db ?
.code
main proc                  
    mov ax, @data
    mov ds, ax
    
    ;thong bao nhap
    lea dx, tb1
    mov ah, 9
    int 21h
    
    ;nhap mot ky tu
    mov ah, 1
    int 21h  
    mov kt, al
    
    ;thong bao truoc
    lea dx, tb2t
    mov ah, 9  
    int 21h  
    
    ;hien ky tu truoc 
    mov ah, 2
    mov dl, kt
    dec dl
    int 21h
    
    ;thong bao da nhap
    lea dx, tb2
    mov ah, 9
    int 21h
    
    ;hien ky tu da nhap
    mov ah, 2
    mov dl, kt
    int 21h
    
    ;thong bao ky tu sau
    lea dx, tb2s
    mov ah, 9
    int 21h
    
    ;hien ky tu sau
    mov ah, 2
    mov dl, kt
    inc dl
    int 21h
    
    
main endp
end main