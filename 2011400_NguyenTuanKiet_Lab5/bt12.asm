.model small
.stack 100h
.data
    tbn1 db 'Nhap so thu nhat (x): $'
    tbn2 db 13, 10, 'Nhap so thu hai (y): $'
    tbx1 db 13, 10, 13, 10, 'x + y = $'
    tbx2 db 13, 10, 'x - y = $'    
    tbx3 db 13, 10, 'x * y = $'
    tbx4 db 13, 10, 'x / y = $'
    x dw 0
    y dw 0                        
    tam dw 0
    tong dw ?
    hieu dw ?
    tich dw ?
    thuong dw ?
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
    
    ;===== Tinh Tong, Hieu, Tich, Thuong =====
    call Tinh
    
    ;===== Xuat Tong =====    
    lea dx, tbx1
    mov ah, 9
    int 21h    
    mov ax, tong 
    call Xuat
    
    ;===== Xuat Hieu =====    
    lea dx, tbx2
    mov ah, 9
    int 21h    
    mov ax, hieu 
    call Xuat
    
    ;===== Xuat Tich =====    
    lea dx, tbx3
    mov ah, 9
    int 21h    
    mov ax, tich 
    call Xuat
    
    ;===== Xuat Thuong =====    
    lea dx, tbx4
    mov ah, 9
    int 21h    
    mov ax, thuong 
    call Xuat
    
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

Xuat proc    
    xor cx, cx
    mov bl, 10
    
    for2: 
        xor dx, dx
        div bx
        push dx    ;Dua du lieu DX vao ngan xep
        inc cx
        or ax, ax
        jnz for2
    
    mov ah, 2
    for3:
        pop dx     ;Lay du lieu tu ngan xep vao DX
        or dl, 30h ;Chuyen HEX sang DECIMAL (0 -> 9)
        int 21h
    loop for3          
        
    ret
Xuat endp

Tinh proc
    ;Tinh tong
    mov ax, x
    add ax, y
    mov tong, ax 
        
    ;Tinh hieu
    mov ax, x
    sub ax, y
    mov hieu, ax
    
    ;Tinh tich
    mov ax, x
    mov bx, y
    mul bx
    mov tich, ax
    
    ;Tinh thuong
    mov dx, 0
    mov ax, x
    mov bx, y
    div bx
    mov thuong,ax  
    ret  
Tinh endp
end