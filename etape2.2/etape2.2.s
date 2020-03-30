
	thumb

	area 	moncode, code, readonly
	export 	calcul_reel
	extern 	N

calcul_reel	proc
	;r0 est l'adresse de base du signal
	;r1 est la valeur de k
	;r2 est l'adresse de la table de cos
	;r3 est la valeur de n
	;r4 vaut ik
	;r5 est le compteur de la boucle for
	;r6 est cos(ik)
	;r7 est x(i)
	;r12 est la valeur de la somme
	push 	{r4,r5,r6}
	ldr	r3, =N
	ldr 	r3, [r3]
	mov 	r5, #0
	
Boucle
	add 	r5, #1 ;On incrémente la valeur contenue dans r12
	
	add	r4, r5, r5
	ldrsh	r7,[r0,r4]
	
	mul	r4, r4, r1 ;calcul de ik
	ldrsh	r6, [r2, r4]
	
	mla	r12, r6, r7, r12
	
	cmp 	r3, r5
	bne 	Boucle ;Si r5!=r3, on boucle
	
	pop 	{r4,r5,r6}
	mov 	r0, r12
	bx	lr
	
	endp
;
	end
