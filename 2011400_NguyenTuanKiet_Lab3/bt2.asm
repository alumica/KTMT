.model small
.stack
.data
    tbNhap db 'Nhap mot ky tu: $'
    tbKhac db 13, 10, 'Ky tu nhap khac chu/so$'
    tbChu db 13, 10, 'Ky tu nhap la chu$'
    tbSo db 13, 10, 'Ky tu nhap la so$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tbNhap
    int 21h       
    
    mov ah, 1
    int 21h
    
    ; kytu < 0
    cmp al, '0'
    jb Khac
    
    ;0 >= kytu <= 9
    cmp al, '9'
    jbe So 
        
    ;kytu < A
    cmp al, 'A'
    jb Khac
    
    ;A >= ky tu <=Z
    cmp al, 'Z'
    jbe Chu
    
    ;kytu < a
    cmp al, 'a'
    jb Khac 
    
    ;0 >= kytu <= z
    cmp al, 'z'
    jbe Chu
    
Khac:
    lea dx, tbKhac
    jmp Thoat
So: 
    lea dx, tbSo
    jmp Thoat
Chu:     
    lea dx, tbChu    
Thoat:
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h 
endp
end main