
	thumb
		
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register

	area  	moncode, code, readonly
	extern	TabCos
	extern	TabSin

calcul	proc
	
	ldr	r2, =TabCos
	ldr	r3, =TabSin
	ldrsh	r1, [r2, #4]
	bx	lr;
	endp
;
	end
