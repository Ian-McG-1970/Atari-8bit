
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
	
	TV	EQU	REGY +1
	TH	EQU	TV +1
	FIRE EQU TH +1
	
	SPR_AND EQU FIRE +1
	SPR_ORA EQU SPR_AND +2

;	SCR0_LO	EQU	SCR0
;	SCR0_HI	EQU	SCR0 +1
;	SCR1_LO	EQU	SCR1
;	SCR1_HI	EQU	SCR1 +1
;	SCR2_LO	EQU	SCR2
;	SCR2_HI	EQU	SCR2 +1
;	SCR3_LO	EQU	SCR3
;	SCR3_HI	EQU	SCR3 +1
;	SCR4_LO	EQU	SCR4
;	SCR4_HI	EQU	SCR4 +1
;	SCR5_LO	EQU	SCR5
;	SCR5_HI	EQU	SCR5 +1
;	SCR6_LO	EQU	SCR6
;	SCR6_HI	EQU	SCR6 +1
;	SCR7_LO	EQU	SCR7
;	SCR7_HI	EQU	SCR7 +1

 ICL 'hardware.s'

.MACRO	BORDER	COL
			LDA #:1
			STA COLBK
.ENDM 

	ORG $800
				
INIT	SEI
		CLD
		LDX	#$FF
		TXS

		LDA PORTB ; disable basic
		ORA #$02
		STA PORTB
			 	
		LDA #$00 ; disable antic
	    STA SDMCTL
	    STA DMACTL

		LDA #$B6 	; set colours
;		STA	COLPF0 
		STA COLOR0
		LDA #$32
;		STA	COLPF1 
		STA COLOR1
		LDA #$0E
;		STA COLPF2 
		STA COLOR2
		LDA #$00
		STA COLOR4; background / border

		LDX #<DISPLAY_LIST	; Extract low BYTE from DISPLAY_LIST and store it in SDLSTL
		LDY #>DISPLAY_LIST
		STX SDLSTL
		STY SDLSTL+1		; Therefore tell antic the starting address of the custom display list.

        LDX #<DLI	; load display list interrupt address
        LDY #>DLI
		STX VDSLST
        STY VDSLST+1

		ldx #<IRQ
        ldy #>IRQ
        stx VIMIRQ
        sty VIMIRQ+1

;        ldx #<VBLANK
;        ldy #>VBLANK
;        stx VVBLKI
;        sty VVBLKI+1
 
		LDA #$21 			; narrow 23 wide ; #$22       		;
		STA SDMCTL     		; Store literal $23 in SDMCTL - therefore switch ANTIC back on to narrow.
		
		LDA #50
		STA TH
		STA	TV
		
		LDA #%10101010
		LDX #<SCN_T ; SCN
		LDY #>SCN_T ; SCN
		STX SCR0+0
		STY SCR0+1
		LDX #>(102*SW)
		LDY #<(102*SW)
		JSR	MEMSET
		
		LDA #%01011010
		LDX #<SCN_B ; SCN
		LDY #>SCN_B ; SCN
		STX SCR0+0
		STY SCR0+1
		LDX #>(90*SW)
		LDY #<(90*SW)
		JSR	MEMSET

        LDA #NMIEN_VBI | NMIEN_DLI	; activate display list interrupt
        STA NMIEN

;                lda     #$40                    ; enable keyboard interrupt only
;                sta     IRQEN

                ; enable IRQ, DLI, and VBLANK interrupts

;                cli
;                lda     #$C0                    ; enable VBLANK and DLIST interrupts
;                sta     NMIEN

		CLI
		
MLOOP	JMP	MLOOP

.LOCAL	VBLANK ; notify main loop that VBLANK processing is done, when we are finished.
		pha
			BORDER $1C

;                lda     #$FF
;                sta     VBL_DONE
			BORDER 0
 
		pla
        rti
.ENDL

.LOCAL	IRQ
		pha
			BORDER $3A
                lda     #0
                sta     IRQEN
                lda     #$40
                sta     IRQEN
                lda     KBCODE
                ora     #$C0
 ;               sta     MY_KEY
			BORDER 0
                pla
                rti
.ENDL

TMP	.BYTE	0
TMPH	.BYTE 	3,6,9,10,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125
TMPV	.BYTE 	3,6,9,10,13,16,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125

.LOCAL	DLI
			STA REGA
			STX REGX
			STY REGY
		
 			BORDER $7A

		ldx TH
		ldy TV
		stx TMPH+1
		sty TMPV+1

		ldy #22
CLRLP	sty	TMP
		LDX TMPH,y
		LDA TMPV,y
		LDY #0
		JSR CLEAR_SPRITE
		ldy TMP
		dey
		bpl	CLRLP

			BORDER $20

			JSR	JOYSTICK

		ldx TH
		ldy TV
		stx TMPH+1
		sty TMPV+1

		BORDER $44
 
		ldy #22
DRWLP	sty TMP
		LDX TMPH,y
		LDA TMPV,y
		LDY #0
		JSR DRAW_SPRITE
		ldy TMP
		dey
		bpl	DRWLP

			BORDER 0

			LDA REGA
			LDX REGX
			LDY REGY
			RTI
.ENDL

.LOCAL	DRAW_SPRITE
			STX REGX ; H
			STA REGY ; V

			LDA SPRITE_AND_LO_LO,Y
			STA AND_LO+1
			LDA SPRITE_AND_LO_HI,Y
			STA AND_LO+2
			LDA SPRITE_AND_HI_LO,Y
			STA AND_HI+1
			LDA SPRITE_AND_HI_HI,Y
			STA AND_HI+2
  
			LDA SPRITE_ORA_LO_LO,Y
			STA ORA_LO+1
			LDA SPRITE_ORA_LO_HI,Y
			STA ORA_LO+2
			LDA SPRITE_ORA_HI_LO,Y
			STA ORA_HI+1
			LDA SPRITE_ORA_HI_HI,Y
			STA ORA_HI+2

			TXA
			AND     #3
			TAX

AND_LO      LDA $ABCD,X
            STA SPR_AND
AND_HI      LDA $ABCD,X
            STA SPR_AND +1
ORA_LO      LDA $ABCD,X
            STA SPR_ORA
ORA_HI      LDA $ABCD,X
            STA SPR_ORA +1
  
			LDX SPRITE_TYPE,Y
 
			LDA SPRITE_DRW_LO,X
			STA SPRN_TMPB+1
			LDA SPRITE_DRW_HI,X
			STA SPRN_TMPB+2
 
			LDA REGY
SPRN_TMPB	JMP $ABCD
.ENDL

.LOCAL	CLEAR_SPRITE
			STX REGX ; H
  
			LDX SPRITE_TYPE,Y
 
			LDY SPRITE_CLR_LO,X
			STY SPRN_TMPB+1
			LDY SPRITE_CLR_HI,X
			STY SPRN_TMPB+2

			TAY
SPRN_TMPB	JMP $ABCD
.ENDL
	
.LOCAL	DRAW_01
		LDA	SC_LO,Y
		STA	SCR0
		LDA	SC_HI,Y 
		STA	SCR0+1 
		LDY	SCR_HOR,X
		LDA	(SCR0),Y
		ORA	SCR_OR,X
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

.LOCAL	DRAW_08
			LDX SPR_AND
			LDY SPR_AND +1
			STX SPA01 +1
			STY SPA01 +2
			INCXY 
			STX SPA02 +1
			STY SPA02 +2
			INCXY 
			STX SPA03 +1
			STY SPA03 +2
			INCXY 
			STX SPA04 +1
			STY SPA04 +2
			INCXY 
			STX SPA05 +1
			STY SPA05 +2
			INCXY 
			STX SPA06 +1
			STY SPA06 +2
			INCXY 
			STX SPA07 +1
			STY SPA07 +2
			INCXY 
			STX SPA08 +1
			STY SPA08 +2

			LDX SPR_ORA
			LDY SPR_ORA +1
			STX SPO01 +1
			STY SPO01 +2
			INCXY 
			STX SPO02 +1
			STY SPO02 +2
			INCXY 
			STX SPO03 +1
			STY SPO03 +2
			INCXY 
			STX SPO04 +1
			STY SPO04 +2
			INCXY 
			STX SPO05 +1
			STY SPO05 +2
			INCXY 
			STX SPO06 +1
			STY SPO06 +2
			INCXY 
			STX SPO07 +1
			STY SPO07 +2
			INCXY 
			STX SPO08 +1
			STY SPO08 +2
 
 			TAY
			LDX SC_HI +0,Y
			STX SCR0 +1
			
			LSR
			BCS	ODD_12221

EVEN_2222:	LDA SC_LO +0,Y
			STA SCR0
			CLC			
			ADC	#32
			STX SCR1 +1
			STA SCR1

			ADDAX
			STX SCR2 +1
			STA SCR2
			ADC	#32
			STX SCR3 +1
			STA SCR3

			ADDAX
			STX SCR4 +1
			STA SCR4
			ADC	#32
			STX SCR5 +1
			STA SCR5
			
			ADDAX
			STX SCR6 +1
			STA SCR6
			ADC	#32
			STX SCR7 +1
			STA SCR7

			JMP	CONT

ODD_12221:	LDA SC_LO +0,Y
			STA SCR0

			CLC			
			ADDAX
			STX SCR1 +1
			STA SCR1

			ADC	#32
			STX SCR2 +1
			STA SCR2
			ADDAX
			STX SCR3 +1
			STA SCR3

			ADC	#32
			STX SCR4 +1
			STA SCR4

			ADDAX
			STX SCR5 +1
			STA SCR5
			
			ADC	#32
			STX SCR6 +1
			STA SCR6

			ADDAX_NOC
			STX SCR7 +1
			STA SCR7
			
CONT:		LDX REGX
			LDY SCR_HOR,X
			
			LDA	SPR08_DRW_CNT,X
			TAX
			
			SEC
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
				TXA
				SBC #8		; carry set
				TAX

			BNE LOOP
		RTS
.ENDL

.LOCAL	CLEAR_08
			LDX SC_HI +0,Y
			STX SCR0 +1

			TYA
			LSR
			BCS	ODD_12221

EVEN_2222:	LDA SC_LO +0,Y
			STA SCR0
			CLC			
			ADC	#32
			STX SCR1 +1
			STA SCR1

			ADDAX
			STX SCR2 +1
			STA SCR2
			ADC	#32
			STX SCR3 +1
			STA SCR3

			ADDAX
			STX SCR4 +1
			STA SCR4
			ADC	#32
			STX SCR5 +1
			STA SCR5
			
			ADDAX
			STX SCR6 +1
			STA SCR6
			ADC	#32
			STX SCR7 +1
			STA SCR7

			JMP	CONT

ODD_12221:	LDA SC_LO +0,Y
			STA SCR0

			CLC			
			ADDAX
			STX SCR1 +1
			STA SCR1

			ADC	#32
			STX SCR2 +1
			STA SCR2
			ADDAX
			STX SCR3 +1
			STA SCR3

			ADC	#32
			STX SCR4 +1
			STA SCR4

			ADDAX
			STX SCR5 +1
			STA SCR5
			
			ADC	#32
			STX SCR6 +1
			STA SCR6

			ADDAX_NOC
			STX SCR7 +1
			STA SCR7
			
CONT:		LDX REGX
			LDY SCR_HOR,X
			LDA	SPR08_CLR_CNT,X
			TAX

			LDA	#0
LOOP			STA	(SCR0),Y
				STA	(SCR1),Y
				STA	(SCR2),Y
				STA	(SCR3),Y
				STA	(SCR4),Y
				STA	(SCR5),Y
				STA	(SCR6),Y
				STA	(SCR7),Y
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
	
	.ALIGN $100

; every 64 lines add 3k
DISPLAY_LIST		
	.BYTE BLANK_LINE,BLANK_LINE,BLANK_LINE	; Discard 24 scan lines
	.BYTE SCREEN_ADR+SM,<SCN_T,>SCN_T
.REPT	128-1
	.BYTE SM
.ENDR
	.BYTE SCREEN_ADR+SM,<SCN_B,>SCN_B
.REPT	64-1
	.BYTE SM
.ENDR
	.BYTE DLI_INT+SM
	.BYTE DISP_LIST,<DISPLAY_LIST,>DISPLAY_LIST

	.ALIGN $100
SC_HI	
	.BYTE >(SCN_T+(000*SW)),>(SCN_T+(001*SW)),>(SCN_T+(002*SW)),>(SCN_T+(003*SW)),>(SCN_T+(004*SW)),>(SCN_T+(005*SW)),>(SCN_T+(006*SW)),>(SCN_T+(007*SW)),>(SCN_T+(008*SW)),>(SCN_T+(009*SW))
	.BYTE >(SCN_T+(010*SW)),>(SCN_T+(011*SW)),>(SCN_T+(012*SW)),>(SCN_T+(013*SW)),>(SCN_T+(014*SW)),>(SCN_T+(015*SW)),>(SCN_T+(016*SW)),>(SCN_T+(017*SW)),>(SCN_T+(018*SW)),>(SCN_T+(019*SW))
	.BYTE >(SCN_T+(020*SW)),>(SCN_T+(021*SW)),>(SCN_T+(022*SW)),>(SCN_T+(023*SW)),>(SCN_T+(024*SW)),>(SCN_T+(025*SW)),>(SCN_T+(026*SW)),>(SCN_T+(027*SW)),>(SCN_T+(028*SW)),>(SCN_T+(029*SW))
	.BYTE >(SCN_T+(030*SW)),>(SCN_T+(031*SW)),>(SCN_T+(032*SW)),>(SCN_T+(033*SW)),>(SCN_T+(034*SW)),>(SCN_T+(035*SW)),>(SCN_T+(036*SW)),>(SCN_T+(037*SW)),>(SCN_T+(038*SW)),>(SCN_T+(039*SW))
	.BYTE >(SCN_T+(040*SW)),>(SCN_T+(041*SW)),>(SCN_T+(042*SW)),>(SCN_T+(043*SW)),>(SCN_T+(044*SW)),>(SCN_T+(045*SW)),>(SCN_T+(046*SW)),>(SCN_T+(047*SW)),>(SCN_T+(048*SW)),>(SCN_T+(049*SW))
	.BYTE >(SCN_T+(050*SW)),>(SCN_T+(051*SW)),>(SCN_T+(052*SW)),>(SCN_T+(053*SW)),>(SCN_T+(054*SW)),>(SCN_T+(055*SW)),>(SCN_T+(056*SW)),>(SCN_T+(057*SW)),>(SCN_T+(058*SW)),>(SCN_T+(059*SW))
	.BYTE >(SCN_T+(060*SW)),>(SCN_T+(061*SW)),>(SCN_T+(062*SW)),>(SCN_T+(063*SW)),>(SCN_T+(064*SW)),>(SCN_T+(065*SW)),>(SCN_T+(066*SW)),>(SCN_T+(067*SW)),>(SCN_T+(068*SW)),>(SCN_T+(069*SW))
	.BYTE >(SCN_T+(070*SW)),>(SCN_T+(071*SW)),>(SCN_T+(072*SW)),>(SCN_T+(073*SW)),>(SCN_T+(074*SW)),>(SCN_T+(075*SW)),>(SCN_T+(076*SW)),>(SCN_T+(077*SW)),>(SCN_T+(078*SW)),>(SCN_T+(079*SW))
	.BYTE >(SCN_T+(080*SW)),>(SCN_T+(081*SW)),>(SCN_T+(082*SW)),>(SCN_T+(083*SW)),>(SCN_T+(084*SW)),>(SCN_T+(085*SW)),>(SCN_T+(086*SW)),>(SCN_T+(087*SW)),>(SCN_T+(088*SW)),>(SCN_T+(089*SW))
	.BYTE >(SCN_T+(090*SW)),>(SCN_T+(091*SW)),>(SCN_T+(092*SW)),>(SCN_T+(093*SW)),>(SCN_T+(094*SW)),>(SCN_T+(095*SW)),>(SCN_T+(096*SW)),>(SCN_T+(097*SW)),>(SCN_T+(098*SW)),>(SCN_T+(099*SW))
	.BYTE >(SCN_T+(100*SW)),>(SCN_T+(101*SW)),>(SCN_T+(102*SW)),>(SCN_T+(103*SW)),>(SCN_T+(104*SW)),>(SCN_T+(105*SW)),>(SCN_T+(106*SW)),>(SCN_T+(107*SW)),>(SCN_T+(108*SW)),>(SCN_T+(109*SW))
	.BYTE >(SCN_T+(110*SW)),>(SCN_T+(111*SW)),>(SCN_T+(112*SW)),>(SCN_T+(113*SW)),>(SCN_T+(114*SW)),>(SCN_T+(115*SW)),>(SCN_T+(116*SW)),>(SCN_T+(117*SW)),>(SCN_T+(118*SW)),>(SCN_T+(119*SW))
	.BYTE >(SCN_T+(120*SW)),>(SCN_T+(121*SW)),>(SCN_T+(122*SW)),>(SCN_T+(123*SW)),>(SCN_T+(124*SW)),>(SCN_T+(125*SW)),>(SCN_T+(126*SW)),>(SCN_T+(127*SW)),>(SCN_T+(128*SW)),>(SCN_T+(129*SW))
	.BYTE >(SCN_T+(130*SW)),>(SCN_T+(131*SW)),>(SCN_T+(132*SW)),>(SCN_T+(133*SW)),>(SCN_T+(134*SW)),>(SCN_T+(135*SW)),>(SCN_T+(136*SW)),>(SCN_T+(137*SW)),>(SCN_T+(138*SW)),>(SCN_T+(139*SW))
	.BYTE >(SCN_T+(140*SW)),>(SCN_T+(141*SW)),>(SCN_T+(142*SW)),>(SCN_T+(143*SW)),>(SCN_T+(144*SW)),>(SCN_T+(145*SW)),>(SCN_T+(146*SW)),>(SCN_T+(147*SW)),>(SCN_T+(148*SW)),>(SCN_T+(149*SW))
	.BYTE >(SCN_T+(150*SW)),>(SCN_T+(151*SW)),>(SCN_T+(152*SW)),>(SCN_T+(153*SW)),>(SCN_T+(154*SW)),>(SCN_T+(155*SW)),>(SCN_T+(156*SW)),>(SCN_T+(157*SW)),>(SCN_T+(158*SW)),>(SCN_T+(159*SW))
	.BYTE >(SCN_T+(160*SW)),>(SCN_T+(161*SW)),>(SCN_T+(162*SW)),>(SCN_T+(163*SW)),>(SCN_T+(164*SW)),>(SCN_T+(165*SW)),>(SCN_T+(166*SW)),>(SCN_T+(167*SW)),>(SCN_T+(168*SW)),>(SCN_T+(169*SW))
	.BYTE >(SCN_T+(170*SW)),>(SCN_T+(171*SW)),>(SCN_T+(172*SW)),>(SCN_T+(173*SW)),>(SCN_T+(174*SW)),>(SCN_T+(175*SW)),>(SCN_T+(176*SW)),>(SCN_T+(177*SW)),>(SCN_T+(178*SW)),>(SCN_T+(179*SW))
	.BYTE >(SCN_T+(180*SW)),>(SCN_T+(181*SW)),>(SCN_T+(182*SW)),>(SCN_T+(183*SW)),>(SCN_T+(184*SW)),>(SCN_T+(185*SW)),>(SCN_T+(186*SW)),>(SCN_T+(187*SW)),>(SCN_T+(188*SW)),>(SCN_T+(189*SW))
	.BYTE >(SCN_T+(190*SW)),>(SCN_T+(191*SW))

	.ALIGN $100
SC_LO
	.BYTE <(SCN_T+(000*SW)),<(SCN_T+(001*SW)),<(SCN_T+(002*SW)),<(SCN_T+(003*SW)),<(SCN_T+(004*SW)),<(SCN_T+(005*SW)),<(SCN_T+(006*SW)),<(SCN_T+(007*SW)),<(SCN_T+(008*SW)),<(SCN_T+(009*SW))
	.BYTE <(SCN_T+(010*SW)),<(SCN_T+(011*SW)),<(SCN_T+(012*SW)),<(SCN_T+(013*SW)),<(SCN_T+(014*SW)),<(SCN_T+(015*SW)),<(SCN_T+(016*SW)),<(SCN_T+(017*SW)),<(SCN_T+(018*SW)),<(SCN_T+(019*SW))
	.BYTE <(SCN_T+(020*SW)),<(SCN_T+(021*SW)),<(SCN_T+(022*SW)),<(SCN_T+(023*SW)),<(SCN_T+(024*SW)),<(SCN_T+(025*SW)),<(SCN_T+(026*SW)),<(SCN_T+(027*SW)),<(SCN_T+(028*SW)),<(SCN_T+(029*SW))
	.BYTE <(SCN_T+(030*SW)),<(SCN_T+(031*SW)),<(SCN_T+(032*SW)),<(SCN_T+(033*SW)),<(SCN_T+(034*SW)),<(SCN_T+(035*SW)),<(SCN_T+(036*SW)),<(SCN_T+(037*SW)),<(SCN_T+(038*SW)),<(SCN_T+(039*SW))
	.BYTE <(SCN_T+(040*SW)),<(SCN_T+(041*SW)),<(SCN_T+(042*SW)),<(SCN_T+(043*SW)),<(SCN_T+(044*SW)),<(SCN_T+(045*SW)),<(SCN_T+(046*SW)),<(SCN_T+(047*SW)),<(SCN_T+(048*SW)),<(SCN_T+(049*SW))
	.BYTE <(SCN_T+(050*SW)),<(SCN_T+(051*SW)),<(SCN_T+(052*SW)),<(SCN_T+(053*SW)),<(SCN_T+(054*SW)),<(SCN_T+(055*SW)),<(SCN_T+(056*SW)),<(SCN_T+(057*SW)),<(SCN_T+(058*SW)),<(SCN_T+(059*SW))
	.BYTE <(SCN_T+(060*SW)),<(SCN_T+(061*SW)),<(SCN_T+(062*SW)),<(SCN_T+(063*SW)),<(SCN_T+(064*SW)),<(SCN_T+(065*SW)),<(SCN_T+(066*SW)),<(SCN_T+(067*SW)),<(SCN_T+(068*SW)),<(SCN_T+(069*SW))
	.BYTE <(SCN_T+(070*SW)),<(SCN_T+(071*SW)),<(SCN_T+(072*SW)),<(SCN_T+(073*SW)),<(SCN_T+(074*SW)),<(SCN_T+(075*SW)),<(SCN_T+(076*SW)),<(SCN_T+(077*SW)),<(SCN_T+(078*SW)),<(SCN_T+(079*SW))
	.BYTE <(SCN_T+(080*SW)),<(SCN_T+(081*SW)),<(SCN_T+(082*SW)),<(SCN_T+(083*SW)),<(SCN_T+(084*SW)),<(SCN_T+(085*SW)),<(SCN_T+(086*SW)),<(SCN_T+(087*SW)),<(SCN_T+(088*SW)),<(SCN_T+(089*SW))
	.BYTE <(SCN_T+(090*SW)),<(SCN_T+(091*SW)),<(SCN_T+(092*SW)),<(SCN_T+(093*SW)),<(SCN_T+(094*SW)),<(SCN_T+(095*SW)),<(SCN_T+(096*SW)),<(SCN_T+(097*SW)),<(SCN_T+(098*SW)),<(SCN_T+(099*SW))
	.BYTE <(SCN_T+(100*SW)),<(SCN_T+(101*SW)),<(SCN_T+(102*SW)),<(SCN_T+(103*SW)),<(SCN_T+(104*SW)),<(SCN_T+(105*SW)),<(SCN_T+(106*SW)),<(SCN_T+(107*SW)),<(SCN_T+(108*SW)),<(SCN_T+(109*SW))
	.BYTE <(SCN_T+(110*SW)),<(SCN_T+(111*SW)),<(SCN_T+(112*SW)),<(SCN_T+(113*SW)),<(SCN_T+(114*SW)),<(SCN_T+(115*SW)),<(SCN_T+(116*SW)),<(SCN_T+(117*SW)),<(SCN_T+(118*SW)),<(SCN_T+(119*SW))
	.BYTE <(SCN_T+(120*SW)),<(SCN_T+(121*SW)),<(SCN_T+(122*SW)),<(SCN_T+(123*SW)),<(SCN_T+(124*SW)),<(SCN_T+(125*SW)),<(SCN_T+(126*SW)),<(SCN_T+(127*SW)),<(SCN_T+(128*SW)),<(SCN_T+(129*SW))
	.BYTE <(SCN_T+(130*SW)),<(SCN_T+(131*SW)),<(SCN_T+(132*SW)),<(SCN_T+(133*SW)),<(SCN_T+(134*SW)),<(SCN_T+(135*SW)),<(SCN_T+(136*SW)),<(SCN_T+(137*SW)),<(SCN_T+(138*SW)),<(SCN_T+(139*SW))
	.BYTE <(SCN_T+(140*SW)),<(SCN_T+(141*SW)),<(SCN_T+(142*SW)),<(SCN_T+(143*SW)),<(SCN_T+(144*SW)),<(SCN_T+(145*SW)),<(SCN_T+(146*SW)),<(SCN_T+(147*SW)),<(SCN_T+(148*SW)),<(SCN_T+(149*SW))
	.BYTE <(SCN_T+(150*SW)),<(SCN_T+(151*SW)),<(SCN_T+(152*SW)),<(SCN_T+(153*SW)),<(SCN_T+(154*SW)),<(SCN_T+(155*SW)),<(SCN_T+(156*SW)),<(SCN_T+(157*SW)),<(SCN_T+(158*SW)),<(SCN_T+(159*SW))
	.BYTE <(SCN_T+(160*SW)),<(SCN_T+(161*SW)),<(SCN_T+(162*SW)),<(SCN_T+(163*SW)),<(SCN_T+(164*SW)),<(SCN_T+(165*SW)),<(SCN_T+(166*SW)),<(SCN_T+(167*SW)),<(SCN_T+(168*SW)),<(SCN_T+(169*SW))
	.BYTE <(SCN_T+(170*SW)),<(SCN_T+(171*SW)),<(SCN_T+(172*SW)),<(SCN_T+(173*SW)),<(SCN_T+(174*SW)),<(SCN_T+(175*SW)),<(SCN_T+(176*SW)),<(SCN_T+(177*SW)),<(SCN_T+(178*SW)),<(SCN_T+(179*SW))
	.BYTE <(SCN_T+(180*SW)),<(SCN_T+(181*SW)),<(SCN_T+(182*SW)),<(SCN_T+(183*SW)),<(SCN_T+(184*SW)),<(SCN_T+(185*SW)),<(SCN_T+(186*SW)),<(SCN_T+(187*SW)),<(SCN_T+(188*SW)),<(SCN_T+(189*SW))
	.BYTE <(SCN_T+(190*SW)),<(SCN_T+(191*SW))

	.ALIGN $100
SCR_HOR
 .BYTE 00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03,04,04,04,04,05,05,05,05,06,06,06,06,07,07,07,07
 .BYTE 08,08,08,08,09,09,09,09,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15
 .BYTE 16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23
 .BYTE 24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31
 .BYTE 32,32,32,32,33,33,33,33,34,34,34,34,35,35,35,35,36,36,36,36,37,37,37,37,38,38,38,38,39,39,39,39

	.ALIGN $100
SCR_OR
.REPT	40
 .BYTE $C0,$30,$0C,$03
.ENDR

	.ALIGN $100
SCR_AND
.REPT	40
 .BYTE $3F,$CF,$F3,$FC
.ENDR

	.ALIGN $100
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

SPRITE_DRW_LO   .BYTE <DRAW_08
SPRITE_DRW_HI   .BYTE >DRAW_08
;SPRITE_DRW_SIZE .BYTE 8*2		; ROWS X COLUMNS
SPRITE_CLR_LO  	.BYTE <CLEAR_08
SPRITE_CLR_HI  	.BYTE >CLEAR_08
SPRITE_CLR_SIZE .BYTE 2			; COLUMNS ONLY

.ALIGN $1000
SCN_T ; screen	
SCN_B	EQU	SCN_T +4096; -16



; if sprite movement is every 2 vertical lines then for atari and c64 (and spectrum)
; c64 - every 2 lines
;  lda vhi,x ; get 1st line address
;  ldy vlo,x
;  sta scrposlo+0 ; store 1st and 2nd line address
;  sta scrposlo+1
;  sty srcposlo+0 ; store 1st line address
;  iny
;  sty scrposlo+1 ; store 2nd line address

;  add 
; a=lo
; y=hi
; sta scrn,x
; sty scrn,x
; adc 



;test 1 - how many 16x16 software sprites can be cleared and drawn per frame?
;test 2 - how many 8x8 software sprites can be cleared and drawn per frame?
;test 3 - how many 1x1 points can be cleared and drawn per frame?

;test 4 - process to setup 2 screens and flip the screens - switch pointers to tables and switch screen address pointers - on interrupt


;object list screen 1 - list of objects drawn on screen 1
; obj x 1
; obj y 1
; obj num 1
;obj 1 count - number of objects on screen 1
 
;object list screen 2 - list of objects drawn on screen 2
; obj x 2
; obj x 2
; obj num 2 
;obj 2 count - number of objects on screen 2

;obj num ; has a draw type and a clear type
; obj draw type (1,8,16)
; obj clear type (1,8,16)
 



