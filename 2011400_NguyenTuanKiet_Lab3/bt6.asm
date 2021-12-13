.model small
.stack
.data 
    tbn db 'Nhap mot ky tu: $'
    tbt db 13, 10, 'Nam ky tu dung truoc: $'
    tbs db 13, 10, 'Nam ky tu dung sau: $'  
    ktt db ?
    kts db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, tbn
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov ktt, al
    mov kts, al
    mov al, 6
    neg al
    add ktt, al    
    
    lea dx, tbt 
    mov ah, 9   
    int 21h  
    
    mov ah, 2
    mov cx, 5
    
Truoc:     
    inc ktt
    mov dl, ktt
    int 21h 
    mov ktt, dl  
    loop Truoc
    
    mov dl, '$' ;reset ky tu cuoi '$'
    lea dx, tbs
    mov ah, 9
    int 21h
     
    mov ah, 2
    mov cx, 5
    mov dl, kts 
    
Sau:            
    inc dl
    int 21h   
    loop Sau
    
    mov ah, 4Ch
    int 21h    
endp
end main