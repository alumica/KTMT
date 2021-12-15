.model small
.stack 100h
.data
    tbNhap db 13, 10, 'Nhap mot ky tu (hoac ESC): $'
    tbChu db 13, 10, 'Ky tu da nhap la chu$'
    tbSo db 13, 10, 'Ky tu da nhap la so$'
    tbKhac db 13, 10, 'Ky tu da nhap khac chu/so$'
.code
    mov ax, @data
    mov ds, ax

    Nhap:    
        mov ah, 9
        lea dx, tbNhap
        int 21h
    
        mov ah, 1
        int 21h 
        
        cmp al, 27
        je exit        
        call Check            
        jmp Nhap        
    exit:    
        mov ah, 4Ch
        int 21h
    
    Check proc
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
    ret    
    Check endp    
end