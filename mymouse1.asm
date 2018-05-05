.model small 
org 100h
.data 
design db 10,13,"***************************************$"
msg db 10,13, "Click the mouse I ll play music for You$"
msg1 db 10,13, "Play again!!! Yes-->Y No-->N$"  
  
.code 
main:jmp start 
 XCords1 dw 160        
  YCords1 dw 100       
  mouseclick   dw 0
  x       dw ?         
  y       dw ?         
  stor  dw 0  
  
 
start:
mov  ax, @data
mov  ds, ax 
call curs_off 

mov  ax, 13h
int  10h
call SetCursor 
l:
call DotOne


DotGame:
mov  bx, 1       
call GetMouseState
and  bx, 00000010b  
jz   DotGame
     
curs_off proc 
mov     ch,10h          
mov     ah,1            
int     10h             
ret 
endp
curs_on proc 
        mov     cx,0506h        
        mov     ah,1            
        int     10h             
        ret  
endp

SetCursor proc 
mov ax, 0h
int 33h
mov ax, 1h
int 33h
ret
endp

DotOne proc 
  mov  ah, 0ch      
  mov  al, 14        
  mov  bh, 0         
  mov  cx, XCords1
  mov  dx, YCords1
  int  10h 
  mov dx,offset design
  mov ah,09h
  int 21h 
  mov dx,offset msg
  mov ah,09h
  int 21h           
  ret
endp  



choice proc
    mov dx,offset msg1
    mov ah,09h
    int 21h  
    mov ah,01h
    int 21h
    cmp al,'y'
    je l
    mov ah,4ch
    int 21h  
    endp 
    
GetMouseState proc 
  mov  ax, 3       
  int  33h
  mov mouseclick,bx  
  cmp bx,0
  je GetMouseState 
  cmp bx, 1
  je left_click
  cmp bx,2
  je right_click
  jne GetMouseState 
  ret
endp 
left_click:
    
     mov     ax,7753
        mov     stor, ax
        call    sounder          
        mov     ax,7739
        mov     stor, ax
        call    sounder
         mov     ax,8235
        mov     stor, ax
        call    sounder
         mov     ax,3579
        mov     stor, ax
        call    sounder
         mov     ax,5145
        mov     stor, ax
        call    sounder 
         mov     ax,3137
        mov     stor, ax
        call    sounder
         mov     ax,3239
        mov     stor, ax
        call    sounder 
        mov     ax,2434
        mov     stor, ax
        call    sounder
         mov     ax,9394
        mov     stor, ax
        call    sounder
         mov     ax,1239
        mov     stor, ax
        call    sounder  
         mov     ax,2153
        mov     stor, ax
        call    sounder 
         mov     ax,7753
        mov     stor, ax
        call    sounder          
        call choice 
         

    

right_click: 
        mov     ax,2153
        mov     stor, ax
        call    sounder          
        mov     ax,3239
        mov     stor, ax
        call    sounder
         mov     ax,3235
        mov     stor, ax
        call    sounder
         mov     ax,3579
        mov     stor, ax
        call    sounder
         mov     ax,3145
        mov     stor, ax
        call    sounder 
         mov     ax,3137
        mov     stor, ax
        call    sounder
         mov     ax,3239
        mov     stor, ax
        call    sounder 
        mov     ax,3234
        mov     stor, ax
        call    sounder
         mov     ax,2394
        mov     stor, ax
        call    sounder
         mov     ax,1239
        mov     stor, ax
        call    sounder  
         mov     ax,2153
        mov     stor, ax
        call    sounder          
        mov     ax,3239
        mov     stor, ax
        call    sounder
         mov     ax,3235
        mov     stor, ax
        call    sounder
         mov     ax,3579
        mov     stor, ax
        call    sounder
         mov     ax,3900
        mov     stor, ax
        call    sounder 
         mov     ax,4125
        mov     stor, ax                   
        call    sounder
         mov     ax,3239
        mov     stor, ax
        call    sounder 
        mov     ax,3239
        mov     stor, ax
        call    sounder
         mov     ax,7809
        mov     stor, ax
        call    sounder
         mov     ax,2239
        mov     stor, ax 
        call    sounder 
        mov     ax,8999
        mov     stor, ax
        call    sounder 
        mov     ax,23459
        mov     stor, ax
        call    sounder
         mov     ax,11233
        mov     stor, ax
        call    sounder
         mov     ax,22345 
         mov     stor, ax
        call    sounder
         jmp     Right_Click1
         
         
 Right_Click1: 
        mov     ax,11233
        mov     stor, ax
        call    sounder          
        mov     ax,22345
        mov     stor, ax
        call    sounder
         mov     ax,3237
        mov     stor, ax
        call    sounder
         mov     ax,3589
        mov     stor, ax
        call    sounder
         mov     ax,3156
        mov     stor, ax
        call    sounder 
         mov     ax,3137
        mov     stor, ax
        call    sounder
         mov     ax,3267
        mov     stor, ax
        call    sounder 
        mov     ax,9995
        mov     stor, ax
        call    sounder
         mov     ax,2884
        mov     stor, ax
        call    sounder
         mov     ax,1259
        mov     stor, ax
        call    sounder  
         mov     ax,2133
        mov     stor, ax
        call    sounder          
        mov     ax,3239
        mov     stor, ax
        call    sounder
         mov     ax,3235
        mov     stor, ax
        call    sounder
         mov     ax,3579
        mov     stor, ax
        call    sounder
         mov     ax,3900
        mov     stor, ax
        call    sounder 
         mov     ax,4125
        mov     stor, ax                   
        call    sounder
         mov     ax,3239
        mov     stor, ax
        call    sounder 
        mov     ax,3239
        mov     stor, ax
        call    sounder
         mov     ax,7809
        mov     stor, ax
        call    sounder
         mov     ax,2239
        mov     stor, ax 
        call    sounder 
        mov     ax,8999
        mov     stor, ax
        call    sounder 
        mov     ax,23459
        mov     stor, ax
        call    sounder
         mov     ax,11233
        mov     stor, ax
        call    sounder
         mov     ax,22345 
         call    choice 
                 

        
sounder:
        mov     al,10110110b    
        out     43h,al          
        mov     ax,stor         
        out     42h,al          
        mov     al,ah           
        out     42h,al          
        in      al,61h          
        or      al,00000011b   
        out     61h,al         
        call    delay          
        and     al,11111100b   
        out     61h,al            
        ret            
  
exit proc
        call    curs_on        
        int     20h
        mov ah,4ch
        int 21h
        endp   
        

delay:
        mov     ah,00h          
        int     01Ah            
        add     dx,4            
        mov     bx,dx           
pozz:
        int     01Ah           
        cmp     dx,bx          
        jl      pozz           
        ret                    


end main


