mov ah, 0eh  ; this will begin to print the welcome message
mov al, 'W'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'c'
int 0x10
mov al, 'o'
int 0x10
mov al, 'm'
int 0x10
mov al, 'e'
int 0x10
mov al, ' '
int 0x10
mov al, 't'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 't'
int 0x10
mov al, 'y'
int 0x10
mov al, 'p'
int 0x10
mov al, 'e'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10
mov al, 1Bh
int 0x10
jmp br      ;prints a line break so that you dont use backspace to get rid of the welcome message
getKey:     ; pretty self-explanatory
mov ah, 0h
int 0x16
mov ah, 0eh ;prints what you type to the screen
cmp al, 0Dh ;compares the key that you pressed to the enter key
je br       ;if it is then it will jump to br which will print a line break
cmp al, 08h ;compares the key that you pressed to the backspace key
je back     ; if it is then jump to back which removes the character to the left of the cursor.
int 0x10
jmp getKey  ;get the next key
br:         ; adds functionality for the enter key
mov al, 0Ah ; go to the next line
int 0x10
mov al, 0Dh
int 0x10
jmp getKey
back:       ;adds functionality for the backspace key
mov al, 08h ;prints backspace (this moves the cursor back)
int 0x10
mov al, 00h ;prints null
int 0x10
mov al, 08h ;prints backspace
int 0x10
jmp getKey
jmp $       ; jump to the current memory address, an infinite loop
times 510-($-$$) db 0
dw 0xAA55   ; this makes the bios see my code as bootable and not just data that happens to look like machine code when compiled