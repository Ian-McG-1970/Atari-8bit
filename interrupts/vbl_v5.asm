	ICL "TEST.H"
	ORG $F0

CLOC	.DS 1
REGA	.DS 1
REGX	.DS 1
REGY	.DS 1

WIDTH	= 4	0

; ---	BASIC switch OFF
;	org $2000\ mva #$ff portb\ rts\ ini $2000

	ORG $2000
MAIN	lda $14
		cmp	$14
		beq	MAIN	; :cmp:req $14		;wait 1 frame

		CLD
		CLV

		SEI					;stop IRQ interrupts
		MVA #$00 NMIEN		;stop NMI interrupts
		STA DMACTl

		MVA #$FE PORTB		;switch off ROM to get 16k more ram

		MWA #NMI $FFFA		;new NMI handler

		MVA #$C0 NMIEN		;switch on NMI+DLI again

		JMP DLI.DLI1		;CPU is busy here, so no more routines allowed

;	mva #$00 pmcntl		;PMG disabled
;	tax
;	sta:rne hposp0,x+

;	mva #$ff portb		;ROM switch on
;	mva #$40 nmien		;only NMI interrupts, DLI disabled
;	cli			;IRQ enabled

;	rts			;return to ... DOS


.LOCAL	DLI

DLI1	LDA CONSOL		; START

DLI_ST	INC NMI.C0 +1

.ENDL

.LOCAL	NMI

		BIT NMIST
		BPL VBL

		JMP DLI.DLI_ST

VBL		STA REGA
		STX REGX
		STY REGY

		STA NMIST		;reset NMI flag

		MWA #DSP_LST DLPTR		;ANTIC address program

		MVA #@DMACTL(STANDARD|DMA|LINEX1|PLAYERS|MISSILES) DMACTL	;set new screen width

		INC CLOC		;little timer

; Initial values

		LDA >CHR_SET+$400*$00
		STA CHBASE
C0		LDA #$00
		STA COLBAK
C1		LDA #$04
		STA COLOR0
C2		LDA #$06
		STA COLOR1
C3		LDA #$08
		STA COLOR2
C4		LDA #$0E
		STA COLOR3
		LDA #$02
		STA CHRCTL
		LDA #$04
		STA GTICTL
X0		LDA #$00
		STA HPOSP0
		STA HPOSP1
		STA HPOSP2
		STA HPOSP3
		STA HPOSM0
		STA HPOSM1
		STA HPOSM2
		STA HPOSM3
		STA SIZEP0
		STA SIZEP1
		STA SIZEP2
		STA SIZEP3
		STA SIZEM
		STA COLPM0
		STA COLPM1
		STA COLPM2
		STA COLPM3

		MWA #DLI.DLI_ST VBL		;set the first address of DLI interrupt

VBI_ST	INC C3 +1

		LDA REGA
		LDX REGX
		LDY REGY
		RTI
.ENDL

DSP_LST	DTA $44,A(SCN_DSP)
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
	DTA $41,A(DSP_LST)

SCN_DSP	INS "test.scn"
		.DS 0*40
	
	.ALIGN $0400
CHR_SET	INS "test.fnt"

	OPT L-
