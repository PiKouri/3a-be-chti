
	thumb
		
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
		
;Initialisation de la variable etat, qui permet de retrouver l'etat de PB1
	area  	madata, data, readwrite
	export 	etat

etat	dcd	0

	
	area  	moncode, code, readonly
	export 	timer_callback
;		
timer_callback	proc
	
	ldr  	r0 ,=etat	;On recupère l'addresse de etat
	ldr  	r2 ,[r0]	;Puis son contenu
	cbnz 	r2 ,cas_1	;Si PB1 n'est pas à 0, on vas à cas_1
	cbz 	r2 ,cas_0	;Si PB1 est à 0, on vas à cas_0
	bx	lr		; dernière instruction de la fonction
	endp
	
cas_1	proc
; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
	mov 	r2, #0x00000000
	str	r2, [r0]
	bx	lr		; dernière instruction de la fonction
	endp
	
cas_0	proc
	; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	mov 	r2, #0x00000001
	str	r2, [r0]
	bx	lr		; dernière instruction de la fonction
	endp
;
	end
