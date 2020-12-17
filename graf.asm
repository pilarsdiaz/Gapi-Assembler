;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		Editor de Texto		;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autores: 	Gary Omar Nova Mamani
; 			Pilar Sahonero Diaz
; Descripcion:	Editor de texto básico hecho en lenguaje ensamblador
include extras.mac
.model small
.stack 64
.data
	;Variables de la pantalla 
	color db 70h
	lineas db 0
	fini db 0
	cini db 0
	ffin db 24
	cfin db 79
	
	;posicion para los mensajes 
	pag db 0
	fila db 19
	columna db 0

	;mensajes 
	msj db 'GAPI - Assembler v1 - Text Editor$'
	msj1 DB 0AH, 0DH, 	'1 Crear		2 Gurdar		3 Abrir			4 Modificar','$'
	msj2 DB 0AH, 0DH, 	'5 Eliminar	6 Salir			Selec. Opcion:  $'	
	option_file db "Nombre del archivo: $"
	texto db 100 dup('$')
	opcion db 0
	;msj1 db '1 Crear $'
	;msj2 db '2 Guardar $'
	;msj3 db '3 Abrir $'
	;msj4 db '4 Modificar $'
	;msj5 db '5 Eliminar $'
	;msj6 db '6 Salir $'

.code

Inicio:
	mov ax,@data
	mov ds, ax
;---------------------------
	call clrscr
	call Pinta_title
	call Pinta_menu
	call Pinta_Select_option
	call Pinta_nombrearch
	jmp salir
	

salir:	
	
;---------------------------
	mov ah,4ch
	int 21h
;---proc
Pinta_title proc
	mov color,20h
	mov lineas,0
	mov fini,0
	mov cini,0
	mov ffin,0
	mov cfin,80
	mov fila,0
	mov columna,22
	call clrscr
	call gotoxy
	PRINT_STRING msj
	Ret
Pinta_title endp

Pinta_menu proc
	;Menu del editor 
	mov color,02h
 	mov lineas,5
 	mov fini,19
 	mov cini,0
 	mov ffin,24
 	mov cfin,79
 	call clrscr
	;primera fila de mensajes 
	mov fila,19
	mov columna,0
	call gotoxy
	PRINT_STRING msj1
	
	;segunda fila de mensajes 
	mov fila,21
	call gotoxy
	PRINT_STRING msj2
	
	Ret
Pinta_menu endp

Pinta_Select_option proc
	mov fila,22
	mov columna,55
	call gotoxy
	READ_STRING opcion
	add opcion,30
	Ret
Pinta_Select_option endp

Pinta_nombrearch proc
	;Mensaje para el nombre del archivo 
	mov color,67h
 	mov lineas,1
 	mov fini,19
 	mov cini,0
 	mov ffin,19
 	mov cfin,79
 	call clrscr
	;mensaje para guardar el nombre 
	mov fila,19
	mov columna,1
	call gotoxy
	PRINT_STRING option_file
	mov fila,19
	mov columna,20
	call gotoxy
	READ_STRING texto
	Ret
Pinta_nombrearch endp

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
