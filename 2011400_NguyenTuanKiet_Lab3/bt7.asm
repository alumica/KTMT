.model small
.stack
.data
    tbNhap db 13, 10, 'Nhap mot ky tu: $'
    tbKhac db 13, 10, 'Ky tu nhap khac chu/so$'
    tbChu db 13, 10, 'Ky tu nhap la chu$'
    tbSo db 13, 10, 'Ky tu nhap la so$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
Nhap:    
    mov ah, 9
    lea dx, tbNhap
    int 21h       
    
    mov ah, 1
    int 21h
    
    ;ESC
    cmp al, 27
    je Thoat
    
    ;kytu < 0
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
    mov ah, 9
    int 21h
    jmp Nhap
So: 
    lea dx, tbSo
    mov ah, 9
    int 21h
    jmp Nhap
Chu:     
    lea dx, tbChu 
    mov ah, 9
    int 21h
    jmp Nhap   
Thoat:   
    mov ah, 4Ch
    int 21h 
endp
end main