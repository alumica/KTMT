.model small  
.stack 100h
.data 
    tb1 db "Hay nhap mot ky tu: $" 
    tb2 db 0Dh,0Ah,"Ky tu da nhap: $" 
    kt db ?
.code      
main proc
    mov ax, @data
    mov ds, ax
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov kt, al
    
    lea dx, tb2
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, kt
    int 21h

main endp
end main
