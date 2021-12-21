.model small
.stack 100
.data 
    tbn db 'Nhap so thap luc phan (toi da 4 ky so): $'
    tbx db 13, 10, 'So thap luc vua nhap: $'
    dem db ? ;toi da 4 ky so
.code
    mov ax, @data
    mov ds, ax
    mov dem, 0
    
    lea dx, tbn
    mov ah, 9
    int 21h
    xor bx, bx
    mov cl, 4
    
    n2: 
        cmp dem, 4
        je n8  
        mov ah, 1
        int 21h
        cmp al, 13
        je n8               
        
        cmp al, 30h ;kytu < 0
        jb del
        cmp al, 39h ;0 >= kytu <= 9
        jbe number 
        cmp al, 41h ;9 > kytu < A
        jb del
        
        cmp al, 46h ;A >= kytu <= F 
        jbe letter
    del:            ;Xoa ky tu nhap sai
        mov ah, 2   
        mov dl, 8h
        int 21h
        mov dl, 20h
        int 21h 
        mov dl, 8h
        int 21h 
        jmp n2
    number:
        and al, 0Fh
        jmp shift    
    letter:
        sub al, 37h
    shift:
        shl bx, cl
        or bl, al
        inc dem
        jmp n2    
    n8:
        xor dx, dx
        mov ax, @data
        mov ds, ax
        lea dx, tbx
        mov ah, 9
        int 21h
        mov cx, 4
    printHex:
        mov dl, bh
        shr dl, 4
        cmp dl, 9
        jg printLetter
        or dl, 30h
        mov ah, 2
        int 21h
        jmp exit
    printLetter:
        add dl, 37h
        mov ah, 2
        int 21h
    exit:
        shl bx, 4
    loop printHex 
    
    mov ah, 4Ch
    int 21h
end