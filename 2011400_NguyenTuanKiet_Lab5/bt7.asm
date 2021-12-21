.model small
.stack 100h
.data     
    tb db 'Ngay/thang/nam cua he thong: $'
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, tb
    mov ah, 9
    int 21h
    
    mov ah, 2Ah
    int 21h
    mov al, dl
    call date1
    
    mov dl, '/'
    mov ah, 2
    int 21h
    
    mov al, dh
    call date1
    
    mov dl, '/'
    mov ah, 2
    int 21h
    
    add cx, 0F830h
    mov ax, cx
    call date1   
    
    mov ah, 4Ch
    int 21h  
    
date1 proc
    aam
    add ax, 3030h
    mov bx, ax
    mov dl, ah
    mov ah, 2
    int 21h
    mov dl, bl
    mov ah, 2
    int 21h
    ret        
date1 endp 
end