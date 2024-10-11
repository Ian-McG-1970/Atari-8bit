
	SCR_WID	EQU 32
	SW		EQU SCR_WID

	SCREEN_MODE	EQU	$0E
	SM			EQU	SCREEN_MODE
	BLANK_LINE	EQU $70
	SCREEN_ADR	EQU	$40
	DISP_LIST	EQU	$41
	DLI_INT		EQU	$80

	SCR0 	EQU	128
	SCR1 	EQU	SCR0 +2
	SCR2 	EQU	SCR1 +2
	SCR3 	EQU	SCR2 +2
	SCR4 	EQU	SCR3 +2
	SCR5 	EQU	SCR4 +2
	SCR6 	EQU	SCR5 +2
	SCR7 	EQU	SCR6 +2

	REGA EQU SCR7 +2
	REGX EQU REGA +1
	REGY EQU REGX +1

	SCR0_OBJ_CNT EQU REGY +1
	SCR1_OBJ_CNT EQU SCR0_OBJ_CNT +1
	OBJECT_TYPE	 EQU SCR1_OBJ_CNT +1
	
	TV	EQU	OBJECT_TYPE +1
	TH	EQU	TV +1
	FIRE EQU TH +1
	
	SPR_AND EQU FIRE +1
	SPR_ORA EQU SPR_AND +2

SPR_LINE_0	EQU	0*32
SPR_LINE_1	EQU	1*32
SPR_LINE_2	EQU	2*32
SPR_LINE_3	EQU	3*32
SPR_LINE_4	EQU	4*32
SPR_LINE_5	EQU	5*32
SPR_LINE_6	EQU	6*32
SPR_LINE_7	EQU	7*32

 ICL 'hardware.s'

.ENUM	@dmactl
	blank	= %00
	narrow	= %01
	standard= %10
	wide	= %11
	missiles= %100
	players	= %1000
	lineX1	= %10000
	lineX2	= %00000
	dma	= %100000
.ENDE

.MACRO	BORDER	COL
			LDA #:1
			STA COLBK
.ENDM 


.MACRO	CPY_A	SRC, DST
		LDA	:1
		STA	:2
.ENDM

.MACRO	CPY_AA	SRC, DST
;		CPY_A	#<:1 :2
;		CPY_A	#>:1 :2+1
		LDA #<:1
		STA :2
		LDA #>:1
		STA :2+1
.ENDM

.MACRO	SET_XY	SRC
		LDX #<:1
		LDY #>:1
.ENDM

.MACRO	SET_YX	SRC
		LDY #<:1
		LDX #>:1
.ENDM

.MACRO	CPY_XY	SRC, DST
;		SET_XY :1
		LDX #<:1
		LDY #>:1
		STX :2
		STY :2+1
.ENDM

	ORG $800
		
INIT	LDA $14
		CMP	$14
		BEQ	INIT		; :cmp:req $14		;wait 1 frame		

		SEI				; stop IRQ interrupts

		CLD
		CLV

		LDX	#$FF
		TXS

		MVA #$00 NMIEN	; disable NMI interrupts
		STA DMACTL		; disable antic
;		STA	SDMCTL		; disable antic shadow

		MVA #$FE PORTB	; switch off ROM to get 16k more ram (and basic?)

		MWA #NMI $FFFA	; new NMI handler

;		MVA #$C0 NMIEN	; switch on NMI+DLI again

;		LDX #<DISPLAY_LIST	; Extract low BYTE from DISPLAY_LIST and store it in SDLSTL
;		LDY #>DISPLAY_LIST
;		STX SDLSTL
;		STY SDLSTL+1		; Therefore tell antic the starting address of the custom display list.

;        LDX #<DLI	; load display list interrupt address
;        LDY #>DLI
;		STX VDSLST
;        STY VDSLST+1

;		ldx #<IRQ
;        ldy #>IRQ
;        stx VIMIRQ
;        sty VIMIRQ+1

;        ldx #<VBLANK
;        ldy #>VBLANK
;        stx VVBLKI
;        sty VVBLKI+1
 
;		LDA #$21 			; narrow 23 wide ; #$22       		;
;		STA SDMCTL     		; Store literal $23 in SDMCTL - therefore switch ANTIC back on to narrow.
		
		LDA #50
		STA TH
		STA	TV
;		LDA	#22
;		STA	SCR0_OBJ_CNT
;		STA	SCR1_OBJ_CNT

		CPY_AA	SCN0_T SCR0
		SET_YX	(128*SW)
		LDA #%0
		JSR	MEMSET		;		LDA #%0 ;10101010;		LDX #<SCN0_T ; SCN;		LDY #>SCN0_T ; SCN;		STX SCR0+0;		STY SCR0+1;		LDX #>(128*SW);		LDY #<(128*SW);		JSR	MEMSET

		CPY_AA	SCN0_B SCR0
		SET_YX	(64*SW)
		LDA #%0
		JSR	MEMSET		;		LDA #%0 ;1011010;		LDX #<SCN0_B ; SCN;		LDY #>SCN0_B ; SCN;		STX SCR0+0;		STY SCR0+1;		LDX #>(64*SW);		LDY #<(64*SW);		JSR	MEMSET

		CPY_AA	SCN1_T SCR0
		SET_YX	(128*SW)
		LDA #%0
		JSR	MEMSET

		CPY_AA	SCN1_B SCR0
		SET_YX	(64*SW)
		LDA #%0
		JSR	MEMSET

		MVA #$C0 NMIEN	; enable NMI+DLI
		
;		CLI
		
MLOOP		JSR	MOVE_HV
		JMP	MLOOP

.LOCAL	DLI
		STA DLI_RGA +1
		STX DLI_RGX +1
		STY DLI_RGY +1

		LDA CONSOL


			JSR	SWAP_SCREEN ; also swap this and previous list
				
 			BORDER $7A
			JSR	CLEAR_SPRITES ; clear previous list

			BORDER $20
			JSR	JOYSTICK

			JSR	MOVE_SPRITES ; move objects to this draw list
		ldx TH
		ldy TV
		lda	#0
		stx TMPH
		sty TMPV
		sta TMPT
		
		BORDER $44

			JSR	DRAW_SPRITES ; draw this list 

			BORDER 0


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

		MWA #DISPLAY_LIST DLISTL	; ANTIC address program

		MVA #@DMACTL(NARROW | DMA | LINEX1 | PLAYERS | MISSILES) DMACTL	; set new screen width

;		LDA >CHR_SET+$400*$00	; Initial values
;		STA CHBASE
C0		LDA #$00
		STA COLOR4
C1		LDA #$B6
		STA COLOR0
C2		LDA #$32
		STA COLOR1
C3		LDA #$0E
		STA COLOR2
C4		LDA #$56
		STA COLOR3
		LDA #$02
		STA CHACTL
		LDA #$04
		STA PRIOR
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

;		INC	C0 +1
;		INC C1 +1	; my code
;		INC C2 +1	; my code
;		INC C3 +1	; my code

VBI_RGA	LDA #0
VBI_RGX	LDX #0
VBI_RGY	LDY #0
		RTI
.ENDL

TMP_CNT	.BYTE	23
TMPH	.BYTE 	0,1,117,117,3,15,22,25,33,35,43,45,53,57,63,67,73,73,81,83,91,93,103,107,113,115,121,111
TMPV	.BYTE 	0,181,3,179,3,17,21,27,31,35,41,45,51,55,61,65,71,75,81,85,91,95,101,105,111,115,121,113
;TMPH	.BYTE 	0,0,116,116,2,16,20,26,32,36,42,46,52,56,62,66,72,76,82,86,92,96,102,106,112,116,122,110
;TMPV	.BYTE 	0,180,2,178,2,16,22,26,32,36,42,46,52,56,62,66,72,76,82,86,92,96,102,106,112,116,122,112
TMPT	.BYTE	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
TMPMH	.BYTE	0,-1,+1,+1,-1,+1,+1,-1,-1,+1,+1,-1,-1,+1,+1,-1,-1,+1,+1,-1,-1,+1,+1,-1,-1,+1,+1,-1,-1,+1
TMPMV	.BYTE	0,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1,+1,-1

.LOCAL	CLEAR_SPRITES ; y moves to x and a moves to y
CLEAR_CNT	LDX #0
LOOP			STX	NEXT +1
CLEAR_H			LDA SCR0_OBJ_H,X ;   ,y
				STA REGX
CLEAR_V			LDA SCR0_OBJ_V,X ;   ,y
CLEAR_T			LDY SCR0_OBJ_T,X ; x ,y
				JSR CLEAR_SPRITE
NEXT			LDX #0
				DEX
				BPL	LOOP
			RTS
.ENDL

.LOCAL	DRAW_SPRITES
DRAW_CNT	LDX #0
LOOP			STX NEXT +1
DRAW_V			LDA SCR1_OBJ_V,X
				STA REGY
DRAW_H			LDA SCR1_OBJ_H,X
				STA REGX
DRAW_T			LDY SCR1_OBJ_T,X
				JSR DRAW_SPRITE
NEXT			LDX #0
				DEX
				BPL	LOOP
			RTS
.ENDL

.LOCAL	MOVE_SPRITES
MOVE_CNT	LDX TMP_CNT
			STX	DRAW_SPRITES.DRAW_CNT +1
			STX CLEAR_SPRITES.CLEAR_CNT +1
LOOP			LDA TMPV,X
MOVE_V			STA SCR0_OBJ_V,X
				LDA TMPH,X
MOVE_H			STA SCR0_OBJ_H,X
				LDA TMPT,X
MOVE_T			STA SCR0_OBJ_T,X
				DEX
				BPL	LOOP
			RTS
.ENDL

.LOCAL	SWAP_SCREEN
			LDA #>SCN0_T			; has screen0 just been displayed
			CMP DLI_SCN_T_ADDR +2
			BEQ SCN0_SCN1			; yes

SCN1_SCN0	LDA	#>SCN0_T			; no - so now show screen0
			STA	DLI_SCN_T_ADDR +2
			LDA	#>SCN0_B
			STA	DLI_SCN_B_ADDR +2
			LDA	#>SC1_HI			; and clear and draw on screen1
			STA	CLEAR_01.SCPTC1 +2
			STA	CLEAR_08.SCPTC8 +2
			STA	DRAW_01.SCPTD1 +2
			STA	DRAW_08.SCPTD8 +2

			LDX	#<SCR0_OBJ_H
			LDY	#<SCR0_OBJ_V
			LDA #<SCR0_OBJ_T
			STX CLEAR_SPRITES.CLEAR_H +1
			STY CLEAR_SPRITES.CLEAR_V +1
			STA CLEAR_SPRITES.CLEAR_T +1
			STX DRAW_SPRITES.DRAW_H +1
			STY DRAW_SPRITES.DRAW_V +1
			STA DRAW_SPRITES.DRAW_T +1
			STX MOVE_SPRITES.MOVE_H +1
			STY MOVE_SPRITES.MOVE_V +1
			STA MOVE_SPRITES.MOVE_T +1
			RTS

SCN0_SCN1	LDA	#>SCN1_T			; so now show screen1 
			STA	DLI_SCN_T_ADDR +2
			LDA	#>SCN1_B
			STA	DLI_SCN_B_ADDR +2
			LDA	#>SC0_HI			; and clear and draw on screen0
			STA	CLEAR_01.SCPTC1 +2
			STA	CLEAR_08.SCPTC8 +2
			STA	DRAW_01.SCPTD1 +2
			STA	DRAW_08.SCPTD8 +2

			LDX	#<SCR1_OBJ_H
			LDY	#<SCR1_OBJ_V
			LDA #<SCR1_OBJ_T
			STX CLEAR_SPRITES.CLEAR_H +1
			STY CLEAR_SPRITES.CLEAR_V +1
			STA CLEAR_SPRITES.CLEAR_T +1
			STX DRAW_SPRITES.DRAW_H +1
			STY DRAW_SPRITES.DRAW_V +1
			STA DRAW_SPRITES.DRAW_T +1
			STX MOVE_SPRITES.MOVE_H +1
			STY MOVE_SPRITES.MOVE_V +1
			STA MOVE_SPRITES.MOVE_T +1
			RTS
.ENDL	

.LOCAL	DLI2
			PHP
			STA INTREGA +1
			STX INTREGX +1
			STY INTREGY +1

			BORDER $28			
			JSR	SWAP_SCREEN ; also swap this and previous list
				
; 			BORDER $7A
			JSR	CLEAR_SPRITES ; clear previous list

;			BORDER $20
			JSR	JOYSTICK

			JSR	MOVE_SPRITES ; move objects to this draw list
		ldx TH
		ldy TV
		lda	#0
		stx TMPH
		sty TMPV
		sta TMPT
		
;		BORDER $44

			JSR	DRAW_SPRITES ; draw this list 

			BORDER 0

INTREGA	LDA #0
INTREGX	LDX #0
INTREGY	LDY #0
			PLP
		RTI
.ENDL

.LOCAL	DRAW_SPRITE
			LDX SPRITE_AND_LO_LO,Y
			STX SCR0
			LDX SPRITE_AND_LO_HI,Y
			STX SCR0 +1
			LDX SPRITE_AND_HI_LO,Y
			STX SCR1
			LDX SPRITE_AND_HI_HI,Y
			STX SCR1 +1
  
			LDX SPRITE_ORA_LO_LO,Y
			STX SCR2
			LDX SPRITE_ORA_LO_HI,Y
			STX SCR2 +1
			LDX SPRITE_ORA_HI_LO,Y
			STX SCR3
			LDX SPRITE_ORA_HI_HI,Y
			STX SCR3 +1

			LDX SPRITE_TYPE,Y
			STX SPRN_TMPB+1

			AND #3
			TAY

			LDA (SCR2),Y
            STA SPR_ORA
			LDA (SCR3),Y
            STA SPR_ORA +1
			LAX (SCR0),Y
			LDA (SCR1),Y
   
SPRN_TMPB	JMP (SPRITE_DRW_JMP_LIST)
.ENDL

.LOCAL	CLEAR_SPRITE
  			LDX SPRITE_TYPE,Y
 			STX SPRN_TMPB+1
			TAY
SPRN_TMPB	JMP (SPRITE_CLR_JMP_LIST)
.ENDL

.LOCAL	DRAW_01
		LDA	SC_LO,Y
		STA	SCR0
SCPTD1	LDA	SC0_HI,Y 
		STA	SCR0+1 
		LDY	SCR_HOR,X
		LDA	(SCR0),Y
		ORA	SCR_OR,X
		STA	(SCR0),Y 
		RTS
.ENDL

.LOCAL	CLEAR_01
		LDA	SC_LO,Y
		STA	SCR0
SCPTC1	LDA	SC0_HI,Y 
		STA	SCR0+1 
		LDY	SCR_HOR,X
		LDA	#0
		STA	(SCR0),Y 
		RTS
.ENDL

.MACRO	INCXY
			INX
			BNE CONT
				INY
CONT
.ENDM

.MACRO	ADDAX
			ADC #32
			BCC	CONT
				INX
				CLC
CONT
.ENDM

.MACRO	ADDAX_NOC
			ADC #32
			BCC	CONT
				INX
;				CLC not needed
CONT
.ENDM

.MACRO	ADDAY
			ADC #32
			BCC	CONT
				INY
				CLC
CONT
.ENDM

.MACRO	ADDAY_NOC
			ADC #32
			BCC	CONT
				INY
;				CLC not needed
CONT
.ENDM

.LOCAL	DRAW_08
			STX SPA01 +1
			STA SPA01 +2
			INX
			STX SPA02 +1
			STA SPA02 +2
			INX 
			STX SPA03 +1
			STA SPA03 +2
			INX 
			STX SPA04 +1
			STA SPA04 +2
			INX 
			STX SPA05 +1
			STA SPA05 +2
			INX 
			STX SPA06 +1
			STA SPA06 +2
			INX 
			STX SPA07 +1
			STA SPA07 +2
			INX 
			STX SPA08 +1
			STA SPA08 +2

			LDX SPR_ORA
			LDA SPR_ORA +1
			STX SPO01 +1
			STA SPO01 +2
			INX 
			STX SPO02 +1
			STA SPO02 +2
			INX 
			STX SPO03 +1
			STA SPO03 +2
			INX 
			STX SPO04 +1
			STA SPO04 +2
			INX 
			STX SPO05 +1
			STA SPO05 +2
			INX 
			STX SPO06 +1
			STA SPO06 +2
			INX 
			STX SPO07 +1
			STA SPO07 +2
			INX 
			STX SPO08 +1
			STA SPO08 +2

			LAX REGY ; V
			ASL
			STA DRW_SPR_JMP +1

SCPTD8		LDY	SC0_HI,X
			STY	SCR0+1

DRW_SPR_JMP	JMP	(DRW_SPR_JMP_TAB)
 
DRAW_08_CONT:
			LDX REGX
			LDY SCR_HOR,X
			
			LDA	SPR08_DRW_CNT,X
			TAX
			
LOOP
				LDA	(SCR7),Y
SPA08 			AND $ABCD,X
SPO08 			ORA $ABCD,X
				STA	(SCR7),Y

				LDA	(SCR6),Y
SPA07 			AND $ABCD,X
SPO07 			ORA $ABCD,X
				STA	(SCR6),Y

				LDA	(SCR5),Y
SPA06 			AND $ABCD,X
SPO06 			ORA $ABCD,X
				STA	(SCR5),Y

				LDA	(SCR4),Y
SPA05 			AND $ABCD,X
SPO05 			ORA $ABCD,X
				STA	(SCR4),Y

				LDA	(SCR3),Y
SPA04 			AND $ABCD,X
SPO04 			ORA $ABCD,X
				STA	(SCR3),Y

				LDA	(SCR2),Y
SPA03 			AND $ABCD,X
SPO03 			ORA $ABCD,X
				STA	(SCR2),Y

				LDA	(SCR1),Y
SPA02 			AND $ABCD,X
SPO02 			ORA $ABCD,X
				STA	(SCR1),Y

				LDA	(SCR0),Y
SPA01 			AND $ABCD,X
SPO01 			ORA $ABCD,X
				STA	(SCR0),Y

				INY
				
				LDA #$FF
				SBX #8 ; = x=x-8 ; #$fc ;equivalent to +4
;				TXA
;				SBC #8		; carry set
;				TAX

			BNE LOOP
		RTS
.ENDL

.LOCAL	CLEAR_08
			ASL
			STA CLR_SPR_JMP +1

SCPTC8		LDX	SC0_HI,Y
			STX LINE0 +2

CLR_SPR_JMP	JMP	(CLR_SPR_JMP_TAB)

;SCPTC8		LDX SC0_HI +0,Y
;			STX LINE0 +2

;			LSR
;			BCS	ODD_12221

;EVEN_2222:	LDA SC_LO +0,Y
;			STA LINE0 +1
;			CLC			
;			ADC	#32
;			STX LINE1 +2
;			STA LINE1 +1

;			ADDAX
;			STX LINE2 +2
;			STA LINE2 +1
;			ADC	#32
;			STX LINE3 +2
;			STA LINE3 +1

;			ADDAX
;			STX LINE4 +2
;			STA LINE4 +1
;			ADC	#32
;			STX LINE5 +2
;			STA LINE5 +1
			
;			ADDAX
;			STX LINE6 +2
;			STA LINE6 +1
;			ADC	#32
;			STX LINE7 +2
;			STA LINE7 +1

;			BVC	CONT ; JMP

;ODD_12221:	LDA SC_LO +0,Y
;			STA LINE0 +1

;			CLC			
;			ADDAX
;			STX LINE1 +2
;			STA LINE1 +1

;			ADC	#32
;			STX LINE2 +2
;			STA LINE2 +1
;			ADDAX
;			STX LINE3 +2
;			STA LINE3 +1

;			ADC	#32
;			STX LINE4 +2
;			STA LINE4 +1

;			ADDAX
;			STX LINE5 +2
;			STA LINE5 +1
			
;			ADC	#32
;			STX LINE6 +2
;			STA LINE6 +1

;			ADDAX_NOC
;			STX LINE7 +2
;			STA LINE7 +1 
			
CLEAR_08_CONT:
CONT:		LDX REGX
			LDY SCR_HOR,X
			LDA	SPR08_CLR_CNT,X
			TAX

			LDA	#0
LOOP
LINE0			STA	$ABCD,Y
LINE1			STA	$ABCD,Y
LINE2			STA	$ABCD,Y
LINE3			STA	$ABCD,Y
LINE4			STA	$ABCD,Y
LINE5			STA $ABCD,Y
LINE6			STA	$ABCD,Y
LINE7			STA	$ABCD,Y
				INY
				DEX
			BNE LOOP
		RTS
.ENDL

;.LOCAL	V_WAIT
;			LDA	#111
;LOOP			CMP	VCOUNT  ; will be equal until incremented in VB
;				BNE	LOOP
;			RTS
;.ENDL

.LOCAL	JOYSTICK
			LDA PORTA
			LSR
			BCS   UP
				DEC   TV
UP       	LSR
			BCS   DOWN
				INC   TV
DOWN     	LSR
			BCS   LEFT
				DEC   TH
LEFT     	LSR
			BCS   RIGHT
				INC   TH
RIGHT    	AND   #1
			STA   FIRE
			RTS
.ENDL

MOVE_TEMP .BYTE 0

.LOCAL	MOVE_HV
; RTS
			LDY TMP_CNT
LOOP
;	BORDER $BA
			LAX TMPH,Y
				CLC
				ADC TMPMH,Y
				CMP #128-9
				BCC CONT_H
					LDA	TMPMH,Y
					EOR	#255
					ADC	#0
					STA	TMPMH,Y
					TXA
CONT_H			STA TMPH,Y
				LAX TMPV,Y
				CLC
				ADC TMPMV,Y
				CMP #192-9
				BCC CONT_V
					LDA	TMPMV,Y
					EOR	#255
					ADC	#0
					STA	TMPMV,Y
					TXA
CONT_V			STA TMPV,Y
;		BORDER 0
				DEY
				BNE	LOOP
			RTS
.ENDL

.LOCAL	MEMSET
			STY	LSB_ONLY+1 ; store LSB count
			CPX	#0          ; MSB?     
            BEQ	LSB_ONLY   ; no

            LDY	#0          ; yes so reset LSB
MSB_LOOP  
LSB_LOOP    		STA	(SCR0),Y   ; clear whole MSB
					DEY 
					BNE	LSB_LOOP

				INC	SCR0+1      ; inc MSB
				DEX               ; dec MSB count
				BNE	MSB_LOOP

LSB_ONLY    LDY	#0          ; LSB count 
            BEQ	MS_END     ; not needed

LAST_LSB_LOOP 	STA	(SCR0),Y
				DEY 
				BNE	LAST_LSB_LOOP
                
            STA	(SCR0),Y     ; clear last Y (0)
MS_END      RTS
.ENDL

; 0		1	0	0	0	0	0	0	0	0
; 32	1	1	0	0	0	0	0	0	0
; 64	1	1	1	0	0	0	0	0	0
; 96	1	1	1	1	0	0	0	0	0
; 128	1	1	1	1	1	0	0	0	0
; 160	1	1	1	1	1	1	0	0	0
; 192	1	1	1	1	1	1	1	0	0
; 224	0	1	1	1	1	1	1	1	0

; 0		0	0	1	1	1	1	1	1	1
; 32	0	0	0	1	1	1	1	1	1
; 64	0	0	0	0	1	1	1	1	1
; 96	0	0	0	0	0	1	1	1	1
; 128	0	0	0	0	0	0	1	1	1
; 160	0	0	0	0	0	0	0	1	1
; 192	0	0	0	0	0	0	0	0	1
; 224	0	0	0	0	0	0	0	0	0

.LOCAL	DRW_SPR_0	; 00 TO 06 - MUST BE KEPT IN LINE WITH CLR_SPR_0 / 6
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*0)
		STY SCR0
		LDY	#(32*1)
		STY SCR1
		LDY	#(32*2)
		STY SCR2
		LDY	#(32*3)
		STY SCR3
		LDY	#(32*4)
		STY SCR4
		LDY	#(32*5)
		STY SCR5
		LDY	#(32*6)
		STY SCR6
		LDY	#(32*7)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_1	; 01 TO 07
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		INY
		STY SCR7+1
		LDY	#(32*1)
		STY SCR0
		LDY	#(32*2)
		STY SCR1
		LDY	#(32*3)
		STY SCR2
		LDY	#(32*4)
		STY SCR3
		LDY	#(32*5)
		STY SCR4
		LDY	#(32*6)
		STY SCR5
		LDY	#(32*7)
		STY SCR6
		LDY	#(32*0)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_2	; 02 TO 08
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		INY
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*2)
		STY SCR0
		LDY	#(32*3)
		STY SCR1
		LDY	#(32*4)
		STY SCR2
		LDY	#(32*5)
		STY SCR3
		LDY	#(32*6)
		STY SCR4
		LDY	#(32*7)
		STY SCR5
		LDY	#(32*0)
		STY SCR6
		LDY	#(32*1)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_3	; 03 TO 09
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		INY
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*3)
		STY SCR0
		LDY	#(32*4)
		STY SCR1
		LDY	#(32*5)
		STY SCR2
		LDY	#(32*6)
		STY SCR3
		LDY	#(32*7)
		STY SCR4
		LDY	#(32*0)
		STY SCR5
		LDY	#(32*1)
		STY SCR6
		LDY	#(32*2)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_4	; 04 TO 10
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		INY
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*4)
		STY SCR0
		LDX	#(32*5)
		STY SCR1
		LDY	#(32*6)
		STY SCR2
		LDY	#(32*7)
		STY SCR3
		LDY	#(32*0)
		STY SCR4
		LDY	#(32*1)
		STY SCR5
		LDY	#(32*2)
		STY SCR6
		LDY	#(32*3)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_5	; 05 TO 11
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		STY	SCR2+1
		INY
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*5)
		STY SCR0
		LDY	#(32*6)
		STY SCR1
		LDY	#(32*7)
		STY SCR2
		LDY	#(32*0)
		STY SCR3
		LDY	#(32*1)
		STY SCR4
		LDY	#(32*2)
		STY SCR5
		LDY	#(32*3)
		STY SCR6
		LDY	#(32*4)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_6	; 05 TO 11
;		LDY	SC0_HI,X
;		STY	SCR0+1
		STY	SCR1+1
		INY
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*6)
		STY SCR0
		LDY	#(32*7)
		STY SCR1
		LDY	#(32*0)
		STY SCR2
		LDY	#(32*1)
		STY SCR3
		LDY	#(32*2)
		STY SCR4
		LDY	#(32*3)
		STY SCR5
		LDY	#(32*4)
		STY SCR6
		LDY	#(32*5)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	DRW_SPR_7	; 05 TO 11
;		LDX	SC0_HI,X
;		STY	SCR0+1
		INY
		STY	SCR1+1
		STY	SCR2+1
		STY	SCR3+1
		STY	SCR4+1
		STY	SCR5+1
		STY	SCR6+1
		STY SCR7+1
		LDY	#(32*7)
		STY SCR0
		LDY	#(32*0)
		STY SCR1
		LDY	#(32*1)
		STY SCR2
		LDY	#(32*2)
		STY SCR3
		LDY	#(32*3)
		STY SCR4
		LDY	#(32*4)
		STY SCR5
		LDY	#(32*5)
		STY SCR6
		LDY	#(32*6)
		STY SCR7
		JMP	DRAW_08.DRAW_08_CONT
.ENDL

.LOCAL	CLR_SPR_0	; 00 TO 06 - MUST BE KEPT IN LINE WITH CLR_SPR_0 / 6
;		LDX	SC0_HI,X
;		STX CLEAR_08.LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*0)
		STX CLEAR_08.LINE0+1
		LDX	#(32*1)
		STX CLEAR_08.LINE1+1
		LDX	#(32*2)
		STX CLEAR_08.LINE2+1
		LDX	#(32*3)
		STX CLEAR_08.LINE3+1
		LDX	#(32*4)
		STX CLEAR_08.LINE4+1
		LDX	#(32*5)
		STX CLEAR_08.LINE5+1
		LDX	#(32*6)
		STX CLEAR_08.LINE6+1
		LDX	#(32*7)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_1	; 01 TO 07
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		INX
		STX CLEAR_08.LINE7+2
		LDX	#(32*1)
		STX CLEAR_08.LINE0+1
		LDX	#(32*2)
		STX CLEAR_08.LINE1+1
		LDX	#(32*3)
		STX CLEAR_08.LINE2+1
		LDX	#(32*4)
		STX CLEAR_08.LINE3+1
		LDX	#(32*5)
		STX CLEAR_08.LINE4+1
		LDX	#(32*6)
		STX CLEAR_08.LINE5+1
		LDX	#(32*7)
		STX CLEAR_08.LINE6+1
		LDX	#(32*0)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_2	; 02 TO 08
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		INX
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*2)
		STX CLEAR_08.LINE0+1
		LDX	#(32*3)
		STX CLEAR_08.LINE1+1
		LDX	#(32*4)
		STX CLEAR_08.LINE2+1
		LDX	#(32*5)
		STX CLEAR_08.LINE3+1
		LDX	#(32*6)
		STX CLEAR_08.LINE4+1
		LDX	#(32*7)
		STX CLEAR_08.LINE5+1
		LDX	#(32*0)
		STX CLEAR_08.LINE6+1
		LDX	#(32*1)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_3	; 03 TO 09
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		INX
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*3)
		STX CLEAR_08.LINE0+1
		LDX	#(32*4)
		STX CLEAR_08.LINE1+1
		LDX	#(32*5)
		STX CLEAR_08.LINE2+1
		LDX	#(32*6)
		STX CLEAR_08.LINE3+1
		LDX	#(32*7)
		STX CLEAR_08.LINE4+1
		LDX	#(32*0)
		STX CLEAR_08.LINE5+1
		LDX	#(32*1)
		STX CLEAR_08.LINE6+1
		LDX	#(32*2)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_4	; 04 TO 10
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		INX
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*4)
		STX CLEAR_08.LINE0+1
		LDX	#(32*5)
		STX CLEAR_08.LINE1+1
		LDX	#(32*6)
		STX CLEAR_08.LINE2+1
		LDX	#(32*7)
		STX CLEAR_08.LINE3+1
		LDX	#(32*0)
		STX CLEAR_08.LINE4+1
		LDX	#(32*1)
		STX CLEAR_08.LINE5+1
		LDX	#(32*2)
		STX CLEAR_08.LINE6+1
		LDX	#(32*3)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_5	; 05 TO 11
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		INX
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*5)
		STX CLEAR_08.LINE0+1
		LDX	#(32*6)
		STX CLEAR_08.LINE1+1
		LDX	#(32*7)
		STX CLEAR_08.LINE2+1
		LDX	#(32*0)
		STX CLEAR_08.LINE3+1
		LDX	#(32*1)
		STX CLEAR_08.LINE4+1
		LDX	#(32*2)
		STX CLEAR_08.LINE5+1
		LDX	#(32*3)
		STX CLEAR_08.LINE6+1
		LDX	#(32*4)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_6	; 05 TO 11
;		LDX	SC0_HI,X
;		STX	LINE0+2
		STX	CLEAR_08.LINE1+2
		INX
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*6)
		STX CLEAR_08.LINE0+1
		LDX	#(32*7)
		STX CLEAR_08.LINE1+1
		LDX	#(32*0)
		STX CLEAR_08.LINE2+1
		LDX	#(32*1)
		STX CLEAR_08.LINE3+1
		LDX	#(32*2)
		STX CLEAR_08.LINE4+1
		LDX	#(32*3)
		STX CLEAR_08.LINE5+1
		LDX	#(32*4)
		STX CLEAR_08.LINE6+1
		LDX	#(32*5)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

.LOCAL	CLR_SPR_7	; 05 TO 11
;		LDX	SC0_HI,X
;		STX	LINE0+2
		INX
		STX	CLEAR_08.LINE1+2
		STX	CLEAR_08.LINE2+2
		STX	CLEAR_08.LINE3+2
		STX	CLEAR_08.LINE4+2
		STX	CLEAR_08.LINE5+2
		STX	CLEAR_08.LINE6+2
		STX CLEAR_08.LINE7+2
		LDX	#(32*7)
		STX CLEAR_08.LINE0+1
		LDX	#(32*0)
		STX CLEAR_08.LINE1+1
		LDX	#(32*1)
		STX CLEAR_08.LINE2+1
		LDX	#(32*2)
		STX CLEAR_08.LINE3+1
		LDX	#(32*3)
		STX CLEAR_08.LINE4+1
		LDX	#(32*4)
		STX CLEAR_08.LINE5+1
		LDX	#(32*5)
		STX CLEAR_08.LINE6+1
		LDX	#(32*6)
		STX CLEAR_08.LINE7+1
		JMP	CLEAR_08.CLEAR_08_CONT
.ENDL

	.ALIGN $100

DRW_SPR_JMP_TAB
.REPT	128
	.WORD DRW_SPR_0, DRW_SPR_1, DRW_SPR_2, DRW_SPR_3, DRW_SPR_4, DRW_SPR_5, DRW_SPR_6, DRW_SPR_7
.ENDR

	.ALIGN $100

CLR_SPR_JMP_TAB
.REPT	128
	.WORD CLR_SPR_0, CLR_SPR_1, CLR_SPR_2, CLR_SPR_3, CLR_SPR_4, CLR_SPR_5, CLR_SPR_6, CLR_SPR_7
.ENDR

; every 64 lines add 3k
DISPLAY_LIST		
	.BYTE BLANK_LINE,BLANK_LINE,BLANK_LINE	; Discard 24 scan lines
DLI_SCN_T_ADDR
	.BYTE SCREEN_ADR+SM,<SCN0_T,>SCN0_T
.REPT	128-1
	.BYTE SM
.ENDR
DLI_SCN_B_ADDR
	.BYTE SCREEN_ADR+SM,<SCN0_B,>SCN0_B
.REPT	64-1
	.BYTE SM
.ENDR
	.BYTE DLI_INT+SM
	.BYTE DISP_LIST,<DISPLAY_LIST,>DISPLAY_LIST

	.ALIGN $100
SC0_HI	
	.BYTE >(SCN0_T+(000*SW)),>(SCN0_T+(001*SW)),>(SCN0_T+(002*SW)),>(SCN0_T+(003*SW)),>(SCN0_T+(004*SW)),>(SCN0_T+(005*SW)),>(SCN0_T+(006*SW)),>(SCN0_T+(007*SW)),>(SCN0_T+(008*SW)),>(SCN0_T+(009*SW))
	.BYTE >(SCN0_T+(010*SW)),>(SCN0_T+(011*SW)),>(SCN0_T+(012*SW)),>(SCN0_T+(013*SW)),>(SCN0_T+(014*SW)),>(SCN0_T+(015*SW)),>(SCN0_T+(016*SW)),>(SCN0_T+(017*SW)),>(SCN0_T+(018*SW)),>(SCN0_T+(019*SW))
	.BYTE >(SCN0_T+(020*SW)),>(SCN0_T+(021*SW)),>(SCN0_T+(022*SW)),>(SCN0_T+(023*SW)),>(SCN0_T+(024*SW)),>(SCN0_T+(025*SW)),>(SCN0_T+(026*SW)),>(SCN0_T+(027*SW)),>(SCN0_T+(028*SW)),>(SCN0_T+(029*SW))
	.BYTE >(SCN0_T+(030*SW)),>(SCN0_T+(031*SW)),>(SCN0_T+(032*SW)),>(SCN0_T+(033*SW)),>(SCN0_T+(034*SW)),>(SCN0_T+(035*SW)),>(SCN0_T+(036*SW)),>(SCN0_T+(037*SW)),>(SCN0_T+(038*SW)),>(SCN0_T+(039*SW))
	.BYTE >(SCN0_T+(040*SW)),>(SCN0_T+(041*SW)),>(SCN0_T+(042*SW)),>(SCN0_T+(043*SW)),>(SCN0_T+(044*SW)),>(SCN0_T+(045*SW)),>(SCN0_T+(046*SW)),>(SCN0_T+(047*SW)),>(SCN0_T+(048*SW)),>(SCN0_T+(049*SW))
	.BYTE >(SCN0_T+(050*SW)),>(SCN0_T+(051*SW)),>(SCN0_T+(052*SW)),>(SCN0_T+(053*SW)),>(SCN0_T+(054*SW)),>(SCN0_T+(055*SW)),>(SCN0_T+(056*SW)),>(SCN0_T+(057*SW)),>(SCN0_T+(058*SW)),>(SCN0_T+(059*SW))
	.BYTE >(SCN0_T+(060*SW)),>(SCN0_T+(061*SW)),>(SCN0_T+(062*SW)),>(SCN0_T+(063*SW)),>(SCN0_T+(064*SW)),>(SCN0_T+(065*SW)),>(SCN0_T+(066*SW)),>(SCN0_T+(067*SW)),>(SCN0_T+(068*SW)),>(SCN0_T+(069*SW))
	.BYTE >(SCN0_T+(070*SW)),>(SCN0_T+(071*SW)),>(SCN0_T+(072*SW)),>(SCN0_T+(073*SW)),>(SCN0_T+(074*SW)),>(SCN0_T+(075*SW)),>(SCN0_T+(076*SW)),>(SCN0_T+(077*SW)),>(SCN0_T+(078*SW)),>(SCN0_T+(079*SW))
	.BYTE >(SCN0_T+(080*SW)),>(SCN0_T+(081*SW)),>(SCN0_T+(082*SW)),>(SCN0_T+(083*SW)),>(SCN0_T+(084*SW)),>(SCN0_T+(085*SW)),>(SCN0_T+(086*SW)),>(SCN0_T+(087*SW)),>(SCN0_T+(088*SW)),>(SCN0_T+(089*SW))
	.BYTE >(SCN0_T+(090*SW)),>(SCN0_T+(091*SW)),>(SCN0_T+(092*SW)),>(SCN0_T+(093*SW)),>(SCN0_T+(094*SW)),>(SCN0_T+(095*SW)),>(SCN0_T+(096*SW)),>(SCN0_T+(097*SW)),>(SCN0_T+(098*SW)),>(SCN0_T+(099*SW))
	.BYTE >(SCN0_T+(100*SW)),>(SCN0_T+(101*SW)),>(SCN0_T+(102*SW)),>(SCN0_T+(103*SW)),>(SCN0_T+(104*SW)),>(SCN0_T+(105*SW)),>(SCN0_T+(106*SW)),>(SCN0_T+(107*SW)),>(SCN0_T+(108*SW)),>(SCN0_T+(109*SW))
	.BYTE >(SCN0_T+(110*SW)),>(SCN0_T+(111*SW)),>(SCN0_T+(112*SW)),>(SCN0_T+(113*SW)),>(SCN0_T+(114*SW)),>(SCN0_T+(115*SW)),>(SCN0_T+(116*SW)),>(SCN0_T+(117*SW)),>(SCN0_T+(118*SW)),>(SCN0_T+(119*SW))
	.BYTE >(SCN0_T+(120*SW)),>(SCN0_T+(121*SW)),>(SCN0_T+(122*SW)),>(SCN0_T+(123*SW)),>(SCN0_T+(124*SW)),>(SCN0_T+(125*SW)),>(SCN0_T+(126*SW)),>(SCN0_T+(127*SW)),>(SCN0_T+(128*SW)),>(SCN0_T+(129*SW))
	.BYTE >(SCN0_T+(130*SW)),>(SCN0_T+(131*SW)),>(SCN0_T+(132*SW)),>(SCN0_T+(133*SW)),>(SCN0_T+(134*SW)),>(SCN0_T+(135*SW)),>(SCN0_T+(136*SW)),>(SCN0_T+(137*SW)),>(SCN0_T+(138*SW)),>(SCN0_T+(139*SW))
	.BYTE >(SCN0_T+(140*SW)),>(SCN0_T+(141*SW)),>(SCN0_T+(142*SW)),>(SCN0_T+(143*SW)),>(SCN0_T+(144*SW)),>(SCN0_T+(145*SW)),>(SCN0_T+(146*SW)),>(SCN0_T+(147*SW)),>(SCN0_T+(148*SW)),>(SCN0_T+(149*SW))
	.BYTE >(SCN0_T+(150*SW)),>(SCN0_T+(151*SW)),>(SCN0_T+(152*SW)),>(SCN0_T+(153*SW)),>(SCN0_T+(154*SW)),>(SCN0_T+(155*SW)),>(SCN0_T+(156*SW)),>(SCN0_T+(157*SW)),>(SCN0_T+(158*SW)),>(SCN0_T+(159*SW))
	.BYTE >(SCN0_T+(160*SW)),>(SCN0_T+(161*SW)),>(SCN0_T+(162*SW)),>(SCN0_T+(163*SW)),>(SCN0_T+(164*SW)),>(SCN0_T+(165*SW)),>(SCN0_T+(166*SW)),>(SCN0_T+(167*SW)),>(SCN0_T+(168*SW)),>(SCN0_T+(169*SW))
	.BYTE >(SCN0_T+(170*SW)),>(SCN0_T+(171*SW)),>(SCN0_T+(172*SW)),>(SCN0_T+(173*SW)),>(SCN0_T+(174*SW)),>(SCN0_T+(175*SW)),>(SCN0_T+(176*SW)),>(SCN0_T+(177*SW)),>(SCN0_T+(178*SW)),>(SCN0_T+(179*SW))
	.BYTE >(SCN0_T+(180*SW)),>(SCN0_T+(181*SW)),>(SCN0_T+(182*SW)),>(SCN0_T+(183*SW)),>(SCN0_T+(184*SW)),>(SCN0_T+(185*SW)),>(SCN0_T+(186*SW)),>(SCN0_T+(187*SW)),>(SCN0_T+(188*SW)),>(SCN0_T+(189*SW))
	.BYTE >(SCN0_T+(190*SW)),>(SCN0_T+(191*SW))

	.ALIGN $100
SC1_HI	
	.BYTE >(SCN1_T+(000*SW)),>(SCN1_T+(001*SW)),>(SCN1_T+(002*SW)),>(SCN1_T+(003*SW)),>(SCN1_T+(004*SW)),>(SCN1_T+(005*SW)),>(SCN1_T+(006*SW)),>(SCN1_T+(007*SW)),>(SCN1_T+(008*SW)),>(SCN1_T+(009*SW))
	.BYTE >(SCN1_T+(010*SW)),>(SCN1_T+(011*SW)),>(SCN1_T+(012*SW)),>(SCN1_T+(013*SW)),>(SCN1_T+(014*SW)),>(SCN1_T+(015*SW)),>(SCN1_T+(016*SW)),>(SCN1_T+(017*SW)),>(SCN1_T+(018*SW)),>(SCN1_T+(019*SW))
	.BYTE >(SCN1_T+(020*SW)),>(SCN1_T+(021*SW)),>(SCN1_T+(022*SW)),>(SCN1_T+(023*SW)),>(SCN1_T+(024*SW)),>(SCN1_T+(025*SW)),>(SCN1_T+(026*SW)),>(SCN1_T+(027*SW)),>(SCN1_T+(028*SW)),>(SCN1_T+(029*SW))
	.BYTE >(SCN1_T+(030*SW)),>(SCN1_T+(031*SW)),>(SCN1_T+(032*SW)),>(SCN1_T+(033*SW)),>(SCN1_T+(034*SW)),>(SCN1_T+(035*SW)),>(SCN1_T+(036*SW)),>(SCN1_T+(037*SW)),>(SCN1_T+(038*SW)),>(SCN1_T+(039*SW))
	.BYTE >(SCN1_T+(040*SW)),>(SCN1_T+(041*SW)),>(SCN1_T+(042*SW)),>(SCN1_T+(043*SW)),>(SCN1_T+(044*SW)),>(SCN1_T+(045*SW)),>(SCN1_T+(046*SW)),>(SCN1_T+(047*SW)),>(SCN1_T+(048*SW)),>(SCN1_T+(049*SW))
	.BYTE >(SCN1_T+(050*SW)),>(SCN1_T+(051*SW)),>(SCN1_T+(052*SW)),>(SCN1_T+(053*SW)),>(SCN1_T+(054*SW)),>(SCN1_T+(055*SW)),>(SCN1_T+(056*SW)),>(SCN1_T+(057*SW)),>(SCN1_T+(058*SW)),>(SCN1_T+(059*SW))
	.BYTE >(SCN1_T+(060*SW)),>(SCN1_T+(061*SW)),>(SCN1_T+(062*SW)),>(SCN1_T+(063*SW)),>(SCN1_T+(064*SW)),>(SCN1_T+(065*SW)),>(SCN1_T+(066*SW)),>(SCN1_T+(067*SW)),>(SCN1_T+(068*SW)),>(SCN1_T+(069*SW))
	.BYTE >(SCN1_T+(070*SW)),>(SCN1_T+(071*SW)),>(SCN1_T+(072*SW)),>(SCN1_T+(073*SW)),>(SCN1_T+(074*SW)),>(SCN1_T+(075*SW)),>(SCN1_T+(076*SW)),>(SCN1_T+(077*SW)),>(SCN1_T+(078*SW)),>(SCN1_T+(079*SW))
	.BYTE >(SCN1_T+(080*SW)),>(SCN1_T+(081*SW)),>(SCN1_T+(082*SW)),>(SCN1_T+(083*SW)),>(SCN1_T+(084*SW)),>(SCN1_T+(085*SW)),>(SCN1_T+(086*SW)),>(SCN1_T+(087*SW)),>(SCN1_T+(088*SW)),>(SCN1_T+(089*SW))
	.BYTE >(SCN1_T+(090*SW)),>(SCN1_T+(091*SW)),>(SCN1_T+(092*SW)),>(SCN1_T+(093*SW)),>(SCN1_T+(094*SW)),>(SCN1_T+(095*SW)),>(SCN1_T+(096*SW)),>(SCN1_T+(097*SW)),>(SCN1_T+(098*SW)),>(SCN1_T+(099*SW))
	.BYTE >(SCN1_T+(100*SW)),>(SCN1_T+(101*SW)),>(SCN1_T+(102*SW)),>(SCN1_T+(103*SW)),>(SCN1_T+(104*SW)),>(SCN1_T+(105*SW)),>(SCN1_T+(106*SW)),>(SCN1_T+(107*SW)),>(SCN1_T+(108*SW)),>(SCN1_T+(109*SW))
	.BYTE >(SCN1_T+(110*SW)),>(SCN1_T+(111*SW)),>(SCN1_T+(112*SW)),>(SCN1_T+(113*SW)),>(SCN1_T+(114*SW)),>(SCN1_T+(115*SW)),>(SCN1_T+(116*SW)),>(SCN1_T+(117*SW)),>(SCN1_T+(118*SW)),>(SCN1_T+(119*SW))
	.BYTE >(SCN1_T+(120*SW)),>(SCN1_T+(121*SW)),>(SCN1_T+(122*SW)),>(SCN1_T+(123*SW)),>(SCN1_T+(124*SW)),>(SCN1_T+(125*SW)),>(SCN1_T+(126*SW)),>(SCN1_T+(127*SW)),>(SCN1_T+(128*SW)),>(SCN1_T+(129*SW))
	.BYTE >(SCN1_T+(130*SW)),>(SCN1_T+(131*SW)),>(SCN1_T+(132*SW)),>(SCN1_T+(133*SW)),>(SCN1_T+(134*SW)),>(SCN1_T+(135*SW)),>(SCN1_T+(136*SW)),>(SCN1_T+(137*SW)),>(SCN1_T+(138*SW)),>(SCN1_T+(139*SW))
	.BYTE >(SCN1_T+(140*SW)),>(SCN1_T+(141*SW)),>(SCN1_T+(142*SW)),>(SCN1_T+(143*SW)),>(SCN1_T+(144*SW)),>(SCN1_T+(145*SW)),>(SCN1_T+(146*SW)),>(SCN1_T+(147*SW)),>(SCN1_T+(148*SW)),>(SCN1_T+(149*SW))
	.BYTE >(SCN1_T+(150*SW)),>(SCN1_T+(151*SW)),>(SCN1_T+(152*SW)),>(SCN1_T+(153*SW)),>(SCN1_T+(154*SW)),>(SCN1_T+(155*SW)),>(SCN1_T+(156*SW)),>(SCN1_T+(157*SW)),>(SCN1_T+(158*SW)),>(SCN1_T+(159*SW))
	.BYTE >(SCN1_T+(160*SW)),>(SCN1_T+(161*SW)),>(SCN1_T+(162*SW)),>(SCN1_T+(163*SW)),>(SCN1_T+(164*SW)),>(SCN1_T+(165*SW)),>(SCN1_T+(166*SW)),>(SCN1_T+(167*SW)),>(SCN1_T+(168*SW)),>(SCN1_T+(169*SW))
	.BYTE >(SCN1_T+(170*SW)),>(SCN1_T+(171*SW)),>(SCN1_T+(172*SW)),>(SCN1_T+(173*SW)),>(SCN1_T+(174*SW)),>(SCN1_T+(175*SW)),>(SCN1_T+(176*SW)),>(SCN1_T+(177*SW)),>(SCN1_T+(178*SW)),>(SCN1_T+(179*SW))
	.BYTE >(SCN1_T+(180*SW)),>(SCN1_T+(181*SW)),>(SCN1_T+(182*SW)),>(SCN1_T+(183*SW)),>(SCN1_T+(184*SW)),>(SCN1_T+(185*SW)),>(SCN1_T+(186*SW)),>(SCN1_T+(187*SW)),>(SCN1_T+(188*SW)),>(SCN1_T+(189*SW))
	.BYTE >(SCN1_T+(190*SW)),>(SCN1_T+(191*SW))

	.ALIGN $100
SC_LO
	.BYTE <(SCN0_T+(000*SW)),<(SCN0_T+(001*SW)),<(SCN0_T+(002*SW)),<(SCN0_T+(003*SW)),<(SCN0_T+(004*SW)),<(SCN0_T+(005*SW)),<(SCN0_T+(006*SW)),<(SCN0_T+(007*SW)),<(SCN0_T+(008*SW)),<(SCN0_T+(009*SW))
	.BYTE <(SCN0_T+(010*SW)),<(SCN0_T+(011*SW)),<(SCN0_T+(012*SW)),<(SCN0_T+(013*SW)),<(SCN0_T+(014*SW)),<(SCN0_T+(015*SW)),<(SCN0_T+(016*SW)),<(SCN0_T+(017*SW)),<(SCN0_T+(018*SW)),<(SCN0_T+(019*SW))
	.BYTE <(SCN0_T+(020*SW)),<(SCN0_T+(021*SW)),<(SCN0_T+(022*SW)),<(SCN0_T+(023*SW)),<(SCN0_T+(024*SW)),<(SCN0_T+(025*SW)),<(SCN0_T+(026*SW)),<(SCN0_T+(027*SW)),<(SCN0_T+(028*SW)),<(SCN0_T+(029*SW))
	.BYTE <(SCN0_T+(030*SW)),<(SCN0_T+(031*SW)),<(SCN0_T+(032*SW)),<(SCN0_T+(033*SW)),<(SCN0_T+(034*SW)),<(SCN0_T+(035*SW)),<(SCN0_T+(036*SW)),<(SCN0_T+(037*SW)),<(SCN0_T+(038*SW)),<(SCN0_T+(039*SW))
	.BYTE <(SCN0_T+(040*SW)),<(SCN0_T+(041*SW)),<(SCN0_T+(042*SW)),<(SCN0_T+(043*SW)),<(SCN0_T+(044*SW)),<(SCN0_T+(045*SW)),<(SCN0_T+(046*SW)),<(SCN0_T+(047*SW)),<(SCN0_T+(048*SW)),<(SCN0_T+(049*SW))
	.BYTE <(SCN0_T+(050*SW)),<(SCN0_T+(051*SW)),<(SCN0_T+(052*SW)),<(SCN0_T+(053*SW)),<(SCN0_T+(054*SW)),<(SCN0_T+(055*SW)),<(SCN0_T+(056*SW)),<(SCN0_T+(057*SW)),<(SCN0_T+(058*SW)),<(SCN0_T+(059*SW))
	.BYTE <(SCN0_T+(060*SW)),<(SCN0_T+(061*SW)),<(SCN0_T+(062*SW)),<(SCN0_T+(063*SW)),<(SCN0_T+(064*SW)),<(SCN0_T+(065*SW)),<(SCN0_T+(066*SW)),<(SCN0_T+(067*SW)),<(SCN0_T+(068*SW)),<(SCN0_T+(069*SW))
	.BYTE <(SCN0_T+(070*SW)),<(SCN0_T+(071*SW)),<(SCN0_T+(072*SW)),<(SCN0_T+(073*SW)),<(SCN0_T+(074*SW)),<(SCN0_T+(075*SW)),<(SCN0_T+(076*SW)),<(SCN0_T+(077*SW)),<(SCN0_T+(078*SW)),<(SCN0_T+(079*SW))
	.BYTE <(SCN0_T+(080*SW)),<(SCN0_T+(081*SW)),<(SCN0_T+(082*SW)),<(SCN0_T+(083*SW)),<(SCN0_T+(084*SW)),<(SCN0_T+(085*SW)),<(SCN0_T+(086*SW)),<(SCN0_T+(087*SW)),<(SCN0_T+(088*SW)),<(SCN0_T+(089*SW))
	.BYTE <(SCN0_T+(090*SW)),<(SCN0_T+(091*SW)),<(SCN0_T+(092*SW)),<(SCN0_T+(093*SW)),<(SCN0_T+(094*SW)),<(SCN0_T+(095*SW)),<(SCN0_T+(096*SW)),<(SCN0_T+(097*SW)),<(SCN0_T+(098*SW)),<(SCN0_T+(099*SW))
	.BYTE <(SCN0_T+(100*SW)),<(SCN0_T+(101*SW)),<(SCN0_T+(102*SW)),<(SCN0_T+(103*SW)),<(SCN0_T+(104*SW)),<(SCN0_T+(105*SW)),<(SCN0_T+(106*SW)),<(SCN0_T+(107*SW)),<(SCN0_T+(108*SW)),<(SCN0_T+(109*SW))
	.BYTE <(SCN0_T+(110*SW)),<(SCN0_T+(111*SW)),<(SCN0_T+(112*SW)),<(SCN0_T+(113*SW)),<(SCN0_T+(114*SW)),<(SCN0_T+(115*SW)),<(SCN0_T+(116*SW)),<(SCN0_T+(117*SW)),<(SCN0_T+(118*SW)),<(SCN0_T+(119*SW))
	.BYTE <(SCN0_T+(120*SW)),<(SCN0_T+(121*SW)),<(SCN0_T+(122*SW)),<(SCN0_T+(123*SW)),<(SCN0_T+(124*SW)),<(SCN0_T+(125*SW)),<(SCN0_T+(126*SW)),<(SCN0_T+(127*SW)),<(SCN0_T+(128*SW)),<(SCN0_T+(129*SW))
	.BYTE <(SCN0_T+(130*SW)),<(SCN0_T+(131*SW)),<(SCN0_T+(132*SW)),<(SCN0_T+(133*SW)),<(SCN0_T+(134*SW)),<(SCN0_T+(135*SW)),<(SCN0_T+(136*SW)),<(SCN0_T+(137*SW)),<(SCN0_T+(138*SW)),<(SCN0_T+(139*SW))
	.BYTE <(SCN0_T+(140*SW)),<(SCN0_T+(141*SW)),<(SCN0_T+(142*SW)),<(SCN0_T+(143*SW)),<(SCN0_T+(144*SW)),<(SCN0_T+(145*SW)),<(SCN0_T+(146*SW)),<(SCN0_T+(147*SW)),<(SCN0_T+(148*SW)),<(SCN0_T+(149*SW))
	.BYTE <(SCN0_T+(150*SW)),<(SCN0_T+(151*SW)),<(SCN0_T+(152*SW)),<(SCN0_T+(153*SW)),<(SCN0_T+(154*SW)),<(SCN0_T+(155*SW)),<(SCN0_T+(156*SW)),<(SCN0_T+(157*SW)),<(SCN0_T+(158*SW)),<(SCN0_T+(159*SW))
	.BYTE <(SCN0_T+(160*SW)),<(SCN0_T+(161*SW)),<(SCN0_T+(162*SW)),<(SCN0_T+(163*SW)),<(SCN0_T+(164*SW)),<(SCN0_T+(165*SW)),<(SCN0_T+(166*SW)),<(SCN0_T+(167*SW)),<(SCN0_T+(168*SW)),<(SCN0_T+(169*SW))
	.BYTE <(SCN0_T+(170*SW)),<(SCN0_T+(171*SW)),<(SCN0_T+(172*SW)),<(SCN0_T+(173*SW)),<(SCN0_T+(174*SW)),<(SCN0_T+(175*SW)),<(SCN0_T+(176*SW)),<(SCN0_T+(177*SW)),<(SCN0_T+(178*SW)),<(SCN0_T+(179*SW))
	.BYTE <(SCN0_T+(180*SW)),<(SCN0_T+(181*SW)),<(SCN0_T+(182*SW)),<(SCN0_T+(183*SW)),<(SCN0_T+(184*SW)),<(SCN0_T+(185*SW)),<(SCN0_T+(186*SW)),<(SCN0_T+(187*SW)),<(SCN0_T+(188*SW)),<(SCN0_T+(189*SW))
	.BYTE <(SCN0_T+(190*SW)),<(SCN0_T+(191*SW))

	.ALIGN $100
SCR_HOR
 .BYTE 00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03,04,04,04,04,05,05,05,05,06,06,06,06,07,07,07,07
 .BYTE 08,08,08,08,09,09,09,09,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15
 .BYTE 16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23
 .BYTE 24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31
SCR_OR
.REPT	32
 .BYTE $C0,$30,$0C,$03
.ENDR
SCR_AND
.REPT	32
 .BYTE $3F,$CF,$F3,$FC
.ENDR
SPR08_DRW_CNT
.REPT	32
 .BYTE 1*8, 2*8, 2*8, 2*8
.ENDR
SPR08_CLR_CNT
.REPT	32
 .BYTE 1, 2, 2, 2
.ENDR

SPR00_AND_LO .BYTE <(SPR00_AND_0-8),<(SPR00_AND_1-8),<(SPR00_AND_2-8),<(SPR00_AND_3-8)
SPR00_AND_HI .BYTE >(SPR00_AND_0-8),>(SPR00_AND_1-8),>(SPR00_AND_2-8),>(SPR00_AND_3-8)
SPR00_ORA_LO .BYTE <(SPR00_ORA_0-8),<(SPR00_ORA_1-8),<(SPR00_ORA_2-8),<(SPR00_ORA_3-8)
SPR00_ORA_HI .BYTE >(SPR00_ORA_0-8),>(SPR00_ORA_1-8),>(SPR00_ORA_2-8),>(SPR00_ORA_3-8)

SPRITE_AND_LO_LO .BYTE <SPR00_AND_LO
SPRITE_AND_LO_HI .BYTE >SPR00_AND_LO
SPRITE_AND_HI_LO .BYTE <SPR00_AND_HI
SPRITE_AND_HI_HI .BYTE >SPR00_AND_HI
SPRITE_ORA_LO_LO .BYTE <SPR00_ORA_LO
SPRITE_ORA_LO_HI .BYTE >SPR00_ORA_LO
SPRITE_ORA_HI_LO .BYTE <SPR00_ORA_HI
SPRITE_ORA_HI_HI .BYTE >SPR00_ORA_HI
SPRITE_TYPE      .BYTE 0,1,2,3

	.ALIGN 8
SPR00_ORA_0
;.BYTE %00000000,%00000000,%00000000,%00000000,%00000000,%00000000,%00000000,%00000000 ; remove?
.BYTE %00010100,%01111101,%01101001,%01000001,%01000001,%01101001,%01111101,%00010100

SPR00_ORA_1
.BYTE %00000000,%01000000,%01000000,%01000000,%01000000,%01000000,%01000000,%00000000
.BYTE %00000101,%00011111,%00011010,%00010000,%00010000,%00011010,%00011111,%00000101

SPR00_ORA_2
.BYTE %01000000,%11010000,%10010000,%00010000,%00010000,%10010000,%11010000,%01000000
.BYTE %00000001,%00000111,%00000110,%00000100,%00000100,%00000110,%00000111,%00000001

SPR00_ORA_3
.BYTE %01010000,%11110100,%10100100,%00000100,%00000100,%10100100,%11110100,%01010000
.BYTE %00000000,%00000001,%00000001,%00000001,%00000001,%00000001,%00000001,%00000000

SPR00_AND_0
;.BYTE %11111111,%11111111,%11111111,%11111111,%11111111,%11111111,%11111111,%11111111 ; remove?
.BYTE %11000011,%00000000,%00000000,%00111100,%00111100,%00000000,%00000000,%11000011

SPR00_AND_1
.BYTE %11111111,%00111111,%00111111,%00111111,%00111111,%00111111,%00111111,%11111111
.BYTE %11110000,%11000000,%11000000,%11001111,%11001111,%11000000,%11000000,%11110000

SPR00_AND_2
.BYTE %00111111,%00001111,%00001111,%11001111,%11001111,%00001111,%00001111,%00111111
.BYTE %11111100,%11110000,%11110000,%11110011,%11110011,%11110000,%11110000,%11111100

SPR00_AND_3
.BYTE %00001111,%00000011,%00000011,%11110011,%11110011,%00000011,%00000011,%00001111
.BYTE %11111111,%11111100,%11111100,%11111100,%11111100,%11111100,%11111100,%11111111

	.ALIGN $100
SPRITE_DRW_JMP_LIST	.WORD DRAW_08
SCR0_OBJ_V	.BYTE 	0,184,0,184,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,117,114,111,108,105
SCR0_OBJ_H	.BYTE 	0,0,120,120,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,117,114,111,108,105
SCR0_OBJ_T	.BYTE	0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
SCR1_OBJ_V	.BYTE 	0,184,0,184,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,117,114,111,108,105
SCR1_OBJ_H	.BYTE 	0,0,120,120,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,117,114,111,108,105
SCR1_OBJ_T	.BYTE	0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0 ; word aligned so must be *2

	.ALIGN $100
SPRITE_CLR_JMP_LIST	.WORD CLEAR_08

.ALIGN $1000
SCN0_T ; screen	
SCN0_B	EQU	SCN0_T +4096
; 2k spare between end of SCN0_B and start of SCN1_T ?
SCN1_T	EQU	SCN0_B +4096
SCN1_B	EQU	SCN1_T +4096
