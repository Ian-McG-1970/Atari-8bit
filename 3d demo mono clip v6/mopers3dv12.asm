
; todo
; get current pos
; read through objects
;  subtract current pos from object pos
;  rotate difference
;  this is the object offset


	CC_ALL_ON	EQU	0 
	CC_TOP 		EQU 1
	CC_BOTTOM 	EQU 2
	CC_LEFT 	EQU 4
	CC_RIGHT 	EQU 8
	CC_BEHIND 	EQU 128
	CC_ALL 		EQU 255

	MAX_PNT 	EQU 16
	CLIP_OFFSET EQU 16384

	SCN_MID EQU 256/2

	SCREEN	EQU	64
	SCR 	EQU	SCREEN +1

	SCR_LO	EQU	SCR
	SCR_HI	EQU	SCR +1

	REGA	EQU SCR +2
	REGX	EQU REGA +1
	REGY	EQU REGX +1

	X0 EQU REGY +1
	X1 EQU X0 +1
	Y0 EQU X1 +1
	Y1 EQU Y0 +1
	Z0 EQU Y1 +1
	Z1 EQU Z0 +1
	Z2 EQU Z1 +1
	Z3 EQU Z2 +1

	PNT	EQU	Z3 +1
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

	PNT_CNT 	EQU P_INVSQR_HI +2
	LINE_CNT	EQU PNT_CNT +1
	
	CC_OR	EQU	LINE_CNT +1
	CC_AND	EQU	CC_OR +1
	CC 		EQU CC_AND +1
	
	X_PNT_LO EQU CC +1
	X_PNT_HI EQU X_PNT_LO+1
	Y_PNT_LO EQU X_PNT_HI+1
	Y_PNT_HI EQU Y_PNT_LO+1
	Z_PNT_LO EQU Y_PNT_HI+1
	Z_PNT_HI EQU Z_PNT_LO+1
	X_OFF_LO EQU Z_PNT_HI+1
	X_OFF_HI EQU X_OFF_LO+1
	Y_OFF_LO EQU X_OFF_HI+1
	Y_OFF_HI EQU Y_OFF_LO+1
	Z_OFF_LO EQU Y_OFF_HI+1
	Z_OFF_HI EQU Z_OFF_LO+1

	X_CLIP_S_PNT_LO EQU Z_OFF_HI +1
	X_CLIP_S_PNT_HI EQU X_CLIP_S_PNT_LO +1
	Y_CLIP_S_PNT_LO EQU X_CLIP_S_PNT_HI +1
	Y_CLIP_S_PNT_HI EQU Y_CLIP_S_PNT_LO +1
	Z_CLIP_S_PNT_LO EQU Y_CLIP_S_PNT_HI +1
	Z_CLIP_S_PNT_HI EQU Z_CLIP_S_PNT_LO +1
	X_CLIP_E_PNT_LO EQU Z_CLIP_S_PNT_HI +1
	X_CLIP_E_PNT_HI EQU X_CLIP_E_PNT_LO +1
	Y_CLIP_E_PNT_LO EQU X_CLIP_E_PNT_HI +1
	Y_CLIP_E_PNT_HI EQU Y_CLIP_E_PNT_LO +1
	Z_CLIP_E_PNT_LO EQU Y_CLIP_E_PNT_HI +1
	Z_CLIP_E_PNT_HI EQU Z_CLIP_E_PNT_LO +1
	
	X_CLIP_S_PER_LO EQU Z_CLIP_E_PNT_HI +1
	X_CLIP_S_PER_HI EQU X_CLIP_S_PER_LO +1
	Y_CLIP_S_PER_LO EQU X_CLIP_S_PER_HI +1
	Y_CLIP_S_PER_HI EQU Y_CLIP_S_PER_LO +1
	X_CLIP_E_PER_LO EQU Y_CLIP_S_PER_HI +1
	X_CLIP_E_PER_HI EQU X_CLIP_E_PER_LO +1
	Y_CLIP_E_PER_LO EQU X_CLIP_E_PER_HI +1
	Y_CLIP_E_PER_HI EQU Y_CLIP_E_PER_LO +1

 X_CLIP_STT = Y_CLIP_E_PER_HI +1
 X_CLIP_END = X_CLIP_STT +2
 Y_CLIP_STT = X_CLIP_END +2
 Y_CLIP_END = Y_CLIP_STT +2
 Z_CLIP_STT = Y_CLIP_END +2
 Z_CLIP_END = Z_CLIP_STT +2
 X_CLIP_MID = Z_CLIP_END +2
 Y_CLIP_MID = X_CLIP_MID +2
 Z_CLIP_MID = Y_CLIP_MID +2
 CLIP_MID = Z_CLIP_MID +2

	CC_S EQU CLIP_MID +2
	CC_E EQU CC_S +1

	Y_ROT = CC_E +1
	ZC_TEMP = Y_ROT +2
	ZS_TEMP = ZC_TEMP +2
	XC_TEMP = ZS_TEMP +2
	XS_TEMP = XC_TEMP +2
	YSINTMP = XS_TEMP +2
	YCOSTMP = YSINTMP +2

	LAST_ZERO_PAGE = YCOSTMP +2

	RES		EQU		Y0
	NUM0	EQU		YCOSTMP +2
	NUM1	EQU		NUM0 +2
	NUM2	EQU		NUM1 +2
	NUM3	EQU		NUM2 +2
	NUM4	EQU		NUM3 +2
	NUM5	EQU		NUM4 +2
	NUM6	EQU		NUM5 +2
	NUM7	EQU		NUM6 +2
	NUM8	EQU		NUM7 +2
	NUM9	EQU		NUM8 +2
	NUM10	EQU		NUM9 +2
	NUM11	EQU		NUM10 +2
	NUM12	EQU		NUM11 +2
	NUM13	EQU		NUM12 +2
	NUM14	EQU		NUM13 +2
	NUM15	EQU		NUM14 +2
	NUM16	EQU		NUM15 +2

 ICL 'hardware.s'

.MACRO	BORDER	COL
			LDA #:1
			STA COLBK
.ENDM 

.MACRO 	MVXA16	NUM
			LDX		:1 +0
			LDA		:1 +1
.ENDM

.MACRO	ADD16	NUM1, NUM2, NUM3
			CLC
			LDA		:1 +0
			ADC		:2 +0
			STA		:3 +0
			LDA		:1 +1
			ADC		:2 +1
			STA		:3 +1
.ENDM

.MACRO	HALF16	NUM1
			LSR		:1 +1
			ROR		:1 +0
.ENDM

.MACRO MVA16	NUM, NUM2
			LDA		:1 +0
			STA		:2 +0
			LDA		:1 +1
			STA		:2 +1
.ENDM

	ORG $800
				
INIT	LDX		#255
		TXS

		INX
		STX 	SCREEN

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
		LDA 	#$02 ; 0E
		STA 	COLOR4

;		LDA 	#$0E ; 00 ; set colours ;		STA		COLOR1
;		LDA 	#$00 ; 0E ;		STA 	COLOR2
;		LDA 	#$00 ; 0E ;		STA 	COLOR4
				
		LDA 	#<DISPLAY_LIST	; Extract low BYTE from DISPLAY_LIST and store it in SDLSTL
		STA 	SDLSTL
		LDA 	#>DISPLAY_LIST	; Extract high BYTE from DISPLAY_LIST and store it in SDLSTL+1
		STA 	SDLSTL+1		; Therefore tell antic the starting address of the custom display list.
						
		LDA 	#$21 ; narrow
		STA 	SDMCTL

		LDA		#>SQRLO
		STA		P_SQR_LO+1
		LDA		#>SQRHI
		STA		P_SQR_HI+1
		LDA		#>NEGSQRLO
		STA		P_INVSQR_LO+1
		LDA		#>NEGSQRHI
		STA		P_INVSQR_HI+1

 LDA #0
 sta Y_ROT
 sta Y_ROT+1
 
 LDA  #<-50
 STA  Y_OFF_LO
 LDA  #>-50
 STA  Y_OFF_HI

 LDA #<-50
 STA  X_OFF_LO
 LDA #>-50
 STA  X_OFF_HI

 LDA  #<100
 STA  Z_OFF_LO
 LDA  #>100
 STA  Z_OFF_HI


MLOOP		JSR		V_WAIT
			JSR		SWAP_SCREEN
			JSR		JOYSTICK
			JSR  	DRAW_OBJ
;			JSR		PLOT_OBJ
			
	MVXA16	X_OFF_LO		
	LDY		#0
	JSR		HEX16			
	MVXA16	Y_OFF_LO		
	LDY		#6
	JSR		HEX16			
	MVXA16	Z_OFF_LO		
	LDY		#12
	JSR		HEX16			
 
		JMP		MLOOP

.LOCAL	HEX16	; Y = YPOS / A = HI / X = LO
			STY		REGY
			STX		REGX		
			LDX		#0
			JSR		HEX8
			LDA		REGX
			LDY		REGY
			LDX		#2		
			JSR		HEX8
			RTS
.ENDL


.MACRO NEG8 ; in = A out = A
		EOR		#255	; 2
		CLC				; 2
		ADC		#1		; 2
.ENDM					; 6

.MACRO NEG16AY ; in = AY out = AY
		EOR		#255	; 2
		CLC				; 2
		ADC		#1		; 2
		TAX				; 2
		TYA				; 2
		EOR		#255	; 2
		ADC		#0		; 2
		TAY				; 2
		TXA				; 2
.ENDM					; 18

.MACRO PERS_MUL_U16U16
  lda   X0              ; set multiplier as x0
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

  ldy   Y0
  sec
  lda   (P_SQR_LO),Y
  sbc   (P_INVSQR_LO),Y ; note these two lines taken as 11 total
  lda   (P_SQR_HI),Y
  sbc   (P_INVSQR_HI),Y
  sta   c1a+1           ; x0*y0h;31 ;c1a means column 1, row a (partial product to be added later)

  ldy   Y1
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c1b+1           ; x0*y1l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  sta   c2a+1           ; x0*y1h;31

  lda   X1              ; set multiplier as x1
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

  ldy   Y0
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c1c+1           ; x1*y0l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  TAX	; sta   c2b+1           ; x1*y1h;31

  ldy   Y1
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c2c+1           ; x1*y1l

;do_adds:
     clc               ; add the first two numbers of column 1
c1a: lda   #0
c1b: adc   #0
     tay

	 TXA
c2a: adc   #0          ; continue to first two numbers of column 2
     tax               ; X=z2, 6 cycles

	 tya
     clc
c1c: adc   #0          ; add last number of column 1
     txa
c2c: adc   #0          ; add last number of column 2
  
fin: ; A=z2
.ENDM

.LOCAL CLIP_CODE_CALC
		LDX   #0
		LDY   X_PNT_LO
		LDA   X_PNT_HI
		CLIP_CODE_H
		STX   CC_TEMP +1
		LDX   #0
		LDY   Y_PNT_LO
		LDA   Y_PNT_HI
		CLIP_CODE_V
		TXA
CC_TEMP	ORA   #0
		RTS
.ENDL

.LOCAL	PERS_MULU16U16
			PERS_MUL_U16U16
		RTS
.ENDL

.LOCAL	HEXCHAR
			LDA		HEX0,Y
NUMBER0		STA		$ABCD,X
			LDA		HEX1,Y
NUMBER1		STA		$ABCD,X
			LDA		HEX2,Y
NUMBER2		STA		$ABCD,X
			LDA		HEX3,Y
NUMBER3		STA		$ABCD,X
			LDA		HEX4,Y
NUMBER4		STA		$ABCD,X
			RTS
.ENDL

.LOCAL	HEX8	; A = NUM / Y = YPOS / X = XPOS
			STA		REGA
			LDA		SCR_0_LO+0,Y
			STA		HEXCHAR.NUMBER0+1
			
			LDA		SCR_1_HI+0,Y 
			STA		HEXCHAR.NUMBER0+2

			LDA		SCR_0_LO+1,Y
			STA		HEXCHAR.NUMBER1+1
			
			LDA		SCR_1_HI+1,Y 
			STA		HEXCHAR.NUMBER1+2

			LDA		SCR_0_LO+2,Y
			STA		HEXCHAR.NUMBER2+1
			
			LDA		SCR_1_HI+2,Y 
			STA		HEXCHAR.NUMBER2+2

			LDA		SCR_0_LO+3,Y
			STA		HEXCHAR.NUMBER3+1
			
			LDA		SCR_1_HI+3,Y 
			STA		HEXCHAR.NUMBER3+2

			LDA		SCR_0_LO+4,Y
			STA		HEXCHAR.NUMBER4+1
			
			LDA		SCR_1_HI+4,Y 
			STA		HEXCHAR.NUMBER4+2

			LDA		REGA
			LSR
			LSR
			LSR
			LSR
			TAY
			JSR		HEXCHAR

			INX

			LDA		REGA
			AND		#15
			TAY
			JSR		HEXCHAR

			RTS
.ENDL

.LOCAL	JOYSTICK
			LDA		TRIG0
			LSR
			BCS		FIRE_OFF

FIRE_ON		LDA 	PORTA
			LSR
FON_UP		BCS   	FON_DOWN
				TAY
				SEC
				LDA   Z_OFF_LO
				SBC   #1
				STA   Z_OFF_LO
				TYA
				BCS		FON_DOWN
					DEC	Z_OFF_HI
FON_DOWN   LSR
			BCS   	FON_LEFT
				TAY
				CLC
				LDA   Z_OFF_LO
				ADC   #1
				STA   Z_OFF_LO
				TYA
				BCC		FON_LEFT
					INC   Z_OFF_HI
FON_LEFT   LSR
			BCS   	FON_RIGHT
				TAY
	LDA Y_ROT
	SEC
	SBC #3
	STA Y_ROT
	LDA Y_ROT+1
	SBC #0
	AND #3
	STA Y_ROT+1
				TYA
FON_RIGHT  LSR
			BCS   	FON_EXIT
				TAY
	LDA Y_ROT
	CLC
	ADC #3
	STA Y_ROT
	LDA Y_ROT+1
	ADC #0
	AND #3
	STA Y_ROT+1
				TYA
FON_EXIT	RTS

FIRE_OFF	LDA 	PORTA
			LSR
FOFF_UP		BCS   	FOFF_DOWN
				TAY
				SEC
				LDA   Y_OFF_LO
				SBC   #1
				STA   Y_OFF_LO
	LDA	Y_OFF_HI
	SBC #0
	STA Y_OFF_HI
				TYA
;				BCS		FOFF_DOWN
;					DEC	Y_OFF_HI
FOFF_DOWN   LSR
			BCS   	FOFF_LEFT
				TAY
				CLC
				LDA   Y_OFF_LO
				ADC   #1
				STA   Y_OFF_LO
	LDA	Y_OFF_HI
	ADC #0
	STA Y_OFF_HI
				TYA
;				BCC		FOFF_LEFT
;					INC   Y_OFF_HI
FOFF_LEFT   LSR
			BCS   	FOFF_RIGHT
				TAY
				SEC
				LDA   X_OFF_LO
				SBC   #1
				STA   X_OFF_LO
	LDA	X_OFF_HI
	SBC #0
	STA X_OFF_HI
				TYA
;				BCS		FOFF_RIGHT
;					DEC   X_OFF_HI
FOFF_RIGHT  LSR
			BCS   	FOFF_EXIT
				TAY
				CLC
				LDA   X_OFF_LO
				ADC   #1
				STA   X_OFF_LO
	LDA	X_OFF_HI
	ADC #0
	STA X_OFF_HI
				TYA
;				BCC		FOFF_EXIT
;					INC   X_OFF_HI
FOFF_EXIT	RTS
.ENDL

.MACRO CLIP_CODE_H
		BEQ   EXIT    		; !0 = OFF RIGHT
		BMI   OFF_LEFT       ; -VE = OFF LEFT
OFF_RIGHT              ; -VE = OFF RIGHT
		LDX   #CC_RIGHT     ; OFF RIGHT EDGE
		BNE   EXIT         ; JMP
OFF_LEFT 
		LDX   #CC_LEFT      ; OFF LEFT EDGE
EXIT
.ENDM

.MACRO CLIP_CODE_V
		BEQ   	EXIT 	  ; !0 = OFF RIGHT
		BMI   	OFF_TOP        ; -VE = OFF LEFT
OFF_BOTTOM             ; -VE = OFF RIGHT
		LDX   	#CC_BOTTOM    ; OFF RIGHT EDGE
		BNE   	EXIT         ; JMP
OFF_TOP 
		LDX   	#CC_TOP       ; OFF LEFT EDGE
EXIT
.ENDM

.MACRO CLIP_CODE
CLIP_CODE ; A = CC
	LDX		#0
	LDY		X_PNT_LO
	LDA		X_PNT_HI
	CLIP_CODE_H
	STX		CC

	LDX		#0
	LDY		Y_PNT_LO
	LDA		Y_PNT_HI
	CLIP_CODE_V
	TXA
	ORA		CC
.ENDM

.LOCAL	DRAW_OBJ
			LDX 	#SHAPE_PNTS ;5 ;#7 ;0
			LDY 	#SHAPE_LINES ;3; 11
 
; get object number,y
; get status,y
; get point adr hi,y
; get point adr lo,y
; get point count,y
; get line adr hi,y
; get line adr lo,y
; get line count,y
 
			STX   PNT_CNT
			STY   LINE_CNT

			LDX   #CC_ALL
			STX   CC_AND ; FF
			INX
			STX   CC_OR ; 0
  
POINT_LOOP		LDY   PNT_CNT
XPL 			LDA   SHAPE_XL,Y
				STA   X_PNT_LO
YPL 			LDA   SHAPE_YL,Y
				STA   Y_PNT_LO
				ASL            ; sign bit into carry; use CPX etc. if using X reg
				LDA #$00
				ADC #$FF        ; C set:   A = $FF + C = $00 / C clear: A = $FF + C = $FF
				EOR #$FF        ; Flip all bits and they all now match C
				STA   Y_PNT_HI
ZPL 			LDA   SHAPE_ZL,Y
				STA   Z_PNT_LO

STAT			LDA   SHAPE_ST,Y
				JSR   ROT_POINT
				LDY   PNT_CNT

				CLC
				LDA   X_PNT_LO  ; X_POS + X_OFFSET
				STA   RXL,Y
				ADC   X_OFF_LO
				STA   X_PNT_LO
				STA   OXL,Y
				LDA   X_PNT_HI
				STA   RXH,Y
				ADC   X_OFF_HI
				STA   X_PNT_HI
				STA   OXH,Y

				CLC
				LDA   Y_PNT_LO  ; Y_POS + Y_OFFSET
				STA   RYL,Y
				ADC   Y_OFF_LO
				STA   Y_PNT_LO
				STA   OYL,Y
				LDA   Y_PNT_HI
				STA   RYH,Y
				ADC   Y_OFF_HI
				STA   Y_PNT_HI
				STA   OYH,Y

				CLC
				LDA   Z_PNT_LO  ; Z_POS + Z_OFFSET
				STA   RZL,Y
				ADC   Z_OFF_LO
				STA   Z_PNT_LO
				STA   OZL,Y
				LDA   Z_PNT_HI
				STA   RZH,Y
				ADC   Z_OFF_HI
				STA   Z_PNT_HI
				STA   OZH,Y
				
				BPL   INFRONT      ; in front 
					LDA   #CC_BEHIND  ; behind
					JMP   BEHIND	; jmp todo - use BNE

INFRONT				JSR   PERSPECTIVE_POINT
      
					LDY   PNT_CNT
					LDA   X_PNT_LO
					STA   PXL,Y
					LDA   X_PNT_HI
					STA   PXH,Y
					LDA   Y_PNT_LO
					STA   PYL,Y
					LDA   Y_PNT_HI
					STA   PYH,Y
		
					JSR	  CLIP_CODE_CALC

BEHIND			STA   CC
				LDY   PNT_CNT
				STA   PCC,Y
			
				AND   CC_AND
				STA   CC_AND
				LDA   CC
				ORA   CC_OR
				STA   CC_OR
      
				DEC PNT_CNT
				BMI POINT_EXIT
				JMP POINT_LOOP
 
POINT_EXIT	LDA   CC_AND
			BNE   OBJECT_EXIT  ; all points are off same side
      
			LDA   CC_OR
			BNE   CLIP_LINE_LOOP ; any point is off
      
LINE_LOOP		LDY   LINE_CNT
SPS 			LDX   SHAPE_PS,Y  ; point start      
				LDA   PXL,X
;				ASL
				STA   H_ST
				LDA   PYL,X
				LSR
				STA   V_ST
SPE 			LDX   SHAPE_PE,Y  ; point end
				LDA   PXL,X
;				ASL
				STA   H_EN
				LDA   PYL,X
				LSR
				STA   V_EN
				JSR   LINE00

				DEC LINE_CNT
				BPL LINE_LOOP
OBJECT_EXIT	RTS

CLIP_LINE_LOOP	LDY   LINE_CNT
SPSC			LDX   SHAPE_PS,Y   ; point start
				STX   CLIP_SSI+1  ; shape start index

				LDA   PCC,X        ; start point clip code
				STA   CC
      
				LDA   PXL,X
;				ASL
				STA   H_ST
				LDA   PYL,X
				LSR
				STA   V_ST

SPEC			LDX   SHAPE_PE,Y  ; point end
				LDA   PCC,X        ; end point clip code
				AND   CC          ;
				BNE   LINE_OFF   ; both off same side

				LDA   PCC,X        ; end point clip code
				ORA   CC          ;
				BNE   CLIP_LINE   ; any are off side

				LDA   PXL,X
;				ASL
				STA   H_EN
				LDA   PYL,X
				LSR
				STA   V_EN
LINE_DRAW		JSR	  LINE00
LINE_OFF		DEC   LINE_CNT
				BPL   CLIP_LINE_LOOP
		RTS

CLIP_LINE
;		JMP	  LINE_OFF ; temp
;	RTS

CLIP_SSI:  LDY #0      ; Y holds shape start index / X already holds point end index

; if y clip is behind then copy rot else copy pers?

				LDA   PXL,Y ; start object +16384
				STA   X_CLIP_S_PER_LO
				CLC
				LDA   PXH,Y 
				ADC   #>CLIP_OFFSET
				STA   X_CLIP_S_PER_HI

				LDA   PYL,Y
				STA   Y_CLIP_S_PER_LO
				CLC
				LDA   PYH,Y 
				ADC   #>CLIP_OFFSET
				STA   Y_CLIP_S_PER_HI

; if x clip is behind then copy rot else copy pers?

				LDA   PXL,X ; end object +16384
				STA   X_CLIP_E_PER_LO
				CLC
				LDA   PXH,X 
				ADC   #>CLIP_OFFSET
				STA   X_CLIP_E_PER_HI

				LDA   PYL,X
				STA   Y_CLIP_E_PER_LO
				CLC
				LDA   PYH,X 
				ADC   #>CLIP_OFFSET
				STA   Y_CLIP_E_PER_HI


				LDA   PCC,Y ; start clip codes
				STA   CC_S
				LDA   PCC,X ; end clip codes
				STA   CC_E
				ORA   CC_S
				STA   CC    ; combined clip codes
            
CLIP_TEST_BEHND	LDA   CC   
				AND   #CC_BEHIND
				BEQ   CLIP_TEST_LEFT

; if behind cc is set then get the x and y pnts

					LDA   OXL,Y ; start object +16384
					STA   X_CLIP_S_PNT_LO
					CLC
					LDA   OXH,Y 
					ADC   #>CLIP_OFFSET
					STA   X_CLIP_S_PNT_HI

					LDA   OYL,Y
					STA   Y_CLIP_S_PNT_LO
					CLC
					LDA   OYH,Y 
					ADC   #>CLIP_OFFSET
					STA   Y_CLIP_S_PNT_HI

					LDA   OZL,Y
					STA   Z_CLIP_S_PNT_LO
					CLC
					LDA   OZH,Y 
					ADC   #>CLIP_OFFSET
					STA   Z_CLIP_S_PNT_HI

					LDA   OXL,X ; end object +16384
					STA   X_CLIP_E_PNT_LO
					CLC
					LDA   OXH,X 
					ADC   #>CLIP_OFFSET
					STA   X_CLIP_E_PNT_HI

					LDA   OYL,X
					STA   Y_CLIP_E_PNT_LO
					CLC
					LDA   OYH,X 
					ADC   #>CLIP_OFFSET
					STA   Y_CLIP_E_PNT_HI

					LDA   OZL,X
					STA   Z_CLIP_E_PNT_LO
					CLC
					LDA   OZH,X 
					ADC   #>CLIP_OFFSET
					STA   Z_CLIP_E_PNT_HI

					JSR   CLIP_BEHIND
					LDA   CC_E			; check cc for offscreen
					AND   CC_S
					BNE   LINE_CLIP_OFF ; both off same side
				LDA   CC_E
				ora   CC_S
				STA   CC

CLIP_TEST_LEFT:	LDA   CC   
				AND   #CC_LEFT
				BEQ   CLIP_TEST_RIGHT
					JSR CLIP_LEFT
					LDA   CC_E
					and   CC_S
					BNE   LINE_CLIP_OFF
				LDA   CC_E
				ora   CC_S
				STA   CC
CLIP_TEST_RIGHT	LDA   CC   
				AND   #CC_RIGHT
				BEQ   CLIP_TEST_TOP
					JSR CLIP_RIGHT
					LDA   CC_E
					And   CC_S
					BNE   LINE_CLIP_OFF
				LDA   CC_E
				ora   CC_S
				STA   CC
CLIP_TEST_TOP	LDA   CC   
				AND   #CC_TOP
				BEQ   CLIP_TEST_BOTTOM
					JSR CLIP_TOP
					LDA   CC_E
					And   CC_S
					BNE   LINE_CLIP_OFF
				LDA   CC_E
				ora   CC_S
				STA   CC
CLIP_TEST_BOTTOM
				LDA   CC   
				AND   #CC_BOTTOM
				BEQ   CLIP_TEST_END
				JSR CLIP_BOTTOM
					LDA   CC_E
					And   CC_S
					BNE   LINE_CLIP_OFF
				LDA   CC_E
				ora   CC_S
				STA   CC

CLIP_TEST_END	LDA   X_CLIP_S_PER_LO ; set line start using start point 
;				ASL
				STA   H_ST
				LDA   Y_CLIP_S_PER_LO
				LSR
				STA   V_ST
				LDA   X_CLIP_E_PER_LO ; set line start using start point 
;				ASL
				STA   H_EN
				LDA   Y_CLIP_E_PER_LO
				LSR
				STA   V_EN
				JSR   LINE00

LINE_CLIP_OFF	JMP   LINE_OFF ; temp
.ENDL

.LOCAL	CLIP_BEHIND
  LDA   CC_S   
  AND   #CC_BEHIND
  BEQ   START_ON_END_OFF ; temp

START_OFF_END_ON
  LDA   X_CLIP_S_PNT_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_S_PNT_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_S_PNT_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_S_PNT_HI
  STA   Y_CLIP_STT+1

  LDA   Z_CLIP_S_PNT_LO
  STA   Z_CLIP_STT
  LDA   Z_CLIP_S_PNT_HI
  STA   Z_CLIP_STT+1
  
  LDA   X_CLIP_E_PNT_LO
  STA   X_CLIP_END
  LDA   X_CLIP_E_PNT_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_E_PNT_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_E_PNT_HI
  STA   Y_CLIP_END+1

  LDA   Z_CLIP_E_PNT_LO
  STA   Z_CLIP_END
  LDA   Z_CLIP_E_PNT_HI
  STA   Z_CLIP_END+1
  
  JSR   MIDPOINT_Z  ; do clip

  LDA   X_CLIP_MID
  STA   X_CLIP_S_PNT_LO
  STA   X_PNT_LO
  LDA   X_CLIP_MID+1
  STA   X_CLIP_S_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   X_PNT_HI

  LDA   Y_CLIP_MID
  STA   Y_CLIP_S_PNT_LO
  STA   Y_PNT_LO
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_S_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   Y_PNT_HI

  LDA   #<CLIP_OFFSET
  STA   Z_CLIP_S_PNT_LO
  STA   Z_PNT_LO
  LDA   #>CLIP_OFFSET
  STA   Z_CLIP_S_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   Z_PNT_HI

	JSR   PERSPECTIVE_POINT
	JSR   CLIP_CODE_CALC
	STA	  CC_S
	
	LDA   X_PNT_LO
	STA   X_CLIP_S_PER_LO
	CLC
	LDA   X_PNT_HI
	ADC   #>CLIP_OFFSET
	STA   X_CLIP_S_PER_HI

	LDA   Y_PNT_LO
	STA   Y_CLIP_S_PER_LO
	CLC
	LDA   Y_PNT_HI
	ADC   #>CLIP_OFFSET
	STA   Y_CLIP_S_PER_HI
	
  RTS
  
START_ON_END_OFF
  LDA   X_CLIP_E_PNT_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_E_PNT_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_E_PNT_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_E_PNT_HI
  STA   Y_CLIP_STT+1

  LDA   Z_CLIP_E_PNT_LO
  STA   Z_CLIP_STT
  LDA   Z_CLIP_E_PNT_HI
  STA   Z_CLIP_STT+1
  
  LDA   X_CLIP_S_PNT_LO
  STA   X_CLIP_END
  LDA   X_CLIP_S_PNT_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_S_PNT_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_S_PNT_HI
  STA   Y_CLIP_END+1

  LDA   Z_CLIP_S_PNT_LO
  STA   Z_CLIP_END
  LDA   Z_CLIP_S_PNT_HI
  STA   Z_CLIP_END+1

  JSR   MIDPOINT_Z  ; do clip

  LDA   X_CLIP_MID
  STA   X_CLIP_E_PNT_LO
  STA   X_PNT_LO
  LDA   X_CLIP_MID+1
  STA   X_CLIP_E_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   X_PNT_HI

  LDA   Y_CLIP_MID
  STA   Y_CLIP_E_PNT_LO
  STA   Y_PNT_LO
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_E_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   Y_PNT_HI

  LDA   #<CLIP_OFFSET
  STA   Z_CLIP_E_PNT_LO
  STA   Z_PNT_LO
  LDA   #>CLIP_OFFSET
  STA   Z_CLIP_E_PNT_HI
  SEC
  SBC   #>CLIP_OFFSET
  STA   Z_PNT_HI

	JSR   PERSPECTIVE_POINT
	JSR   CLIP_CODE_CALC
	STA	  CC_E

	LDA   X_PNT_LO
	STA   X_CLIP_E_PER_LO
	CLC
	LDA   X_PNT_HI
	ADC   #>CLIP_OFFSET
	STA   X_CLIP_E_PER_HI

	LDA   Y_PNT_LO
	STA   Y_CLIP_E_PER_LO
	CLC
	LDA   Y_PNT_HI
	ADC   #>CLIP_OFFSET
	STA   Y_CLIP_E_PER_HI
	
  RTS
.ENDL

.LOCAL	CLIP_LEFT
  LDA   CC_S   
  AND   #CC_LEFT
  BEQ   START_ON_END_OFF

START_OFF_END_ON
  LDA   X_CLIP_S_PER_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_S_PER_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_S_PER_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_S_PER_HI
  STA   Y_CLIP_STT+1
  
  LDA   X_CLIP_E_PER_LO
  STA   X_CLIP_END
  LDA   X_CLIP_E_PER_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_E_PER_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_E_PER_HI
  STA   Y_CLIP_END+1
  
  JSR   MIDPOINT_TOP_LEFT  ; do clip
  
  LDA   #<CLIP_OFFSET
  sta   X_CLIP_S_PER_LO
  LDA   #>CLIP_OFFSET
  sta   X_CLIP_S_PER_HI

  LDA   Y_CLIP_MID
  sta   Y_CLIP_S_PER_LO
  LDA   Y_CLIP_MID+1
  sta   Y_CLIP_S_PER_HI

	LDX   #0
	LDY   Y_CLIP_S_PER_LO
	SEC
	LDA   Y_CLIP_S_PER_HI 
	SBC   #>CLIP_OFFSET
	STA   Y_PNT_HI
	CLIP_CODE_V
	STX CC_S	; CLIP CODE
  RTS
  
START_ON_END_OFF
  LDA   X_CLIP_E_PER_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_E_PER_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_E_PER_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_E_PER_HI
  STA   Y_CLIP_STT+1
  
  LDA   X_CLIP_S_PER_LO
  STA   X_CLIP_END
  LDA   X_CLIP_S_PER_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_S_PER_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_S_PER_HI
  STA   Y_CLIP_END+1
  
  JSR   MIDPOINT_TOP_LEFT  ; do clip

  LDA   #<CLIP_OFFSET
  sta   X_CLIP_E_PER_LO
  LDA   #>CLIP_OFFSET
  sta   X_CLIP_E_PER_HI

  LDA   Y_CLIP_MID
  sta   Y_CLIP_E_PER_LO
  LDA   Y_CLIP_MID+1
  sta   Y_CLIP_E_PER_HI
    
    LDX   #0
    LDY   Y_CLIP_E_PER_LO
    SEC
    LDA   Y_CLIP_E_PER_HI 
    SBC   #>CLIP_OFFSET
    STA   Y_PNT_HI
    CLIP_CODE_V
	STX   CC_E

  RTS
.ENDL

.LOCAL CLIP_RIGHT
  LDA   CC_S   
  AND   #CC_RIGHT
  BEQ   START_ON_END_OFF

START_OFF_END_ON
  LDA   X_CLIP_E_PER_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_E_PER_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_E_PER_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_E_PER_HI
  STA   Y_CLIP_STT+1
  
  LDA   X_CLIP_S_PER_LO
  STA   X_CLIP_END
  LDA   X_CLIP_S_PER_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_S_PER_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_S_PER_HI
  STA   Y_CLIP_END+1
  
  JSR   MIDPOINT_BOTTOM_RIGHT  ; do clip
  
  LDA   #<(CLIP_OFFSET +255)
  sta   X_CLIP_S_PER_LO
  LDA   #>(CLIP_OFFSET +255)
  sta   X_CLIP_S_PER_HI

  LDA   Y_CLIP_MID
  sta   Y_CLIP_S_PER_LO
  LDA   Y_CLIP_MID+1
  sta   Y_CLIP_S_PER_HI

    LDX   #0
    LDY   Y_CLIP_S_PER_LO
    SEC
    LDA   Y_CLIP_S_PER_HI 
    SBC   #>CLIP_OFFSET
    STA   Y_PNT_HI
    CLIP_CODE_V
	STX CC_S
 
 RTS
  
START_ON_END_OFF
  LDA   X_CLIP_S_PER_LO
  STA   X_CLIP_STT
  LDA   X_CLIP_S_PER_HI
  STA   X_CLIP_STT+1

  LDA   Y_CLIP_S_PER_LO
  STA   Y_CLIP_STT
  LDA   Y_CLIP_S_PER_HI
  STA   Y_CLIP_STT+1
    
  LDA   X_CLIP_E_PER_LO
  STA   X_CLIP_END
  LDA   X_CLIP_E_PER_HI
  STA   X_CLIP_END+1

  LDA   Y_CLIP_E_PER_LO
  STA   Y_CLIP_END
  LDA   Y_CLIP_E_PER_HI
  STA   Y_CLIP_END+1
  
  JSR   MIDPOINT_BOTTOM_RIGHT  ; do clip
  
  LDA   #<(CLIP_OFFSET +255)
  sta   X_CLIP_E_PER_LO
  LDA   #>(CLIP_OFFSET +255)
  sta   X_CLIP_E_PER_HI

  LDA   Y_CLIP_MID
  sta   Y_CLIP_E_PER_LO
  LDA   Y_CLIP_MID+1
  sta   Y_CLIP_E_PER_HI


    LDX   #0
    LDY   Y_CLIP_E_PER_LO
    SEC
    LDA   Y_CLIP_E_PER_HI 
    SBC   #>CLIP_OFFSET
    STA   Y_PNT_HI
    CLIP_CODE_V
	STX CC_E
  RTS
.ENDL
      
.LOCAL CLIP_TOP
  LDA   CC_S   
  AND   #CC_TOP
  BEQ   START_ON_END_OFF
START_OFF_END_ON
  LDA   X_CLIP_S_PER_LO
  STA   Y_CLIP_STT
  LDA   X_CLIP_S_PER_HI
  STA   Y_CLIP_STT+1

  LDA   Y_CLIP_S_PER_LO
  STA   X_CLIP_STT
  LDA   Y_CLIP_S_PER_HI
  STA   X_CLIP_STT+1
  
  LDA   X_CLIP_E_PER_LO
  STA   Y_CLIP_END
  LDA   X_CLIP_E_PER_HI
  STA   Y_CLIP_END+1

  LDA   Y_CLIP_E_PER_LO
  STA   X_CLIP_END
  LDA   Y_CLIP_E_PER_HI
  STA   X_CLIP_END+1
  
  JSR   MIDPOINT_TOP_LEFT  ; do clip
  
  LDA   #<CLIP_OFFSET
  sta   Y_CLIP_S_PER_LO
  LDA   #>CLIP_OFFSET
  sta   Y_CLIP_S_PER_HI

  LDA   Y_CLIP_MID
  sta   X_CLIP_S_PER_LO
  LDA   Y_CLIP_MID+1
  sta   X_CLIP_S_PER_HI
  
    LDX   #0       ; CLIP CODE
    LDY   X_CLIP_S_PER_LO
    SEC
    LDA   X_CLIP_S_PER_HI 
    SBC   #>CLIP_OFFSET
    CLIP_CODE_H
	STX CC_S
  RTS
  
START_ON_END_OFF
  LDA   X_CLIP_E_PER_LO
  STA   Y_CLIP_STT
  LDA   X_CLIP_E_PER_HI
  STA   Y_CLIP_STT+1

  LDA   Y_CLIP_E_PER_LO
  STA   X_CLIP_STT
  LDA   Y_CLIP_E_PER_HI
  STA   X_CLIP_STT+1
  
  LDA   X_CLIP_S_PER_LO
  STA   Y_CLIP_END
  LDA   X_CLIP_S_PER_HI
  STA   Y_CLIP_END+1

  LDA   Y_CLIP_S_PER_LO
  STA   X_CLIP_END
  LDA   Y_CLIP_S_PER_HI
  STA   X_CLIP_END+1
  
  JSR   MIDPOINT_TOP_LEFT  ; do clip
  
  LDA   #<CLIP_OFFSET
  sta   Y_CLIP_E_PER_LO
  LDA   #>CLIP_OFFSET
  sta   Y_CLIP_E_PER_HI

  LDA   Y_CLIP_MID
  sta   X_CLIP_E_PER_LO
  LDA   Y_CLIP_MID+1
  sta   X_CLIP_E_PER_HI

    LDX   #0       ; CLIP CODE
    LDY   X_CLIP_E_PER_LO
    SEC
    LDA   X_CLIP_E_PER_HI 
    SBC   #>CLIP_OFFSET
    CLIP_CODE_H
	STX CC_E
  RTS
.ENDL

.LOCAL CLIP_BOTTOM
  LDA   CC_S   
  AND   #CC_BOTTOM
  BEQ   START_ON_END_OFF

START_OFF_END_ON
  LDA   X_CLIP_E_PER_LO
  STA   Y_CLIP_STT
  LDA   X_CLIP_E_PER_HI
  STA   Y_CLIP_STT+1

  LDA   Y_CLIP_E_PER_LO
  STA   X_CLIP_STT
  LDA   Y_CLIP_E_PER_HI
  STA   X_CLIP_STT+1
  
  LDA   X_CLIP_S_PER_LO
  STA   Y_CLIP_END
  LDA   X_CLIP_S_PER_HI
  STA   Y_CLIP_END+1

  LDA   Y_CLIP_S_PER_LO
  STA   X_CLIP_END
  LDA   Y_CLIP_S_PER_HI
  STA   X_CLIP_END+1
  
  JSR   MIDPOINT_BOTTOM_RIGHT  ; do clip

  LDA   #<(CLIP_OFFSET +255)
  sta   Y_CLIP_S_PER_LO
  LDA   #>(CLIP_OFFSET +255)
  sta   Y_CLIP_S_PER_HI

  LDA   Y_CLIP_MID
  sta   X_CLIP_S_PER_LO
  LDA   Y_CLIP_MID+1
  sta   X_CLIP_S_PER_HI

    LDX   #0       ; CLIP CODE
    LDY   X_CLIP_S_PER_LO
    SEC
    LDA   X_CLIP_S_PER_HI 
    SBC   #>CLIP_OFFSET
    CLIP_CODE_H

	STX CC_S
  RTS
  
START_ON_END_OFF
  LDA   X_CLIP_S_PER_LO
  STA   Y_CLIP_STT
  LDA   X_CLIP_S_PER_HI
  STA   Y_CLIP_STT+1

  LDA   Y_CLIP_S_PER_LO
  STA   X_CLIP_STT
  LDA   Y_CLIP_S_PER_HI
  STA   X_CLIP_STT+1
    
  LDA   X_CLIP_E_PER_LO
  STA   Y_CLIP_END
  LDA   X_CLIP_E_PER_HI
  STA   Y_CLIP_END+1

  LDA   Y_CLIP_E_PER_LO
  STA   X_CLIP_END
  LDA   Y_CLIP_E_PER_HI
  STA   X_CLIP_END+1
  
  JSR   MIDPOINT_BOTTOM_RIGHT  ; do clip
  
  LDA   #<(CLIP_OFFSET +255)
  sta   Y_CLIP_E_PER_LO
  LDA   #>(CLIP_OFFSET +255)
  sta   Y_CLIP_E_PER_HI

  LDA   Y_CLIP_MID
  sta   X_CLIP_E_PER_LO
  LDA   Y_CLIP_MID+1
  sta   X_CLIP_E_PER_HI

    LDX   #0       ; CLIP CODE
    LDY   X_CLIP_E_PER_LO
    SEC
    LDA   X_CLIP_E_PER_HI 
    SBC   #>CLIP_OFFSET
    CLIP_CODE_H
	STX CC_E 
  RTS
.ENDL









MIDPOINT_Z_MORE
  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry

  LDA   X_CLIP_MID   
  STA   X_CLIP_END
  LDA   X_CLIP_MID+1
  STA   X_CLIP_END+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry

  LDA   Y_CLIP_MID   
  STA   Y_CLIP_END
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_END+1

  LSR   Z_CLIP_MID+1     ; half MSB
  ROR   Z_CLIP_MID     ; half LSB add carry

  LDA   Z_CLIP_MID   
  STA   Z_CLIP_END
  LDA   Z_CLIP_MID+1
  STA   Z_CLIP_END+1

.LOCAL MIDPOINT_Z
  CLC           ; clear carry
  LDA Y_CLIP_STT
  ADC Y_CLIP_END
  STA Y_CLIP_MID     ; store sum of LSBs
  LDA Y_CLIP_STT+1
  ADC Y_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA Y_CLIP_MID+1

  CLC           ; clear carry
  LDA X_CLIP_STT
  ADC X_CLIP_END
  STA X_CLIP_MID     ; store sum of LSBs
  LDA X_CLIP_STT+1
  ADC X_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA X_CLIP_MID+1

  CLC           ; clear carry
  LDA Z_CLIP_STT
  ADC Z_CLIP_END
  STA Z_CLIP_MID     ; store sum of LSBs
  LDA Z_CLIP_STT+1
  ADC Z_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA Z_CLIP_MID+1
  
  LDA   Z_CLIP_MID+1
  CMP   #>(CLIP_OFFSET *2)
  BNE   MIDPOINT_DIFF
    LDA   Z_CLIP_MID
    CMP   #<(CLIP_OFFSET *2)
    BEQ   MIDPOINT_FOUND

MIDPOINT_DIFF
  BCS   MIDPOINT_Z_MORE

MIDPOINT_LESS
  LSR   Z_CLIP_MID+1     ; half MSB
  ROR   Z_CLIP_MID     ; half LSB add carry
  LDA   Z_CLIP_MID
  CLC 
  ADC   #1
  STA   Z_CLIP_STT
  LDA   Z_CLIP_MID+1
  ADC   #0
  STA   Z_CLIP_STT+1

  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry

  LDA   X_CLIP_MID
  STA   X_CLIP_STT
  LDA   X_CLIP_MID+1
  STA   X_CLIP_STT+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry

  LDA   Y_CLIP_MID
  STA   Y_CLIP_STT
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_STT+1

  JMP   MIDPOINT_Z

MIDPOINT_FOUND  
  LSR   X_CLIP_MID+1   ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry
  LSR   Y_CLIP_MID+1   ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry
  LSR   Z_CLIP_MID+1   ; half MSB
  ROR   Z_CLIP_MID     ; half LSB add carry
  RTS
.ENDL





MIDPOINT_TOP_LEFT_MORE
  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry

  LDA   X_CLIP_MID   
  STA   X_CLIP_END
  LDA   X_CLIP_MID+1
  STA   X_CLIP_END+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry

  LDA   Y_CLIP_MID   
  STA   Y_CLIP_END
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_END+1

.LOCAL MIDPOINT_TOP_LEFT
  CLC           ; clear carry
  LDA Y_CLIP_STT
  ADC Y_CLIP_END
  STA Y_CLIP_MID     ; store sum of LSBs
  LDA Y_CLIP_STT+1
  ADC Y_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA Y_CLIP_MID+1

  CLC           ; clear carry
  LDA X_CLIP_STT
  ADC X_CLIP_END
  STA X_CLIP_MID     ; store sum of LSBs
  LDA X_CLIP_STT+1
  ADC X_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA X_CLIP_MID+1
  
  LDA   X_CLIP_MID+1
  CMP   #>(CLIP_OFFSET *2)
  BNE   MIDPOINT_DIFF
    LDA   X_CLIP_MID
    CMP   #<(CLIP_OFFSET *2)
    BEQ   MIDPOINT_FOUND

MIDPOINT_DIFF
  BCS   MIDPOINT_TOP_LEFT_MORE

MIDPOINT_LESS
  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry
  LDA   X_CLIP_MID
  CLC 
  ADC   #1
  STA   X_CLIP_STT
  LDA   X_CLIP_MID+1
  ADC   #0
  STA   X_CLIP_STT+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry
  LDA   Y_CLIP_MID
  STA   Y_CLIP_STT
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_STT+1
  JMP   MIDPOINT_TOP_LEFT

MIDPOINT_FOUND  
  LSR   X_CLIP_MID+1   ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry
  LSR   Y_CLIP_MID+1   ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry
  RTS
.ENDL

MIDPOINT_BOTTOM_RIGHT_MORE
  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry

  LDA   X_CLIP_MID   
  STA   X_CLIP_END
  LDA   X_CLIP_MID+1
  STA   X_CLIP_END+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry

  LDA   Y_CLIP_MID   
  STA   Y_CLIP_END
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_END+1

.LOCAL MIDPOINT_BOTTOM_RIGHT
  CLC           ; clear carry
  LDA   Y_CLIP_STT
  ADC Y_CLIP_END
  STA Y_CLIP_MID     ; store sum of LSBs
  LDA Y_CLIP_STT+1
  ADC Y_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA Y_CLIP_MID+1

  CLC           ; clear carry
  LDA X_CLIP_STT
  ADC X_CLIP_END
  STA X_CLIP_MID     ; store sum of LSBs
  LDA X_CLIP_STT+1
  ADC X_CLIP_END+1   ; add the MSBs using carry from the previous calculation
  STA X_CLIP_MID+1

  LDA   X_CLIP_MID+1
  CMP   #>((CLIP_OFFSET +255) *2)
  BNE   MIDPOINT_DIFF
    LDA   X_CLIP_MID
    CMP   #<((CLIP_OFFSET +255) *2)
    BEQ   MIDPOINT_FOUND

MIDPOINT_DIFF
  BCS   MIDPOINT_BOTTOM_RIGHT_MORE

MIDPOINT_LESS
  LSR   X_CLIP_MID+1     ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry
  LDA   X_CLIP_MID
  CLC 
  ADC   #1
  STA   X_CLIP_STT
  LDA   X_CLIP_MID+1
  ADC   #0
  STA   X_CLIP_STT+1

  LSR   Y_CLIP_MID+1     ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry
  LDA   Y_CLIP_MID
  STA   Y_CLIP_STT
  LDA   Y_CLIP_MID+1
  STA   Y_CLIP_STT+1
  JMP   MIDPOINT_BOTTOM_RIGHT

MIDPOINT_FOUND  
  LSR   X_CLIP_MID+1   ; half MSB
  ROR   X_CLIP_MID     ; half LSB add carry
  LSR   Y_CLIP_MID+1   ; half MSB
  ROR   Y_CLIP_MID     ; half LSB add carry
  RTS
.ENDL

.ALIGN $100
.LOCAL PERSPECTIVE_POINT
			LDX   X_PNT_HI      ; get x hi
			STX   X_MINUS+1
			BPL   X_POS
				LDA   NEGTAB,X
				STA   X_PNT_HI 
				LDX   X_PNT_LO
				LDA   NEGTAB,X
				STA   X_PNT_LO 
X_POS		LDX   Y_PNT_HI      ; get y hi
			STX   Y_MINUS+1
			BPL   Y_POS
				LDA   NEGTAB,X
				STA   Y_PNT_HI 
				LDX   Y_PNT_LO
				LDA   NEGTAB,X
				STA   Y_PNT_LO 
Y_POS		LDX 	Z_PNT_HI
			LDA		Z_PNT_LO
			CLC
			ADC		#64
			STA		Z_PNT_LO
			BCC		Z_CONT
				INX
Z_CONT		TXA

;;	LAX   Z_PNT_HI      ; shift x/x/z down until z is less than 255
;			TAX
;;	inx
;;	txa
			LDY   PPTABLO,X
			STY   PP_SFT+1
PP_SFT		JMP   PP_SFT_8

PP_SFT_8:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO	; this can be done faster with lookup tables? tables for lookup shifted back by 8 lookup shifted back by 7 ... lookup shifted back by 1 etc?
PP_SFT_7:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_6:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_5:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_4:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_3:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_2:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_1:	DIV_SHIFT_16 Z_PNT_LO, X_PNT_LO, Y_PNT_LO
PP_SFT_0:

			LDA   X_PNT_LO  ; divide shifted x
			STA   Y0
			LDA   X_PNT_HI
			STA   Y1
			LDX   Z_PNT_LO  ; by reciptical of shifted z
			LDA   REC16LO,X
			STA   X0
			LDA   REC16HI,X
			STA   X1
			DIV_MUL_U16U16 ; doesnt need z0 ot z3?

X_MINUS 	LDA   #0        ; negative?
			BPL   X_PLUS   ; no
				NEG16  Z1    ; yes
X_PLUS  	LDA   Z1        ; pers x + screen middle
			LDX   Z2
			CLC
			ADC   #<SCN_MID
			BCC   X_PS_PLS
				INX
X_PS_PLS	STA   X_PNT_LO
			STX   X_PNT_HI
           
			LDA   Y_PNT_LO  ; divide shifted z
			STA   Y0
			LDA   Y_PNT_HI
			STA   Y1
			LDX   Z_PNT_LO  ; by reciptical of shifted z
			LDA   REC16LO,X
			STA   X0
			LDA   REC16HI,X
			STA   X1
			DIV_MUL_U16U16 ; doesnt need z0 ot z3?

Y_MINUS		LDA   #0        ; negative
			BPL   Y_PLUS   ; no
				NEG16  Z1    ; yes
Y_PLUS		LDA   Z1        ; pers x + screen middle
			LDY   Z2
			CLC
			ADC   #<SCN_MID
			BCC   Y_PS_PLS
				INY
Y_PS_PLS	STA   Y_PNT_LO 
			STY   Y_PNT_HI
			RTS
.ENDL

.MACRO ROTATE_Y
; rotate around y-axis:
; x'' = x'*cos(B) + z*sin(B)
; z'  = x'*sin(B) - z*cos(B)
  LDX   X_PNT_LO
  STX   X0
  LDA 	YCOSTMP
  JSR   ROTS08S08
  STX   XC_TEMP
  STY   XC_TEMP+1

  LDX   Z_PNT_LO
  STX   X0
  LDA 	YSINTMP
  JSR   ROTS08S08
  STX   ZS_TEMP
  STY   ZS_TEMP+1
  
  LDX   X_PNT_LO
  STX   X0
  LDA 	YSINTMP
  JSR   ROTS08S08
  STX   XS_TEMP
  STY   XS_TEMP+1

  LDX   Z_PNT_LO
  STX   X0
  LDA 	YCOSTMP
  JSR   ROTS08S08
  STX   ZC_TEMP
  STY   ZC_TEMP+1
   
  CLC
  LDA   XC_TEMP
  ADC   ZS_TEMP
  STA   X_PNT_LO
  LDA   XC_TEMP+1
  ADC   ZS_TEMP+1
  STA   X_PNT_HI
    
  SEC
  LDA   XS_TEMP
  SBC   ZC_TEMP
  STA   Z_PNT_LO
  LDA   XS_TEMP+1
  SBC   ZC_TEMP+1
  STA   Z_PNT_HI
.ENDM

.MACRO ROT_U08U08 ; in = (A=X0 / Y-Y0) out = (A / X)
;set multiplier as x0
		sta 	p_sqr_lo
		sta 	p_sqr_hi
		eor 	#$ff
		sta 	p_invsqr_lo
		sta 	p_invsqr_hi;17

		sec
		lda 	(p_sqr_lo),y
		sbc 	(p_invsqr_lo),y;note these two lines taken as 11 total

		lda 	(p_sqr_hi),y
		sbc 	(p_invsqr_hi),y
		tax
        LDA 	#$00
        ADC 	#$FF        ; C set:   A = $FF + C = $00 / C clear: A = $FF + C = $FF
		tay
.ENDM

;tempx .byte 0
;tempy .byte 0

.MACRO ROT_U16U08
  lda   X0              ; set multiplier as x0
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

  sec
  lda   (P_SQR_LO),Y
  sbc   (P_INVSQR_LO),Y ; note these two lines taken as 11 total
  lda   (P_SQR_HI),Y
  sbc   (P_INVSQR_HI),Y
  sta   c1a+1           ; x0*y0h;31 ;c1a means column 1, row a (partial product to be added later)

  lda   X1              ; set multiplier as x1
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

;sec
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  TAX
 
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  TAY

  TXA
  clc               ; add the first two numbers of column 1
c1a  adc   #0
  TAX
     
  bcc exit
   INY
exit 
.ENDM

.LOCAL ROTS08S08 ; return z1/z2 in x/y
		LDX   #0      	; reset sign count
		ASL				; making object twice as big?
		BCC cont1
			INX         ; inc count
			EOR #$ff  	; negate #2
			ADC #0    	; carry is set
cont1:	TAY
		LDA   X0 		; get x
		BPL   cont2
			INX         ; inc count
			EOR #$ff  	; negate #2
			CLC
			ADC #1
cont2:	STX   count+1  ;  TYA           ; store count  PHA           ; push on stack
		ROT_U08U08 ; ROT_U16U08
count:	LDA   #0      ; PLA           ; get stack
		LSR           ; AND #1
		BCC   cont3
			LDA   NEGTAB,Y
			TAY
			LDA   NEGTAB,X
			TAX
cont3:	RTS
.ENDL

.ALIGN $100
.LOCAL SIN_COS
		STY		ANGLE_L +1
		LDA		SIN_COS_JMP_TAB,X
		STA		SIN_JMP	+1
		LDA		SIN_COS_JMP_TAB+1,X
		STA		COS_JMP	+1

SIN_JMP	JSR		SIN_COS_000_090
		STY		SIN +1

ANGLE_L	LDY		#0
COS_JMP	JSR		SIN_COS_000_090
		TYA
		TAX
SIN		LDY		#0
		RTS

SIN_COS_090_180: ; if (x < 180) / (X=1) return  sine_table[90-y]
	TYA					; NEGATE Y
	EOR		#255
	TAY
SIN_COS_000_090: ; if (x <  90) / (X=0) return  sine_table[   y]
	LDA		SINTAB,Y
	TAY
	RTS
SIN_COS_270_000: ; if (X=3) return -sine_table[90-y]
	TYA					; NEGATE Y
	EOR		#255
	TAY
SIN_COS_180_270: ; if (x < 270) / (X=2) return -sine_table[   y]
	LDA		SINTAB,Y
	EOR		#255
	TAY
	INY
	RTS

SIN_COS_JMP_TAB	.BYTE <SIN_COS_000_090, <SIN_COS_090_180, <SIN_COS_180_270, <SIN_COS_270_000, <SIN_COS_000_090

.ENDL

.LOCAL ROT_POINT

; point format A???????

	BEQ		ROTATE_POINT	; if all zero - then rotate
	BMI		COPY_XZ			; (#A) if negative then reuse x/y from this point and use y point

NEGATE_XZ		; negate x/y from the point pointed to and use y point
	TAY

	SEC
	LDA	  #0
	SBC	  RXL,Y
	STA   X_PNT_LO
	LDA   #0
	SBC	  RXH,Y
	STA	  X_PNT_HI

	SEC
	LDA	  #0
	SBC	  RZL,Y
	STA   Z_PNT_LO
	LDA   #0
	SBC	  RZH,Y
	STA	  Z_PNT_HI

	RTS

COPY_XZ		; use x/y from the point pointed to and use y point
;	LSR
	AND	  #%01111111
	TAY

	LDA   RXL,Y
	STA   X_PNT_LO
	LDA   RXH,Y
	STA   X_PNT_HI

	LDA   RZL,Y
	STA   Z_PNT_LO
	LDA   RZH,Y
	STA   Z_PNT_HI

	RTS

;SWAP_XZ	; swap x/y from the point pointed to and use y point
;	TAY
;	LDA	  RXL,Y
;	STA   Z_PNT_LO
;	LDA	  RXH,Y
;	STA	  Z_PNT_HI
;	LDA	  RZL,Y
;	STA   X_PNT_LO
;	LDA	  RZH,Y
;	STA	  X_PNT_HI
;	RTS

ROTATE_POINT
   	LDX		Y_ROT+1
	LDY		Y_ROT
	JSR		SIN_COS
	STY		YCOSTMP
	STX		YSINTMP
 	ROTATE_Y  
	RTS
.ENDL

.MACRO DIV_SHIFT_16 NUM1, NUM2, NUM3 ; convert x to unsigned and set a flag shift x down until z is less than 256 multiply by recipricol
  LSR ; 16 bit divide by 2
  ROR   :1 
  LSR   :2+1
  ROR   :2
  LSR   :3+1
  ROR   :3
.ENDM

.MACRO DIV_MUL_U16U16
  lda   X0              ; set multiplier as x0
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

  ldy   Y0
  sec
  lda   (P_SQR_HI),Y
  sbc   (P_INVSQR_HI),Y
  sta   c1a+1           ; x0*y0h;31 ;c1a means column 1, row a (partial product to be added later)

  ldy   Y1  ;sec  ;notice that the high byte of sub above is always +ve
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c1b+1           ; x0*y1l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  sta   c2a+1           ; x0*y1h;31

  lda   X1              ; set multiplier as x1
  sta   P_SQR_LO
  sta   P_SQR_HI
  eor   #$ff
  sta   P_INVSQR_LO
  sta   P_INVSQR_HI ;17

  ldy   Y0  ;sec
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c1c+1           ; x1*y0l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  sta   c2b+1           ; x1*y1h;31

  ldy   Y1  ;sec
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c2c+1           ; x1*y1l

      clc               ; add the first two numbers of column 1
c1a: lda   #0
c1b: adc   #0
c1c: adc   #0          ; add last number of column 1
      sta   Z1  ;8

c2a: lda   #0          ; continue to first two numbers of column 2
c2b: adc   #0

      clc
c2c: adc   #0          ; add last number of column 2
      sta   Z2          ; X=z2
.ENDM

.MACRO NEG16  NUM
  SEC       ;Ensure carry is set                      #2
  LDA #0    ;Load constant zero                       #2
  SBC :1   ;... subtract the least significant byte  #3
  STA :1   ;... and store the result                 #3
  LDA #0    ;Load constant zero again                 #2
  SBC :1+1 ;... subtract the most significant byte   #3
  STA :1+1 ;... and store the result                 #3
.ENDM		; #18
		
PLOT		LDA   SCR_0_LO,Y
			STA   SCR
PLOT_HI		LDA   SCR_1_HI,Y 
			STA   SCR+1 
            LDY   SCR_HOR,X
            LDA   (SCR),Y
			ORA   SCR_OR,X
            STA   (SCR),Y 
            RTS

LINE_H_SAME	    LDA   V_EN
                CMP   V_ST
                BNE   LINE_NOT_PLOT
				RTS

LINE00		  	LDA   #$7F; #$FF 
				STA   LINE_FRAC
                  
                LDA   H_ST
                CMP   H_EN
                BEQ   LINE_H_SAME
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
                                STA   LINE_IXIY_END+1 
                                SBC   V_ST
                                TAX ; divisor
                                SEC
                                LDA   H_EN ; calc x diff
                                SBC   H_ST  ; dividend
                                JSR   DIVMUL_1608 ; a=divisor
                                STA   LINE_IXIY_INC+1
                                LDX   H_ST
                                LDY   V_ST

LINE_INC_FRAC_HOR_INC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
DRAW_BANK_HI_1	                LDA   SCR_0_HI,Y
                                STA   SCR_HI
                                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y 
                                LDA   LINE_FRAC
LINE_IXIY_INC		            ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IXIY_CONT
									INX
;									clc ; ??
LINE_IXIY_CONT		            LDY   LINE_VER
                                INY
LINE_IXIY_END	                CPY   #0
                                BNE   LINE_INC_FRAC_HOR_INC_WHOLE_VER
                            RTS

CALC_INC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
                                STA   LINE_IYIX_END+1 
                                SBC   H_ST
                                TAX         ; divisor
                                SEC
                                LDA   V_EN ; calc x diff
                                SBC   V_ST ; dividend
                                JSR   DIVMUL_1608
                                STA   LINE_IYIX_INC+1
                                LDX   H_ST
                                LDY   V_ST
                                BPL   LINE_INC_FRAC_VER_INC_WHOLE_HOR ; JMP could use BPL as V is always +?

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
                                STA   LINE_DXDY_END+1 
                                SEC
                                LDA   V_ST
                                SBC   V_EN
                                TAX
                                SEC
                                LDA   H_EN
                                SBC   H_ST
                                JSR   DIVMUL_1608
                                STA   LINE_DXDY_INC+1
                                LDX   H_ST
                                LDY   V_ST
 
LINE_INC_FRAC_HOR_DEC_WHOLE_VER	STY   LINE_VER
								LDA   SCR_0_LO,Y
                                STA   SCR_LO 
DRAW_BANK_HI_3	                LDA   SCR_0_HI,Y
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
;									clc ; ??
LINE_DXDY_CONT                 	LDY   LINE_VER
                                DEY
LINE_DXDY_END                  	CPY   #0
                                BNE   LINE_INC_FRAC_HOR_DEC_WHOLE_VER
                                RTS
                                  
LINE_IYIX_LOOP                  LDA   LINE_FRAC
LINE_IYIX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_IYIX_CONT
									LDY   LINE_VER
									INY
LINE_INC_FRAC_VER_INC_WHOLE_HOR 	STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
DRAW_BANK_HI_2	                    LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
;									clc ; ??
LINE_IYIX_CONT	                LDY   SCR_HOR,X
                                LDA   (SCR),Y
								ORA   SCR_OR,X
                                STA   (SCR),Y 
                                INX
LINE_IYIX_END                   CPX   #0
                                BNE   LINE_IYIX_LOOP
                            RTS 

CALC_DEC_FRAC_VER_INC_WHOLE_HOR SEC
                                LDA   H_EN
                                STA   LINE_DYDX_END+1 
                                SBC   H_ST
                                TAX ; divisor
                                LDA   V_ST ; calc x diff
                                SBC   V_EN ; dividend
                                JSR   DIVMUL_1608
                                STA   LINE_DYDX_INC+1
                                LDX   H_ST
                                LDY   V_ST
                                BPL   LINE_DEC_FRAC_VER_INC_WHOLE_HOR ; JMP could use BPL as V is always +?
 
LINE_DYDX_LOOP                  LDA   LINE_FRAC
LINE_DYDX_INC                   ADC   #0
                                STA   LINE_FRAC
                                BCC   LINE_DYDX_CONT
									LDY   LINE_VER
                                    DEY
LINE_DEC_FRAC_VER_INC_WHOLE_HOR	    STY   LINE_VER
									LDA   SCR_0_LO,Y
                                    STA   SCR_LO 
DRAW_BANK_HI_4                      LDA   SCR_0_HI,Y 
                                    STA   SCR_HI 
;									clc ; ??
LINE_DYDX_CONT                  LDY SCR_HOR,X
                                LDA (SCR),Y
								ORA SCR_OR,X
                                STA (SCR),Y 
                                INX
LINE_DYDX_END                   CPX #0
                                BNE LINE_DYDX_LOOP
                            RTS

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
			LDA	#81
LOOP			CMP	VCOUNT  ; will be equal until incremented in VB
				BNE	LOOP
			RTS
.ENDL

.LOCAL	SWAP_SCREEN
			LDY		#99	; loop counter

			INC		SCREEN
			LDA		SCREEN
			LSR
			LDA		#0				; setup screen clear value before jumping to loop
			BCS		SCREEN_0
				JMP		SCREEN_1

SCREEN_0	LDX		#>SCR_0
			STX		DISPLAY_LIST_SCREEN+1
		
			LDX		#>SCR_1_HI
			STX		PLOT_HI+2
			STX		DRAW_BANK_HI_1+2
			STX		DRAW_BANK_HI_2+2
			STX		DRAW_BANK_HI_3+2
			STX		DRAW_BANK_HI_4+2
			
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

SCREEN_1	LDX		#>SCR_1
			STX		DISPLAY_LIST_SCREEN+1

			LDX		#>SCR_0_HI
			STX		PLOT_HI+2
			STX		DRAW_BANK_HI_1+2
			STX		DRAW_BANK_HI_2+2
			STX		DRAW_BANK_HI_3+2
			STX		DRAW_BANK_HI_4+2

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

.ENDL

.ALIGN $100
				
DISPLAY_LIST .BYTE $70,$70,$70	;Discard 24 scan lines
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

 .byte 255-255
NEGTAB: .BYTE 255-000,255-001,255-002,255-003,255-004,255-005,255-006,255-007,255-008,255-009,255-010,255-011,255-012,255-013,255-014,255-015
        .BYTE 255-016,255-017,255-018,255-019,255-020,255-021,255-022,255-023,255-024,255-025,255-026,255-027,255-028,255-029,255-030,255-031
        .BYTE 255-032,255-033,255-034,255-035,255-036,255-037,255-038,255-039,255-040,255-041,255-042,255-043,255-044,255-045,255-046,255-047
        .BYTE 255-048,255-049,255-050,255-051,255-052,255-053,255-054,255-055,255-056,255-057,255-058,255-059,255-060,255-061,255-062,255-063
        .BYTE 255-064,255-065,255-066,255-067,255-068,255-069,255-070,255-071,255-072,255-073,255-074,255-075,255-076,255-077,255-078,255-079
        .BYTE 255-080,255-081,255-082,255-083,255-084,255-085,255-086,255-087,255-088,255-089,255-090,255-091,255-092,255-093,255-094,255-095
        .BYTE 255-096,255-097,255-098,255-099,255-100,255-101,255-102,255-103,255-104,255-105,255-106,255-107,255-108,255-109,255-110,255-111
        .BYTE 255-112,255-113,255-114,255-115,255-116,255-117,255-118,255-119,255-120,255-121,255-122,255-123,255-124,255-125,255-126,255-127
        .BYTE 255-128,255-129,255-130,255-131,255-132,255-133,255-134,255-135,255-136,255-137,255-138,255-139,255-140,255-141,255-142,255-143
        .BYTE 255-144,255-145,255-146,255-147,255-148,255-149,255-150,255-151,255-152,255-153,255-154,255-155,255-156,255-157,255-158,255-159
        .BYTE 255-160,255-161,255-162,255-163,255-164,255-165,255-166,255-167,255-168,255-169,255-170,255-171,255-172,255-173,255-174,255-175
        .BYTE 255-176,255-177,255-178,255-179,255-180,255-181,255-182,255-183,255-184,255-185,255-186,255-187,255-188,255-189,255-190,255-191
        .BYTE 255-192,255-193,255-194,255-195,255-196,255-197,255-198,255-199,255-200,255-201,255-202,255-203,255-204,255-205,255-206,255-207
        .BYTE 255-208,255-209,255-210,255-211,255-212,255-213,255-214,255-215,255-216,255-217,255-218,255-219,255-220,255-221,255-222,255-223
        .BYTE 255-224,255-225,255-226,255-227,255-228,255-229,255-230,255-231,255-232,255-233,255-234,255-235,255-236,255-237,255-238,255-239
        .BYTE 255-240,255-241,255-242,255-243,255-244,255-245,255-246,255-247,255-248,255-249,255-250,255-251,255-252,255-253,255-254,255-255   
 .byte 255-000 ; needed at end for +1 ????
 
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
SINTAB:
 .BYTE    0,   0,   1,   2,   3,   3,   4,   5,   6,   7,   7,   8,   9,  10,  10,  11
 .BYTE   12,  13,  14,  14,  15,  16,  17,  17,  18,  19,  20,  20,  21,  22,  23,  24
 .BYTE   24,  25,  26,  27,  27,  28,  29,  30,  30,  31,  32,  33,  33,  34,  35,  36
 .BYTE   36,  37,  38,  39,  39,  40,  41,  42,  42,  43,  44,  44,  45,  46,  47,  47
 .BYTE   48,  49,  50,  50,  51,  52,  52,  53,  54,  55,  55,  56,  57,  57,  58,  59
 .BYTE   59,  60,  61,  61,  62,  63,  63,  64,  65,  65,  66,  67,  67,  68,  69,  69
 .BYTE   70,  71,  71,  72,  73,  73,  74,  75,  75,  76,  76,  77,  78,  78,  79,  79
 .BYTE   80,  81,  81,  82,  82,  83,  84,  84,  85,  85,  86,  87,  87,  88,  88,  89
 .BYTE   89,  90,  90,  91,  92,  92,  93,  93,  94,  94,  95,  95,  96,  96,  97,  97
 .BYTE   98,  98,  99,  99, 100, 100, 101, 101, 102, 102, 102, 103, 103, 104, 104, 105
 .BYTE  105, 106, 106, 106, 107, 107, 108, 108, 108, 109, 109, 110, 110, 110, 111, 111
 .BYTE  112, 112, 112, 113, 113, 113, 114, 114, 114, 115, 115, 115, 116, 116, 116, 117
 .BYTE  117, 117, 117, 118, 118, 118, 119, 119, 119, 119, 120, 120, 120, 120, 121, 121
 .BYTE  121, 121, 121, 122, 122, 122, 122, 123, 123, 123, 123, 123, 123, 124, 124, 124
 .BYTE  124, 124, 124, 125, 125, 125, 125, 125, 125, 125, 125, 125, 126, 126, 126, 126
 .BYTE  126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126, 126

.ALIGN $100
PPTABLO:
.REPT	1
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_0
.ENDR
.REPT	1
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_1
.ENDR
.REPT	2
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_2
.ENDR
.REPT	4
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_3
.ENDR
.REPT	8
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_4
.ENDR
.REPT	16
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_5
.ENDR
.REPT	32
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_6
.ENDR
.REPT	64
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_7
.ENDR
.REPT	128
 .BYTE  <PERSPECTIVE_POINT.PP_SFT_8
.ENDR

HEX0	.BYTE %00000111,%00000010,%00000111,%00000111,%00000101,%00000111,%00000111,%00000111,%00000111,%00000111,%00000111,%00000111,%00000111,%00000110,%00000111,%00000111 
HEX1	.BYTE %00000101,%00000110,%00000001,%00000001,%00000101,%00000100,%00000100,%00000001,%00000101,%00000101,%00000101,%00000101,%00000100,%00000101,%00000100,%00000100 
HEX2	.BYTE %00000101,%00000010,%00000111,%00000111,%00000111,%00000111,%00000111,%00000001,%00000111,%00000111,%00000111,%00000110,%00000100,%00000101,%00000111,%00000111
HEX3	.BYTE %00000101,%00000010,%00000100,%00000001,%00000001,%00000001,%00000101,%00000001,%00000101,%00000001,%00000101,%00000101,%00000100,%00000101,%00000100,%00000100
HEX4	.BYTE %00000111,%00000111,%00000111,%00000111,%00000001,%00000111,%00000111,%00000001,%00000111,%00000111,%00000101,%00000111,%00000111,%00000110,%00000111,%00000100

;SHAPE_PNTS =8-1
;SHAPE_LINES =12-1
;SHAPE_ST .BYTE 128+2, 128+3, 7,     6,     128+6, 128+7, 0,     0
;SHAPE_XL .BYTE -127,  127,   -127,  127,   -127,  127,   -127,  127
;SHAPE_YL .BYTE -127,  -127,  127,   127,   -127,  -127,  127,   127
;SHAPE_ZL .BYTE -127,  -127,  -127,  -127,  127,   127,   127,   127
;SHAPE_PS .BYTE 0,1,3,2, 4,5,7,6 ,0,5,2,7
;SHAPE_PE .BYTE 1,3,2,0, 5,7,6,4 ,4,1,6,3

;SHAPE_PNTS =6-1
;SHAPE_LINES =12-1
;SHAPE_ST  .BYTE 2,   3,    0,    0,    128+5, 0
;SHAPE_XL .BYTE -127, 0,    +127, 0,    0,     0
;SHAPE_YL .BYTE 0,    0,    0,    0,    -127,  +127
;SHAPE_ZL .BYTE 0,    -127, 0,    +127, 0,     0
;SHAPE_PS .BYTE 0,1,2,3, 0,1,2,3 ,0,1,2,3
;SHAPE_PE .BYTE 1,2,3,0, 4,4,4,4 ,5,5,5,5

;;;SHAPE_PNTS =4-1
;;;SHAPE_LINES =6-1
;;;SHAPE_XL .BYTE <-127, <127, <0,  <0
;;;SHAPE_YL .BYTE <127, <127, <127, <-127
;;;SHAPE_ZL .BYTE <-127, <-127,  <+127,  <0
;;;SHAPE_PS .BYTE 0,0,0,1,1,2
;;;SHAPE_PE .BYTE 1,2,3,2,3,3

SHAPE_PNTS =4-1
SHAPE_LINES =6-1
SHAPE_ST .BYTE 0,    0,   0,    0
SHAPE_XL .BYTE -127, 127, 0,    0
SHAPE_YL .BYTE -90,  -90, 90,   90
SHAPE_ZL .BYTE 0,    0,   -127, 127
SHAPE_PS .BYTE 0,0,0,1,1,2
SHAPE_PE .BYTE 1,2,3,2,3,3

;SHAPE_PNTS =4-1
;SHAPE_LINES =6-1
;SHAPE_ST .BYTE 0,    0,   0,    0
;SHAPE_XL .BYTE -5, 5, 0,    0
;SHAPE_YL .BYTE -3,  -3, 3,   3
;SHAPE_ZL .BYTE 0,    0,   -5, 5
;SHAPE_PS .BYTE 0,0,0,1,1,2
;SHAPE_PE .BYTE 1,2,3,2,3,3

; 0 1
; 
; 
; 
; 2 3

RXL 
.REPT	MAX_PNT
	.BYTE 0
.ENDR
RXH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
RYL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
RYH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
RZL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
RZH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OXL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OXH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OYL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OYH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OZL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
OZH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
PXL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
PXH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
PYL
.REPT	MAX_PNT
	.BYTE 0
.ENDR
PYH
.REPT	MAX_PNT
	.BYTE 0
.ENDR
PCC
.REPT	MAX_PNT
	.BYTE 0
.ENDR
 
.ALIGN $5000
SCR_0	       	
SCR_1	EQU	SCR_0 + 4096
