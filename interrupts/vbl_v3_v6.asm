	icl "test.h"

	org $f0
regA	.ds 1
regX	.ds 1
regY	.ds 1

;	org $2000\ mva #$ff portb\ rts\ ini $2000; ---	BASIC switch OFF

	org $2000

main	lda $14
		cmp	$14
		beq	main	; :cmp:req $14		;wait 1 frame

		sei			;stop IRQ interrupts

		cld
		clv

		mva #$00 nmien		;stop NMI interrupts
		sta dmactl
		mva #$fe portb		;switch off ROM to get 16k more ram

		mwa #NMI $fffa		;new NMI handler

		mva #$c0 nmien		;switch on NMI+DLI again

mloop 	jmp mloop

.local	DLI
		sta regA
		stx regX
		sty regY

		lda consol

dli_st	inc VBL.c0+1	; my code

		lda regA
		ldx regX
		ldy regY
		rti
.endl

.local	NMI

		bit nmist
		bpl VBL

dli_adr	jmp DLI		; dli start address
.endl

.local	VBL
		sta regA
		stx regX
		sty regY

		sta nmist		;reset NMI flag

		mwa #dsp_lst dlptr		;ANTIC address program

		mva #@dmactl(standard|dma|lineX1|players|missiles) dmactl	;set new screen width

		lda >fnt+$400*$00	; Initial values
		sta chbase
c0		lda #$00
		sta colbak
c1		lda #$04
		sta color0
c2		lda #$06
		sta color1
c3		lda #$08
		sta color2
c4		lda #$0E
		sta color3
		lda #$02
		sta chrctl
		lda #$04
		sta gtictl
		lda #$00
		sta hposp0
		sta hposp1
		sta hposp2
		sta hposp3
		sta hposm0
		sta hposm1
		sta hposm2
		sta hposm3
		sta sizep0
		sta sizep1
		sta sizep2
		sta sizep3
		sta sizem
		sta colpm0
		sta colpm1
		sta colpm2
		sta colpm3

		inc c3 +1	; my code

		lda regA
		ldx regX
		ldy regY
		rti
.endl

dsp_lst	dta $44,a(scn_adr)
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $80
	dta $04,$04
	dta $04
		dta $41,a(dsp_lst)

scn_adr	ins "test.scn"

	.ds 0*40

	.ALIGN $0400
fnt	ins "test.fnt"

	opt l-
