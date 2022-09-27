	SCREEN	EQU	128
	SCR 	EQU	SCREEN +1

	SCR_LO	EQU	SCR
	SCR_HI	EQU	SCR +1

	REGA	EQU	SCR +2
	REGX	EQU REGA +1
	REGY	EQU REGX +1
	
	X_PNT_LO EQU REGY +1
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

	CC		EQU	Z_OFF_HI +1
	MUL_VAL_LO	EQU	CC +1

	MUL_VAL_HI	EQU	MUL_VAL_LO +1	

	X0 EQU MUL_VAL_HI +1
	X1 EQU X0 +1
	Y0 EQU X1 +1
	Y1 EQU Y0 +1
	Z0 EQU Y1 +1
	Z1 EQU Z0 +1
	Z2 EQU Z1 +1
	Z3 EQU Z2 +1

	P1X	EQU	Z3 +1
	P1Y	EQU	P1X +1	
		
	P_SQR_LO	EQU	P1Y +1
	P_SQR_HI	EQU	P_SQR_LO +2
	P_INVSQR_LO	EQU	P_SQR_HI +2
	P_INVSQR_HI EQU	P_INVSQR_LO +2

	SCNX = 127/2
	SCNY = 127/2

 ICL 'hardware.s'

	ORG $800
				
INIT	LDA 	PORTB ; disable basic
		ORA 	#$02
		STA 	PORTB
			 	
		LDA 	#$00 ; disable antic
		STA 	SDMCTL
		STA 	DMACTL
		        
		LDA 	#$55 ;00 55 	; set colours
		STA		COLOR1
		LDA 	#$AA ; 55 AA
		STA 	COLOR2
		LDA 	#$FF ;AA FF
		STA 	COLOR3
		LDA 	#$00 ; FF
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

		LDA  #<500
		STA  Y_OFF_LO
		LDA  #>500
		STA  Y_OFF_HI

		LDA #<500
		STA  X_OFF_LO
		LDA #>500
		STA  X_OFF_HI

		LDA  #<500
		STA  Z_OFF_LO
		LDA  #>500
		STA  Z_OFF_HI

MLOOP		JSR		V_WAIT
			JSR		SWAP_SCREEN
			JSR		JOYSTICK

;			LDX 	Z_OFF_HI ; P1X
;			LDY 	X_OFF_HI ; P1Y
;			JSR		PLOT_OR

			LDA		X_OFF_LO
			STA		X_PNT_LO
			LDA		X_OFF_HI
			STA		X_PNT_HI

			LDA		Y_OFF_LO
			STA		Y_PNT_LO
			LDA		Y_OFF_HI
			STA		Y_PNT_HI

			LDA		Z_OFF_LO
			STA		Z_PNT_LO
			LDA		Z_OFF_HI
			STA		Z_PNT_HI
			JSR		PERSPECTIVE

			LDX 	X_PNT_LO ; P1X
			LDY 	Y_PNT_LO ; X_OFF_HI ; P1Y
			JSR		PLOT_OR

			LDA		X_OFF_LO
			STA		X_PNT_LO
			LDA		X_OFF_HI
			STA		X_PNT_HI

			LDA		Y_OFF_LO
			STA		Y_PNT_LO
			LDA		Y_OFF_HI
			STA		Y_PNT_HI

			LDA		Z_OFF_LO
			STA		Z_PNT_LO
			LDA		Z_OFF_HI
			STA		Z_PNT_HI
			JSR		CLASSIFY
			
			LDX		Z_OFF_LO
			LDA		Z_OFF_HI
			LDY		#0
			JSR		HEX16

			LDX		X_OFF_LO
			LDA		X_OFF_HI
			LDY		#6
			JSR		HEX16

			LDX		X_PNT_LO
			LDA		X_PNT_HI
			LDY		#12
			JSR		HEX16

			LDX		MUL_VAL_LO
			LDA		MUL_VAL_HI
			LDY		#18
			JSR		HEX16

			LDX		TEMPP+0
			LDA		TEMPP+1
			LDY		#24
			JSR		HEX16

			LDX		CC
			LDA		#0
			LDY		#30
			JSR		HEX16

;			LDA		MUL_VAL_HI
;			STA		Y1
;			LDA		MUL_VAL_LO
;			STA		Y0

;			LDA		Z_PNT_LO
;			STA		X0
;			LDA		Z_PNT_HI
;			STA		X1

;			JSR		mult16 ; umult16 ; MULS16S16
;			LDX   	Z1        ; pers x + screen middle
;			LDA   	Z0
;			LDY		#36
;			JSR		HEX16

;			LDX   	Z3        ; pers x + screen middle
;			LDA   	Z2
;			LDY		#42
;			JSR		HEX16

;			LDX		Z_PNT_LO
;			LDA		Z_PNT_HI
;			LDY		#48
;			JSR		HEX16

;			lda		#<$5147
;			sta		X0
;			lda		#>$5147
;			sta		X1
;			lda		#
;			sta
;			jsr	umult16


		JMP		MLOOP

.LOCAL	JOYSTICK
			LDA 	PORTA
			LSR
UP			BCS   	DOWN
				TAY
				CLC
				LDA   Y_OFF_LO
				ADC   #3
				STA   Y_OFF_LO
				TYA
				BCC		DOWN
					INC	Y_OFF_HI
DOWN       	LSR
			BCS   	LEFT
				TAY
				SEC
				LDA   Y_OFF_LO
				SBC   #3
				STA   Y_OFF_LO
				TYA
				BCS		LEFT
					DEC   Y_OFF_HI
LEFT     	LSR
			BCS   	RIGHT
				TAY
				SEC
				LDA   X_OFF_LO
				SBC   #3
				STA   X_OFF_LO
				TYA
				BCS		RIGHT
					DEC   X_OFF_HI
RIGHT     	LSR
			BCS   	EXIT
				TAY
				CLC
				LDA   X_OFF_LO
				ADC   #3
				STA   X_OFF_LO
				TYA
				BCC		EXIT
					INC   X_OFF_HI
EXIT		RTS
.ENDL

.LOCAL	JOYSTICK2
			LDX		#0
			LDY		#0
			LDA 	PORTA
			LSR
UP			BCS   	DOWN
				DEY
DOWN       	LSR
			BCS   	LEFT
				INY
LEFT     	LSR
			BCS   	RIGHT
				DEX
;				RTS
RIGHT     	LSR
			BCS   	EXIT
				INX
EXIT		RTS
.ENDL

;.LOCAL	KEYBOARD
;			RTS
;.ENDL

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

.LOCAL	HEX8	; A = NUM / Y = YPOS / X = XPOS
			STA		REGA
			LDA		SCR_0_LO+0,Y
			STA		NUMBER0+1
			STA		NUMBER5+1
			
			LDA		SCR_1_HI+0,Y 
			STA		NUMBER0+2
			STA		NUMBER5+2

			LDA		SCR_0_LO+1,Y
			STA		NUMBER1+1
			STA		NUMBER6+1
			
			LDA		SCR_1_HI+1,Y 
			STA		NUMBER1+2
			STA		NUMBER6+2

			LDA		SCR_0_LO+2,Y
			STA		NUMBER2+1
			STA		NUMBER7+1
			
			LDA		SCR_1_HI+2,Y 
			STA		NUMBER2+2
			STA		NUMBER7+2

			LDA		SCR_0_LO+3,Y
			STA		NUMBER3+1
			STA		NUMBER8+1
			
			LDA		SCR_1_HI+3,Y 
			STA		NUMBER3+2
			STA		NUMBER8+2

			LDA		SCR_0_LO+4,Y
			STA		NUMBER4+1
			STA		NUMBER9+1
			
			LDA		SCR_1_HI+4,Y 
			STA		NUMBER4+2
			STA		NUMBER9+2

			LDA		REGA
			LSR
			LSR
			LSR
			LSR
			TAY

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

			INX

			LDA		REGA
			AND		#15
			TAY

			LDA		HEX0,Y
NUMBER5		STA		$ABCD,X
			LDA		HEX1,Y
NUMBER6		STA		$ABCD,X
			LDA		HEX2,Y
NUMBER7		STA		$ABCD,X
			LDA		HEX3,Y
NUMBER8		STA		$ABCD,X
			LDA		HEX4,Y
NUMBER9		STA		$ABCD,X

			RTS
.ENDL
		
PLOT_OR
	TYA
	BMI		PO_EXIT
	TXA
	BMI		PO_EXIT

			LDA   SCR_0_LO,Y
			STA   SCR
PLOT_OR_HI	LDA   SCR_1_HI,Y 
			STA   SCR+1 
            LDY   SCR_HOR,X
            LDA   (SCR),Y
PLOT_OR_TAB	ORA   SCR_OR,X
            STA   (SCR),Y 

PO_EXIT     RTS

PLOT_AND	
	TYA
	BMI		PO_EXIT
	TXA
	BMI		PO_EXIT

				LDA   SCR_0_LO,Y
				STA   SCR 
PLOT_AND_HI		LDA   SCR_0_HI,Y 
				STA   SCR+1 
				LDY   SCR_HOR,X
				LDA   (SCR),Y
PLOT_AND_TAB  	AND   SCR_AND,X
                STA   (SCR),Y 

PA_EXIT         RTS

.MACRO CMP_16 NUM1, NUM2
; Does exactly the same as CMP of two values (effectively its a A - M) and sets the flags as follows:
;  If A = M : Carry =  SET   Zero =  SET   Negative = CLEAR
;  If A > M : Carry =  SET   Zero = CLEAR  Negative = CLEAR
;  If A < M : Carry = CLEAR  Zero = CLEAR  Negative =  SET
  LDA :1+1
  CMP :2+1
  BNE CONT
    LDA :1
    CMP :2
CONT
; Status register sorted, from here you can branch as you like as you would after a CMP opc.
.ENDM

.LOCAL	CLASSIFY ; in = Z_PNT_HI/Z_PNT_LO / X_PNT_HI/X_PNT_LO / Y_PNT_HI/Y_PNT_LO out = CC
			LDX		#0	; CC

			LDA		Z_PNT_LO	; add		si,MIDDLE_VER
			CLC			
			ADC   	#<SCNX
			STA		Z_PNT_LO
			BCC		X_CHECK
				INC		Z_PNT_HI

X_CHECK:	LDA		X_PNT_HI
			BPL		X_POS
				NEG16	X_PNT_LO	; negate x
X_NEG:			CMP_16 	X_PNT_LO, Z_PNT_LO
				BCC 	Y_CHECK ; if NUM1L < NUM2L then NUM1 < NUM2
X_NEG_OFF:			LDX		#2
					BNE		Y_CHECK	; jmp - use bne
	
X_POS:		CMP_16 	X_PNT_LO, Z_PNT_LO
			BCC 	Y_CHECK ; if NUM1L < NUM2L then NUM1 < NUM2
X_POS_OFF:		LDX		#1
;				BNE		Y_CHECK	; jmp - use beq

Y_CHECK:	LDA		Y_PNT_HI
			BPL		Y_POS
				NEG16	Y_PNT_LO	; negate x
Y_NEG:			CMP_16 	Y_PNT_LO, Z_PNT_LO
				BCC 	QUIT ; if NUM1L < NUM2L then NUM1 < NUM2
Y_NEG_OFF:			TXA
					ORA		#8
					STA		CC
					RTS
	
Y_POS:		CMP_16 	Y_PNT_LO, Z_PNT_LO
			BCC 	QUIT ; if NUM1L < NUM2L then NUM1 < NUM2
Y_POS_OFF:		TXA
				ORA		#4
				STA		CC
				RTS

QUIT		STX	CC
			RTS

;
;	xor		dl,dl	; clear clipcodes
;.hor:
;	test	bx,bx 		; test if -ve
;	jns		.right	
;.left:
;		neg		bx
;		cmp		bx,si
;		jl		.ver
;			mov		dl,OFF_LEFT
;			jmp		.ver
;.right:
;		cmp		bx,si
;		jl		.ver
;			mov		dl,OFF_RIGHT
;.ver:
;	sub		si,(MIDDLE_VER-MIDDLE_HOR)
;
;	test	cx,cx 		; test if -ve
;	jns		.bottom
;.top:
;		neg		cx
;		cmp		cx,si
;		jl		.quit
;			or		dl,OFF_TOP
;			ret
;.bottom:
;		cmp		cx,si
;		jl		.quit
;			or		dl,OFF_BOTTOM
;.quit:
		RTS
.ENDL

.LOCAL	V_WAIT
			LDA		RTCLOK+2
LOOP		CMP		RTCLOK+2  ; will be equal until incremented in VB
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
			STX		PLOT_OR_HI+2
			STX		PLOT_AND_HI+2
			STY		PLOT_OR_HI+1
			STY		PLOT_AND_HI+1
;			STX		DRAW_BANK_HI_1+2
;			STX		DRAW_BANK_HI_2+2
;			STX		DRAW_BANK_HI_3+2
;			STX		DRAW_BANK_HI_4+2
;			STY		DRAW_BANK_HI_1+1
;			STY		DRAW_BANK_HI_2+1
;			STY		DRAW_BANK_HI_3+1
;			STY		DRAW_BANK_HI_4+1
			
			LDA		#$AA			
			LDY		#99
			JMP		CLEAR_SCREEN_1

SCREEN_1	LDX		#>SCR_1
			STX		DISPLAY_LIST_SCREEN+1

			LDX		#>SCR_0_HI
			LDY		#<SCR_0_HI
			STX		PLOT_OR_HI+2
			STX		PLOT_AND_HI+2
			STY		PLOT_OR_HI+1
			STY		PLOT_AND_HI+1
;			STX		DRAW_BANK_HI_1+2
;			STX		DRAW_BANK_HI_2+2
;			STX		DRAW_BANK_HI_3+2
;			STX		DRAW_BANK_HI_4+2
;			STY		DRAW_BANK_HI_1+1
;			STY		DRAW_BANK_HI_2+1
;			STY		DRAW_BANK_HI_3+1
;			STY		DRAW_BANK_HI_4+1

			LDA		#$AA
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

.MACRO NEG16  NUM
  SEC       ;Ensure carry is set                      #2
  LDA #0    ;Load constant zero                       #2
  SBC :1   	;... subtract the least significant byte  #3
  STA :1   	;... and store the result                 #3
  LDA #0    ;Load constant zero again                 #2
  SBC :1 +1 	;... subtract the most significant byte   #3
  STA :1 +1 	;... and store the result                 #3
.ENDM
 
;.MACRO NEG32 NUM
;  SEC       ;Ensure carry is set
;  LDA #0    ;Load constant zero
;  SBC :1   ;... subtract the least significant byte
;  STA :1   ;... and store the result
;  LDA #0    ;Load constant zero again
;  SBC :1 +1 ;... subtract the most significant byte
;  STA :1 +1 ;... and store the result   
;  LDA #0    ;Load constant zero again
;  SBC :1 +2 ;... subtract the most significant byte
;  STA :1 +2 ;... and store the result   
;  LDA #0    ;Load constant zero again
;  SBC :1 +3 ;... subtract the most significant byte
;  STA :1 +3 ;... and store the result   
;.ENDM

;16-bit multiply with 32-bit product 
;took from 6502.org
 		
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

.MACRO MUL_U16U16
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
  sta   Z0              ; x0*y0l
  lda   (P_SQR_HI),Y
  sbc   (P_INVSQR_HI),Y
  sta   c1a+1           ; x0*y0h;31 ;c1a means column 1, row a (partial product to be added later)

  ldy   Y1
;sec  ;notice that the high byte of sub above is always +ve
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
;sec
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c1c+1           ; x1*y0l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  sta   c2b+1           ; x1*y1h;31

  ldy   Y1
;sec
  lda   (P_SQR_LO),y
  sbc   (P_INVSQR_LO),y
  sta   c2c+1           ; x1*y1l
  lda   (P_SQR_HI),y
  sbc   (P_INVSQR_HI),y
  tay                   ; x1*y1h;Y=z3, 30 cycles
;17+33+31+17+31+30=159 cycles for main multiply part

;jmp do_adds; can put do_adds in zp for a slight speed increase
;do_adds:
      clc               ; add the first two numbers of column 1
c1a: lda   #0
c1b: adc   #0
      sta   Z1  ;9

c2a: lda   #0          ; continue to first two numbers of column 2
c2b: adc   #0
      tax               ; X=z2, 6 cycles
      bcc c1c  ;3/6 avg 4.5
        iny             ; z3++
      clc

c1c: lda   #0          ; add last number of column 1
      adc   Z1
      sta   Z1  ;8

      txa               ; A=z2
c2c: adc   #0          ; add last number of column 2
      tax               ; X=z2, 6
      bcc fin;3/4 avg 3.5
        iny             ; z3++
  
fin: stx   Z2          ; X=z2
      sty   Z3          ; Y=z3
.ENDM

.LOCAL	MULU16U16
			MUL_U16U16
		RTS
.ENDL

;.ALIGN $100

;	lda	zlo			; z lo
;	sta	hilo
;	lda	zhi			; z hi
;	lsr				; hi
;	ror	hilo		; lo
;	lsr				; hi
;	ror	hilo		;
;	clc
;	adc	#>ztabhi	; hi table pos
;	sta	hihi
;	adc	#4			; lo tables pos
;	sta	lohi
;	lda	hilo
;	sta lolo
;hihi/hilo lda $abcd
;	sta mulhi
;lohi/lolo lda $abcd
;	sta	mullo

;	ldx	zlo
;	ldy	zhi
;	lda	zhitab,y	; (>ztabhi) + zhi/y
;	sta	hihi
;	clc
;	adc	#4
;	sta	lohi
;	lda	zlotab,x	; (>ztabhi) + zlo/y 
;	ora	zhilotab,y			; + w lowest bits of 
;	tay
;hihi/hilo lda $abcd,y
;	sta mulhi
;lohi/lolo lda $abcd,y
;	sta	mullo

;	ldx	zlo
;	ldy	zhi
;	lda	zhitab,y	; (>ztabhi) + zhi/y
;	sta	hihi
;	clc
;	adc	#4
;	sta	lohi
;	lda	zlotab,x	; (>ztabhi) + zlo/y 
;	ora	zhilotab,y			; + w lowest bits of 
;	sta	hilo
;	sta	lolo
;hihi/hilo lda $abcd
;	sta mulhi
;lohi/lolo lda $abcd
;	sta	mullo

TEMPP	.byte 0,0

.LOCAL	PERSPECTIVE	; in = Z_PNT_HI/Z_PNT_LO / X_PNT_HI/X_PNT_LO / Y_PNT_HI/Y_PNT_LO out = X_PNT_HI/X_PNT_LO / Y_PNT_HI/Y_PNT_LO
			lda	Z_PNT_LO			; z lo
			sta	zhi+1				; lo
			lda	Z_PNT_HI			; z hi
			lsr				; hi /2
			ror	zhi+1		; lo /2
			lsr				; hi /2
			ror	zhi+1		; lo /4
	STA TEMPP+1	; hi /4
	ldy	zhi+1
	sty TEMPP+0 	; lo /4
			clc
			adc	#>pers4096tabhi	; hi table pos
			sta	zhi+2
			adc	#4			; lo tables pos
			sta	zlo+2
			lda	zhi+1
			sta zlo+1
zhi lda $abcd
			STA		Y1
			STA		MUL_VAL_HI	; temp
zlo lda $abcd
			STA		Y0
			STA		MUL_VAL_LO	; temp

X_PERS:		LDA		X_PNT_LO			; get x lo
			ASL		; Shift the LSB 	; *2
			STA		X0
			LDA		X_PNT_HI			; get x hi 
			ROL		; Rotate the MSB	; *2
			STA		X1
			STA   	X_NEG_TEST+1    	; backup x sign
			BPL   	X_NEG_CONT			; positive so no negate needed
				NEG16  X0  				; negate x
X_NEG_CONT:
			JSR		MULU16U16
X_NEG_TEST: LDA   #0      				; restore x sign
			BPL   X_NEG_POS  			; positive so no negate needed
				NEG16  Z2				; negate answer
X_NEG_POS:	LDA   	Z2        ; pers x + screen middle
			LDX   	Z3
			CLC
			ADC   	#<SCNX
			BCC   	X_PS_PLS
					INX
X_PS_PLS:	STA   	X_PNT_LO
			STX   	X_PNT_HI

Y_PERS:		LDA		Y_PNT_LO			; get x lo
			ASL		; Shift the LSB 	; *2
			STA		X0
			LDA		Y_PNT_HI			; get x hi 
			ROL		; Rotate the MSB	; *2
			STA		X1
			STA   	Y_NEG_TEST+1    	; backup x sign
			BPL   	Y_NEG_CONT			; positive so no negate needed
				NEG16  X0  				; negate x
Y_NEG_CONT:
			JSR		MULU16U16
Y_NEG_TEST: LDA   #0      				; restore x sign
			BPL   Y_NEG_POS  			; positive so no negate needed
				NEG16  Z2				; negate answer
Y_NEG_POS:	LDA   	Z2        ; pers x + screen middle
			LDX   	Z3
			CLC
			ADC   	#<SCNY
			BCC   	Y_PS_PLS
					INX
Y_PS_PLS:	STA   	Y_PNT_LO
			STX   	Y_PNT_HI

			RTS
.ENDL
				
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

.ALIGN $100
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
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 .BYTE $C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03,$C0,$30,$0C,$03
 
SCR_AND
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC
 .BYTE $3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC,$3F,$CF,$F3,$FC

SCR_HOR
 .BYTE 00,00,00,00,01,01,01,01,02,02,02,02,03,03,03,03,04,04,04,04,05,05,05,05,06,06,06,06,07,07,07,07
 .BYTE 08,08,08,08,09,09,09,09,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15
 .BYTE 16,16,16,16,17,17,17,17,18,18,18,18,19,19,19,19,20,20,20,20,21,21,21,21,22,22,22,22,23,23,23,23
 .BYTE 24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29,30,30,30,30,31,31,31,31

;NEGTAB: 
; .BYTE 255-000,255-001,255-002,255-003,255-004,255-005,255-006,255-007,255-008,255-009,255-010,255-011,255-012,255-013,255-014,255-015
; .BYTE 255-016,255-017,255-018,255-019,255-020,255-021,255-022,255-023,255-024,255-025,255-026,255-027,255-028,255-029,255-030,255-031
; .BYTE 255-032,255-033,255-034,255-035,255-036,255-037,255-038,255-039,255-040,255-041,255-042,255-043,255-044,255-045,255-046,255-047
; .BYTE 255-048,255-049,255-050,255-051,255-052,255-053,255-054,255-055,255-056,255-057,255-058,255-059,255-060,255-061,255-062,255-063
; .BYTE 255-064,255-065,255-066,255-067,255-068,255-069,255-070,255-071,255-072,255-073,255-074,255-075,255-076,255-077,255-078,255-079
; .BYTE 255-080,255-081,255-082,255-083,255-084,255-085,255-086,255-087,255-088,255-089,255-090,255-091,255-092,255-093,255-094,255-095
; .BYTE 255-096,255-097,255-098,255-099,255-100,255-101,255-102,255-103,255-104,255-105,255-106,255-107,255-108,255-109,255-110,255-111
; .BYTE 255-112,255-113,255-114,255-115,255-116,255-117,255-118,255-119,255-120,255-121,255-122,255-123,255-124,255-125,255-126,255-127
; .BYTE 255-128,255-129,255-130,255-131,255-132,255-133,255-134,255-135,255-136,255-137,255-138,255-139,255-140,255-141,255-142,255-143
; .BYTE 255-144,255-145,255-146,255-147,255-148,255-149,255-150,255-151,255-152,255-153,255-154,255-155,255-156,255-157,255-158,255-159
; .BYTE 255-160,255-161,255-162,255-163,255-164,255-165,255-166,255-167,255-168,255-169,255-170,255-171,255-172,255-173,255-174,255-175
; .BYTE 255-176,255-177,255-178,255-179,255-180,255-181,255-182,255-183,255-184,255-185,255-186,255-187,255-188,255-189,255-190,255-191
; .BYTE 255-192,255-193,255-194,255-195,255-196,255-197,255-198,255-199,255-200,255-201,255-202,255-203,255-204,255-205,255-206,255-207
; .BYTE 255-208,255-209,255-210,255-211,255-212,255-213,255-214,255-215,255-216,255-217,255-218,255-219,255-220,255-221,255-222,255-223
; .BYTE 255-224,255-225,255-226,255-227,255-228,255-229,255-230,255-231,255-232,255-233,255-234,255-235,255-236,255-237,255-238,255-239
; .BYTE 255-240,255-241,255-242,255-243,255-244,255-245,255-246,255-247,255-248,255-249,255-250,255-251,255-252,255-253,255-254,255-255   

 ICL 'perstab4096.s'

HEX0	.BYTE %10111111,%10101110,%10111111,%10111111,%10111011,%10111111,%10111111,%10111111,%10111111,%10111111,%10111111,%10111111,%10111111,%10111110,%10111111,%10111111 
HEX1	.BYTE %10111011,%10111110,%10101011,%10101011,%10111011,%10111010,%10111010,%10101011,%10111011,%10111011,%10111011,%10111011,%10111010,%10111011,%10111010,%10111010 
HEX2	.BYTE %10111011,%10101110,%10111111,%10111111,%10111111,%10111111,%10111111,%10101011,%10111111,%10111111,%10111111,%10111110,%10111010,%10111011,%10111111,%10111111
HEX3	.BYTE %10111011,%10101110,%10111010,%10101011,%10101011,%10101011,%10111011,%10101011,%10111011,%10101011,%10111011,%10111011,%10111010,%10111011,%10111010,%10111010
HEX4	.BYTE %10111111,%10111111,%10111111,%10111111,%10101011,%10111111,%10111111,%10101011,%10111111,%10111111,%10111011,%10111111,%10111111,%10111110,%10111111,%10111010
 
.ALIGN $3000
SCR_0	       	
SCR_1	EQU	SCR_0 + 4096
