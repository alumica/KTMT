.model small
.stack
.data
    tbn db 'Nhap so nhi phan (toi da 16 bit): $'
    tbx db 13, 10, 'So nhi phan da nhap: $' 
    tam db ?
.code
    mov ax, @data
    mov ds, ax
    
    xor bx, bx
    xor cx, cx
    
    lea dx, tbn
    mov ah, 9    
    int 21h
    
    
    input:
        cmp cx, 16
        je endInput 
        mov ah, 1 
        int 21h
        
        ;check
          
        cmp al, 13
        je endInput
        cmp al, '0'
        je save
        cmp al, '1'
        je save
                
        
        ;xoa ky tu khac 0, 1 
        mov ah, 2
        mov dl, 8
        int 21h
        mov dl, 32
        int 21h 
        mov dl, 8
        int 21h
        jmp input
    save:
        and al, 0Fh ;doi sang 0, 1
        shl bx, 1 ;dich sang trai 1 bit
        or bl, al ;luu vao bl
        inc cx
        jmp input
    endInput: 
        lea dx, tbx
        mov ah, 9
        int 21h 
        
        ;kiem tra so phan tu nhap vao       
        mov tam, 16
        sub tam, cl
        cmp tam, 0
        je output
    ;xoa cac bit du       
    delBit:
        rol bx, 1
        dec tam
        cmp tam, 0
        jne delBit
  
        ;xuat ket qua    
    output:
        rol bx, 1
        jc out1
        mov dl, '0'
        mov ah, 2
        int 21h
        jmp exit
    out1:
        mov dl, '1'
        mov ah, 2
        int 21h
    exit:
        dec cx
        cmp cx, 0h
        jne output
    
    
    mov ah, 4Ch
    int 21h 
end