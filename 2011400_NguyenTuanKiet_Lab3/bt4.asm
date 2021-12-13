.model small
.stack 100h
.data
    tbn db 'Nhap mot ky tu: $'
    tbx db 13, 10, 'Nam ky tu ke tiep: $'  
    d db 10
    kt db ?
.code
main proc  
    mov ax, @data
    mov ds, ax
    
    lea dx, tbn
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    
    mov kt, al
    
    mov ah, 9
    lea dx, tbx    
    int 21h  
    
    mov ah, 2
    mov cx, 5
    
PrintLoop:      
    inc kt
    mov dl, kt
    int 21h 
    mov kt, dl
    mov dl, 10
    int 21h 
    mov dl, 8
    int 21h    
    loop PrintLoop
    
    mov ah, 4ch
    int 21h    
main endp
end