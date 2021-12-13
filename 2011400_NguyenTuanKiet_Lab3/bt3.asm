.model small
.stack
.data
.code
main proc
    mov ah, 2  
    mov cx, 26
    mov dl, 'A'
inChuHoa:       
    int 21h
    inc dl
    loop inChuHoa
       
    mov ah, 4Ch
    int 21h
endp
end main