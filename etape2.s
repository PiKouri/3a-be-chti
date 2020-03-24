
	thumb
		
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register

	area  	moncode, code, readonly
	extern	TabCos
	extern	TabSin
	export	calcul

calcul	proc
	
	ldr	r2, =TabCos
	ldr	r3, =TabSin
	add	r0, r0
	ldrsh	r1, [r2, r0]
	ldrsh	r12, [r3, r0]
	mul	r1, r1, r1
	mla	r0, r12, r12, r1 	
	bx	lr
	endp
;
	end
