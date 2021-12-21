.model small
.stack 100h
.data
    tbn db 'Nhap gia tri vao thanh ghi BX: $'
    tbx db 13, 10, 'Gia tri dau tien: $'
.code 
    xor cx, cx
    mov ax, @data
    mov ds, ax
    
    lea dx, tbn
    mov ah, 9
    int 21h
    
Nhap:
   mov ah, 1
   int 21h
   cmp al, 13
   je Enter
   inc cx
   push ax
   jmp Nhap 
Enter:
    lea dx, tbx
    mov ah, 9
    int 21h   
   
Xuat:  
   pop bx
   dec cx
   cmp cx, 0
   je Xuat1 
   cmp cx, 0
   jne Xuat
Xuat1:
    mov dx, bx
    mov ah, 2
    int 21h
           
    mov ah, 4Ch
    int 21h
end