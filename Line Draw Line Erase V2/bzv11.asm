	SCREEN	EQU	128
	SCR 	EQU	SCREEN +1

	SCR_LO	EQU	SCR
	SCR_HI	EQU	SCR +1

	P1X	EQU	SCR +2
	P1Y	EQU	P1X +1	
	I1X	EQU	P1Y +1
	I1Y	EQU	I1X +1
	P2X	EQU	I1Y +1
	P2Y	EQU	P2X +1
	I2X	EQU	P2Y +1
	I2Y	EQU	I2X +1

	P3X	EQU	I2Y +2
	P3Y	EQU	P3X +1	
	I3X	EQU	P3Y +1
	I3Y	EQU	I3X +1
	P4X	EQU	I3Y +1
	P4Y	EQU	P4X +1
	I4X	EQU	P4Y +1
	I4Y	EQU	I4X +1

	PNT	EQU	I4Y +1
	LINE_FRAC	EQU	PNT +1
	H_ST	EQU	LINE_FRAC +1
	H_EN	EQU	H_ST +1
	V_ST	EQU	H_EN +1
	V_EN	EQU	V_ST +1
	LINE_VER	EQU	V_EN +1
	
	P_SQR_LO	EQU	LINE_VER +1
	P_SQR_HI	EQU	P_SQR_LO +2
	P_INVSQR_LO	EQU	P_SQR_HI +2
	P_INVSQR_HI EQU	P_INVSQR_LO +2

	S0_IFHIWV_CNT	EQU P_INVSQR_HI +2
	S0_VIWH_CNT EQU S0_IFHIWV_CNT +1
	S0_HDWV_CNT EQU S0_VIWH_CNT +1
	S0_VDWH_CNT EQU S0_HDWV_CNT +1
	S1_IFHIWV_CNT EQU S0_VDWH_CNT +1
	S1_VIWH_CNT EQU S1_IFHIWV_CNT +1
	S1_HDWV_CNT EQU S1_VIWH_CNT +1
	S1_VDWH_CNT EQU S1_HDWV_CNT +1

	DIST EQU S1_VDWH_CNT +1
	SLOPE EQU DIST +1

 ICL 'hardware.s'

	ORG $800
				
INIT	LDX		#255
		TXS
		
		LDA 	PORTB ; disable basic
		ORA 	#$02
		STA 	PORTB
			 	
		LDA 	#$00 ; disable antic
		STA 	SDMCTL
		STA 	DMACTL
		        
		LDA 	#$0E ; 00 	; set colours
		STA		COLOR1
		LDA 	#$00 ; 0E
		STA 	COLOR2
		LDA 	#$00 ; 0E
		STA 	COLOR4
			
		LDA 	#0
		STA 	SCREEN
				
		LDA 	#<DISPLAY_LIST	; Extract low BYTE from DISPLAY_LIST and store it in SDLSTL
		STA 	SDLSTL
		LDA 	#>DISPLAY_LIST	; Extract high BYTE from DISPLAY_LIST and store it in SDLSTL+1
		STA 	SDLSTL+1		; Therefore tell antic the starting address of the custom display list.
						
		LDA 	#$21 ; narrow 23 wide ; #$22       		;
		STA 	SDMCTL     		;Store literal $23 in SDMCTL - therefore switch ANTIC back on to narrow.
			
		LDA		#>SQRLO
		STA		P_SQR_LO+1
		LDA		#>SQRHI
		STA		P_SQR_HI+1
		LDA		#>NEGSQRLO
		STA		P_INVSQR_LO+1
		LDA		#>NEGSQRHI
		STA		P_INVSQR_HI+1
 
		LDX		#14
		LDX		#34
		STX		P1X
		STY		P1Y
		LDX		#55
		LDX		#77
		STY		P2X
		STX		P2Y

		LDX		#29
		LDX		#36
		STY		P3X
		STX		P3Y

		LDX		#104
		LDX		#13
		STY		P4X
		STX		P4Y

		LDX		#1
		LDY		#-2
		STX		I1X
		STY		I1Y

		LDX		#-1
		LDY		#2
		STY		I2X
		STX		I2Y

		LDX		#-1
		LDY		#-2
		STY		I3X
		STX		I3Y

		LDX		#1
		LDY		#2
		STY		I4X
		STX		I4Y

		LDA		#0
		STA		S0_IFHIWV_CNT
		STA		S0_VIWH_CNT
		STA		S0_HDWV_CNT
		STA		S0_VDWH_CNT
		STA		S1_IFHIWV_CNT
		STA		S1_VIWH_CNT
		STA		S1_HDWV_CNT
		STA		S1_VDWH_CNT

MLOOP		JSR		V_WAIT
			JSR		SWAP_SCREEN

			JSR		MOVE_POINTS
			
			LDA		P1X
			STA		H_ST
			LDA		P1Y
			STA		V_ST
			LDA		P2X
			STA		H_EN
			LDA		P2Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		P1X
			STA		H_ST
			LDA		P1Y
			STA		V_ST
			LDA		P3X
			STA		H_EN
			LDA		P3Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		P1X
			STA		H_ST
			LDA		P1Y
			STA		V_ST
			LDA		P4X
			STA		H_EN
			LDA		P4Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		P2X
			STA		H_ST
			LDA		P2Y
			STA		V_ST
			LDA		P3X
			STA		H_EN
			LDA		P3Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		P2X
			STA		H_ST
			LDA		P2Y
			STA		V_ST
			LDA		P4X
			STA		H_EN
			LDA		P4Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		P3X
			STA		H_ST
			LDA		P3Y
			STA		V_ST
			LDA		P4X
			STA		H_EN
			LDA		P4Y
			STA		V_EN
			JSR		DRAW_LINE

			LDA		#30
			STA		H_ST
			LDA		#0
			STA		V_ST
			LDA		#247
			STA		H_EN
			LDA		#127
			STA		V_EN
;			JSR		DRAW_LINE

			LDA		#30
			STA		H_ST
			LDA		#0
			STA		V_ST
			LDA		#126
			STA		H_EN
			LDA		#127
			STA		V_EN
;			JSR		DRAW_LINE

			LDA		#247
			STA		H_ST
			LDA		#0
			STA		V_ST
			LDA		#30
			STA		H_EN
			LDA		#127
			STA		V_EN
;			JSR		DRAW_LINE

			LDA		#126
			STA		H_ST
			LDA		#0
			STA		V_ST
			LDA		#30
			STA		H_EN
			LDA		#127
			STA		V_EN
;			JSR		DRAW_LINE



DRAW_LINES	JSR		S0_DRAW_LINES		; draw all lines on screen
		
		JMP		MLOOP

DRAW_LINE	JMP		S0_DRAW_LINE	; build tables of lines to draw

.LOCAL	MOVEPNT_V
		TYA
		STX		PNT
		CLC 
		ADC		PNT
		BPL		EXIT
			TYA			
			EOR		#$FF
			TAY
			INY
			TXA
EXIT	TAX
		RTS 
.ENDL

.LOCAL	MOVEPNT_H
		TXA
		LSR
		TAX
		TYA
		STX		PNT
		CLC 
		ADC		PNT
		BPL		EXIT
			TYA			
			EOR		#$FF
			TAY
			INY
			TXA
EXIT	ASL
		TAX
		RTS 
.ENDL

.LOCAL	MOVE_POINTS
				LDX		P1X
				LDY 	I1X
				JSR 	MOVEPNT_H
				STX 	P1X 
				STY 	I1X

				LDX 	P1Y
				LDY 	I1Y
				JSR 	MOVEPNT_V
				STX 	P1Y 
				STY 	I1Y

				LDX 	P2X
				LDY 	I2X
				JSR 	MOVEPNT_H
				STX 	P2X
				STY 	I2X

				LDX 	P2Y
				LDY 	I2Y
				JSR 	MOVEPNT_V
				STX 	P2Y 
				STY 	I2Y

				LDX 	P3X
				LDY 	I3X
				JSR 	MOVEPNT_h
				STX 	P3X 
				STY 	I3X

				LDX 	P4Y
				LDY 	I4Y
				JSR 	MOVEPNT_V
				STX 	P4Y 
				STY 	I4Y

				RTS
.ENDL

;.LOCAL	PLOT_DRAW
;			LDA   SCR_0_LO,Y
;			STA   SCR
;PLOT_HI		LDA   SCR_1_HI,Y 
;			STA   SCR+1 
;            LDY   SCR_HOR,X
;            LDA   (SCR),Y
;			ORA   SCR_OR,X
;            STA   (SCR),Y 
;            RTS
;.ENDL.

;.LOCAL	PLOT_CLEAR
;				LDA   SCR_0_LO,Y
;				STA   SCR 
;PLOT_HI			LDA   SCR_0_HI,Y 
;				STA   SCR+1 
;				LDY   SCR_HOR,X
;				LDA   (SCR),Y
;				AND   SCR_AND,X
;                STA   (SCR),Y 
;                RTS
;.ENDL.


S0_DRAW_LINE_H_SAME	LDA   V_EN
					CMP   V_ST
					BNE   S0_DRAW_LINE.LINE_NOT_PLOT
					RTS

.LOCAL	S0_DRAW_LINE
				LDA   #$FF
				STA   LINE_FRAC
                  
                LDA   H_ST
                CMP   H_EN
                BEQ   S0_DRAW_LINE_H_SAME
                BCC   LINE_NOSWAP
					LDY   H_EN
                    STY   H_ST
                    STA   H_EN
                    LDX   V_EN
                    LDY   V_ST
                    STX   V_ST
                    STY   V_EN

LINE_NOSWAP     LDA   V_EN
					CMP   V_ST
LINE_NOT_PLOT   	BCC   LINE_BLTR

LINE_TLBR	SEC 
            LDA   H_EN
            SBC   H_ST
            STA   SCR
            SEC
            LDA   V_EN
            SBC   V_ST
            CMP   SCR ; Accumulator less than location SCR ?
            BCC   CALC_INC_FRAC_VER_INC_WHOLE_HOR

CALC_INC_FRAC_HOR_INC_WHOLE_VER	SEC
                                LDA   V_EN
;	STA	DIST
                                SBC   V_ST
                                TAX 				; divisor
                                SEC
                                LDA   H_EN 			; calc x diff
                                SBC   H_ST  		; dividend
                                JSR   DIVMUL_1608	; a=divisor / a=slope	;	STA SLOPE

		INC	S0_IFHIWV_CNT ; 1ST
		LDX	S0_IFHIWV_CNT

		STA S0_HIWV_SLP,X

		LDA H_ST
		STA S0_HIWV_HST,X
		LDA V_ST
		STA S0_HIWV_VST,X
		LDA V_EN
		STA S0_HIWV_END,X
;		LDA SLOPE
;		STA S0_HIWV_SLP,X
	RTS

CALC_INC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
;	STA	DIST
                                SBC   H_ST

                                TAX         ; divisor
                                SEC
                                LDA   V_EN ; calc x diff
                                SBC   V_ST ; dividend
                                JSR   DIVMUL_1608
;	STA SLOPE

		INC	S0_VIWH_CNT ; 2ND
		LDX	S0_VIWH_CNT

		STA S0_VIWH_SLP,X

		LDA H_ST
		STA S0_VIWH_HST,X
		LDA V_ST
		STA S0_VIWH_VST,X
		LDA H_EN			; DIST
		STA S0_VIWH_END,X
;		LDA SLOPE
;		STA S0_VIWH_SLP,X
	RTS


LINE_BLTR   SEC
            LDA	H_EN
            SBC   H_ST
            STA   SCR
            SEC
            LDA   V_ST
            SBC   V_EN
            CMP   SCR ; Accumulator less than location SCR ?
            BCC   CALC_DEC_FRAC_VER_INC_WHOLE_HOR


CALC_INC_FRAC_HOR_DEC_WHOLE_VER LDA   V_EN
;	STA	DIST
                                SEC
                                LDA   V_ST
                                SBC   V_EN
                                TAX
                                SEC
                                LDA   H_EN
                                SBC   H_ST
                                JSR   DIVMUL_1608
;	STA SLOPE

 		INC	S0_HDWV_CNT ; 3RD
		LDX	S0_HDWV_CNT

		STA S0_HDWV_SLP,X

		LDA H_ST
		STA S0_HDWV_HST,X
		LDA V_ST
		STA S0_HDWV_VST,X
		LDA V_EN ;DIST
		STA S0_HDWV_END,X
;		LDA SLOPE
;		STA S0_HDWV_SLP,X
	RTS
                                   
CALC_DEC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
;	STA	DIST
                                SBC   H_ST
                                TAX ; divisor
                                LDA   V_ST ; calc x diff
                                SBC   V_EN ; dividend
                                JSR   DIVMUL_1608
;	STA SLOPE
 
 		INC	S0_VDWH_CNT ; 4TH
		LDX	S0_VDWH_CNT

		STA S0_VDWH_SLP,X

		LDA H_ST
		STA S0_VDWH_HST,X
		LDA V_ST
		STA S0_VDWH_VST,X
		LDA H_EN ; DIST
		STA S0_VDWH_END,X
;		LDA SLOPE
;		STA S0_VDWH_SLP,X
	RTS
 
.ENDL

.LOCAL	S0_DRAW_IFHIWV
LOOP			STY   LINE_VER
				LDA   SCR_0_LO,Y
				STA   SCR_LO 
				LDA   SCR_0_HI,Y
				STA   SCR_HI
				LDY   SCR_HOR,X
				LDA   (SCR),Y
				ORA   SCR_OR,X
				STA   (SCR),Y 
				LDA   LINE_FRAC
FRAC			ADC   #0
				STA   LINE_FRAC
				BCC   CONT
					INX
CONT			LDY   LINE_VER
				INY
DIST	    	CPY   #0
				BNE   LOOP
			RTS
.ENDL
S0_DRAW_IFHIWV_FRAC	EQU S0_DRAW_IFHIWV.FRAC
S0_DRAW_IFHIWV_END	EQU S0_DRAW_IFHIWV.DIST

.LOCAL	S1_DRAW_IFHIWV
LOOP			STY   LINE_VER
				LDA   SCR_0_LO,Y
				STA   SCR_LO 
				LDA   SCR_1_HI,Y
				STA   SCR_HI
				LDY   SCR_HOR,X
				LDA   (SCR),Y
				ORA   SCR_OR,X
				STA   (SCR),Y 
				LDA   LINE_FRAC
FRAC			ADC   #0
				STA   LINE_FRAC
				BCC   CONT
				INX
CONT			LDY   LINE_VER
				INY
DIST	    	CPY   #0
				BNE   LOOP
			RTS
.ENDL
S1_DRAW_IFHIWV_FRAC	EQU S1_DRAW_IFHIWV.FRAC
S1_DRAW_IFHIWV_END 	EQU S1_DRAW_IFHIWV.DIST

.LOCAL	S0DRAWIVIWH
LINE_IYIX_LOOP                  LDA   LINE_FRAC
LINE_IYIX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IYIX_CONT
									LDY   LINE_VER
									INY
LINE_INC_FRAC_VER_INC_WHOLE_HOR 	STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_2	                    	LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
LINE_IYIX_CONT	                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y 
                                INX
LINE_IYIX_END                   CPX   #0
                                BNE   LINE_IYIX_LOOP
                            RTS 
.ENDL
S0_DRAW_IVIWH EQU S0DRAWIVIWH.LINE_INC_FRAC_VER_INC_WHOLE_HOR
S0_DRAW_IVIWH_END EQU S0DRAWIVIWH.LINE_IYIX_END
S0_DRAW_IVIWH_FRAC EQU S0DRAWIVIWH.LINE_IYIX_INC

.LOCAL	S0_DRAW_IHDWV
LINE_INC_FRAC_HOR_DEC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_3		                LDA   SCR_0_HI,Y
                                STA   SCR_HI  
                                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y   
                                LDA   LINE_FRAC
LINE_DXDY_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DXDY_CONT
									INX
LINE_DXDY_CONT                 	LDY   LINE_VER
                                DEY
LINE_DXDY_END                  	CPY   #0
                                BNE   LINE_INC_FRAC_HOR_DEC_WHOLE_VER
                                RTS
.ENDL
S0_DRAW_IHDWV_END EQU S0_DRAW_IHDWV.LINE_DXDY_END
S0_DRAW_IHDWV_FRAC EQU S0_DRAW_IHDWV.LINE_DXDY_INC

.LOCAL	S0DRAWDVIWH
LINE_DYDX_LOOP                  LDA   LINE_FRAC
LINE_DYDX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DYDX_CONT
									LDY   LINE_VER
                                    DEY
LINE_DEC_FRAC_VER_INC_WHOLE_HOR	    STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_4 		                     LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
LINE_DYDX_CONT                  LDY SCR_HOR,X
                                LDA (SCR),Y
								ORA SCR_OR,X
                                STA (SCR),Y 
                                INX
LINE_DYDX_END                   CPX #0
                                BNE LINE_DYDX_LOOP
                            RTS
.ENDL
S0_DRAW_DVIWH EQU S0DRAWDVIWH.LINE_DEC_FRAC_VER_INC_WHOLE_HOR
S0_DRAW_DVIWH_END EQU S0DRAWDVIWH.LINE_DYDX_END
S0_DRAW_DVIWH_FRAC EQU S0DRAWDVIWH.LINE_DYDX_INC



S1_DRAW_LINE_H_SAME	LDA   V_EN
					CMP   V_ST
					BNE   S1_DRAW_LINE.LINE_NOT_PLOT
					RTS

.LOCAL	S1_DRAW_LINE
				LDA   #$FF
				STA   LINE_FRAC
                  
                LDA   H_ST
                CMP   H_EN
                BEQ   S1_DRAW_LINE_H_SAME
                BCC   LINE_NOSWAP
					LDY   H_EN
                    STY   H_ST
                    STA   H_EN
                    LDX   V_EN
                    LDY   V_ST
                    STX   V_ST
                    STY   V_EN

LINE_NOSWAP     LDA   V_EN
					CMP   V_ST
LINE_NOT_PLOT   	BCC   LINE_BLTR

LINE_TLBR	SEC 
            LDA   H_EN
            SBC   H_ST
            STA   SCR
            SEC
            LDA   V_EN
            SBC   V_ST
            CMP   SCR ; Accumulator less than location SCR ?
            BCC   CALC_INC_FRAC_VER_INC_WHOLE_HOR

CALC_INC_FRAC_HOR_INC_WHOLE_VER	SEC
                                LDA   V_EN
;	STA	DIST
                                SBC   V_ST
                                TAX					; divisor
                                SEC
                                LDA   H_EN 			; calc x diff
                                SBC   H_ST  		; dividend
                                JSR   DIVMUL_1608 	; a=divisor
;	STA SLOPE

		INC	S1_IFHIWV_CNT
		LDX	S1_IFHIWV_CNT

		STA S1_HIWV_SLP,X

		LDA H_ST
		STA S1_HIWV_HST,X
		LDA V_ST
		STA S1_HIWV_VST,X
		LDA V_EN ; DIST
		STA S1_HIWV_END,X
;		LDA SLOPE
;		STA S1_HIWV_SLP,X
	RTS

CALC_INC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
;	STA	DIST
                                SBC   H_ST

                                TAX         ; divisor
                                SEC
                                LDA   V_EN ; calc x diff
                                SBC   V_ST ; dividend
                                JSR   DIVMUL_1608
;	STA SLOPE

		INC	S1_VIWH_CNT
		LDX	S1_VIWH_CNT

		STA S1_VIWH_SLP,X

		LDA H_ST
		STA S1_VIWH_HST,X
		LDA V_ST
		STA S1_VIWH_VST,X
		LDA H_EN ; DIST
		STA S1_VIWH_END,X
;		LDA SLOPE
;		STA S1_VIWH_SLP,X
	RTS


LINE_BLTR   SEC
            LDA	H_EN
            SBC   H_ST
            STA   SCR
            SEC
            LDA   V_ST
            SBC   V_EN
            CMP   SCR ; Accumulator less than location SCR ?
            BCC   CALC_DEC_FRAC_VER_INC_WHOLE_HOR


CALC_INC_FRAC_HOR_DEC_WHOLE_VER LDA   V_EN
;	STA	DIST
                                SEC
                                LDA   V_ST
                                SBC   V_EN
                                TAX
                                SEC
                                LDA   H_EN
                                SBC   H_ST
                                JSR   DIVMUL_1608
;	STA SLOPE
 
 		INC	S1_HDWV_CNT
		LDX	S1_HDWV_CNT

		STA S1_HDWV_SLP,X

		LDA H_ST
		STA S1_HDWV_HST,X
		LDA V_ST
		STA S1_HDWV_VST,X
		LDA V_EN ; DIST
		STA S1_HDWV_END,X
;		LDA SLOPE
;		STA S1_HDWV_SLP,X
	RTS
                                   
CALC_DEC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
;	STA	DIST
                                SBC   H_ST
                                TAX ; divisor
                                LDA   V_ST ; calc x diff
                                SBC   V_EN ; dividend
                                JSR   DIVMUL_1608
;	STA SLOPE
 
  		INC	S1_VDWH_CNT ; 4TH
		LDX	S1_VDWH_CNT

		STA S1_VDWH_SLP,X

		LDA H_ST
		STA S1_VDWH_HST,X
		LDA V_ST
		STA S1_VDWH_VST,X
		LDA H_EN ; DIST
		STA S1_VDWH_END,X
;		LDA SLOPE
;		STA S1_VDWH_SLP,X
	RTS
 
.ENDL



.LOCAL	S1DRAWIVIWH
LINE_IYIX_LOOP                  LDA   LINE_FRAC
LINE_IYIX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IYIX_CONT
									LDY   LINE_VER
									INY
LINE_INC_FRAC_VER_INC_WHOLE_HOR 	STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_2	                    	LDA   SCR_1_HI,Y 
                                    STA   SCR_HI 
LINE_IYIX_CONT	                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y 
                                INX
LINE_IYIX_END                   CPX   #0
                                BNE   LINE_IYIX_LOOP
                            RTS 
.ENDL
S1_DRAW_IVIWH EQU S1DRAWIVIWH.LINE_INC_FRAC_VER_INC_WHOLE_HOR
S1_DRAW_IVIWH_END EQU S1DRAWIVIWH.LINE_IYIX_END
S1_DRAW_IVIWH_FRAC EQU S1DRAWIVIWH.LINE_IYIX_INC

.LOCAL	S1_DRAW_IHDWV
LINE_INC_FRAC_HOR_DEC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_3		                LDA   SCR_1_HI,Y
                                STA   SCR_HI  
                                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y   
                                LDA   LINE_FRAC
LINE_DXDY_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DXDY_CONT
									INX
LINE_DXDY_CONT                 	LDY   LINE_VER
                                DEY
LINE_DXDY_END                  	CPY   #0
                                BNE   LINE_INC_FRAC_HOR_DEC_WHOLE_VER
                                RTS
.ENDL
S1_DRAW_IHDWV_END EQU S1_DRAW_IHDWV.LINE_DXDY_END
S1_DRAW_IHDWV_FRAC EQU S1_DRAW_IHDWV.LINE_DXDY_INC

.LOCAL	S1DRAWDVIWH
LINE_DYDX_LOOP                  LDA   LINE_FRAC
LINE_DYDX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DYDX_CONT
									LDY   LINE_VER
                                    DEY
LINE_DEC_FRAC_VER_INC_WHOLE_HOR	    STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_4 		                    LDA   SCR_1_HI,Y 
                                    STA   SCR_HI 
LINE_DYDX_CONT                  LDY SCR_HOR,X
                                LDA (SCR),Y
								ORA SCR_OR,X
                                STA (SCR),Y 
                                INX
LINE_DYDX_END                   CPX #0
                                BNE LINE_DYDX_LOOP
                            RTS
.ENDL
S1_DRAW_DVIWH EQU S1DRAWDVIWH.LINE_DEC_FRAC_VER_INC_WHOLE_HOR
S1_DRAW_DVIWH_END EQU S1DRAWDVIWH.LINE_DYDX_END
S1_DRAW_DVIWH_FRAC EQU S1DRAWDVIWH.LINE_DYDX_INC




.LOCAL	S0_CLEAR_IHIWV
LINE_INC_FRAC_HOR_INC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_1		                LDA   SCR_0_HI,Y
                                STA   SCR_HI
                                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y 
                                LDA   LINE_FRAC
LINE_IXIY_INC		            ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IXIY_CONT
									INX
LINE_IXIY_CONT		            LDY   LINE_VER
                                INY
LINE_IXIY_END	                CPY   #0
                                BNE   LINE_INC_FRAC_HOR_INC_WHOLE_VER
                            RTS
.ENDL
S0_CLEAR_IHIWV_FRAC EQU S0_CLEAR_IHIWV.LINE_IXIY_INC
S0_CLEAR_IHIWV_END EQU S0_CLEAR_IHIWV.LINE_IXIY_END


.LOCAL	S0CLEARIVIWH
LINE_IYIX_LOOP                  LDA   LINE_FRAC
LINE_IYIX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IYIX_CONT
									LDY   LINE_VER
									INY
LINE_INC_FRAC_VER_INC_WHOLE_HOR 	STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_2	                    	LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
LINE_IYIX_CONT	                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y 
                                INX
LINE_IYIX_END                   CPX   #0
                                BNE   LINE_IYIX_LOOP
                            RTS 
.ENDL
S0_CLEAR_IVIWH EQU S0CLEARIVIWH.LINE_INC_FRAC_VER_INC_WHOLE_HOR
S0_CLEAR_IVIWH_END EQU S0CLEARIVIWH.LINE_IYIX_END
S0_CLEAR_IVIWH_FRAC EQU S0CLEARIVIWH.LINE_IYIX_INC

.LOCAL	S0_CLEAR_IHDWV
LINE_INC_FRAC_HOR_DEC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_3		                LDA   SCR_0_HI,Y
                                STA   SCR_HI  
                                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y   
                                LDA   LINE_FRAC
LINE_DXDY_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DXDY_CONT
									INX
LINE_DXDY_CONT                 	LDY   LINE_VER
                                DEY
LINE_DXDY_END                  	CPY   #0
                                BNE   LINE_INC_FRAC_HOR_DEC_WHOLE_VER
                                RTS
.ENDL
S0_CLEAR_IHDWV_END EQU S0_CLEAR_IHDWV.LINE_DXDY_END
S0_CLEAR_IHDWV_FRAC EQU S0_CLEAR_IHDWV.LINE_DXDY_INC

.LOCAL	S0CLEARDVIWH
LINE_DYDX_LOOP                  LDA   LINE_FRAC
LINE_DYDX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DYDX_CONT
									LDY   LINE_VER
                                    DEY
LINE_DEC_FRAC_VER_INC_WHOLE_HOR	    STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_4 		                    LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
LINE_DYDX_CONT                  LDY SCR_HOR,X
                                LDA #0
                                STA (SCR),Y 
                                INX
LINE_DYDX_END                   CPX #0
                                BNE LINE_DYDX_LOOP
                            RTS
.ENDL
S0_CLEAR_DVIWH EQU S0CLEARDVIWH.LINE_DEC_FRAC_VER_INC_WHOLE_HOR
S0_CLEAR_DVIWH_END EQU S0CLEARDVIWH.LINE_DYDX_END
S0_CLEAR_DVIWH_FRAC EQU S0CLEARDVIWH.LINE_DYDX_INC
 
.LOCAL	S1_CLEAR_IHIWV
LINE_INC_FRAC_HOR_INC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_1		                LDA   SCR_1_HI,Y
                                STA   SCR_HI
                                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y 
                                LDA   LINE_FRAC
LINE_IXIY_INC		            ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IXIY_CONT
									INX
LINE_IXIY_CONT		            LDY   LINE_VER
                                INY
LINE_IXIY_END	                CPY   #0
                                BNE   LINE_INC_FRAC_HOR_INC_WHOLE_VER
                            RTS
.ENDL
S1_CLEAR_IHIWV_FRAC EQU S1_CLEAR_IHIWV.LINE_IXIY_INC
S1_CLEAR_IHIWV_END EQU S1_CLEAR_IHIWV.LINE_IXIY_END


.LOCAL	S1CLEARIVIWH
LINE_IYIX_LOOP                  LDA   LINE_FRAC
LINE_IYIX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IYIX_CONT
									LDY   LINE_VER
									INY
LINE_INC_FRAC_VER_INC_WHOLE_HOR 	STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_2	                    	LDA   SCR_1_HI,Y 
                                    STA   SCR_HI 
LINE_IYIX_CONT	                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y 
                                INX
LINE_IYIX_END                   CPX   #0
                                BNE   LINE_IYIX_LOOP
                            RTS 
.ENDL
S1_CLEAR_IVIWH EQU S1CLEARIVIWH.LINE_INC_FRAC_VER_INC_WHOLE_HOR
S1_CLEAR_IVIWH_END EQU S1CLEARIVIWH.LINE_IYIX_END
S1_CLEAR_IVIWH_FRAC EQU S1CLEARIVIWH.LINE_IYIX_INC

.LOCAL	S1_CLEAR_IHDWV
LINE_INC_FRAC_HOR_DEC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
LINE_HI_3		                LDA   SCR_1_HI,Y
                                STA   SCR_HI  
                                LDY   SCR_HOR,X
                                LDA   #0
                                STA   (SCR),Y   
                                LDA   LINE_FRAC
LINE_DXDY_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DXDY_CONT
									INX
LINE_DXDY_CONT                 	LDY   LINE_VER
                                DEY
LINE_DXDY_END                  	CPY   #0
                                BNE   LINE_INC_FRAC_HOR_DEC_WHOLE_VER
                                RTS
.ENDL
S1_CLEAR_IHDWV_END EQU S1_CLEAR_IHDWV.LINE_DXDY_END
S1_CLEAR_IHDWV_FRAC EQU S1_CLEAR_IHDWV.LINE_DXDY_INC

.LOCAL	S1CLEARDVIWH
LINE_DYDX_LOOP                  LDA   LINE_FRAC
LINE_DYDX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DYDX_CONT
									LDY   LINE_VER
                                    DEY
LINE_DEC_FRAC_VER_INC_WHOLE_HOR	    STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
LINE_HI_4 		                    LDA   SCR_1_HI,Y 
                                    STA   SCR_HI 
LINE_DYDX_CONT                  LDY SCR_HOR,X
                                LDA #0
                                STA (SCR),Y 
                                INX
LINE_DYDX_END                   CPX #0
                                BNE LINE_DYDX_LOOP
                            RTS
.ENDL
S1_CLEAR_DVIWH EQU S1CLEARDVIWH.LINE_DEC_FRAC_VER_INC_WHOLE_HOR
S1_CLEAR_DVIWH_END EQU S1CLEARDVIWH.LINE_DYDX_END
S1_CLEAR_DVIWH_FRAC EQU S1CLEARDVIWH.LINE_DYDX_INC

	                                 
.LOCAL	DIVMUL_1608
			STA   P_SQR_LO  ; DIV_MUL_U16U08 ; set multiplier as x0
			STA   P_SQR_HI
			EOR   #$ff
			STA   P_INVSQR_LO
			STA   P_INVSQR_HI ;17

			SEC
			LDY   REC16LO,X ; Y=divisor
			LDA   (P_SQR_HI),Y
			SBC   (P_INVSQR_HI),Y
			STA   C1A+1           ; x0*y0h;31 ;c1a means column 1, row a (partial product to be added later)

			LDY   REC16HI,X
			LDA   (P_SQR_LO),y
			SBC   (P_INVSQR_LO),y
			CLC
C1A: 		ADC   #0
			RTS
.ENDL

.LOCAL	V_WAIT
			LDA		RTCLOK+2
LOOP		CMP		RTCLOK+2  ; will be equal until incremented in VB
					BEQ	LOOP
			RTS
.ENDL

.LOCAL	S0_DRAW_LINES
			LDX		S0_IFHIWV_CNT
			BEQ		IFHIWV_EXIT
HIWV_LOOP		STX		PNT
				
				STX   	LINE_FRAC
				LDA		S0_HIWV_END,X
				STA		S0_DRAW_IFHIWV_END+1
				LDA		S0_HIWV_SLP,X
				STA		S0_DRAW_IFHIWV_FRAC+1
				LDY		S0_HIWV_VST,X
				LDA		S0_HIWV_HST,X
				TAX
				JSR		S0_DRAW_IFHIWV

				LDX 	PNT
				DEX
				BNE		HIWV_LOOP

IFHIWV_EXIT	LDX		S0_VIWH_CNT
			BEQ		VIWH_EXIT
VIWH_LOOP		STX		PNT

				STX   	LINE_FRAC
				LDA		S0_VIWH_END,X
				STA		S0_DRAW_IVIWH_END+1
				LDA		S0_VIWH_SLP,X
				STA		S0_DRAW_IVIWH_FRAC+1
				LDY		S0_VIWH_VST,X
				LDA		S0_VIWH_HST,X
				TAX
				JSR		S0_DRAW_IVIWH

				LDX		PNT
				DEX
				BNE		VIWH_LOOP

VIWH_EXIT	LDX		S0_HDWV_CNT
			BEQ		HDWV_EXIT
HDWV_LOOP		STX		PNT

				STX   	LINE_FRAC
				LDA		S0_HDWV_END,X
				STA		S0_DRAW_IHDWV_END+1
				LDA		S0_HDWV_SLP,X
				STA		S0_DRAW_IHDWV_FRAC+1
				LDY		S0_HDWV_VST,X
				LDA		S0_HDWV_HST,X
				TAX
				JSR		S0_DRAW_IHDWV
				
				LDX		PNT
				DEX
				BNE		HDWV_LOOP

HDWV_EXIT	LDX		S0_VDWH_CNT
			BEQ		VDWH_EXIT
VDWH_LOOP		STX		PNT

				STX   	LINE_FRAC
				LDA		S0_VDWH_END,X
				STA		S0_DRAW_DVIWH_END+1
				LDA		S0_VDWH_SLP,X
				STA		S0_DRAW_DVIWH_FRAC+1
				LDY		S0_VDWH_VST,X
				LDA		S0_VDWH_HST,X
				TAX
				JSR		S0_DRAW_DVIWH
				
				LDX		PNT
				DEX
				BNE		VDWH_LOOP
VDWH_EXIT	RTS
.ENDL

.LOCAL	S1_DRAW_LINES
			LDX		S1_IFHIWV_CNT
			BEQ		IFHIWV_EXIT
IFHIWV_LOOP		STX		PNT

				STX		LINE_FRAC
				LDA		S1_HIWV_END,X
				STA		S1_DRAW_IFHIWV_END+1
				LDA		S1_HIWV_SLP,X
				STA		S1_DRAW_IFHIWV_FRAC+1
				LDY		S1_HIWV_VST,X
				LDA		S1_HIWV_HST,X
				TAX
				JSR		S1_DRAW_IFHIWV

				LDX		PNT
				DEX
				BNE		IFHIWV_LOOP

IFHIWV_EXIT	LDX		S1_VIWH_CNT
			BEQ		VIWH_EXIT
VIWH_LOOP		STX		PNT

				STX   	LINE_FRAC
				LDA		S1_VIWH_END,X
				STA		S1_DRAW_IVIWH_END+1
				LDA		S1_VIWH_SLP,X
				STA		S1_DRAW_IVIWH_FRAC+1
				LDY		S1_VIWH_VST,X
				LDA		S1_VIWH_HST,X
				TAX
				JSR		S1_DRAW_IVIWH

				LDX		PNT
				DEX
				BNE		VIWH_LOOP

VIWH_EXIT	LDX		S1_HDWV_CNT
			BEQ		HDWV_EXIT
HDWV_LOOP		STX		PNT

				STX   	LINE_FRAC
				LDA		S1_HDWV_END,X
				STA		S1_DRAW_IHDWV_END+1
				LDA		S1_HDWV_SLP,X
				STA		S1_DRAW_IHDWV_FRAC+1
				LDY		S1_HDWV_VST,X
				LDA		S1_HDWV_HST,X
				TAX
				JSR		S1_DRAW_IHDWV
				
				LDX		PNT
				DEX
				BNE		HDWV_LOOP

HDWV_EXIT	LDX		S1_VDWH_CNT
			BEQ		VDWH_EXIT
VDWH_LOOP		STX		PNT			; 3

				STX   	LINE_FRAC
				LDA		S1_VDWH_END,X
				STA		S1_DRAW_DVIWH_END+1
				LDA		S1_VDWH_SLP,X
				STA		S1_DRAW_DVIWH_FRAC+1
				LDY		S1_VDWH_VST,X
				LDA		S1_VDWH_HST,X
				TAX
				JSR		S1_DRAW_DVIWH
				
				LDX		PNT			; 3
				DEX					; 2
				BNE		VDWH_LOOP
VDWH_EXIT	RTS
.ENDL

.LOCAL	S0_CLEAR_LINES
			LDX		S0_IFHIWV_CNT
			BEQ		HIWV_EXIT
HIWV_LOOP		LDX		S0_IFHIWV_CNT ; 3

				STX   	LINE_FRAC
				LDA		S0_HIWV_END,X
				STA		S0_CLEAR_IHIWV_END+1
				LDA		S0_HIWV_SLP,X
				STA		S0_CLEAR_IHIWV_FRAC+1
				LDY		S0_HIWV_VST,X
				LDA		S0_HIWV_HST,X
				TAX
				JSR		S0_CLEAR_IHIWV

			DEC		S0_IFHIWV_CNT ; 5
			BNE		HIWV_LOOP

HIWV_EXIT	LDX		S0_VIWH_CNT
			BEQ		VIWH_EXIT
VIWH_LOOP		LDX		S0_VIWH_CNT

				STX   	LINE_FRAC
				LDA		S0_VIWH_END,X
				STA		S0_CLEAR_IVIWH_END+1
				LDA		S0_VIWH_SLP,X
				STA		S0_CLEAR_IVIWH_FRAC+1
				LDY		S0_VIWH_VST,X
				LDA		S0_VIWH_HST,X
				TAX
				JSR		S0_CLEAR_IVIWH

			DEC		S0_VIWH_CNT
			BNE		VIWH_LOOP

VIWH_EXIT	LDX		S0_HDWV_CNT
			BEQ		HDWV_EXIT
HDWV_LOOP		LDX		S0_HDWV_CNT

				STX   	LINE_FRAC
				LDA		S0_HDWV_END,X
				STA		S0_CLEAR_IHDWV_END+1
				LDA		S0_HDWV_SLP,X
				STA		S0_CLEAR_IHDWV_FRAC+1
				LDY		S0_HDWV_VST,X
				LDA		S0_HDWV_HST,X
				TAX
				JSR		S0_CLEAR_IHDWV
				
			DEC		S0_HDWV_CNT
			BNE		HDWV_LOOP

HDWV_EXIT	LDX		S0_VDWH_CNT
			BEQ		VDWH_EXIT
VDWH_LOOP		LDX		S0_VDWH_CNT

				STX   	LINE_FRAC
				LDA		S0_VDWH_END,X
				STA		S0_CLEAR_DVIWH_END+1
				LDA		S0_VDWH_SLP,X
				STA		S0_CLEAR_DVIWH_FRAC+1
				LDY		S0_VDWH_VST,X
				LDA		S0_VDWH_HST,X
				TAX
				JSR		S0_CLEAR_DVIWH
				
			DEC		S0_VDWH_CNT
			BNE		VDWH_LOOP

VDWH_EXIT	RTS
.ENDL

.LOCAL	S1_CLEAR_LINES
			LDX		S1_IFHIWV_CNT
			BEQ		IFHIWV_EXIT
IFHIWV_LOOP		LDX		S1_IFHIWV_CNT

				STX   	LINE_FRAC
				LDA		S1_HIWV_END,X
				STA		S1_CLEAR_IHIWV_END+1
				LDA		S1_HIWV_SLP,X
				STA		S1_CLEAR_IHIWV_FRAC+1
				LDY		S1_HIWV_VST,X
				LDA		S1_HIWV_HST,X
				TAX
				JSR		S1_CLEAR_IHIWV

			DEC		S1_IFHIWV_CNT
			BNE		IFHIWV_LOOP

IFHIWV_EXIT	LDX		S1_VIWH_CNT
			BEQ		VIWH_EXIT
VIWH_LOOP		LDX		S1_VIWH_CNT

				STX   	LINE_FRAC
				LDA		S1_VIWH_END,X
				STA		S1_CLEAR_IVIWH_END+1
				LDA		S1_VIWH_SLP,X
				STA		S1_CLEAR_IVIWH_FRAC+1
				LDY		S1_VIWH_VST,X
				LDA		S1_VIWH_HST,X
				TAX
				JSR		S1_CLEAR_IVIWH

			DEC		S1_VIWH_CNT
			BNE		VIWH_LOOP

VIWH_EXIT	LDX		S1_HDWV_CNT
			BEQ		HDWV_EXIT
HDWV_LOOP		LDX		S1_HDWV_CNT

				STX   	LINE_FRAC
				LDA		S1_HDWV_END,X
				STA		S1_CLEAR_IHDWV_END+1
				LDA		S1_HDWV_SLP,X
				STA		S1_CLEAR_IHDWV_FRAC+1
				LDY		S1_HDWV_VST,X
				LDA		S1_HDWV_HST,X
				TAX
				JSR		S1_CLEAR_IHDWV
				
			DEC		S1_HDWV_CNT
			BNE		HDWV_LOOP

HDWV_EXIT	LDX		S1_VDWH_CNT
			BEQ		VDWH_EXIT
VDWH_LOOP		LDX		S1_VDWH_CNT

				STX   	LINE_FRAC
				LDA		S1_VDWH_END,X
				STA		S1_CLEAR_DVIWH_END+1
				LDA		S1_VDWH_SLP,X
				STA		S1_CLEAR_DVIWH_FRAC+1
				LDY		S1_VDWH_VST,X
				LDA		S1_VDWH_HST,X
				TAX
				JSR		S1_CLEAR_DVIWH
				
			DEC		S1_VDWH_CNT
			BNE		VDWH_LOOP

VDWH_EXIT	RTS
.ENDL


.LOCAL	SWAP_SCREEN
			INC		SCREEN
			LDA		SCREEN
			LSR
			BCC		SCREEN_1

SCREEN_0	LDX		#>SCR_0					; display screen 0
			STX		DISPLAY_LIST_SCREEN+1

			LDX		#<S1_DRAW_LINE		; point line draw routine to screen 1
			LDY		#>S1_DRAW_LINE
			STX		DRAW_LINE+1
			STY		DRAW_LINE+2

			LDX		#<S1_DRAW_LINES		; draw lines on screen 1
			LDY		#>S1_DRAW_LINES
			STX		DRAW_LINES+1
			STY		DRAW_LINES+2

			JMP		S1_CLEAR_LINES		; RTS

SCREEN_1	LDX		#>SCR_1					; display screen 1
			STX		DISPLAY_LIST_SCREEN+1

			LDX		#<S0_DRAW_LINE			; point line draw routine to screen 0
			LDY		#>S0_DRAW_LINE
			STX		DRAW_LINE+1
			STY		DRAW_LINE+2

			LDX		#<S0_DRAW_LINES			; draw lines on screen 0
			LDY		#>S0_DRAW_LINES
			STX		DRAW_LINES+1
			STY		DRAW_LINES+2

			JMP		S0_CLEAR_LINES		; RTS
.ENDL
		
.ALIGN $100		
DISPLAY_LIST		.BYTE $70,$70,$70	;Discard 24 scan lines
			.BYTE $4F
DISPLAY_LIST_SCREEN	.BYTE <SCR_0,>SCR_0
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
			.BYTE $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F ; , $0F
			.BYTE $41,<DISPLAY_LIST,>DISPLAY_LIST

.ALIGN $100
REC16LO                                                         
 .BYTE 255,000,085,000,051,170,146,000,113,153,069,085,177,073,017,000
 .BYTE 015,056,121,204,048,162,033,170,061,216,123,036,211,136,066,000
 .BYTE 193,135,080,028,235,188,144,102,062,024,244,209,176,144,114,085
 .BYTE 057,030,005,236,212,189,167,146,125,105,086,068,050,033,016,000
 .BYTE 240,224,210,195,181,168,155,142,129,117,105,094,083,072,061,051
 .BYTE 041,031,021,012,003,250,241,232,224,216,208,200,192,185,177,170
 .BYTE 163,156,149,143,136,130,124,118,112,106,100,094,089,083,078,073
 .BYTE 067,062,057,052,048,043,038,034,029,025,020,016,012,008,004,000
 .BYTE 252,248,244,240,236,233,229,225,222,218,215,212,208,205,202,199
 .BYTE 195,192,189,186,183,180,178,175,172,169,166,164,161,158,156,153
 .BYTE 151,148,146,143,141,138,136,134,131,129,127,125,122,120,118,116
 .BYTE 114,112,110,108,106,104,102,100,098,096,094,092,090,088,087,085
 .BYTE 083,081,080,078,076,074,073,071,070,068,066,065,063,062,060,059
 .BYTE 057,056,054,053,051,050,048,047,046,044,043,041,040,039,037,036
 .BYTE 035,033,032,031,030,028,027,026,025,024,022,021,020,019,018,017
 .BYTE 015,014,013,012,011,010,009,008,007,006,005,004,003,002,001,000

REC16HI                                                         
 .BYTE 255,128,085,064,051,042,036,032,028,025,023,021,019,018,017,016
 .BYTE 015,014,013,012,012,011,011,010,010,009,009,009,008,008,008,008
 .BYTE 007,007,007,007,006,006,006,006,006,006,005,005,005,005,005,005
 .BYTE 005,005,005,004,004,004,004,004,004,004,004,004,004,004,004,004
 .BYTE 003,003,003,003,003,003,003,003,003,003,003,003,003,003,003,003
 .BYTE 003,003,003,003,003,002,002,002,002,002,002,002,002,002,002,002
 .BYTE 002,002,002,002,002,002,002,002,002,002,002,002,002,002,002,002
 .BYTE 002,002,002,002,002,002,002,002,002,002,002,002,002,002,002,002
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,001,001

sqrlo:                                                           
 .BYTE 000,000,001,002,004,006,009,012,016,020,025,030,036,042,049,056
 .BYTE 064,072,081,090,100,110,121,132,144,156,169,182,196,210,225,240
 .BYTE 000,016,033,050,068,086,105,124,144,164,185,206,228,250,017,040
 .BYTE 064,088,113,138,164,190,217,244,016,044,073,102,132,162,193,224
 .BYTE 000,032,065,098,132,166,201,236,016,052,089,126,164,202,241,024
 .BYTE 064,104,145,186,228,014,057,100,144,188,233,022,068,114,161,208
 .BYTE 000,048,097,146,196,246,041,092,144,196,249,046,100,154,209,008
 .BYTE 064,120,177,234,036,094,153,212,016,076,137,198,004,066,129,192
 .BYTE 000,064,129,194,004,070,137,204,016,084,153,222,036,106,177,248
 .BYTE 064,136,209,026,100,174,249,068,144,220,041,118,196,018,097,176
 .BYTE 000,080,161,242,068,150,233,060,144,228,057,142,228,058,145,232
 .BYTE 064,152,241,074,164,254,089,180,016,108,201,038,132,226,065,160
 .BYTE 000,096,193,034,132,230,073,172,016,116,217,062,164,010,113,216
 .BYTE 064,168,017,122,228,078,185,036,144,252,105,214,068,178,033,144
 .BYTE 000,112,225,082,196,054,169,028,144,004,121,238,100,218,081,200
 .BYTE 064,184,049,170,036,158,025,148,016,140,009,134,004,130,001,128
 .BYTE 000,128,001,130,004,134,009,140,016,148,025,158,036,170,049,184
 .BYTE 064,200,081,218,100,238,121,004,144,028,169,054,196,082,225,112
 .BYTE 000,144,033,178,068,214,105,252,144,036,185,078,228,122,017,168
 .BYTE 064,216,113,010,164,062,217,116,016,172,073,230,132,034,193,096
 .BYTE 000,160,065,226,132,038,201,108,016,180,089,254,164,074,241,152 
 .BYTE 064,232,145,058,228,142,057,228,144,060,233,150,068,242,161,080 
 .BYTE 000,176,097,018,196,118,041,220,144,068,249,174,100,026,209,136 
 .BYTE 064,248,177,106,036,222,153,084,016,204,137,070,004,194,129,064 
 .BYTE 000,192,129,066,004,198,137,076,016,212,153,094,036,234,177,120 
 .BYTE 064,008,209,154,100,046,249,196,144,092,041,246,196,146,097,048 
 .BYTE 000,208,161,114,068,022,233,188,144,100,057,014,228,186,145,104 
 .BYTE 064,024,241,202,164,126,089,052,016,236,201,166,132,098,065,032 
 .BYTE 000,224,193,162,132,102,073,044,016,244,217,190,164,138,113,088 
 .BYTE 064,040,017,250,228,206,185,164,144,124,105,086,068,050,033,016 
 .BYTE 000,240,225,210,196,182,169,156,144,132,121,110,100,090,081,072 
 .BYTE 064,056,049,042,036,030,025,020,016,012,009,006,004,002,001,000 

sqrhi:                                                          
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,001,002,002
 .BYTE 002,002,002,002,002,002,002,002,003,003,003,003,003,003,003,003
 .BYTE 004,004,004,004,004,004,004,004,005,005,005,005,005,005,005,006
 .BYTE 006,006,006,006,006,007,007,007,007,007,007,008,008,008,008,008
 .BYTE 009,009,009,009,009,009,010,010,010,010,010,011,011,011,011,012
 .BYTE 012,012,012,012,013,013,013,013,014,014,014,014,015,015,015,015
 .BYTE 016,016,016,016,017,017,017,017,018,018,018,018,019,019,019,019
 .BYTE 020,020,020,021,021,021,021,022,022,022,023,023,023,024,024,024
 .BYTE 025,025,025,025,026,026,026,027,027,027,028,028,028,029,029,029
 .BYTE 030,030,030,031,031,031,032,032,033,033,033,034,034,034,035,035
 .BYTE 036,036,036,037,037,037,038,038,039,039,039,040,040,041,041,041
 .BYTE 042,042,043,043,043,044,044,045,045,045,046,046,047,047,048,048
 .BYTE 049,049,049,050,050,051,051,052,052,053,053,053,054,054,055,055
 .BYTE 056,056,057,057,058,058,059,059,060,060,061,061,062,062,063,063
 .BYTE 064,064,065,065,066,066,067,067,068,068,069,069,070,070,071,071
 .BYTE 072,072,073,073,074,074,075,076,076,077,077,078,078,079,079,080
 .BYTE 081,081,082,082,083,083,084,084,085,086,086,087,087,088,089,089
 .BYTE 090,090,091,092,092,093,093,094,095,095,096,096,097,098,098,099
 .BYTE 100,100,101,101,102,103,103,104,105,105,106,106,107,108,108,109
 .BYTE 110,110,111,112,112,113,114,114,115,116,116,117,118,118,119,120
 .BYTE 121,121,122,123,123,124,125,125,126,127,127,128,129,130,130,131
 .BYTE 132,132,133,134,135,135,136,137,138,138,139,140,141,141,142,143
 .BYTE 144,144,145,146,147,147,148,149,150,150,151,152,153,153,154,155
 .BYTE 156,157,157,158,159,160,160,161,162,163,164,164,165,166,167,168
 .BYTE 169,169,170,171,172,173,173,174,175,176,177,178,178,179,180,181
 .BYTE 182,183,183,184,185,186,187,188,189,189,190,191,192,193,194,195
 .BYTE 196,196,197,198,199,200,201,202,203,203,204,205,206,207,208,209
 .BYTE 210,211,212,212,213,214,215,216,217,218,219,220,221,222,223,224
 .BYTE 225,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239
 .BYTE 240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255

negsqrlo:                                                          
 .BYTE 128,001,130,004,134,009,140,016,148,025,158,036,170,049,184,064
 .BYTE 200,081,218,100,238,121,004,144,028,169,054,196,082,225,112,000
 .BYTE 144,033,178,068,214,105,252,144,036,185,078,228,122,017,168,064
 .BYTE 216,113,010,164,062,217,116,016,172,073,230,132,034,193,096,000
 .BYTE 160,065,226,132,038,201,108,016,180,089,254,164,074,241,152,064
 .BYTE 232,145,058,228,142,057,228,144,060,233,150,068,242,161,080,000
 .BYTE 176,097,018,196,118,041,220,144,068,249,174,100,026,209,136,064
 .BYTE 248,177,106,036,222,153,084,016,204,137,070,004,194,129,064,000
 .BYTE 192,129,066,004,198,137,076,016,212,153,094,036,234,177,120,064
 .BYTE 008,209,154,100,046,249,196,144,092,041,246,196,146,097,048,000
 .BYTE 208,161,114,068,022,233,188,144,100,057,014,228,186,145,104,064
 .BYTE 024,241,202,164,126,089,052,016,236,201,166,132,098,065,032,000
 .BYTE 224,193,162,132,102,073,044,016,244,217,190,164,138,113,088,064
 .BYTE 040,017,250,228,206,185,164,144,124,105,086,068,050,033,016,000
 .BYTE 240,225,210,196,182,169,156,144,132,121,110,100,090,081,072,064
 .BYTE 056,049,042,036,030,025,020,016,012,009,006,004,002,001,000,000
 .BYTE 000,001,002,004,006,009,012,016,020,025,030,036,042,049,056,064
 .BYTE 072,081,090,100,110,121,132,144,156,169,182,196,210,225,240,000
 .BYTE 016,033,050,068,086,105,124,144,164,185,206,228,250,017,040,064
 .BYTE 088,113,138,164,190,217,244,016,044,073,102,132,162,193,224,000
 .BYTE 032,065,098,132,166,201,236,016,052,089,126,164,202,241,024,064
 .BYTE 104,145,186,228,014,057,100,144,188,233,022,068,114,161,208,000
 .BYTE 048,097,146,196,246,041,092,144,196,249,046,100,154,209,008,064
 .BYTE 120,177,234,036,094,153,212,016,076,137,198,004,066,129,192,000
 .BYTE 064,129,194,004,070,137,204,016,084,153,222,036,106,177,248,064
 .BYTE 136,209,026,100,174,249,068,144,220,041,118,196,018,097,176,000
 .BYTE 080,161,242,068,150,233,060,144,228,057,142,228,058,145,232,064
 .BYTE 152,241,074,164,254,089,180,016,108,201,038,132,226,065,160,000
 .BYTE 096,193,034,132,230,073,172,016,116,217,062,164,010,113,216,064
 .BYTE 168,017,122,228,078,185,036,144,252,105,214,068,178,033,144,000
 .BYTE 112,225,082,196,054,169,028,144,004,121,238,100,218,081,200,064
 .BYTE 184,049,170,036,158,025,148,016,140,009,134,004,130,001,128,000

negsqrhi:
 .BYTE 063,063,062,062,061,061,060,060,059,059,058,058,057,057,056,056
 .BYTE 055,055,054,054,053,053,053,052,052,051,051,050,050,049,049,049
 .BYTE 048,048,047,047,046,046,045,045,045,044,044,043,043,043,042,042
 .BYTE 041,041,041,040,040,039,039,039,038,038,037,037,037,036,036,036
 .BYTE 035,035,034,034,034,033,033,033,032,032,031,031,031,030,030,030
 .BYTE 029,029,029,028,028,028,027,027,027,026,026,026,025,025,025,025
 .BYTE 024,024,024,023,023,023,022,022,022,021,021,021,021,020,020,020
 .BYTE 019,019,019,019,018,018,018,018,017,017,017,017,016,016,016,016
 .BYTE 015,015,015,015,014,014,014,014,013,013,013,013,012,012,012,012
 .BYTE 012,011,011,011,011,010,010,010,010,010,009,009,009,009,009,009
 .BYTE 008,008,008,008,008,007,007,007,007,007,007,006,006,006,006,006
 .BYTE 006,005,005,005,005,005,005,005,004,004,004,004,004,004,004,004
 .BYTE 003,003,003,003,003,003,003,003,002,002,002,002,002,002,002,002
 .BYTE 002,002,001,001,001,001,001,001,001,001,001,001,001,001,001,001
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
 .BYTE 000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,001
 .BYTE 001,001,001,001,001,001,001,001,001,001,001,001,001,002,002,002
 .BYTE 002,002,002,002,002,002,002,003,003,003,003,003,003,003,003,004
 .BYTE 004,004,004,004,004,004,004,005,005,005,005,005,005,005,006,006
 .BYTE 006,006,006,006,007,007,007,007,007,007,008,008,008,008,008,009
 .BYTE 009,009,009,009,009,010,010,010,010,010,011,011,011,011,012,012
 .BYTE 012,012,012,013,013,013,013,014,014,014,014,015,015,015,015,016
 .BYTE 016,016,016,017,017,017,017,018,018,018,018,019,019,019,019,020
 .BYTE 020,020,021,021,021,021,022,022,022,023,023,023,024,024,024,025
 .BYTE 025,025,025,026,026,026,027,027,027,028,028,028,029,029,029,030
 .BYTE 030,030,031,031,031,032,032,033,033,033,034,034,034,035,035,036
 .BYTE 036,036,037,037,037,038,038,039,039,039,040,040,041,041,041,042
 .BYTE 042,043,043,043,044,044,045,045,045,046,046,047,047,048,048,049
 .BYTE 049,049,050,050,051,051,052,052,053,053,053,054,054,055,055,056
 .BYTE 056,057,057,058,058,059,059,060,060,061,061,062,062,063,063,064

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
	
.ALIGN $100
SCR_OR
.REPT 32
 .BYTE $80,$40,$20,$10,$08,$04,$02,$01
.ENDR
 
;SCR_AND
;.REPT 32
; .BYTE $7F,$BF,$DF,$EF,$F7,$FB,$FD,$FE
;.ENDR

SCR_HOR
 .BYTE 0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3
 .BYTE 4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7
 .BYTE 8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11
 .BYTE 12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15
 .BYTE 16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19
 .BYTE 20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23
 .BYTE 24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27
 .BYTE 28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31
 
.ALIGN $100
S0_HIWV_HST
S0_HIWV_VST EQU S0_HIWV_HST +256
S0_HIWV_END EQU S0_HIWV_VST +256
S0_HIWV_SLP EQU S0_HIWV_END +256

S0_VIWH_HST EQU S0_HIWV_SLP +256
S0_VIWH_VST EQU S0_VIWH_HST +256
S0_VIWH_END EQU S0_VIWH_VST +256
S0_VIWH_SLP EQU S0_VIWH_END +256

S0_HDWV_HST EQU S0_VIWH_SLP +256
S0_HDWV_VST EQU S0_HDWV_HST +256
S0_HDWV_END EQU S0_HDWV_VST +256
S0_HDWV_SLP EQU S0_HDWV_END +256

S0_VDWH_HST EQU S0_HDWV_SLP +256
S0_VDWH_VST EQU S0_VDWH_HST +256
S0_VDWH_END EQU S0_VDWH_VST +256
S0_VDWH_SLP EQU S0_VDWH_END +256

S1_HIWV_HST EQU S0_VDWH_SLP +256
S1_HIWV_VST EQU S1_HIWV_HST +256
S1_HIWV_END EQU S1_HIWV_VST +256
S1_HIWV_SLP EQU S1_HIWV_END +256

S1_VIWH_HST EQU S1_HIWV_SLP +256
S1_VIWH_VST EQU S1_VIWH_HST +256
S1_VIWH_END EQU S1_VIWH_VST +256
S1_VIWH_SLP EQU S1_VIWH_END +256

S1_HDWV_HST EQU S1_VIWH_SLP +256
S1_HDWV_VST EQU S1_HDWV_HST +256
S1_HDWV_END EQU S1_HDWV_VST +256
S1_HDWV_SLP EQU S1_HDWV_END +256

S1_VDWH_HST EQU S1_HDWV_SLP +256
S1_VDWH_VST EQU S1_VDWH_HST +256
S1_VDWH_END EQU S1_VDWH_VST +256
S1_VDWH_SLP EQU S1_VDWH_END +256

.ALIGN $5000
SCR_0	       	
SCR_1	EQU	SCR_0 + 4096
