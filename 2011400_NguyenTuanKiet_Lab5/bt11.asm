.model small
.stack 100h
.data
    tbn1 db 'Nhap so thu nhat (x): $'
    tbn2 db 13, 10, 'Nhap so thu hai (y): $'
    tbx db 13, 10, 13, 10, 'Da chuyen: Thuong so -> BX, Phan du -> CX.$'
    x dw 0
    y dw 0                        
    tam dw 0
.code
    mov ax, @data
    mov ds, ax   
    
    ;===== Nhap so x =====   
    lea dx, tbn1
    call Nhap 
    xor ah, ah
    mov x, ax
    
    ;===== Nhap so y =====
    lea dx, tbn2
    call Nhap
    xor ah, ah
    mov y, ax
    
    ;===== Tinh Thuong: BX -> Quotient, CX -> Remainder =====
    call Tinh   
    
    lea dx, tbx
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h 

Nhap proc 
    mov ah, 9
    int 21h
    Nhap1:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je Thoat        
        cmp al, '0'
        jb Xoa
        cmp al, '9'
        jbe Luu
        jmp Xoa 
     Luu:
        and al, 0Fh
        xor ah, ah
        mov si, ax    
        mov ax, tam
        xor ah, ah
        mov bx, 10
        mul bx
        mov tam, ax
        add tam, si
        jmp Nhap1
     Thoat:
     mov ax, tam
     mov tam, 0
     ret
     
     Xoa: ;Xoa ky tu nhap sai(clear sreen)
        mov ah, 2
        mov dl, 8
        int 21h
        mov dl, 32
        int 21h 
        mov dl, 8
        int 21h
        jmp Nhap1
Nhap endp

Tinh proc   
    ;Tinh thuong
    mov dx, 0
    mov ax, x
    mov bx, y
    div bx
    mov bx, ax 
    mov cx, dx 
    ret  
Tinh endp
end