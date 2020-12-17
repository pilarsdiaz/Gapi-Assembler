;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		Editor de Texto		;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autores: 	Gary Omar Nova Mamani
; 			Pilar Sahonero Diaz
; Descripcion:	Editor de texto básico hecho en lenguaje ensamblador

.model small
.stack 64
.data
	
	color db 70h
	lineas db 0
	fini db 0
	cini db 0
	ffin db 24
	cfin db 79
	
	pag db 0
	fila db 20
	columna db 0

	msj1 db '1 Crear $'
	msj2 db '2 Guardar $'
	msj3 db '3 Abrir $'
	msj4 db '4 Modificar $'
	msj5 db '5 Eliminar $'
	msj6 db '6 Salir $'

.code

Inicio:
	mov ax,@data
	mov ds, ax
;---------------------------
	call clrscr
	;Menu del editor 
	mov color,30h
 	mov lineas,5
 	mov fini,19
 	mov cini,0
 	mov ffin,24
 	mov cfin,79
 	call clrscr
	;Crear
	call gotoxy
	mov ah,09h
	lea dx,msj1
	int 21h
	; Guardar
	add columna,9
	call gotoxy
	mov ah,09h
	lea dx,msj2
	int 21h
	
	;Abrir
	add columna,19
	call gotoxy
	mov ah,09h
	lea dx,msj3
	int 21h

	

	jmp salir
	

salir:	
	
;---------------------------
	mov ah,4ch
	int 21h
;---proc	
clrscr proc
	push ax
	push bx
	push cx
	push dx
	mov ah,06h
	mov bh,color
	mov al,lineas
	mov ch,fini
	mov cl,cini
	mov dh,ffin
	mov dl,cfin
	int 10h
	pop dx
	pop cx
	pop bx
	pop ax
	Ret
clrscr endp

gotoxy proc
	push ax
	push bx
	push dx
	mov ah,02h
	mov bh,pag
	mov dh,fila
	mov dl,columna
	int 10h
	pop dx
	pop bx
	pop ax
 	ret
gotoxy endp
end Inicio
