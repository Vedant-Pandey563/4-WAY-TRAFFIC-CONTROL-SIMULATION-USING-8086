; controlling external device with 8086 microprocessor.

;intialization
#start=Traffic_Lights.exe#

name "traffic"


mov ax, all_red
out 4, ax

;main loop
mov si, offset situation


next:
mov ax, [si]     

out 4, ax

; wait 1 seconds (1 million microseconds)
mov     dx, 4240H
mov     ah, 86h
int     15h   

mov     cx, 0FH   
mov     dx, 4240H
mov     ah, 86h
int     15h


add si, 2 ; next situation
cmp si, sit_end
jb  next
mov si, offset situation
jmp next


situation        dw      0000_0011_0000_1100b
s1               dw      0000_0110_1001_1010b
s2               dw      0000_1000_0110_0001b
s3               dw      0000_1000_0110_0001b
s4               dw      0000_0100_1101_0011b
sit_end = $


all_red          equ     0000_0010_0100_1001b

                                     
                                     
                                     
; Defining car data structure
car_data        dw      0100h   ; Initial position 
car_speed       db      2       ; Initial speed
car_direction   db      1       ; 1 for right, 0 for left
                    
                    
                    
; Main simulation loop
main_loop:
    ; To Update car positions based on speed and direction
    ; Checking for collisions and handle intersection logic
    ; Generation of new cars randomly

    ; Delay to control simulation speed
    mov     cx, 0Fh
    mov     dx, 4240h
    mov     ah, 86h
    int     15h

    ; Continue the simulation loop

    jmp     main_loop