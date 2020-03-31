	thumb

	area 	moncode, code, readonly
	export 	M2
	extern	TabCos
	extern	TabSin

N	EQU	128

M2	proc
	;r0 adresse de l'element x(i) (initialement adresse de base du signal)
	;r1 est la valeur de k
	;r2 est l'adresse de la table de cos
	;r3 est l'adresse de la table de sin
	;r4 vaut ik
	;r5 adresse de fin de la table signal
	;r6 est cos(ik)
	;r7 est x(i)
	;r5 est sin(ik)
	;r12 est la valeur de la somme (cos)
	;r9 est la valeur de la somme (sin)
	push	{r4, r5, r6, r7, r8, r9}
	ldr	r2, =TabCos
	ldr	r3, =TabSin
	mov	r5, #N
	add	r5, r0
	mov	r12, #0
	mov	r4, #0
	mov	r9, #0
	
Boucle
	
	ldrsh	r7, [r0], #2 ; r7 = x(i) (adresse = r0) | puis r0 = r0+2 | r7 format 1.15
	ldrsh	r6, [r2, r4, LSL #1] ; r6 = cos(ik) (adresse = r2 + r4 * 2) | r6 format 1.15
	ldrsh	r8, [r3, r4, LSL #1] ; r8 = sin(ik) (adresse = r3 + r4 * 2) | r8 format 1.15
	
	mla	r12, r6, r7, r12
	mla	r9, r8, r7, r9
		
	add	r4, r1 ;calcul de ik
	and	r4, #63 ; modulo N=64
	cmp 	r5, r0 ; 
	bne 	Boucle ;Si r5!=r3, on boucle

	smull	r1, r0, r12, r12 ; r1,r0 = Re(k)²
	smlal	r1, r0, r9, r9 ; r1,r0 = Re(k)² + Im(k)²
	
	pop	{r4, r5, r6, r7, r8, r9}
	bx	lr
	endp

;
	end
