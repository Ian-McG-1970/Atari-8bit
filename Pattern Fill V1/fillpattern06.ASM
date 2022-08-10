	SCREEN	EQU	128

	SCR 	EQU	SCREEN +1
	SCR_LO	EQU	SCR
	SCR_HI	EQU	SCR_LO +1
	
	REGA EQU SCR_HI +1
	REGX EQU REGA +1
	REGY EQU REGX +1
	
	LHS	EQU	REGY +1
	LHE EQU LHS +1
	TMP EQU LHE +1
	DIRECTION EQU TMP +1
	VSTART EQU DIRECTION +1
	HSTART EQU VSTART +1
	VCNT EQU HSTART +1
	
	V0	EQU	VCNT +1
	V1	EQU	V0 +1
	V2	EQU	V1 +1
	V3	EQU V2 +1
	H0	EQU	V3 +1
	H1	EQU	H0 +1
	H2	EQU	H1 +1
	H3	EQU	H2 +1
	PATTERN	EQU H3 +1
	PATTERN_CLIP EQU PATTERN +1

 ICL 'hardware.s'

	ORG $800
				
INIT	LDA PORTB ; disable basic
		ORA #$02
		STA PORTB
			 	
		LDA #$00 ; disable antic
		STA SDMCTL
		STA DMACTL

		LDA #$73 	; set colours
		STA	COLOR0
		       
		LDA #$F7
		STA	COLOR1
		LDA #$2F
		STA COLOR2
		LDA #$78
		STA COLOR3
		LDA #$00
		STA COLOR4 ; background / border
			
		LDA #0
		STA SCREEN

		LDA #<DISPLAY_LIST	; Extract low BYTE from DISPLAY_LIST and store it in SDLSTL
		STA SDLSTL
		LDA #>DISPLAY_LIST	; Extract high BYTE from DISPLAY_LIST and store it in SDLSTL+1
		STA SDLSTL+1		; Therefore tell antic the starting address of the custom display list.
						
		LDA #$21 ; narrow 23 wide ; #$22       		;
		STA SDMCTL     		;Store literal $23 in SDMCTL - therefore switch ANTIC back on to narrow.
		
		LDA #%01010101 ; %01100110
		STA	PATTERN
 
; 20,50,50,80,80,50,50,20
		LDX #20
		STX V0
		LDY #50
		STY H0
		LDX #50
		STX V1
		LDY #80
		STY H1
		LDX #80
		STX V2
		LDY #50
		STY H2
		LDX #50
		STX V3
		LDY #20
		STY H3

; 20,50,50,80,80,80,50,50
;		LDX #20
;		STX V0
;		LDY #50
;		STY H0
;		LDX #50
;		STX V1
;		LDY #80
;		STY H1
;		LDX #80
;		STX V2
;		LDY #80
;		STY H2
;		LDX #50
;		STX V3
;		LDY #50
;		STY H3

; 20,50,50,50,80,20,50,20
;		LDX #20
;		STX V0
;		LDY #50
;		STY H0
;		LDX #50
;		STX V1
;		LDY #50
;		STY H1
;		LDX #80
;		STX V2
;		LDY #20
;		STY H2
;		LDX #50
;		STX V3
;		LDY #20
;		STY H3

MLOOP		JSR	V_WAIT
			JSR	SWAP_SCREEN

			JSR FILL_SHAPE
			
		JMP	MLOOP

.LOCAL	FILL_SHAPE
			LDA	V0
			STA	TMP
			LDA V1
			LDY	H0
			LDX	H1
			JSR	LINE_SETUP
			CLC ; right edge
			JSR	FILL
	
			LDA	V1
			STA	TMP
			LDA V2
			LDY	H1
			LDX	H2
			JSR	LINE_SETUP
			CLC ; right edge
			JSR	FILL

			LDA	V3
			STA	TMP
			LDA V2
			LDY	H3
			LDX	H2
			JSR	LINE_SETUP
			SEC ; left edge
			JSR	FILL

			LDA	V0
			STA	TMP
			LDA V3
			LDY	H0
			LDX	H3
			JSR	LINE_SETUP
			SEC ; left edge
			JSR	FILL
 
			LDA V2
			SEC
			SBC V0
			TAX ; VC
			TYA	; H
			ldy V0 ; v
			jsr FILL_LINE
		RTS
.ENDL

.LOCAL	LINE_SETUP
			SEC
			SBC TMP
			STA	VCNT
			STY HSTART
			TXA
			CMP HSTART
			BEQ SAME
			BCC LESS
MORE			LDA #1
				JMP CONT
LESS			LDA #-1
				JMP CONT
SAME			LDA #0
CONT		STA DIRECTION	; -1 = moving left / +1 = moving right / 0 = straight down
			TYA		; H
			LDY TMP ; V
			LDX VCNT; VC
			RTS
.ENDL

.LOCAL	FILL ; carry set = direction
			STA HSTART
			BCC RIGHT_EDGE
LEFT_EDGE		LDA	#<LINE_LEFT
				STA	SCR
				LDA	#>LINE_LEFT
				STA	SCR+1
				JMP	CONT
RIGHT_EDGE		LDA	#<LINE_RIGHT
				STA	SCR
				LDA	#>LINE_RIGHT
				STA	SCR+1
CONT		LDA HSTART
LOOP			STA	(SCR),Y
				CLC
				ADC DIRECTION
				INY
				DEX
				BPL	LOOP
			RTS
.ENDL

PATTERNS
 .BYTE	%11001100,%00110011,%10011001,%01100110,%11110000,%00001111,%10100000,%00000101

.LOCAL FILL_LINE
			STY VSTART
			STX VCNT
LOOP			LDA VSTART
				TAY
				AND #7
				TAX
				LDA PATTERNS,X
				STA PATTERN
				
				LDA LINE_LEFT,Y
				LDX LINE_RIGHT,Y
				JSR LINE
				INC VSTART
				DEC VCNT
			BPL LOOP ; BPL BNE
			RTS
.ENDL

.LOCAL	LINE
			STA LHS
			LDA SCR_0_LO,Y
			STA SCR 
LINE_HI		LDA SCR_0_HI,Y 
			STA SCR+1 

			STX LHE
			LDA SCR_HOR,X
			TAY
			LDX LHS
			SEC
			SBC SCR_HOR,X
			BEQ LINE_SAME

			STA	TMP
			LDa LHE
			and #3
			tax

			LDA	PATTERN
			AND	LINE_RIGHT_OR,X
			STA PATTERN_CLIP
			
			LDA (SCR),Y
			AND LINE_RIGHT_AND,X
			ORA	PATTERN_CLIP
			STA (SCR),Y
			DEY
			
			LDX	TMP
			DEX
			BEQ LINE_LEFT
 
			LDA PATTERN ; #$FF
LOOP			STA (SCR),Y
				DEY
				DEX
				BNE LOOP

LINE_LEFT	LDA LHS
			AND #3
			TAX

			LDA	PATTERN
			AND	LINE_LEFT_OR,X
			STA PATTERN_CLIP
			
			LDA (SCR),Y
			AND LINE_LEFT_AND,X
			ORA	PATTERN_CLIP
			STA (SCR),Y
			RTS

LINE_SAME	TXA
			AND #3
			TAX
			LDA	PATTERN
			AND	LINE_LEFT_OR,X
			STA PATTERN_CLIP
			LDA LHE
			AND #3
			TAX			
			LDA PATTERN_CLIP
			AND	LINE_RIGHT_OR,X
			STA PATTERN_CLIP

			LDA LHS
			AND #3
			TAX
			LDA LINE_SAME_LEFT_2,X
			STA	TMP
			LDA LHE
			AND #3
			TAX			
			LDA	TMP
			ORA LINE_SAME_RIGHT_2,X
			AND (SCR),Y
			ORA PATTERN_CLIP
			STA (SCR),Y
			RTS
.ENDL

.LOCAL	V_WAIT
			LDA	RTCLOK+2
LOOP			CMP	RTCLOK+2  ; will be equal until incremented in VB
				BEQ	LOOP
			RTS
.ENDL

.LOCAL	SWAP_SCREEN
			INC		SCREEN
			LDA		SCREEN
			LSR
			BCC		SCREEN_1

SCREEN_0	LDX		#>SCR_0
			STX		DISPLAY_LIST_SCREEN+1
		
			LDX		#>SCR_1_HI
			LDY		#<SCR_1_HI
			STX		LINE.LINE_HI+2
			STY		LINE.LINE_HI+1			

			LDA		#%10101010 ;0; $FF ; #$A5			
			LDY		#99
			JMP		CLEAR_SCREEN_1

SCREEN_1	LDX		#>SCR_1
			STX		DISPLAY_LIST_SCREEN+1

			LDX		#>SCR_0_HI
			LDY		#<SCR_0_HI
			STX		LINE.LINE_HI+2
			STY		LINE.LINE_HI+1			

			LDA		#%10101010 ;0; $FF ;#$A5
			LDY		#99
CLEAR_SCREEN_0	
CLR_SCN_0_LP	STA		SCR_0-1+(99*000),Y
				STA		SCR_0-1+(99*001),Y
				STA		SCR_0-1+(99*002),Y
				STA		SCR_0-1+(99*003),Y
				STA		SCR_0-1+(99*004),Y
				STA		SCR_0-1+(99*005),Y
				STA		SCR_0-1+(99*006),Y
				STA		SCR_0-1+(99*007),Y
				STA		SCR_0-1+(99*008),Y
				STA		SCR_0-1+(99*009),Y
				STA		SCR_0-1+(99*010),Y
				STA		SCR_0-1+(99*011),Y
				STA		SCR_0-1+(99*012),Y
				STA		SCR_0-1+(99*013),Y
				STA		SCR_0-1+(99*014),Y
				STA		SCR_0-1+(99*015),Y
				STA		SCR_0-1+(99*016),Y
				STA		SCR_0-1+(99*017),Y
				STA		SCR_0-1+(99*018),Y
				STA		SCR_0-1+(99*019),Y
				STA		SCR_0-1+(99*020),Y
				STA		SCR_0-1+(99*021),Y
				STA		SCR_0-1+(99*022),Y
				STA		SCR_0-1+(99*023),Y
				STA		SCR_0-1+(99*024),Y
				STA		SCR_0-1+(99*025),Y
				STA		SCR_0-1+(99*026),Y
				STA		SCR_0-1+(99*027),Y
				STA		SCR_0-1+(99*028),Y
				STA		SCR_0-1+(99*029),Y
				STA		SCR_0-1+(99*030),Y
				STA		SCR_0-1+(99*031),Y
				STA		SCR_0-1+(99*032),Y
				STA		SCR_0-1+(99*033),Y
				STA		SCR_0-1+(99*034),Y
				STA		SCR_0-1+(99*035),Y
				STA		SCR_0-1+(99*036),Y
				STA		SCR_0-1+(99*037),Y
				STA		SCR_0-1+(99*038),Y
				STA		SCR_0-1+(99*039),Y
				STA		SCR_0-1+(99*040),Y				
				DEY
				BNE		CLR_SCN_0_LP
;			STA		SCR_0-1+(99*041)+1
			STA		SCR_0-1+(99*041)+2
;			STA		SCR_0-1+(99*041)+3
			STA		SCR_0-1+(99*041)+4
;			STA		SCR_0-1+(99*041)+5
			RTS

CLEAR_SCREEN_1	
CLR_SCN_1_LP	STA		SCR_1-1+(99*000),Y
				STA		SCR_1-1+(99*001),Y
				STA		SCR_1-1+(99*002),Y
				STA		SCR_1-1+(99*003),Y
				STA		SCR_1-1+(99*004),Y
				STA		SCR_1-1+(99*005),Y
				STA		SCR_1-1+(99*006),Y
				STA		SCR_1-1+(99*007),Y
				STA		SCR_1-1+(99*008),Y
				STA		SCR_1-1+(99*009),Y
				STA		SCR_1-1+(99*010),Y
				STA		SCR_1-1+(99*011),Y
				STA		SCR_1-1+(99*012),Y
				STA		SCR_1-1+(99*013),Y
				STA		SCR_1-1+(99*014),Y
				STA		SCR_1-1+(99*015),Y
				STA		SCR_1-1+(99*016),Y
				STA		SCR_1-1+(99*017),Y
				STA		SCR_1-1+(99*018),Y
				STA		SCR_1-1+(99*019),Y
				STA		SCR_1-1+(99*020),Y
				STA		SCR_1-1+(99*021),Y
				STA		SCR_1-1+(99*022),Y
				STA		SCR_1-1+(99*023),Y
				STA		SCR_1-1+(99*024),Y
				STA		SCR_1-1+(99*025),Y
				STA		SCR_1-1+(99*026),Y
				STA		SCR_1-1+(99*027),Y
				STA		SCR_1-1+(99*028),Y
				STA		SCR_1-1+(99*029),Y
				STA		SCR_1-1+(99*030),Y
				STA		SCR_1-1+(99*031),Y
				STA		SCR_1-1+(99*032),Y
				STA		SCR_1-1+(99*033),Y
				STA		SCR_1-1+(99*034),Y
				STA		SCR_1-1+(99*035),Y
				STA		SCR_1-1+(99*036),Y
				STA		SCR_1-1+(99*037),Y
				STA		SCR_1-1+(99*038),Y
				STA		SCR_1-1+(99*039),Y
				STA		SCR_1-1+(99*040),Y
				DEY
				BNE		CLR_SCN_1_LP
;			STA		SCR_1-1+(99*041)+1
			STA		SCR_1-1+(99*041)+2
;			STA		SCR_1-1+(99*041)+3
			STA		SCR_1-1+(99*041)+4
;			STA		SCR_1-1+(99*041)+5
			RTS
.ENDL

			.ALIGN $100
				
DISPLAY_LIST		.BYTE $70,$70,$70	;Discard 24 scan lines
			.BYTE $4E
DISPLAY_LIST_SCREEN	.BYTE <SCR_0,>SCR_0
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
			.BYTE $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; , $0E
			.BYTE $41,<DISPLAY_LIST,>DISPLAY_LIST
;			.BYTE $80 ; DLI

.ALIGN $100

SCR_0_HI	.BYTE >(SCR_0+(32*000)),>(SCR_0+(32*001)),>(SCR_0+(32*002)),>(SCR_0+(32*003)),>(SCR_0+(32*004)),>(SCR_0+(32*005)),>(SCR_0+(32*006)),>(SCR_0+(32*007))
	.BYTE >(SCR_0+(32*008)),>(SCR_0+(32*009)),>(SCR_0+(32*010)),>(SCR_0+(32*011)),>(SCR_0+(32*012)),>(SCR_0+(32*013)),>(SCR_0+(32*014)),>(SCR_0+(32*015))
	.BYTE >(SCR_0+(32*016)),>(SCR_0+(32*017)),>(SCR_0+(32*018)),>(SCR_0+(32*019)),>(SCR_0+(32*020)),>(SCR_0+(32*021)),>(SCR_0+(32*022)),>(SCR_0+(32*023))
	.BYTE >(SCR_0+(32*024)),>(SCR_0+(32*025)),>(SCR_0+(32*026)),>(SCR_0+(32*027)),>(SCR_0+(32*028)),>(SCR_0+(32*029)),>(SCR_0+(32*030)),>(SCR_0+(32*031))
	.BYTE >(SCR_0+(32*032)),>(SCR_0+(32*033)),>(SCR_0+(32*034)),>(SCR_0+(32*035)),>(SCR_0+(32*036)),>(SCR_0+(32*037)),>(SCR_0+(32*038)),>(SCR_0+(32*039))
	.BYTE >(SCR_0+(32*040)),>(SCR_0+(32*041)),>(SCR_0+(32*042)),>(SCR_0+(32*043)),>(SCR_0+(32*044)),>(SCR_0+(32*045)),>(SCR_0+(32*046)),>(SCR_0+(32*047))
	.BYTE >(SCR_0+(32*048)),>(SCR_0+(32*049)),>(SCR_0+(32*050)),>(SCR_0+(32*051)),>(SCR_0+(32*052)),>(SCR_0+(32*053)),>(SCR_0+(32*054)),>(SCR_0+(32*055))
	.BYTE >(SCR_0+(32*056)),>(SCR_0+(32*057)),>(SCR_0+(32*058)),>(SCR_0+(32*059)),>(SCR_0+(32*060)),>(SCR_0+(32*061)),>(SCR_0+(32*062)),>(SCR_0+(32*063))
	.BYTE >(SCR_0+(32*064)),>(SCR_0+(32*065)),>(SCR_0+(32*066)),>(SCR_0+(32*067)),>(SCR_0+(32*068)),>(SCR_0+(32*069)),>(SCR_0+(32*070)),>(SCR_0+(32*071))
	.BYTE >(SCR_0+(32*072)),>(SCR_0+(32*073)),>(SCR_0+(32*074)),>(SCR_0+(32*075)),>(SCR_0+(32*076)),>(SCR_0+(32*077)),>(SCR_0+(32*078)),>(SCR_0+(32*079))
	.BYTE >(SCR_0+(32*080)),>(SCR_0+(32*081)),>(SCR_0+(32*082)),>(SCR_0+(32*083)),>(SCR_0+(32*084)),>(SCR_0+(32*085)),>(SCR_0+(32*086)),>(SCR_0+(32*087))
	.BYTE >(SCR_0+(32*088)),>(SCR_0+(32*089)),>(SCR_0+(32*090)),>(SCR_0+(32*091)),>(SCR_0+(32*092)),>(SCR_0+(32*093)),>(SCR_0+(32*094)),>(SCR_0+(32*095))
	.BYTE >(SCR_0+(32*096)),>(SCR_0+(32*097)),>(SCR_0+(32*098)),>(SCR_0+(32*099)),>(SCR_0+(32*100)),>(SCR_0+(32*101)),>(SCR_0+(32*102)),>(SCR_0+(32*103))
	.BYTE >(SCR_0+(32*104)),>(SCR_0+(32*105)),>(SCR_0+(32*106)),>(SCR_0+(32*107)),>(SCR_0+(32*108)),>(SCR_0+(32*109)),>(SCR_0+(32*110)),>(SCR_0+(32*111))
	.BYTE >(SCR_0+(32*112)),>(SCR_0+(32*113)),>(SCR_0+(32*114)),>(SCR_0+(32*115)),>(SCR_0+(32*116)),>(SCR_0+(32*117)),>(SCR_0+(32*118)),>(SCR_0+(32*119))
	.BYTE >(SCR_0+(32*120)),>(SCR_0+(32*121)),>(SCR_0+(32*122)),>(SCR_0+(32*123)),>(SCR_0+(32*124)),>(SCR_0+(32*125)),>(SCR_0+(32*126)),>(SCR_0+(32*127))
	
SCR_0_LO	.BYTE <(SCR_0+(32*000)),<(SCR_0+(32*001)),<(SCR_0+(32*002)),<(SCR_0+(32*003)),<(SCR_0+(32*004)),<(SCR_0+(32*005)),<(SCR_0+(32*006)),<(SCR_0+(32*007))
	.BYTE <(SCR_0+(32*008)),<(SCR_0+(32*009)),<(SCR_0+(32*010)),<(SCR_0+(32*011)),<(SCR_0+(32*012)),<(SCR_0+(32*013)),<(SCR_0+(32*014)),<(SCR_0+(32*015))
	.BYTE <(SCR_0+(32*016)),<(SCR_0+(32*017)),<(SCR_0+(32*018)),<(SCR_0+(32*019)),<(SCR_0+(32*020)),<(SCR_0+(32*021)),<(SCR_0+(32*022)),<(SCR_0+(32*023))
	.BYTE <(SCR_0+(32*024)),<(SCR_0+(32*025)),<(SCR_0+(32*026)),<(SCR_0+(32*027)),<(SCR_0+(32*028)),<(SCR_0+(32*029)),<(SCR_0+(32*030)),<(SCR_0+(32*031))
	.BYTE <(SCR_0+(32*032)),<(SCR_0+(32*033)),<(SCR_0+(32*034)),<(SCR_0+(32*035)),<(SCR_0+(32*036)),<(SCR_0+(32*037)),<(SCR_0+(32*038)),<(SCR_0+(32*039))
	.BYTE <(SCR_0+(32*040)),<(SCR_0+(32*041)),<(SCR_0+(32*042)),<(SCR_0+(32*043)),<(SCR_0+(32*044)),<(SCR_0+(32*045)),<(SCR_0+(32*046)),<(SCR_0+(32*047))
	.BYTE <(SCR_0+(32*048)),<(SCR_0+(32*049)),<(SCR_0+(32*050)),<(SCR_0+(32*051)),<(SCR_0+(32*052)),<(SCR_0+(32*053)),<(SCR_0+(32*054)),<(SCR_0+(32*055))
	.BYTE <(SCR_0+(32*056)),<(SCR_0+(32*057)),<(SCR_0+(32*058)),<(SCR_0+(32*059)),<(SCR_0+(32*060)),<(SCR_0+(32*061)),<(SCR_0+(32*062)),<(SCR_0+(32*063))
	.BYTE <(SCR_0+(32*064)),<(SCR_0+(32*065)),<(SCR_0+(32*066)),<(SCR_0+(32*067)),<(SCR_0+(32*068)),<(SCR_0+(32*069)),<(SCR_0+(32*070)),<(SCR_0+(32*071))
	.BYTE <(SCR_0+(32*072)),<(SCR_0+(32*073)),<(SCR_0+(32*074)),<(SCR_0+(32*075)),<(SCR_0+(32*076)),<(SCR_0+(32*077)),<(SCR_0+(32*078)),<(SCR_0+(32*079))
	.BYTE <(SCR_0+(32*080)),<(SCR_0+(32*081)),<(SCR_0+(32*082)),<(SCR_0+(32*083)),<(SCR_0+(32*084)),<(SCR_0+(32*085)),<(SCR_0+(32*086)),<(SCR_0+(32*087))
	.BYTE <(SCR_0+(32*088)),<(SCR_0+(32*089)),<(SCR_0+(32*090)),<(SCR_0+(32*091)),<(SCR_0+(32*092)),<(SCR_0+(32*093)),<(SCR_0+(32*094)),<(SCR_0+(32*095))
	.BYTE <(SCR_0+(32*096)),<(SCR_0+(32*097)),<(SCR_0+(32*098)),<(SCR_0+(32*099)),<(SCR_0+(32*100)),<(SCR_0+(32*101)),<(SCR_0+(32*102)),<(SCR_0+(32*103))
	.BYTE <(SCR_0+(32*104)),<(SCR_0+(32*105)),<(SCR_0+(32*106)),<(SCR_0+(32*107)),<(SCR_0+(32*108)),<(SCR_0+(32*109)),<(SCR_0+(32*110)),<(SCR_0+(32*111))
	.BYTE <(SCR_0+(32*112)),<(SCR_0+(32*113)),<(SCR_0+(32*114)),<(SCR_0+(32*115)),<(SCR_0+(32*116)),<(SCR_0+(32*117)),<(SCR_0+(32*118)),<(SCR_0+(32*119))
	.BYTE <(SCR_0+(32*120)),<(SCR_0+(32*121)),<(SCR_0+(32*122)),<(SCR_0+(32*123)),<(SCR_0+(32*124)),<(SCR_0+(32*125)),<(SCR_0+(32*126)),<(SCR_0+(32*127))

SCR_1_HI	.BYTE >(SCR_1+(32*000)),>(SCR_1+(32*001)),>(SCR_1+(32*002)),>(SCR_1+(32*003)),>(SCR_1+(32*004)),>(SCR_1+(32*005)),>(SCR_1+(32*006)),>(SCR_1+(32*007))
	.BYTE >(SCR_1+(32*008)),>(SCR_1+(32*009)),>(SCR_1+(32*010)),>(SCR_1+(32*011)),>(SCR_1+(32*012)),>(SCR_1+(32*013)),>(SCR_1+(32*014)),>(SCR_1+(32*015))
	.BYTE >(SCR_1+(32*016)),>(SCR_1+(32*017)),>(SCR_1+(32*018)),>(SCR_1+(32*019)),>(SCR_1+(32*020)),>(SCR_1+(32*021)),>(SCR_1+(32*022)),>(SCR_1+(32*023))
	.BYTE >(SCR_1+(32*024)),>(SCR_1+(32*025)),>(SCR_1+(32*026)),>(SCR_1+(32*027)),>(SCR_1+(32*028)),>(SCR_1+(32*029)),>(SCR_1+(32*030)),>(SCR_1+(32*031))
	.BYTE >(SCR_1+(32*032)),>(SCR_1+(32*033)),>(SCR_1+(32*034)),>(SCR_1+(32*035)),>(SCR_1+(32*036)),>(SCR_1+(32*037)),>(SCR_1+(32*038)),>(SCR_1+(32*039))
	.BYTE >(SCR_1+(32*040)),>(SCR_1+(32*041)),>(SCR_1+(32*042)),>(SCR_1+(32*043)),>(SCR_1+(32*044)),>(SCR_1+(32*045)),>(SCR_1+(32*046)),>(SCR_1+(32*047))
	.BYTE >(SCR_1+(32*048)),>(SCR_1+(32*049)),>(SCR_1+(32*050)),>(SCR_1+(32*051)),>(SCR_1+(32*052)),>(SCR_1+(32*053)),>(SCR_1+(32*054)),>(SCR_1+(32*055))
	.BYTE >(SCR_1+(32*056)),>(SCR_1+(32*057)),>(SCR_1+(32*058)),>(SCR_1+(32*059)),>(SCR_1+(32*060)),>(SCR_1+(32*061)),>(SCR_1+(32*062)),>(SCR_1+(32*063))
	.BYTE >(SCR_1+(32*064)),>(SCR_1+(32*065)),>(SCR_1+(32*066)),>(SCR_1+(32*067)),>(SCR_1+(32*068)),>(SCR_1+(32*069)),>(SCR_1+(32*070)),>(SCR_1+(32*071))
	.BYTE >(SCR_1+(32*072)),>(SCR_1+(32*073)),>(SCR_1+(32*074)),>(SCR_1+(32*075)),>(SCR_1+(32*076)),>(SCR_1+(32*077)),>(SCR_1+(32*078)),>(SCR_1+(32*079))
	.BYTE >(SCR_1+(32*080)),>(SCR_1+(32*081)),>(SCR_1+(32*082)),>(SCR_1+(32*083)),>(SCR_1+(32*084)),>(SCR_1+(32*085)),>(SCR_1+(32*086)),>(SCR_1+(32*087))
	.BYTE >(SCR_1+(32*088)),>(SCR_1+(32*089)),>(SCR_1+(32*090)),>(SCR_1+(32*091)),>(SCR_1+(32*092)),>(SCR_1+(32*093)),>(SCR_1+(32*094)),>(SCR_1+(32*095))
	.BYTE >(SCR_1+(32*096)),>(SCR_1+(32*097)),>(SCR_1+(32*098)),>(SCR_1+(32*099)),>(SCR_1+(32*100)),>(SCR_1+(32*101)),>(SCR_1+(32*102)),>(SCR_1+(32*103))
	.BYTE >(SCR_1+(32*104)),>(SCR_1+(32*105)),>(SCR_1+(32*106)),>(SCR_1+(32*107)),>(SCR_1+(32*108)),>(SCR_1+(32*109)),>(SCR_1+(32*110)),>(SCR_1+(32*111))
	.BYTE >(SCR_1+(32*112)),>(SCR_1+(32*113)),>(SCR_1+(32*114)),>(SCR_1+(32*115)),>(SCR_1+(32*116)),>(SCR_1+(32*117)),>(SCR_1+(32*118)),>(SCR_1+(32*119))
	.BYTE >(SCR_1+(32*120)),>(SCR_1+(32*121)),>(SCR_1+(32*122)),>(SCR_1+(32*123)),>(SCR_1+(32*124)),>(SCR_1+(32*125)),>(SCR_1+(32*126)),>(SCR_1+(32*127))

SCR_OR
.REPT	32
 .BYTE $C0,$30,$0C,$03
.ENDR

SCR_AND
.REPT	32
 .BYTE $3F,$CF,$F3,$FC
.ENDR

SCR_HOR
 .BYTE 00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03,04,04,04,04,05,05,05,05,06,06,06,06,07,07,07,07
 .BYTE 08,08,08,08,09,09,09,09,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15
 .BYTE 16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23
 .BYTE 24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31

SCR_LINE
 .BYTE 00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03,04,04,04,04,05,05,05,05,06,06,06,06,07,07,07,07
 .BYTE 08,08,08,08,09,09,09,09,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15
 .BYTE 16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23
 .BYTE 24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31 

LINE_RIGHT_OR
 .BYTE %11000000,%11110000,%11111100,%11111111
LINE_RIGHT_AND
 .BYTE %00111111,%00001111,%00000011,%00000000

LINE_LEFT_OR
 .BYTE %11111111,%00111111,%00001111,%00000011
LINE_LEFT_AND
 .BYTE %00000000,%11000000,%11110000,%11111100
 
LINE_SAME_LEFT
 .BYTE %11111111,%00111111,%00001111,%00000011

LINE_SAME_RIGHT
 .BYTE %11000000,%11110000,%11111100,%11111111

LINE_SAME_LEFT_2
 .BYTE %00000000,%11000000,%11110000,%11111100

LINE_SAME_RIGHT_2
 .BYTE %00111111,%00001111,%00000011,%00000000

LINE_LEFT
.REPT 192
 .BYTE 0
.ENDR

LINE_RIGHT
.REPT 192
 .BYTE 0
.ENDR

.ALIGN $3000
SCR_0	       	
SCR_1	EQU	SCR_0 + 4096

; 4 sets of points
; top 

; 1 = top, right dir, right column
; 2 = mid, left dir, right column
; 3 = mid, left dir, left column
; 4 = top, right dir, left column

; 20,50
; 50,80
; 80,50
; 50,20
; read these 8 bytes into 8 zero page locations
; convert into 4 sets of instructions to fill
; do fill 4 times
; draw 
