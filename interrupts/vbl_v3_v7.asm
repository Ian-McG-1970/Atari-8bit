	ICL "test.h"

;	ORG $2000\ mva #$ff portb\ rts\ ini $2000; ---	BASIC switch OFF

	ORG $2000

MAIN	LDA $14
		CMP	$14
		BEQ	MAIN		; :cmp:req $14		;wait 1 frame

		SEI				; stop IRQ interrupts

		CLD
		CLV

		MVA #$00 NMIEN	; stop NMI interrupts
		STA DMACTL		; disable antic
;		STA	SDMCTL		; disable antic shadow

		MVA #$FE PORTB	; switch off ROM to get 16k more ram (and basic?)

		MWA #NMI $FFFA	; new NMI handler

		MVA #$C0 NMIEN	; switch on NMI+DLI again

MLOOP 	JMP MLOOP

.LOCAL	DLI
		STA DLI_RGA +1
		STX DLI_RGX +1
		STY DLI_RGY +1

		LDA CONSOL

DLI_ST	INC VBL.C0 +1	; my code

		LDA VBL.C0+1
		STA COLBAK

DLI_RGA	LDA #0
DLI_RGX	LDX #0
DLI_RGY	LDY #0
		RTI
.ENDL

.local	NMI

		BIT NMIST
		BPL VBL

DLI_ADR	JMP DLI				; dli start address
.ENDL

.LOCAL	VBL
		STA VBI_RGA +1
		STX VBI_RGX +1
		STY VBI_RGY +1

		STA NMIST			; reset NMI flag

		MWA #DSP_LST DLPTR	; ANTIC address program

		MVA #@DMACTL(STANDARD | DMA | LINEX1 | PLAYERS | MISSILES) DMACTL	; set new screen width

;		LDA >CHR_SET+$400*$00	; Initial values
;		STA CHBASE
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
		LDA #$00
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

		INC C3 +1	; my code

VBI_RGA	LDA #0
VBI_RGX	LDX #0
VBI_RGY	LDY #0
		RTI
.ENDL

DSP_LST	DTA $44,A(SCN_ADR)
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $80
		DTA $04,$04
		DTA $04
		DTA $41,A(DSP_LST)

SCN_ADR	
	INS "test.scn"

	.ALIGN $0400
CHR_SET	
	INS "test.fnt"

	opt l-
