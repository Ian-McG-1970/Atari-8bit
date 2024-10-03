/***************************************/
/*  Use MADS http://mads.atari8.info/  */
/*  Mode: DLI (char mode)              */
/***************************************/

	icl "test.h"

	org $f0

fcnt	.ds 2
fadr	.ds 2
fhlp	.ds 2
cloc	.ds 1
regA	.ds 1
regX	.ds 1
regY	.ds 1

WIDTH	= 4	0
HEIGHT	= 30

; ---	BASIC switch OFF
;	org $2000\ mva #$ff portb\ rts\ ini $2000

; ---	MAIN PROGRAM
	org $2000

main
	lda:cmp:req $14		;wait 1 frame

	sei					;stop IRQ interrupts
	mva #$00 nmien		;stop NMI interrupts
	sta dmactl
	mva #$fe portb		;switch off ROM to get 16k more ram

	mwa #NMI $fffa		;new NMI handler

	mva #$c0 nmien		;switch on NMI+DLI again

	jmp DLI.dli1		;CPU is busy here, so no more routines allowed

	mva #$00 pmcntl		;PMG disabled
	tax
	sta:rne hposp0,x+

	mva #$ff portb		;ROM switch on
	mva #$40 nmien		;only NMI interrupts, DLI disabled
	cli			;IRQ enabled

	rts			;return to ... DOS

; ---	DLI PROGRAM

.local	DLI

	?old_dli = *

	ift !CHANGES

dli1	lda trig0		; FIRE #0
	beq stop

	lda trig1		; FIRE #1
	beq stop

	lda consol		; START
	and #1
	beq stop

	lda skctl
	and #$04
	beq stop

	lda vcount
	cmp #$02
	bne dli1

	:3 sta wsync

	jmp NMI.quit
	eif


dli_start
	inc NMI.c0+1

.endl

; ---

CHANGES = 0
FADECHR	= 0

SCHR	= 127

; ---

.proc	NMI

	bit nmist
	bpl VBL

	jmp DLI.dli_start
dliv	equ *-2

VBL
	sta regA
	stx regX
	sty regY

	sta nmist		;reset NMI flag

	mwa #display_list dlptr		;ANTIC address program

	mva #@dmactl(standard|dma|lineX1|players|missiles) dmactl	;set new screen width

	inc cloc		;little timer

; Initial values

	lda >CHAR_SET+$400*$00
	sta chbase
c0	lda #$00
	sta colbak
c1	lda #$04
	sta color0
c2	lda #$06
	sta color1
c3	lda #$08
	sta color2
c4	lda #$0E
	sta color3
	lda #$02
	sta chrctl
	lda #$04
	sta gtictl
x0	lda #$00
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

	mwa #DLI.dli_start dliv	;set the first address of DLI interrupt

;this area is for yours routines
 inc c3 +1

quit
	lda regA
	ldx regX
	ldy regY
	rti

.endp

DISPLAY_LIST	
	dta $44,a(SCREEN_DISPLAY)
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
	dta $41,a(DISPLAY_LIST)

SCREEN_DISPLAY	
	ins "test.scn"
	.ds 0*40
	
	.ALIGN $0400
CHAR_SET
	ins "test.fnt"


; ---
	run main
; ---

	opt l-

.MACRO	SPRITES
missiles
	.ds $100
player0
	.ds $100
player1
	.ds $100
player2
	.ds $100
player3
	.ds $100
.ENDM

;USESPRITES = 0

.MACRO	DLINEW
	mva <:1 NMI.dliv
	ift [>?old_dli]<>[>:1]
	mva >:1 NMI.dliv+1
	eif

	ift :2
	lda regA
	eif

	ift :3
	ldx regX
	eif

	ift :4
	ldy regY
	eif

	rti

	.def ?old_dli = *
.ENDM

