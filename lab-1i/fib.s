.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG

	push {r3,r4,r5,r6,lr}
	@ pre = r3 = -1
	@ res = r4 = 1
	@ sum = r5 = 0

	mov r3, #-1
	mov r4, #1
	mov r5, #0
	mov r6, r0 @ mov r6, #1 >>> wrong!
	
.loop:
	add r5, r4, r3
	mov r3, r4
	mov r4, r5
	subs r6, r6, #1
	it ge
	bge .loop

	mov r0, r5
	pop {r3, r4, r5, r6, pc}
	.size fibonacci, .-fibonacci
	.end
