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
<<<<<<< HEAD
	
	color db 70h
=======
; variables de menu
	title_text db 'GAPI - Assembler v1 - Text Editor$'
	msj1 db '1 Crear $'
	msj2 db '2 Guardar $'
	msj3 db '3 Abrir $'
	msj4 db '4 Modificar $'
	msj5 db '5 Eliminar $'
	msj6 db '6 Salir $'
; variables de limpia Pantalla
	color db 30h
>>>>>>> b9899a39630f4f5b123737a0937b8b8e01860dbb
	lineas db 0
	fini db 0
	cini db 0
	ffin db 24
	cfin db 79
<<<<<<< HEAD
	
	pag db 0
	fila db 20
	columna db 0

	
=======

>>>>>>> b9899a39630f4f5b123737a0937b8b8e01860dbb

.code

Inicio:
	mov ax,@data
	mov ds, ax
;=====================FUNCION PRINCIPAL====================
	call Pinta_title
	call Pinta_edit	
	call Pinta_menu
>>>>>>> b9899a39630f4f5b123737a0937b8b8e01860dbb
	jmp salir

	
;=====================FUNCIONES====================

salir:	
	mov ah,4ch
	int 21h
;====================METODOS=====================
Pinta_title proc
	mov color,67h
	mov fini,0
	mov cini,0
	mov ffin,1
	mov cfin,80
	call clrscr
	call gotoxy
	PRINT_STRING title_text
	Ret
Pinta_title endp

Pinta_edit proc
	mov color,70h
	mov fini,1
	mov cini,0
	mov ffin,21
	mov cfin,80
	call clrscr
	mov fila,1
	mov columna,2
	call gotoxy
	Ret
Pinta_edit endp

Pinta_menu proc
	mov color,20h
	mov fini,22
	mov cini,0
	mov ffin,26
	mov cfin,80
	call clrscr
	mov fila,0
	mov columna,0
	call gotoxy
	call Menu
	Ret
Pinta_menu endp

Menu proc
	PRINT_STRING msj
	PRINT_STRING msj2
	PRINT_STRING msj3
	PRINT_STRING msj4
	PRINT_STRING msj5
	PRINT_STRING msj6
	PRINT_STRING msj7
	Ret
Menu endp
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
<<<<<<< HEAD

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
=======
>>>>>>> b9899a39630f4f5b123737a0937b8b8e01860dbb
end Inicio
