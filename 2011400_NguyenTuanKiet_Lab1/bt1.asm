.model small
.stack 100h
.data    
    str1 db "Hello, world !$" 
    str2 db 13, 10, "Hello, solar system !$"  
    str3 db 13, 10, "Hello, universe !$"
.code       
main proc  
    mov ax, @data     
    mov ds, ax
    
    lea dx, str1
    mov ah, 09h
    int 21h     
    
    lea dx, str2
    mov ah, 09h
    int 21h
      
    lea dx, str3
    mov ah, 09h
    int 21h    
    
    mov ah, 4ch
    int 21h
main endp 
end main
