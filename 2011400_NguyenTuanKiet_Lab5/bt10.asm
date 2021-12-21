.model small
.stack 100h
.data
    tbn1 db 'Nhap chieu dai: $'
    tbn2 db 13, 10, 'Nhap chieu rong: $'
    tbx1 db 13, 10, 'Chu vi hinh chu nhat: $'
    tbx2 db 13, 10, 'Dien tich hinh chu nhat: $'
    d dw 0
    r dw 0                        
    tam dw 0
    cv dw ?
    dt dw ?
.code
    mov ax, @data
    mov ds, ax   
    
    ;===== Nhap chieu dai =====   
    lea dx, tbn1
    call Nhap 
    xor ah, ah
    mov d, ax
    
    ;===== Nhap chieu rong =====
    lea dx, tbn2
    call Nhap
    xor ah, ah
    mov r, ax
    
    ;===== Tinh Chu vi, Dien tich =====
    call Tinh
    
    ;===== Xuat Chu vi =====    
    lea dx, tbx1
    mov ah, 9
    int 21h    
    mov ax, cv 
    call Xuat
    
    ;===== Xuat Dien tich =====   
    lea dx, tbx2
    mov ah, 9
    int 21h 
    mov ax, dt
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
    ;Tinh chu vi
    mov ax, d
    add ax, r
    add ax, ax
    mov cv, ax 
        
    ;Tinh dien tich
    mov ax, d
    mov bx, r
    mul bx
    mov dt, ax  
    ret  
Tinh endp
end