	thumb

	area 	moncode, code, readonly
	export 	M2
	extern	TabCos
	extern	TabSin

N	EQU	128

M2	proc
	push	{lr, r4, r5, r0, r1}
	ldr	r2, =TabCos
	
	bl	calcul

	smull	r4, r5, r0, r0 ; r3,r4 = Re(k)�

	pop	{r0, r1}

	ldr	r2, =TabSin
	bl	calcul
	
	smlal	r4, r5, r0, r0 ; r0 = Im(k)�
	
	mov	r0, r5 ; on garde les 32 bits de poids fort
	pop	{pc, r4, r5}
	endp

calcul	proc
	;r0 adresse de l'element x(i) (initialement adresse de base du signal)
	;r1 est la valeur de k
	;r2 est l'adresse de la table de cos
	;r3 est adresse du tableau de signal
	;r4 vaut ik
	;r6 est cos(ik)
	;r7 est x(i)
	;r12 est la valeur de la somme
	push 	{r4, r6, r7}
	mov	r3, #N
	add	r3, r0
	mov	r12, #0
	mov	r4, #0
	
Boucle
	
	ldrsh	r7, [r0], #2 ; r7 = x(i) (adresse = r0) | puis r0 = r0+2 | r7 format 1.15
	ldrsh	r6, [r2, r4, LSL #1] ; r6 = cos(ik) (adresse = r2 + r4 * 2) | r7 format 1.15
	
	mla	r12, r6, r7, r12
		
	add	r4, r1 ;calcul de ik
	and	r4, #63 ; modulo N=64
	cmp 	r3, r0 ; 
	bne 	Boucle ;Si r5!=r3, on boucle
	
	pop 	{r4, r6, r7}
	mov 	r0, r12 ; r0 format 2.30

	bx	lr
	endp
;
	end
