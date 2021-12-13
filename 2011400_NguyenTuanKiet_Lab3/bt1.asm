.model small
.stack
.data
    tb1 db 'Bay gio la (S)ang, (C)hieu hay (T)oi? $'
    tb2 db 13, 10, 'Chao buoi sang$'
    tb3 db 13, 10, 'Chao buoi chieu$'
    tb4 db 13, 10, 'Chao buoi toi$'
.code
main proc
    mov ax, @data
    mov ds, ax
Nhap:    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 1
    int 21h
    
    ;mov kt, al
    cmp al, 'S'    
    je Sang
    cmp al, 's'    
    je Sang
    
    cmp al, 'C'    
    je Chieu 
    cmp al, 'c'    
    je Chieu
    
    cmp al, 'T'    
    je Toi  
    cmp al, 't'    
    je Toi
    
    ;quay lai nhap
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    jmp Nhap 
    
Sang:
    
    lea dx, tb2
    jmp kt
Chieu:
    lea dx, tb3
    jmp kt
Toi:
    lea dx, tb4 
kt: 
    mov ah, 9
    int 21h   
    
    mov ah, 4Ch
    int 21h       
endp
end main