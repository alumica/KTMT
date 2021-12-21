.model small
.stack 100h
.data     
    tb db 'Gio, phut, giay cua he thong: $'
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, tb
    mov ah, 9
    int 21h
    
    mov ah, 2ch
    int 21h
   
    mov al, ch
    call time1
    
    mov dl, ':'
    mov ah, 2
    int 21h
    mov al, cl
    call time1
    
    mov dl, ':'
    mov ah, 2
    int 21h
    mov al, dh
    call time1
    
    mov ah, 4Ch
    int 21h  
    
time1 proc
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
time1 endp    
      
end