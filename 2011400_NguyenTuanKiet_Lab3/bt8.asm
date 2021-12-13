.model small
.stack
.data
    tbn db 'Nhap mot chu thuong (a-z): $'
    tbx db 13, 10, 'Chu hoa tuong ung: $'
    kt db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;xuat thong bao nhap
    lea dx, tbn
    mov ah, 9
    int 21h
    
    ;nhap 1 ky tu (khong hien thi)
    mov ah, 8
    int 21h
    
    ;luu va chuyen ky tu sang hoa
    mov kt, al
    sub kt, 32    
    
    ;xuat thong bao xuat
    lea dx, tbx
    mov ah, 9
    int 21h
    
    ;xuat ky tu   
    mov ah, 2
    mov dl, kt
    int 21h
    
    mov ah, 4Ch
    int 21h
endp
end main