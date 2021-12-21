.model small
.stack 100h
.data
    tbn db 'Nhap so thap phan: $'
    tbx db 13, 10, 'So thap phan vua nhap la: $'
    tam dw 0
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, tbn
    call Nhap
    
    lea dx, tbx
    mov ah, 9
    int 21h 
    mov ax, tam
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
end