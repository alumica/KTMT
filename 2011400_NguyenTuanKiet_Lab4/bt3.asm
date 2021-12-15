.model small
.stack
.data
    tbn db 13, 10, 'Nhap mot chu thuong (a-z): $'
    tbx db 13, 10, 'Chu hoa tuong ung: $'
    kt db ?
.code 
    
    call Nhap
    call Xuat
    
    mov ah, 4Ch
    int 21h
        
    Nhap proc 
        mov ax, @data
        mov ds, ax                   
        
        NhapLai:
            lea dx, tbn 
            mov ah, 9
            int 21h   
                     
            mov ah, 1
            int 21h
       
            ;kytu < a
            cmp al, 'a'            
            jb NhapLai 
            
            ;a >= kytu <= z
            cmp al, 'z'
            jbe Chuyen
        
        Chuyen:
            mov cx, 0                     
            sub al, 20h         
            mov kt, al
            loope Chuyen
        
        ret
    Nhap endp   
    
    Xuat proc
        lea dx, tbx
        mov ah, 9
        int 21h
        
        mov ah, 2
        mov dl, kt
        int 21h
        
        ret    
    Xuat endp
    
end