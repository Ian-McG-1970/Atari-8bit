;Bruce Lee - (c) 1984 Datasoft - By Ron J Fortier

;Coverted from ATX to XEX - By UTE
 
;Must use MADS(2.0.4 b7)or later 

;Program starts at $8000

ICDNO       = $0001
ICAX1       = $000A
DOSVEC      = $000A
DOSINI      = $000C
RTCLOK      = $0012
BUFADR      = $0015
ICCOMT      = $0017
DSKFMS      = $0018
DSKUTL      = $001A
ABUFPT      = $001C
ICSTAZ      = $0023			;
ICBALZ      = $0024			;
ICBAHZ      = $0025			;

LIVES       = $0026			;Number of Lives for Bruce
SCRNMBR     = $0027			;Current Screen Number

ICBLLZ      = $0028			;Lamp count for screen 0
ICBLHZ      = $0029			;Lamp count for screen 1
ICAX1Z      = $002A			;Lamp count for screen 2
ICAX2Z      = $002B			;Lamp count for screen 3
ICAX5Z      = $002E			;Lamp count for screen 6
ICAX6Z      = $002F
STATUS      = $0030
CHKSUM      = $0031
BFENLO      = $0034
LTEMP       = $0036
BUFRFL      = $0038
NOCKSM      = $003C
BPTR        = $003D
FTYPE       = $003E
FEOF        = $003F
CRITIC      = $0042
FMSZPG      = $0043
;$48 = saved keyboard keycode
;$49 = Current player size
ZCHAIN      = $004A
;$4B temporary storage?
DSTAT       = $004C			;Index of current player.(Bruce, Ninja, Yamo)
ATRACT      = $004D			;

DRKMSK      = $004E			;Possibly Collision Detection info????
COLRSH      = $004F
TEMP        = $0050
HOLD1       = $0051
LMARGN      = $0052			;Column of current lamp collision
RMARGN      = $0053			;Row of current lamp collision
ROWCRS      = $0054
COLCRS      = $0055
;$56 = Ninja Count down timer until spawn
DINDEX      = $0057			;Yamo Count down timer until spawn

SAVMSC      = $0058
OLDROW      = $005A			;Lowest player vertical position
OLDCOL      = $005B
OLDCHR      = $005D
OLDADR      = $005E
PALNTS      = $0062
LOGCOL      = $0063
ADRESS      = $0064			;Player 0 to Player collision status
MLTTMP      = $0066			;$64 - $67 Player to player collision info
SAVADR      = $0068			;Missile to Player collision status
RAMTOP      = $006A
BUFCNT      = $006B
BUFSTR      = $006C
BITMSK      = $006E
SHFAMT      = $006F
ROWAC       = $0070
COLAC       = $0072
ENDPT       = $0074
DELTAR      = $0076
DELTAC      = $0077
KEYDEF      = $0079			;Stores the four different character set addresses
SWPFLG      = $007B
HOLDCH      = $007C
INSDAT      = $007D
COUNTR      = $007E
LOMEM       = $0080
VDSLST      = $0200
VIMIRQ      = $0216
VVBLKI      = $0222
SDLSTL      = $0230
SDLSTH      = $0231
SSKCTL      = $0232
COLDST      = $0244
PCOLR0      = $02C0
COLOR0      = $02C4
MEMLO       = $02E7
CRSINH      = $02F0
KEYDEL      = $02F1
CHBAS       = $02F4
NEWCOL      = $02F6
CH          = $02FC
IOCB0       = $0340
IOCB2       = $0360
BASICF      = $03F8
M0PF        = $D000
HPOSP0      = $D000
M1PF        = $D001
M2PF        = $D002
HPOSP2      = $D002
M3PF        = $D003
P0PF        = $D004
HPOSM0      = $D004
P1PF        = $D005
P2PF        = $D006
P3PF        = $D007
SIZEP0      = $D008
SIZEP2      = $D00A
SIZEP3      = $D00B
P0PL        = $D00C
TRIG0       = $D010
TRIG1       = $D011
COLPM0      = $D012
COLPM2      = $D014
COLPF0      = $D016
COLPF1      = $D017
COLPF2      = $D018
COLPF3      = $D019
COLBK       = $D01A
PRIOR       = $D01B
GRACTL      = $D01D
HITCLR      = $D01E
CONSOL      = $D01F
AUDF1       = $D200
AUDC1       = $D201
AUDCTL      = $D208
KBCODE      = $D209
RANDOM      = $D20A
POTGO       = $D20B
IRQEN       = $D20E
SKSTAT      = $D20F
SKCTL       = $D20F
PORTA       = $D300
PORTB       = $D301
PBCTL       = $D303
DMACLT      = $D400
DLISTL      = $D402
DLISTH      = $D403
VSCROL      = $D405
PMBASE      = $D407
CHBASE      = $D409
WSYNC       = $D40A
VCOUNT      = $D40B
NMIEN       = $D40E
SETVBV      = $E45C
XITVBV      = $E462
WARMSV      = $E474

L0082       = $0082
L0083       = $0083
L0084       = $0084

L0085       = $0085			;Something to do with Ninja or Yamo???

L0086       = $0086
L0087       = $0087
L0088       = $0088
L0089       = $0089

L008B       = $008B			;Location where Ninja and Yamo Hit Points are copied to

L008E       = $008E

L0092       = $0092			;Store some kind of status for Bruce, Yamo, and Ninja, Possibly which frame to draw??? Or alive or dead?

L0093       = $0093			;$92 = Bruce, $93 = Yamo, $94 = Ninja

L0095       = $0095			;Stores the current Joystick Direction

L0096       = $0096			;This may store the current joystick direction	Player 2????

L0098       = $0098			;This stores the status of the joystick button

L0099       = $0099			;This may store the status of the joystick button Player 2???

L009B       = $009B			;This is Bruce's horizontal position
L009E       = $009E			;This is Bruce's Vertical position
L009F       = $009F			;This is Yamo's Vertical position - $9C is Yamo's Horizontal position
					;$A0 is Ninja's Vertical position and $9D is Ninja's Horizontal position
L00A1       = $00A1
L00A4       = $00A4

L00A7       = $00A7			;Stores Player 0 to Playfield collsion status
L00A8       = $00A8			;Stores Player 3 to Playfield collison status
L00A9       = $00A9			;Missile 0-3 Playefield collision status

L00AA       = $00AA
L00AD       = $00AD
L00B0       = $00B0
L00B1       = $00B1
L00B2       = $00B2

L00B3       = $00B3			;Possibly stores Player to Player collision
L00B4       = $00B4
L00B6       = $00B6			;Player 0 and 1 Logical OR'ed then AND'ed with #$0F and saved here
L00B7       = $00B7			;Same as above P2 and P3.
L00B8       = $00B8			;Same as above except about Ninja.
L00B9       = $00B9			;Bruce horizontal position
L00BC       = $00BC			;Bruce temporary vertical position????
L00BF       = $00BF			;BF, C0, and C1 may store collision information - not sure???
L00C2       = $00C2
L00C5       = $00C5
L00C8       = $00C8
L00CB       = $00CB
L00CD		= $00CD
L00CE       = $00CE
L00CF		= $00CF
L00D0		= $00D0
L00D1       = $00D1			;????

BRUCEHP     = $00D4			;Bruce hit points - Starts with $24(36 Dec)
YAMOHP      = $00D5			;Yamo's hit points - initialized to $14(20)
NINJAHP     = $00D6			;Ninja's hit points - initialized to $07

L00D7       = $00D7
L00D8		= $00D8
L00DA       = $00DA
L00DD       = $00DD
L00DF		= $00DF
L00E0       = $00E0
L00E3       = $00E3			;Number of lines to draw for current sprite
;E5, E4, E3 is sprite height
L00E6       = $00E6			;Second player offset
L00E9       = $00E9
L00EC       = $00EC			;Current lamp row
L00EF       = $00EF			;Current Player/Missile memory offset calculate high byte
;$EF, $F0, $F1	same as above			
L00F2       = $00F2			;Used with an index to compute current player size and color, or offset for memory area????
;$F3, $F4 used to calculate second player where Bruce and Yamo use two Player/Missile location each
L00F5       = $00F5			;Random value stored here
L00F6       = $00F6			;Random value stored here	
L00F7       = $00F7			;Random value stored here
L00F8       = $00F8			;Player on screen status
L00F9       = $00F9			;Game paused status. %1xxxxxxx = paused, %0xxxxxxx = game running
L00FA       = $00FA			;????
L0100       = $0100
L0101       = $0101
L0103       = $0103
L0105       = $0105
L0109       = $0109
L010A       = $010A
L010B       = $010B
L010C       = $010C
L010E       = $010E
L010F       = $010F
L0110       = $0110
L0111       = $0111
L0112       = $0112
L0114       = $0114
L0115       = $0115
L0116       = $0116
L0117       = $0117
L0118       = $0118
L0119       = $0119
L011A       = $011A
L011B       = $011B
L011C       = $011C
L011E       = $011E
L011F       = $011F
L0120       = $0120
L0122       = $0122
L0123       = $0123
L0124       = $0124
L0125       = $0125
L0126       = $0126
L0128       = $0128
L0129       = $0129
L012A       = $012A
L012C       = $012C
L012D       = $012D
L012E       = $012E
L012F       = $012F
L0130       = $0130
L0132       = $0132
L0133       = $0133
L0134       = $0134
L0136       = $0136
L0137       = $0137
L0138       = $0138
L0139       = $0139
L013A       = $013A
L013C       = $013C

DLCOLOR     = $0144			;Display list color changes
L0145       = $0145			;Current display list color	
L0146       = $0146			;Current display list color	
L0147       = $0147			;Current display list color	
L0148       = $0148			;Current display list color	

L014B       = $014B			;Current display list color	- Maybe
L014D       = $014D			;Current display list color	- Maybe
L0158       = $0158			;Display list colors for current screen
L09B9       = $09B9			;$44 plus current screen number
L09BA       = $09BA			;$0D plus carry if set
L09E9       = $09E9
L09EA       = $09EA
L0FD0       = $0FD0
L1F73       = $1F73			;Low Address to read sprites from
L1F74       = $1F74			;High Address to read sprites from
L1F76       = $1F76			;Player Vertical position
L1F77       = $1F77
L1F7F       = $1F7F			;Player Vertical position
L1F80       = $1F80
L2102       = $2102
L2117       = $2117
L2118       = $2118
L2203       = $2203
L236F       = $236F
L2393       = $2393
L2399       = $2399
L239F       = $239F
L24E7       = $24E7
L251C       = $251C
L251D       = $251D
L25E6       = $25E6
L2601       = $2601
L2B10       = $2B10
L2C2C       = $2C2C
;$3A0E stores number of lives

;$7800 = Player Missile memory area PMBASE - Single Line Resolution
L7881       = $7881			;
L7884       = $7884			;
L7887       = $7887			;
L788A       = $788A			;
L788D       = $788D			;
L7896       = $7896			;
L789C       = $789C			;
L789E       = $789E			;
L789F       = $789F			;
L78A1       = $78A1			;
L78A2       = $78A2			;
L78A4       = $78A4			;
L78A6       = $78A6			;
L78D1       = $78D1			;
L78DB       = $78DB			;
L78FE       = $78FE			;
L7900       = $7900			;Start of screen memory
L7914       = $7914			;
L7B00       = $7B00			;Missile 1-4
L7C00       = $7C00			;Player 1
L7C1C       = $7C1C			;	
L7C44       = $7C44			;
L7D00       = $7D00			;Player 2
L7E00       = $7E00			;Player 3
L7F00       = $7F00			;Player 4

L80A5       = $80A5			;
L8C3C       = $8C3C			;
LA540       = $A540			;
LD500       = $D500			;
LE000       = $E000			;
LFFFB       = $FFFB			;Usually vectors for NMI, Reset, IRQ, etc.???

            org $0400
            
GameOn:     lda #$00		;Main body of the program after loading screens
            pha			;
            plp			;
            lda #$17		;
            sta DOSINI		;
            lda #$04		;
            sta DOSINI+1	;this will jump to the 'rts' and give control back to the OS
            lda #$18		;
            sta DOSVEC		;
            lda #$04		;
            sta DOSVEC+1	;
            jmp WARMSV		;Start a warm boot - Then go to DOSVEC
            rts			;DOSINI points here
            
L0418:      sei			;Program jumps here after warm boot - DOSVEC points here
            ldx #$00		;
            stx NMIEN		;Disable NMI's
            dex			;X = $FF
            txs			;Stack = $FF
            jsr L0B5C		;Writes 0 to $7800 - $78A5, $12 - $F5, $86, $87. Writes 1 to $13C - $143, $F5 - $FC
				;Writes 0 to $D200 - $D208(AUDF1,AUDC1 - AUDF4,AUDC4), $8E - $91 - Other initializations
            jsr L0568		;Clears memory $7B00 - $7FFF, AUDCTL, $88, $89, and more initalizations
            jmp L046D		;Jump to main body of program

;Jumps here when timer runs out - Demo mode			
DemoMode:   sei			;
            ldx #$00		;
            stx NMIEN		;Disable NMI's
            dex			;
            txs			;Stack = $FF(Top)
            jsr L0B5C		;Clears PM memory, clears sound registers, 4 lives for Bruce, Yin-Yang value, etc
            jsr L0568		;Game screen and audio initalizations. 		
            lsr L00F8		;
            lda #$F7
            sta PORTB
            lda L398E
            sta L3990
            lda L398F
            sta L3991
            lda #$00
            sta L398F
            sta L398E
            jsr L06F3
            jsr L1E45		;Draw players, store player color, size
            lda #$00
            sta ICCOMT
            lda #$80
            sta DSKFMS
            lda #$3F
            sta DMACLT
            lda #$C0
            sta NMIEN
            jmp L1508

;This Displays the title screen until a button is pushed		
L046D:      lda #$F3			;
            sta PORTB			;
            jsr L1E34			;Clears audio again(AUD(C,F)1-4) and writes 0 to $8E - $91
            jsr L1F40			;Something to do with Bruce, Yamo, and Ninjas status.
            jsr L13A9			;Writes 0 to $78A9 - $7B19 using pointers($39D9 - $39F5) - Again
            jsr L0A91			;Puts title screen colors in play field registers. 
            lda #$08			;
            sta COLPM0			;Store 8 in player missile 0 - color of 'TM' on option screen
            lda #$A9			;
            sta HPOSP0			;Store $A9 in player horizontal position 0 - TM position
            ldx #$03			;
L048A:      lda L0AA6,X			;Moves 4 bytes - $EA, $4E, $4A, $4A
            sta L7C44,X			;to $7C44-$7C47 Player 1 memory area
            dex					;Used to display 'TM' after 'Bruce Lee' on title screen
            bpl L048A			;
            lda #$00			;
            sta NMIEN			;Disable NMI's
            lda #$1E			;
            sta DLISTL			;
            lda #$0F			;
            sta DLISTH			;Point to next display list $0F1E
            lda #$E1			;
            sta VVBLKI			;
            lda #$0F			;
            sta VVBLKI+1		;Point to Vertical Blank $0FE1
            lda #$40			;
            sta NMIEN			;Enable VBlank(bit 6) but not DLI's(Bit 7)
            lda #$62			;
            ldx #$00			;
            ldy #$00			;
            jsr L11E2			;This copies bytes to screen memory locations
            lda #$08			;It calculates what to display, two lines at a time
            ldx #$00			;It indexes into pointer table $3D3A based on A, X, and Y registers
            ldy #$18			;
            jsr L11E2			;More title screen Calculations
            lda #$09			;
            ldx #$00			;
            ldy #$2C			;
            jsr L11E2			;More title screen Calculations
            lda #$0A			;
            ldx #$00			;
            ldy #$30			;
            jsr L11E2			;More title screen Calculations
            lda #$4F			;
            ldx #$01			;
            ldy #$1C			;
            jsr L11E2			;More title screen Calculations
            lda #$50			;
            ldx #$02			;
            ldy #$16			;
            jsr L11E2			;More title screen Calculations
            lda #$51			;
            ldx #$03			;
            ldy #$1C			;
            jsr L11E2			;More title screen Calculations
            ldx #$09			;
L04F2:      lda L7900,X			;
            ora #$80			;Logical OR'ing characters with $80 will inverses them
            sta L7900,X			;This code makes '1 Player' and 'Computer' highlighted(Inverse characters)
            lda L7930,X			;
            ora #$80			;
            sta L7930,X			;
            dex				;
            bpl L04F2			;Inverse till line done
            lda L3990			;Grab initial value
            sta L398E			;0 here means 1 Player, 1 here means 2 Player
            lda L3991			;Grab initial value
            sta L398F			;0 here means Computer, 1 here means Opponent
            lda L398E			;Get 1P/2P statys
            beq L0519			;If 1P skip	JSR
            jsr FlipSel			;If 2P flip characters to inversre 
L0519:      lda L398F			;Get Comp/Opp status
            beq L0521			;If Computer skip JSR
            jsr L0AAA			;If Opp flip characters to inverse
L0521:      lda #$09			;
            sta FMSZPG+4		;$47
            lda #$60			;
            sta FMSZPG+3		;$46
            jsr TitleLoop		;Waits for keypress or button push. Updates screen.
;Start key or jostick button(s) were pressed
            lda #$00			;Start was pressed on title screen, execution continues here.
            sta HPOSP0			;Player 0 Horizontal Pos. = 0
            sta RTCLOK			;Reset counter
            lda L398E			;Get 1P/2P status
            sta L3990			;Store it 
            lda L398F			;Get Computer/Opponent Status
            sta L3991			;Store it
            jsr L0B05			;Sets up the Display list, DLI, VBI, and displays the 'PLAYER 1' screen 
            sei					;
            ldx #$00			;
            stx NMIEN			;Turn off DLI, VBI, Reset
            dex					;
            txs					;Stack = $FF(Top)
            jsr L0B5C			;Clears PM memory, clears sound registers, 4 lives for Bruce, Yin-Yang value, etc
            jsr L0568			;Game screen and audio initalizations. See Below
            jsr L06F3			;Displays current screen
            lda #$00			;
            sta ICCOMT			;????
            lda #$80			;
            sta DSKFMS			;????
            lda #$3F			;
            sta DMACLT			;Enable DMA - But it's already enabled
            lda #$C0			;
            sta NMIEN			;Enable VBI, DLI
            jmp L1508			;Jump to main game loop
			
;Writes 0's to memory, sets up DLI, VBI, AUDIO, Draws Lives/Score Line
L0568:      lda #$00			;
            tax					;Clear player missile memory
L056B:      sta L7C00,X			;$7B00 - $7FFF = 0
            sta L7D00,X			;
            sta L7E00,X			;
            sta L7F00,X			;
            sta L7B00,X			;
            inx					;
            bne L056B			;
            sta AUDCTL			;Initialize AUDCTL
            sta L0088			;
            sta L0089			;
            lda #$3C			;
            sta PBCTL			;
            lda #$FF			;
            sta PORTB			;
            jsr L0614			;This subroutine sets up a Disp. List, DLI, VBI, PMBASE, CHBASE, and Enables IRQ's
            lda #$03			;
            sta SKCTL			;Enable Regular Audio
            sta GRACTL			;Turn on Players amd Missiles
            lda #$11			;
            sta PRIOR			;Set player priority and Enable Fifth Player
            lda #$FF			;
            sta FMSZPG+5		;Key code - $FF = None
            lda #$04			;
            sta COLCRS			;Used to test bit 3 of SKSTAT for new Keypress
            jsr L066B			;Set playfield colors
            ldy #$78			;
            lda #$A9			;
            jsr L064C			;Computes pointer addresses($78A9 - $7B19) and stores them at $39D9 - $39F5
            jsr L13A9			;Writes 0 to $78A9 - $7B19 using pointers($39D9 - $39F5). Memory locations for the Score/lives line
            lda #$80			;
            ldx #$03			;
L05B7:      sta L78A5,X			;Store $80 to $78A5 - $78A8 - Black spaces before Score line
            dex					;$80 tells display routine when to stop copying screen data
            bpl L05B7			;
            ldx #$07			;
L05BF:      sta L78D1,X			;Store $80 to $78D1 - $78D8
            dex					;
            bpl L05BF			;
            ldx #$03			;
L05C7:      sta L7901,X			;Store $80 to $7901 - $7904
            dex					;
            bpl L05C7			;
            jsr L28FC			;Computes player score and displays it on screen
            jsr L2948			;Display High score value on screen
            lda #$11			;Value used for '1UP' Flashing delay
            sta L3A2C			;Store it here
            jsr L13CC			;Draws '1UP' to screen
            jsr L140B			;Draw 'TOP' to screen
            jsr L1414			;Draw 'FALLS' to screen
            jsr L141D			;Computes LIVES packed bytes and stores in screen memory
            lda #$01			;
            sta OLDCOL			;?????
            sta LOGCOL			;?????
            ldx #$04			;
            lda #$FF			;
L05EE:      sta L7801,X			;Loop and store $FF at $7804, $7803, $7802, $7801
            dex					;
            bpl L05EE			;
            ldx #$00			;
            lda #$00			;
            jsr L0885			;Spawn a player
            jsr L0876			;?????
            lda #$40			;
            sta NMIEN			;Turn off DLI but leave VBI on
L0603:      lda VCOUNT			;-------------------------------------
            cmp #$08			;Wait until screen beam is in between
            bcc L0603			;Line 8 and line $50 before enabling
            cmp #$50			;DMA
            bcs L0603			;
            lda #$3F			;
            sta DMACLT			;--------------------------------------
            rts
			
;This subroutine sets up a Disp. List, DLI, VBI, PMBASE, CHBASE, and Disables IRQ's
L0614:      lda #<L0F6E_DLI1 	; #$6E			;
            sta VDSLST			;
            lda #>L0F6E_DLI1 	; #$0F			;
            sta VDSLST+1		;Display list interrupt routine @ $0F6E
            lda #$0A			;
            sta VVBLKI			;
            lda #$10			;
            sta VVBLKI+1		;Stage 1 VBLANK address at $100A
            lda #$60			;
            sta VIMIRQ			;
            lda #$0F			;
            sta VIMIRQ+1		;Immediate IRQ vector handler - $0F60 
            lda #$F1			;
            sta DLISTL			;
            lda #$0E			;
            sta DLISTH			;Display list @ $0EF1
            lda #$00			;
            sta IRQEN			;IRQEN - Turn off all IRQ's
            lda #$E0			;
            sta CHBASE			;$E000 = Character set address
            lda #$78			;
            sta PMBASE			;$7800 = Player Missile Memory
            rts
			
;This routine Computes Data pointer addresses and stores them at $39D9 - $39F5 - This code could be deleted
;and the values just placed in memory when the program loads.
;It uses these addresses to compute other values for the start screen.
L064C:      ldx #$00			;
            sta L39D9			;
            sty L39E8			;
L0654:      lda L39D9,X			;
            clc					;
            adc #$30			;Compute Low byte
            sta L39DA,X			;
            lda L39E8,X			;
            adc #$00			;Compute High byte
            sta L39E9,X			;
            inx					;
            cpx #$0D			;
            bcc L0654			;
            rts

;This routine sets colors for the Playfield and background from data area		
L066B:      ldx #$04			;Loop 4 times
L066D:      lda L3E6A,X			;Data area
            sta COLPF0,X		;Playfield area($D016-$D01A)
            dex					;
            bpl L066D			;Loop 4 times
            rts					;

;Start of title screen loop			
TitleLoop:  lda FMSZPG+3		;Load timer
            ora FMSZPG+4		;Test with other timer value. 
            bne TitleBtn		;Branch to wait for a keypress
            jmp DemoMode		;Otherwise if ~30 seconds pass, start demo????

;Title Screen loop waiting for button press				
TitleBtn:   lda CONSOL			;Load CONSOL to test for button press
            lsr					;
            bcc L0694			;Start button pressed
            lsr					;
            bcc L06A0			;Select button pressed
            lsr					;
            bcc L06C4			;Option button pressed
            lda TRIG0			;A = Joystick 0 button status	
            and TRIG1			;Logical AND with Joystick 1 button status - If either are pressed jsr L06E3
            bne TitleLoop		;If neither button is pressed then loop again
L0694:      jsr L06E3			;Tests for console button pushes
            lda #$10			;------------------
            sta FMSZPG+2		;
L069B:      lda FMSZPG+2		;Wait $10 VBI
            bne L069B			;------------------
            rts					

;Toggles title screen			
L06A0:      lda L398F			;Load value
            eor #$01			;Toggle Value
            sta L398F			;Store value
            sta L3991			;
            jsr L0AAA			;Flips between 'COMPUTER - OPPONENT'	
            jsr L06E3			;Tests for console button pushes
            lda #$09			;-----------------------------------
            sta FMSZPG+4		;Reset 'Demo Mode'
            lda #$60			;Timer values
            sta FMSZPG+3		;-----------------------------------
            lda #$04			;Wait 4 VBI
            sta FMSZPG+2		;
L06BD:      lda FMSZPG+2		;
            bne L06BD			;Loop
            jmp TitleLoop

;Toggles title screen				
L06C4:      lda L398E			;Load value
            eor #$01			;Toggle Value
            sta L398E			;Store value
            sta L3990			;
            jsr FlipSel			;Flips between '1 PLAYER - 2 PLAYERS'
            jsr L06E3			;Tests for console button pushes
            lda #$09			;-----------------------------------
            sta FMSZPG+4		;Reset 'Demo Mode'
            lda #$60			;Timer values
            sta FMSZPG+3		;-----------------------------------
            lda #$04			;Wait 4 VBI
            sta FMSZPG+2		;
            bne L06BD			;Loop
L06E3:      lda CONSOL			;Get console button status
            cmp #$07			;7 = no buttons pushed
            bne L06E3			;Wait for button release
            lda TRIG0			;Test both joystick buttons
            and TRIG1			;for a press
            beq L06E3			;-----------------------
            rts

;Protection routine - Crashes computer if value != 0			
L06F3:      ldx #$1A			;Index
            lda KEYDEL,X		;
            ora CRSINH,X		;
            ora MEMLO,X			;
            beq L0705			;Continue with program if equal
            ldx RANDOM			;X = random
            txs					;S = random
            rti					;Return to random - Intentional Crash

;Continue with program execution			
L0705:      lda #$20			;
            sta L0EF4			;????
            sta L0EF5			;????
            lda #$10			;
            sta L0EF6			;????
            jsr L38FF			;????
            jsr L1E34			;Writes 0 to $D200 - $D208(AUDC1,AUDF1 - AUDC4,AUDF4) and $8E - $91.
            lda SCRNMBR			;Load current screen number
            cmp #$0B			;Is it screen 11?
            bne L072B			;Branch if not screen 11
            lda BFENLO			;
            ora LTEMP			;
            ora BUFRFL			;
            bne L072B			;
            ldx #$0D			;
            jmp L299B			;

;This routine is called when Bruce changes screens. All values are computed from a table using the screen number as an index.			
L072B:      lda SCRNMBR			;
            asl					;
            adc RTCLOK			;
            tax					;
            lda IOCB0,X			;
            beq L0747			;	
            lsr IOCB0,X
            lda #$07
            ldx #$01
            jsr L2917
            lda #$D0
            ldx #$02
            jsr L2917
L0747:      ldx SCRNMBR
            lda L0F38,X
            sta SAVMSC
            lda L0F4C,X
            sta SAVMSC+1
            lda L3F17,X
            sta KEYDEF
            lda #$00
            ldy #$83
L075C:      sta L7815,Y
            dey
            bpl L075C
            sta L0084
            sta L0085
            sta PALNTS
            lda #$07
            sta L39C2
            lda L4095,X
            sta DELTAC
            beq L077A
            lda #$00
            sta L0088
            sta L0089
L077A:      lda L0CF4,X
            sta COLCRS+1
            lda L0D30,X
            sta DINDEX
            lda FTYPE
            beq L078E
            lda #$03
            sta COLCRS+1
            sta DINDEX
L078E:      lda L398F
            beq L0797
            lda #$08
            sta DINDEX
L0797:      lda #$01
            sta L00B6
            lda #$04
            sta L00D1
            lda #$00
            sta L789C
            sta L789D
            sta L789E
            sta L00C2
            sta L00FA
            tax
L07AF:      lda #$05				;-----------------------
            ror SAVMSC+1			;
            ror SAVMSC				;Computes part of 
            bcc L07B9				;Display list and
            ora #$80				;Stores it					
L07B9:      sta L0EFC,X				;With this line
            inx						;
            cpx #$0B				;
            bcc L07AF				;-----------------------
            lda SCRNMBR
            asl
            tax
            lda L3E8B,X				;-----------------------
            sta BUFADR				;Computes color address?
            lda L3E8C,X				;
            sta BUFADR+1			;
            ldy #$13				;
L07D1:      lda (BUFADR),Y			;
            sta DLCOLOR,Y			;$144-$157
            dey						;
            bpl L07D1				;-----------------------
            ldx SCRNMBR
            lda L3F2B,X
            sta BUFADR
            lda L3F40,X
            sta BUFADR+1
            ldx #$02
            jsr L13B7				;This subroutine moves low and high byte to $13, $14 (RTCLOK+1, RTCLOK+2)
            lda RTCLOK+1
            sec
            sbc #$04
            sta RTCLOK+1
            lda RTCLOK+2
            sbc #$00
            sta RTCLOK+2
            ldy #$00
            jsr L0844
L07FC:      lda (BUFADR),Y			;Load buffer 
            bpl L081A				;
            and #$7F				;
            beq L0830				;Branch when done
            tax
            jsr L083D
L0808:      lda (BUFADR),Y
            sta (RTCLOK+1),Y		;Stores screen based on computed values
            jsr L0836				;Increments next address for storage
            jsr L083D				;Increments next buffer address
            jsr L085A				;
            dex						;Count down line position
            bne L0808
            beq L07FC
L081A:      tax
            jsr L083D				;Increments next buffer address
            lda (BUFADR),Y
            jsr L083D				;Increments next buffer address
L0823:      sta (RTCLOK+1),Y
            jsr L0836
            jsr L085A
            dex
            bne L0823
            beq L07FC				;Loop until done loading screen
L0830:      jsr L2ACA				;Finished with loop will jump here
            jmp L318F				;Returns to an address based on screen number
			
;Increments next address for storage			
L0836:      inc RTCLOK+1
            bne L083C
            inc RTCLOK+2
L083C:      rts

;Increments next buffer address
L083D:      inc BUFADR
            bne L0843
            inc BUFADR+1
L0843:      rts

;Stores 4 black blocks at the beginning of each screen line
L0844:      jsr L0868				;Temporarily stores values
            ldx #$03				;Number of black boxes
            lda #$86				;Black box index number
L084B:      sta (RTCLOK+1),Y		;Store black block at address
            jsr L0836				;Increments next address for storage
            dex						;
            bpl L084B				;Loop 4 times
            lda #$27				;
            sta FMSZPG+6			;Address $49 = $27 - Number of columns per line
            jmp L086F				;Loads temporary stored values

;Store black boxes at end of screen			
L085A:      sta LFFFB				;
            dec FMSZPG+6			;Decrement $49
            bpl L0867				;Skip if haven't reached the end of the current line
            jsr L0844				;Store 4 black boxes at current position
            jsr L0844				;Store 4 black boxes at current position
L0867:      rts

;Temporary stores values
L0868:      sta COLRSH
            stx TEMP
            sty HOLD1
            rts

;Loads temporary stored values above			
L086F:      ldy HOLD1
            ldx TEMP
            lda COLRSH
            rts

;			
L0876:      lda RTCLOK
            clc
            adc #$01
            eor #$03
            asl
            asl
            ora #$F3
            sta PORTB
            rts
			
;Spawn a player based on index
L0885:      ora #$01			;Switch on player alive bit
            sta L0092,X			;Store it in player status
            rol					;
            rol					;
            rol					;
            and #$03			;
            tay					;
            sty ATRACT			;
            lda L42D2,Y			;
            sta L00EF,X			;
            jsr L0A84			;
            ldy ATRACT			;
            lda L42D5,Y			;
            sta L00F2,X			;Current player missile memory high byte
            beq L08A5			;
            jsr L0A84			;
L08A5:      ldy ATRACT			;
            lda #$00			;
            sta L00C2,X			;
            sta L00D1,X			;
            sta L00FA,X			;
            lda #$0F			;
            sta L0095,X			;Direction of Joystick - $0F = neutral
            lda #$01			;
            sta L0098,X			;Status of Joystick button - 1 = not pressed
            lda #$01			;
            sta L00B6,X			;
            lda #$01			;
            sta L00A1,X			;
            lda #$02			;
            sta L7806,X			;
            sta L780C,X			;
            lda #$03			;
            sta L7809,X			;
            sta L780F,X			;
            lda #$24			;
            sta BRUCEHP,X		;Reset player hit points
            stx DSTAT			;Index of current player
            lda L00F8			;Player on screen status
            beq L08DC			;Branch if not on screen
            txa					;player index -> A
            bne L08ED			;Branch if not Bruce
L08DC:      ldx SCRNMBR			;Load screen number
            lda L3FB9,X			;Load player vertical position
            tay					;Store vertical 
            lda L3FA5,X			;Load horizontal spawn location	
L08E5:      ldx DSTAT			;Index of current player
            sta L009B,X			;Store player horizontal position
            tya					;get vertical pos
            sta L009E,X			;Store player vertical position
            rts

;Process player spawn who is not Bruce			
L08ED:      lda L0087,X			;
            bne L0932			;Non existant player????
            cpx #$01			;Is player Yamo
            bne L091D			;Branch if Ninja
            ldx SCRNMBR			;Load screen number
            lda L0D58,X			;load value based on screen number
            beq L090A			;Branch if 0
            lda RANDOM			;Load a random number
            cmp #$C0			;Compare with $C0
            bcs L090A			;Branch if greater than $C0
            lda L0D58,X			;Load value based on screen number
            bpl L08DC			;Branch if positive
            bmi L0911			;Branch if negative
L090A:      lda RANDOM			;Load a random value
            and #$01			;Mask of lowest bit
            beq L08DC			;Branch if lowest bit is 0
L0911:      ldx SCRNMBR			;load screen number
            lda L3FE1,X			;Load vertical spawn location
            tay					;Store vertical
            lda L3FCD,X			;Load horizontal spawn location	
            jmp L08E5			;

;Process Ninja spawn			
L091D:      ldx SCRNMBR			;load screen number
            lda L0D1C,X			;Load value based on screen number
            beq L090A			;Branch if 0
            lda RANDOM			;Load a random number
            cmp #$C0			;Compare with $C0
            bcs L090A			;Branch if greater than $C0
            lda L0D58,X			;Load value based on screen number
            bpl L08DC			;Branch if positive
            bmi L0911			;Branch if negative
L0932:      sta L009B,X			;Store player horizontal position
            lda L0089,X			;
            sta L009E,X			;Store player vertical position
            lda L008B,X			;
            sta BRUCEHP,X		;Store player hit points
            lda #$00			;
            sta L0087,X			;Player existance????
            rts

;Spawn Yamo		
L0941:      jsr L0CB2			;Play spawn sound
            ldx #$01			;Player index
            lda #$80			;Player ID (%1000xxxx = Yamo, %0100xxxx = Ninja)
            jsr L0885			;Process player spawn variables
            lda #$10			;
            sta L00C2,X			;
            lda #$2A			;
            sta L7806,X			;
            lda #$2B			;
            sta L7809,X			;
            lda #$6C			;
            sta L780C,X			;
            lda #$6D			;
            sta L780F,X			;
            lda #$0A			;
            sta L00D1,X			;
            lda BRUCEHP,X		;Load Yamo hit points
            cmp #$14			;Is it $14
            bcc L0971			;Branch if $14
            lda #$14			;Else load $14
            sta BRUCEHP,X		;Store Yamo hit points
L0971:      rts

;Test spawn timer for Yamo
L0972:      lda DINDEX			;Yamo spawn timer
            bne L099F			;If not zero yet return
            ldx #$01			;1 = Yamo index
            lda L0092,X			;Load alive status
            and #$01			;Mask off alive bit
            bne L099F			;Branch if alive already
            jsr L0941			;Create a new Yamo????
            ldx SCRNMBR			;Load screen number
            lda L0D44,X			;Screen number as index
            sta DINDEX			;Store in Yamo spawn timer
            lda L398F			;Compute/Opponent status
            beq L0991			;Branch if computer controls Yamo
            lda #$30			;If opponent controls Yamo 
            sta DINDEX			;set shorter spawn time
L0991:      jsr L0CCD			;Check to see if room timer expired, set overflow flag if so	
            bvs L09A0			;Sets very small delay for Yamo respawn	
            bcs L099D			;Divide spawn timer by 2 if Carry is set	
            lda FTYPE			;????
            bne L09A0			;Set small respawn timer if FTYPE???? != 0
            rts

;Divide Yamo spawn timer by 2			
L099D:      lsr DINDEX
L099F:      rts

;Sets very small delay for Yamo respawn	
L09A0:      lda #$03			;
            sta DINDEX			;
            rts

;Yamo died 			
L09A5:      cpx #$01			;Is Yamo?
            bne L09D5			;Branch if not Yamo
L09A9:      lda #$44			;
            clc					;
            adc SCRNMBR			;Add $44 to screen number
            sta L09B9			;store in low byte
            lda #$0D			;
            adc #$00			;Add carry flag to $0D
            sta L09BA			;Store in high byte
            lda LE000			;Gets address from 09BA(H),09B9(L)
            sta DINDEX			;Delay value for Yamo respawn
            lda L398F			;Computer/Opponent status
            beq L09C6			;Branch if Computer controls Yamo
            lda #$30			;
            sta DINDEX			;Countdown timer = $30 if Opponent controls Yamo
L09C6:      jsr L0CCD			;Check to see if room timer expired, set overflow flag if so
            bvs L09A0			;Set small respawn timer if room time expired
            bcs L09D2			;Divide spawn timer by 2 if Carry is set
            lda FTYPE			;????
            bne L09A0			;Set small respawn timer if FTYPE???? != 0
            rts

;Divide Yamo spawn timer by 2				
L09D2:      lsr DINDEX			;DINDEX/2
            rts

;Ninja died			
L09D5:      cpx #$02			;Is it Ninja?
            bne L0A01			;Branch if not Ninja
L09D9:      lda #$08			;
            clc					;
            adc SCRNMBR			;8 + Screen number
            sta L09E9			;Store
            lda #$0D			;
            adc #$00			;Add carry flag
            sta L09EA			;
            lda LE000			;Gets address from 09E9(H),09EA(L)
            sta COLCRS+1		;$B0 - Reset spawn timer for Ninja
            jsr L0CCD			;Check to see if room timer expired, set overflow flag if so
            bvs L09FC			;Set small respawn timer if room time expired
            bcs L09F9			;Divide spawn timer by 2 if Carry is set
            lda FTYPE			;????
            bne L09FC			;Set small respawn timer if FTYPE???? != 0
            rts

;Divide Ninja spawn timer by 2			
L09F9:      lsr COLCRS+1		;COLCRS+1/2
            rts

;Sets very small delay for Yamo respawn			
L09FC:      lda #$03
            sta COLCRS+1
            rts

;Check if Yamo and Ninja have died			
L0A01:      jsr L09A9			;Check Yamo
            jmp L09D9			;Check Ninja

;Decremnt Ninja and Yamo spawn timers			
L0A07:      lda COLCRS+1		;Load spawn timer for Ninja
            beq L0A0D			;If already 0 then skip
            dec COLCRS+1		;Else decrement timer
L0A0D:      lda DINDEX			;Load spawn timer for Yamo
            beq L0A13			;If already 0 then skip
            dec DINDEX			;Else decrement timer
L0A13:      rts

;Test spawn timer for Ninja
L0A14:      lda COLCRS+1		;Load Ninja spawn timer
            bne L0A5A			;If not zero yet return
            lda L0093			;Load Yamo alive status
            and #$01			;Mask off alive bit
            beq L0A3A			;If Yamo alive Branch and spawn Ninja
            lda FTYPE			;If Yamo not alive load FTYPE????
            bne L0A3A			;If FTYPE != 0 spawn Ninja
            lda L398F			;Load Compute/Opponent status
            bne L0A3A			;Spawn Ninja if Opponent controlls Ninja
            jsr L0CCD			;Check to see if room timer expired, set overflow flag if so
            bvs L0A3A			;If room timer expired spawn Ninja
            bcs L0A3A			;Spawn Ninja if carry flag set
            lda RANDOM			;Load a random number
            cmp #$19			;Is it $19?
            bcc L0A3A			;Spawn ninja if so
            lda #$10			;Otherwise set Ninja spawn timer 
            sta COLCRS+1		;to a small amount
            rts
			
L0A3A:      ldx #$02			;2 = Ninja index
            lda L0092,X			;Load Ninja alive status
            and #$01			;Mask off alive status bit
            bne L0A5A			;If already exists return
            jsr L0A5B			;Spawn Ninja
            ldx SCRNMBR			;Screen number as index
            lda L0D08,X			;Load timer value based on screen number
            sta COLCRS+1		;Store timer value
            jsr L0CCD			;Check to see if room timer expired, set overflow flag if so
            bvs L09FC			;If room timer expired spawn Ninja
            bcs L0A58			;Divide spawn timer by 2 is carry set
            lda FTYPE			;Load FTYPE????
            bne L09FC			;Set small respawn timer if FTYPE???? != 0
            rts
			
L0A58:      lsr COLCRS+1		;Divide spawn timer by 2
L0A5A:      rts

;
L0A5B:      jsr L0CB2			;Store spawn sound in memory
            lda #$40			;
            jsr L0885
            lda #$82
            sta L780C,X
            lda #$00
            sta L7809,X
            sta L780F,X
            lda BRUCEHP,X		;Load Ninja hit points	
            cmp #$07			;Compare with 7
            bcc L0A7A			;Branch if 7
            lda #$07			;If not 
            sta BRUCEHP,X		;Store 7 in Ninja hit poinys
L0A7A:      lda #$10			;
            sta L00D1,X			;
            jsr L25D9			;
            jmp L2617			;
;			
L0A84:      sec
            sbc #$03
            tay
            lda L42D8,Y
            tay
            txa
            sta L7801,Y
            rts

;This routine loads colors in to the Playfield registers			
L0A91:      txa
            pha
            ldx #$04
L0A95:      lda L0AA1,X
            sta COLPF0,X
            dex
            bpl L0A95
            pla
            tax
            rts
            
L0AA1:      .byte $08,$0E,$80,$00,$80	;Five colors of title screen, and 'PLAYER 1','PLAYER 2' screens
L0AA6:      .byte $EA,$4E,$4A,$4A		;'TM' Displayed in Player memory on the title screen next to 'BRUCE LEE'

;Called by a Select Button press and flips text between normal and inverse characters 
;by XOR'ing(EOR) with #$80 to flip the high bit on or off. COMPUTER - OPPONENT
L0AAA:      ldx #$13				;Number of characters to process
L0AAC:      lda L7930,X				;Load a character
            cmp #$8D				;Is it a '-' character?
            beq L0AB8				;If it is skip it
            eor #$80				;Otherwise flip the inverse bit
            sta L7930,X				;Store it back in screen memory
L0AB8:      dex					;Process next character
            bpl L0AAC				;Until no more characters
            ldx #$30				;
            lda L398F				;Computer - Opponent status
            jmp L0AD9				;

;Called by an Option Button press. 1 PLAYER - 2 PLAYERS Same as above.			
FlipSel:    ldx #$13				;Number of characters to process
InvNxt:     lda L7900,X				;Load a character
            cmp #$8D				;Is it a '-' character?
            beq SkpDsh				;If it is skip it
            eor #$80				;Otherwise flip the inverse bit
            sta L7900,X				;Store it back in screen memory
SkpDsh:     dex					;Process next character
            bpl InvNxt				;Until no more characters
            ldx #$00				;
            lda L398E				;1 Player - 2 Player status
L0AD9:      bne L0AF0               		;0 = 1 Player, 1 = 2 Player                                                                                
            lda #$42				;
            sta L78FF,X				;--------------------------
            lda #$80				;displays correct characters 
            sta L7908,X				;on the title screen
            lda #$56				;Such as '-' and inverted
            sta L790A,X				;space character
            lda #$00				;
            sta L7914,X				;--------------------------
            rts
			
;This fixes the title screen so it displays the correct characters           
L0AF0:      lda #$00
            sta L78FF,X
            lda #$42
            sta L7908,X
            lda #$80
            sta L790A,X
            lda #$56
            sta L7914,X
            rts

;This subroutine sets up the Display list,DLI,VBI, and displays the 'PLAYER 1' screen            
L0B05:      lda #$00				;
            sta NMIEN				;Disable VBL,DLI, Reset button
            jsr L13A9				;Clears the screen
            jsr L1E34				;Clears the Audio registers(D200-D208)
            lda #$0A				;
            sta DLISTL				;
            lda #$0F				;
            sta DLISTH				;Display list = $0F0A
            lda #$E1				;
            sta VVBLKI				;
            lda #$0F				;
            sta VVBLKI+1			;Stage 1 VBlank = $0FE1
            lda #<L0FBF_DLI2		; #$BF				;
            sta VDSLST				;
            lda #>L0FBF_DLI2		; #$0F				;
            sta VDSLST+1			;Display list interrupt = $0FBF
            lda #$87				;
            sta L0F11				;L0F11 = $87 ---NOT SURE YET???
            lda #$C0				;
            sta NMIEN				;Enable DLI and VBI
            jsr L0A91				;Loads colors in to the Playfield registers
            lda #$52				;
            clc						;
            adc RTCLOK				;RTCLOK = $52 ---NOT SURE YET??? Used for addressing???
            ldx #$03				;
            ldy #$1C				;
            jsr L11E2				;Load 'PLAYER 1' data to screen memory
            lda #$40				;
            sta FMSZPG+2			;$0045 = $40
            lda L398E				;Load 1P/2P status
            beq L0B52				;Skip if 1 Player
            asl FMSZPG+2			;$0045 = $80 for two player status
L0B52:      lda FMSZPG+2			;Display for 2/3's of a second(NTSC)
            bne L0B52				;Loop until zero - Updated during Vblank
            lda #$07				;
            sta L0F11				;Store in memory ---NOT SURE YET???
            rts						;

;This subroutine copies Play-field graphics, clears sound registers, 4 lives for Bruce, Yin-Yang value, other aspects of game play		        
L0B5C:      lda #$00			;-----------------
            tax					;
L0B5F:      cpx #$E4			;
            bcs L0B65			;
            sta RTCLOK,X		;$12 - $F5 = 0
L0B65:      cpx #$A6			;
            bcs L0B6C			;
            sta L7800,X			;$7800 - $78A5 = 0 
L0B6C:      inx					;
            bne L0B5F			;
            sta L0086			;$86 = 0
            sta L0087			;$87 = 0
            ldx #$07			;
            lda #$01			;
L0B77:      sta L013C,X			;$13C - $143 = 1
            sta L00F5,X			;$F5 - $FC = 1
            dex					;
            bpl L0B77			;-----------------
            jsr L1E34			;Writes 0 to $D200 - $D208(AUDF1,AUDC1 - AUDF4,AUDC4), $8E - $91
            lda #$05
            sta L4278			;Number of extra lives on a latter level(Yin Yangs) = 5
            sta L4279			;$4379 = 5 - Back up????
            jsr L0CC2			;Moves Bytes from $40B1 - $40C4 to $28 - $3B
            ldx #$27			;----------------------
            lda #$01			;
L0B91:      sta IOCB0,X			;Store 1 to $340 - $367
            dex					;
            bpl L0B91			;----------------------
            lda #$00			;
            sta IOCB0			;Store 0 to $340, $341
            sta IOCB0+ICDNO		;----------------------
            jsr L2B17			;A checksum to make sure the code hasn't been modified
            jsr L0BCB			;Write 1 to $36A - $3CA
            lda #$04			;
            sta LIVES			;Lives = 4
            lda L398F			;Get Computer - Opponet status. 0 = Computer, 1 = Opponent
            beq L0BB2			;Branch if Yamo is controlled by computer
            lda #$09			;If player 2 controlls Yamo give Player 9 Lives	
            sta LIVES			;Lives = 9
L0BB2:      ldx #$02			;
L0BB4:      lda L39FA,X			;
            sta L3A01,X			;$3A01 = $00,$90,$40
            sta L3A04,X			;$3A04 = $00,$90,$40
            dex					;
            bpl L0BB4			;
            ldx #$1B			;
L0BC2:      lda LIVES,X			;Load $26 - $41
            sta L3A0E,X			;Store $3A0E - $3A29
            dex					;
            bpl L0BC2			;
            rts		

;Writes 1 to $36A - #3CA          
L0BCB:      lda #$01
            ldx #$60
L0BCF:      sta IOCB2+ICAX1,X
            dex
            bpl L0BCF
            rts
            
L0BD6:      lda #$6A
            sta RTCLOK+1
            lda #$03
            sta RTCLOK+2
            lda #$00
            sta ZCHAIN+1
L0BE2:      asl
            tax
            jsr L0BF0
            inc ZCHAIN+1
            lda ZCHAIN+1
            cmp #$14
            bcc L0BE2
            rts
			
L0BF0:      lda L40C5,X
            sta DSKFMS+1
            lda L40C6,X
            sta DSKUTL
            ldy #$00
L0BFC:      lda (DSKFMS+1),Y
            bmi L0C13
            pha
            lda (RTCLOK+1),Y
            tax
            pla
            sta (RTCLOK+1),Y
            txa
            sta (DSKFMS+1),Y
            jsr L319C
            jsr L0836
            jmp L0BFC		
L0C13:      rts

L0C14:      ldx #$13
L0C16:      lda DLCOLOR,X
            sta L0158,X
            dex
            bpl L0C16
            lda #$FE
            sta COUNTR+1
            lda #$00
            sta GRACTL
            lda #$33
            sta DMACLT
            rts
            
L0C2E:      ldx #$13
L0C30:      lda L0158,X
            sta DLCOLOR,X
            dex
            bpl L0C30
            lda #$00
            sta COUNTR+1
            lda #$03
            sta GRACTL
            lda #$3F
            sta DMACLT
            rts
            
L0C48:      ldx #$08
L0C4A:      lda L0100,X
            beq L0CAE
            txa
            pha
            lda L010A,X
            sta L011E,X
            sta BUFSTR+1
            lda L0114,X
            sta BUFSTR
            lda L0100,X
            bmi L0C8C
            dec L010A,X
            lda L010A,X
            cmp L0128,X
            bcs L0C74
            lda L0132,X
            sta L010A,X
L0C74:      sta BUFCNT
            lda BUFSTR
            cmp #$05
            beq L0C86
            cmp #$0A
            beq L0C86
            jsr L3736
            jmp L0CAC
			
L0C86:      jsr L374B
            jmp L0CAC
			
L0C8C:      inc L010A,X
            lda L010A,X
            cmp L0132,X
            bcc L0C9D
            lda L0128,X
            sta L010A,X
L0C9D:      sta BUFCNT
            lda BUFSTR
            cmp #$05
            beq L0C86
            cmp #$0A
            beq L0C86
            jsr L3736
L0CAC:      pla
            tax
L0CAE:      dex
            bpl L0C4A
            rts
 
;Sound for spawn Ninja/Yamo spawn
L0CB2:      pha
            txa
            pha
            tya
            pha
            ldy #$09			;Spawn sound
            jsr L1DB0			;Stores sound info in memory
            pla
            tay
            pla
            tax
            pla
            rts
            
;Writes lamp values from $40B1 - $40C4 to $28 - $3B
L0CC2:      ldx #$13			;
L0CC4:      lda L40B1,X			;
            sta ICBLLZ,X		;Writing lamp values 
            dex					;
            bpl L0CC4			;
            rts
 
;Check to see if room timer expired.(Makes Yamo and Ninja spawn instantly) 
L0CCD:      lda L0085			;Timer count updated during VBI
            cmp #$1C			;
            bcs L0CD7			;Reached count
            cmp #$15			;????
            clv					;Clears overflow bit
            rts

;Sets overflow bit when room and other timers expire			
L0CD7:      lda #$FF			;
            bit L0CDC			;Set overflow bit
L0CDC:      rts

L0CDD:      lda RTCLOK
            clc
            adc #$26
            tax
            lda #$01
L0CE5:      sta IOCB0,X
            dex
            dex
            bpl L0CE5
            ldx RTCLOK
            lda #$00
            sta IOCB0,X
            rts

;Data             
L0CF4:      sei
            dey
            dey
            .byte $00,$80
            plp
            rti
            rts
            
            .byte $00,$00,$10,$00,$10,$18,$10,$10,$10,$18,$00,$00
L0D08:      .byte $B0,$B0,$B0,$00,$80,$10,$40,$28,$00,$00,$10,$00,$10,$10,$10,$10
            .byte $10,$10,$00,$00
L0D1C:      .byte $02,$02,$00,$00,$80,$80,$02,$02,$00,$00,$02,$00,$80,$00,$02,$00
            .byte $80,$00,$00,$00
L0D30:      .byte $FE,$FE,$FE,$00,$D0,$D0,$B0,$C0,$00,$00,$40,$00,$40,$D0,$30,$40
            .byte $30,$D0,$00,$00
L0D44:      .byte $FE,$FE,$FE,$00,$FE,$70,$FE,$D0,$00,$00,$40,$00,$60,$FE,$40,$60
            .byte $40,$FE,$00,$00
L0D58:      .byte $80,$80,$00,$00,$80,$02,$00,$80,$00,$00,$80,$00,$02,$00,$00,$00
            .byte $02,$00,$00,$00
L0D6C:      .byte $01
L0D6D:      .byte $01
L0D6E:      .byte $00
L0D6F:      .byte $01,$01,$01,$02,$02,$02,$02,$01,$02,$01,$02,$02
L0D7B:      .byte $92
L0D7C:      .byte $0D,$A7,$0D,$C4,$0D,$CF,$0D,$DA,$0D,$F9,$0D,$40,$0E,$67,$0E,$6A
            .byte $0E,$8F,$0E,$AE,$0E,$ED,$0E,$4C,$64,$4C,$86,$4C,$66,$40,$88,$40
            .byte $68,$38,$88,$30,$66,$24,$86,$10,$64,$00,$84,$FF,$80,$28,$7A,$66
            .byte $66,$84,$56,$84,$4A,$64,$42,$86,$35,$66,$2D,$88,$27,$66,$1D,$66
            .byte $17,$66,$10,$64,$0F,$64,$10,$64,$FF,$15,$A8,$11,$A8,$0E,$A8,$0A
            .byte $A8,$02,$A8,$FF,$08,$8E,$08,$8E,$08,$8C,$AC,$8C,$D8,$8E,$FF,$24
            .byte $C2,$20,$C6,$2C,$C8,$38,$CC,$20,$C8,$44,$C4,$58,$C2,$00,$00,$00
            .byte $00,$00,$00,$58,$C2,$18,$C4,$78,$C6,$08,$C8,$08,$E2,$FF,$8E,$A2
            .byte $87,$44,$79,$A4,$83,$44,$95,$A6,$86,$46,$6A,$A6,$79,$46,$9C,$A6
            .byte $8A,$46,$5C,$A6,$6B,$46,$A0,$A6,$90,$46,$50,$A6,$5B,$46,$A2,$A6
            .byte $99,$46,$47,$A6,$48,$46,$A1,$A6,$A5,$46,$42,$A6,$34,$46,$9B,$A6
            .byte $B1,$46,$41,$A6,$1F,$44,$92,$A4,$BE,$44,$45,$A4,$09,$44,$84,$A6
            .byte $CA,$48,$4D,$AA,$FF,$1A,$68,$1A,$68,$1A,$88,$1A,$68,$1A,$68,$1A
            .byte $68,$1A,$66,$1A,$66,$1A,$86,$1A,$66,$1A,$64,$1A,$64,$1A,$64,$1A
            .byte $62,$1A,$82,$84,$62,$84,$4C,$84,$4C,$08,$4E,$FF,$40,$46,$FF,$54
            .byte $A2,$54,$44,$54,$A6,$54,$48,$54,$A8,$54,$4A,$54,$AA,$00,$4A,$00
            .byte $AA,$00,$4A,$00,$AA,$00,$48,$00,$A8,$00,$46,$00,$A4,$00,$42,$00
            .byte $A2,$00,$42,$FF,$1E,$A2,$0F,$A2,$0C,$A2,$1C,$A2,$10,$A2,$09,$A2
            .byte $19,$A2,$11,$A2,$06,$A2,$16,$A2,$13,$A2,$04,$A2,$12,$A2,$13,$A2
            .byte $03,$A2,$FF,$B0,$C2,$B0,$C2,$B0,$C4,$B0,$C4,$B0,$C4,$B0,$C4,$B0
            .byte $C6,$B0,$C6,$B0,$C6,$AA,$C8,$AA,$C8,$AA,$C8,$AA,$C8,$AA,$C8,$AA
            .byte $C8,$AA,$C8,$AA,$C8,$AA,$C8,$AA,$C8,$AA,$C8,$AA,$C6,$AA,$C6,$AA
            .byte $C4,$AA,$C4,$AD,$C4,$AD,$C4,$AD,$C4,$AD,$C2,$B0,$C2,$B0,$C2,$B0
            .byte $C2,$FF,$00,$42,$FF
	    .byte $70,$70,$40	;Start screen display list
L0EF4:      .byte $20
L0EF5:      .byte $20
L0EF6:      .byte $10,$00,$C2,$D5,$78,$90
L0EFC:      .byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$41,$F1,$0E
	    .byte $70,$70,$70,$47,$05,$79,$07
L0F11:      .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$41,$0A,$0F,$70,$70,$70
            .byte $50,$F0,$46,$A5,$78,$70,$70,$47,$B9,$78,$70,$70,$06,$70,$70,$02
            .byte $70,$02,$70,$02,$41,$1E,$0F
L0F38:      .byte $14,$14,$14,$12,$00,$00,$00,$00,$00,$00,$01,$00,$01,$20,$01,$C0
            .byte $41,$01,$00,$40
L0F4C:      .byte $02,$02,$02,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
            .byte $00,$00,$00,$00
            
            pha
            lda #$00
            sta IRQEN
            lda PORTA
            lda PORTB
            pla
            rti
			
;Initial Display List interrupt            
L0F6E_DLI1: cld					;Clear decimal mode			
            pha					;
            txa					;
            pha					;
            lda KEYDEF			;New character base
            sta WSYNC			;Store non zero value in Horizontal wait register
            ldx #$88			;
            sta CHBASE			;New character base
            stx COLPF1			;Background Color
            lda #<L0F8D_DLI3	; #$8D			;
            sta VDSLST			;
            lda #>L0F8D_DLI3	; #$0F			;
            sta VDSLST+1		;Next DLI = $0F8D
            pla					;
            tax					;
            pla					;
            rti					;
 
;DLI #2, #3, #4 - Colors change based on X value
L0F8D_DLI3: cld
            pha
            txa
            pha
            sta WSYNC
            ldx CRITIC
            lda DLCOLOR,X
            sta COLBK
            lda L0145,X
            sta COLPF3
            lda L0146,X
            sta COLPF2
            lda L0147,X
            sta COLPF1
            lda L0148,X
            sta COLPF0
            lda CRITIC
            clc
            adc #$05
            sta CRITIC
            pla
            tax
            pla
            rti
            
;DLI for 'PLAYER 1' screen
L0FBF_DLI2: cld
            pha
            tya
            pha
            sta WSYNC
            ldy #$01
L0FC8:      sty COLPF0
            sta WSYNC
            iny
            cpy #$09
            bcc L0FC8
            dey
L0FD4:      sty COLPF0
            sta WSYNC
            dey
            bne L0FD4
            pla
            tay
            pla
            rti
            
;DLI for Title screen
            lda $45
            beq L0FE7
            dec $45
L0FE7:      lda $46
            beq L0FF7
            dec $46
            bne L0FF7
            lda $47
            beq L0FF7
            dec $47
            dec $46
L0FF7:      lda #$E0
            sta CHBASE
            jsr L0A91
            lda #$08
            sta CONSOL
            pla
            tay
            pla
            tax
            pla
            rti
 
;Vertical blank
            cld				        ;Clear decimal mode
            lda #$E0				;Load character base
            sta CHBASE				;Store 
            lda #<L0F6E_DLI1 		; #$6E				;Load first DLI address
            sta VDSLST				;
            lda #>L0F6E_DLI1		; #$0F				;
            sta VDSLST+1			;DLI = $0F6E
            lda #$00				;
            sta CRITIC				;
            ldx SCRNMBR				;Current screen number
            jsr L066B				;Loads first colors
            jsr L1DDE				;Plays sounds
            lda COUNTR+1			;
            bpl L102F				;		
            lda #$05				;Never hits this code
            sta COLPF2				;Maybe opponent mode????
L102F:      lda #$08				;
            sta CONSOL				;
            lda L0D6C				;
            beq L103D				;
            lda #$00				;
            beq L103F				;Always branch
L103D:      lda #$2C
L103F:      sta L78DB
            lda L398F
            bne L104C
            lda L398E
            beq L1057
L104C:      lda L0D6D
            beq L1055
            lda #$00
            beq L1057
L1055:      lda #$2C
L1057:      sta L78FE
            lda L00F8
            beq L106C
            lda L00F9
            bmi L106C
            inc L0084
            bne L106C
            lda L0085
            bmi L106C
            inc L0085
L106C:      inc HOLDCH
            bne L1088
            lda COUNTR+1
            bmi L1082
            inc COUNTR+1
            bpl L1082
            lda #$86
            sta L00F9
            jsr L1395
            jsr L0C14
L1082:      inc INSDAT
            bne L1088
            inc COUNTR
L1088:      lda #$FE
            ldx #$00
            ldy COUNTR+1
            bpl L1096
            sta COUNTR+1
            ldx INSDAT
            lda #$F7
L1096:      sta LOMEM+1
            stx LOMEM
            lda COUNTR+1
            bpl L10AD
            ldx #$13
L10A0:      lda L0158,X
            eor LOMEM
            and LOMEM+1
            sta DLCOLOR,X
            dex
            bpl L10A0
L10AD:      lda FMSZPG+2
            beq L10B3
            dec FMSZPG+2
L10B3:      lda FMSZPG+3
            beq L10BC
            dec FMSZPG+3
            jmp L10C4
			
L10BC:      lda FMSZPG+4
            beq L10C4
            dec FMSZPG+4
            dec FMSZPG+3
L10C4:      jsr L3E3E
            lda L00F8
            beq L111B
            lda PORTA
            ldx RTCLOK				;May store 2 player status????
            beq L10D6
            lsr
            lsr
            lsr
            lsr
L10D6:      and #$0F				;Mask off low nibble of joystick value
            ldy L0D6C,X
            bne L10E7
            pha
            and #$03
            tay
            pla
            lsr
            lsr
            ora L3E63,Y
L10E7:      sta L0095				;Store Joystick status
            lda TRIG0,X				;Check trigger status
            sta L0098				;Save in $98
            lda L398F				;0 = Computer, 1 = Opponent
            beq L111B				;Branch if computer
            lda RTCLOK				;
            eor #$01
            tax
            php
            lda PORTA
            plp
            beq L1103
            lsr
            lsr
            lsr
            lsr
L1103:      and #$0F
            ldy L0D6C,X
            bne L1114
            pha
            and #$03
            tay
            pla
            lsr
            lsr
            ora L3E63,Y
L1114:      sta L0096
            lda TRIG0,X
            sta L0099
L111B:      lda L00F8			;Is player on screen? 1 = yes
            beq L1131			;Branch if no
            lda L00F9			;Game paused status
            bmi L1135			;Branch is negative(Should never be negative)
            lda L0095			;Joystick direction
            and L0096			;Joystick direction player 2
            cmp #$0F			;Any movement
            bne L1131			;Branch if != $0F
            lda L0098			;Joystick player 1
            and L0099			;Joystick player 2
            bne L1135			;
L1131:      lda #$00			;
            sta COUNTR+1		;Reset player 2 timeout counter
L1135:      lda L00F8			;
            bne L1154			;Branch if player on screen
            lda PCOLR0
            bne L1154
            ldy #$00
            lda (ICCOMT),Y
            lsr
            lsr
            lsr
            lsr
            sta L0095
            lda (ICCOMT),Y
            and #$0F
            sta L0098
            inc ICCOMT
            bne L1154
            inc DSKFMS
L1154:      lda DELTAC			;
            bne L11B0
            lda L00F9			;Game paused status
            bmi L11B0			;Should never be negative
            lda L00F8			;Player on screen?	
            beq L11B0			;Branch if no
            lda L398F			;0 = Computer, 1 = Opponent
            beq L11B0			;Branch if computer
            lda L0096
            cmp #$0F
            bne L11AA
            lda L0099
            beq L11AA
            inc L0086
            bne L11B0
            inc L0087
            lda L0087
            cmp #$07
            bcc L11B0
            lda #$00
            sta L398F			;Computer controls Yamo
            lda #$20
            sta L0085
            jsr L391E			;Save sound info
            lda LIVES
            cmp #$05
            bcc L1192
            sbc #$05
            jmp L1194
			
L1192:      lda #$00
L1194:      sta LIVES
            lda L3A0E
            cmp #$05
            bcc L11A2
            sbc #$05
            jmp L11A4
			
L11A2:      lda #$00
L11A4:      sta L3A0E
            jsr L141D			;Computes LIVES packed bytes and stores in screen memory
L11AA:      lda #$00
            sta L0086
            sta L0087
L11B0:      sta POTGO			;Computer player
            pla
            tay
            pla
            tax
            pla
            rti					;Ends VBI

;            
L11B9:      jsr L2579			;Possibly has something to do with players on the screen????
            ldx #$02			;Player index
L11BE:      lda L0092,X			;Load player on screen status
            and #$01			;Mask onscreen bit
            beq L11DE			;Skip player if not on screen
            lda SCRNMBR			;Load screen number
            cmp #$13			;is it screen $13?
            bne L11D8			;Branch if not screen $13
            lda L0085			;????
            cmp #$02
            bcs L11D4
            lda #$0E
            bne L11D6
L11D4:      lda #$0F
L11D6:      sta L0095
L11D8:      jsr L15B9			;Write player status values and other?????
            jsr L1FC2			;????
L11DE:      dex
            bpl L11BE
            rts

;This routine computes display bytes and stores them in screen memory          
L11E2:      pha					;
            jsr L13B7			;Grab low and high byte from table based on X register
            pla					;
            asl					;A x2
            tax					;A -> X
            sty BUFADR			;
            lda L3A2D,X			;Get low base
            sec
            sbc BUFADR			;Subtract low offset
            sta BUFADR			;Low address to load bytes from
            lda L3A2E,X			;Get high base
            sbc #$00			;Subtract carry if set
            sta BUFADR+1		;High address to load bytes from
L11FA:      lda (BUFADR),Y		;Load a screen byte
            sec
            sbc #$20			;Subtracting $20 will give the screen code
            cmp #$80			;Computed the character?
            beq L120F			;Branch if yes
            sta (RTCLOK+1),Y	;Else save byte tRTCLOKo screen display
            iny					;
            bne L11FA			;
            inc RTCLOK+2		;
            inc BUFADR+1		;
            jmp L11FA			;Get next character to display
L120F:      rts

;Process losing of a life.
L1210:      jsr L1E34			;Clear audio registers
            lda L00F8			;Player alive or on screen?
            bne L121A			;Reset bruce
            jmp L046D			;Jump to title screen

;Reset Bruce			
L121A:      dec LIVES			;Subract 1 from Bruce lives
            bmi L1285			;Process Game over
L121E:      lda #$24			;$24 fresh hit points
            sta BRUCEHP			;
            sta YAMOHP			;This will be changed later to correct value
            sta NINJAHP			;This will be changed later to correct value
            lda #$00			;
            sta L0088			;????
            sta L0089			;????
            jsr L1F40			;Calculates Sprite positions and erases them
            jsr L38FF			;
            jsr L3E3E			;
            lda L398E			;
            beq L1245
            lda L3A0E
            bmi L1245
            lda RTCLOK
            eor #$01
            sta RTCLOK
L1245:      jsr L0B05
            lda L398E
            beq L1278
            lda L3A0E
            bmi L1278
            ldx #$1B
L1254:      lda LIVES,X
            ldy L3A0E,X
            sta L3A0E,X
            tya
            sta LIVES,X
            dex
            bpl L1254
            jsr L0BD6
            ldx #$02
L1267:      lda L3A01,X
            pha
            lda L3A04,X
            sta L3A01,X
            pla
            sta L3A04,X
            dex
            bpl L1267
L1278:      jsr L0568
            lda #$C0
            sta NMIEN
            ldx SCRNMBR
            jmp L299B
			
L1285:      jsr L1F40
            jsr L38FF
            jsr L13A9
            lda #$0A
            sta DLISTL
            lda #$0F
            sta DLISTH
            lda #$E1
            sta VVBLKI
            lda #$0F
            sta VVBLKI+1
            jsr L0A91
            lda #$0D			;-------------------------------------
            ldx #$03			;Process end of game graphics
            ldy #$1B			;
            jsr L11E2			;-------------------------------------
            lda #$0E			;-------------------------------------
            ldx #$04			;Process end of game graphics
            ldy #$1B			;
            jsr L11E2			;-------------------------------------
            lda RTCLOK
            clc
            adc #$11
            sta (RTCLOK+1),Y
            jsr L2A4E
            ldy #$80
            lda L3A0B
            jsr L1447
            ldy #$82
            lda L3A0C
            jsr L1447
            ldy #$84
            lda L3A0D
            jsr L1447
            lda #$A0
            sta FMSZPG+2
L12DD:      lda FMSZPG+2
            bne L12DD
            lda L398E
            beq L12EE
            lda L3A0E
            bmi L12EE
            jmp L121E
			
L12EE:      lda #$40
            sta FMSZPG+2
L12F2:      lda FMSZPG+2
            bne L12F2
            jmp L046D
			
L12F9:      lda #$00
            sta L3A2A
            clc
            rol L3A2B
            rol L3A2A
            rol L3A2B
            rol L3A2A
            rol L3A2B
            rol L3A2A
            rts
			
;Test for a Start button push during game execution
L1312:      lda CONSOL
            ldx L00F8			;Is player on screen?
            beq L132A			;Branch if not on screen
            lsr					;If start button pushed lowest bit will be zero
            bcs L1344			;Branch if no start push
            jsr L06E3			;Waits for Console and Joystick buttons to be released
            lda #$06			;
            sta FMSZPG+2		;
L1323:      lda FMSZPG+2		;
            bne L1323			;Wait 6 VBI cycles
            jmp L0418			;Jump to program reset

;Console Button push test when player is not on screen			
L132A:      cmp #$07			;7 = no button push	
            bne L1336			;Branch if button push
            lda TRIG0			;Get joystick button status
            and TRIG1			;Get player 2 Joy button status
            bne L1344			;Branch if no no button pushes
L1336:      jsr L06E3			;Waits for Console and Joystick buttons to be released
            lda #$06			;
            sta FMSZPG+2		;
L133D:      lda FMSZPG+2		;
            bne L133D			;Delay routine - 6 VBI cycles
            jmp L046D			;Jump to title screen loop
L1344:      rts

;Checks to see if game is paused and debounces keyboard
L1345:      lda L00F9			;Load game paused status
            pha					;Save status
            and #$80			;Mask of pause bit
            sta L00F9			;Save masked off bit back in $F9
            pla					;Pop original status
            and #$06			;Mask of bits 1 and 2
            beq L135C			;Skip if 0
            sec					;
            sbc #$01			;Decrement value
            ora L00F9			;OR with pause status bit
            sta L00F9			;Store new value
            lda #$FF			;$FF = no keypress
            sta FMSZPG+5		;Store keyboard code
L135C:      rts

;Pauses or resumes game
L135D:      lda L00F9			;Load pause status bit
            and #$06			;Mask of bits 1 and 2
            bne L13A4			;Skip if not debounced yet
            lda L00F9			;Load pause status bit
            bpl L136F			;Branch if paused
            lda TRIG0			;Test if joystick 1 or 2 has been pushed
            and TRIG1			;And toggle pause bit if so
            beq L1377			;Branch if either Joy button has been pushed
L136F:      lda #$FF			;$FF = No keyboard push
            cmp FMSZPG+5		;Compare with saved keyboard state
            beq L13A4			;Branch if no keyboard keys been pressed
            sta FMSZPG+5		;Store keyboard code $FF 
L1377:      lda L00F9			;Load pause status bit
            eor #$80			;Toggle high bit - Pause or Un-Pause
            ora #$06			;Turn on bits 1 and 2 - 6 VBI's to debounce keyboard
            sta L00F9			;Store new pause bit status and debounce values
            bmi L1395			;Branch if not paused
            jsr L14FF			;Writes top score to screen/erases '**PAUSED**'
            lda COUNTR+1		;Some kind of color test????? Possibly Attract has changed this value
            bpl L138B			;Branch if ATTRACT is positive??????
            jsr L0C2E			;Reload display list colors
L138B:      lda #$00			;Reset ATTRACT?????
            sta COUNTR+1		;ATTRACT value?????
            jsr L140B			;Draw 'TOP' to screen
            jmp L2948			;

;Resets '1UP' timer and ATRACT????			
L1395:      lda #$11			;
            sta L3A2C			;$11 in '1UP' timer
            jsr L13CC			;Store '1UP' in screen memory
            lda #$51			;
            sta COUNTR+1		;Possibly ATTRACT count down value????
            jmp L14F6			;
L13A4:      rts

            ldx #$02			;Possible these two lines are never executed
            bne L13AB			;

;			
L13A9:      ldx #$00			;
L13AB:      jsr L13B7			;This subroutine moves the low and high byte addresses to $13, $14
            jsr L13C2			;Writes zeros to addresses $78A9 - $7B19 - Essentially clears the screen
            inx					;
            cpx #$0E			;
            bcc L13AB			;
            rts					

;This subroutine moves low and high byte to $13, $14          
L13B7:      lda L39D9,X			;
            sta RTCLOK+1		;
            lda L39E8,X			;
            sta RTCLOK+2		;
            rts

;This routine writes zeros to data areas in memory, possibly 48 byte display areas            
L13C2:      ldy #$2F
            lda #$00
L13C6:      sta (RTCLOK+1),Y
            dey
            bpl L13C6
            rts

;Draw and erase '1 UP' from screen            
L13CC:      dec L3A2C			;Wait $20 game loops
            bne L13F1			;Branch if not zero
            lda #$20			;Reload $3A2C
            sta L3A2C			;$20(32 dec) more game loops 
            lda L00F8			;Player on screen? 
            bne L13E4			;Branch if yes
            lda PORTB			;
            eor #$0C			;Toggle between $FF and $F3
            sta PORTB			;
            bne L13E9			;
L13E4:      lda #$FF			;
            sta PORTB			;
L13E9:      lda #$00			;
            tax					;
            ldy #$34			;
            jmp L11E2			;Erase '1 UP' from screen
			
L13F1:      lda L3A2C			;
            cmp #$10			;Have $10 cycles gone by?
            bne L140A			;Skip if not $10 yet
            lda L00F8			;Is player on screen?
            beq L13FF			;Branch if yes
            jsr L0876			;
L13FF:      ldx RTCLOK			;
            inx					;
            txa					;
            ldx #$01			;
            ldy #$04			;
            jmp L11E2			;Draw '1 UP' to screen memory
L140A:      rts

L140B:      lda #$03			;
            ldx #$01			;
            ldy #$10			;
            jmp L11E2			;Draw 'TOP' to screen memory
			
L1414:      lda #$05			;
            ldx #$01			;
            ldy #$1C			;
            jmp L11E2			;Draw 'FALLS' to screen memory
	
;Computes LIVES packed bytes and stores in screen memory	
L141D:      lda #$00			;
            sta L3A0A			;
            lda LIVES			;Lives value
            sta L3A07			;Store lives value
L1427:      sec					;
            sbc #$0A			;
            bcc L1432			;Branch if value < 10
            inc L3A0A			;
            jmp L1427
			
L1432:      clc					;
            adc #$0A			;Recreate inital value of 4
            sta L3A07			;Store again
            lda L3A0A			;
            asl					;
            asl					;
            asl					;
            asl					;
            ora L3A07			;
            ldy #$56			;
            jmp L14D6			;Displays the number of lives on the screen	

;Stores Score bytes on screen			
L1447:      pha
            jsr L2994			;Returns high nibble in low nibble	
            ora #$10			;1 + low nibble = Decimal for screen
            sta L78A5,Y			;Store on Screen score
            pla					;Pop original number
            and #$0F			;Save low nibble
            ora #$10			;1 + low nibble = Decimal for screen
            sta L78A6,Y			;store next score value on screen
            rts		

;This toggles the sound status register(L0D6E) on or off            
L1459:      lda L0D6E			;Load sound status	
            eor #$01			;Toggle status
            sta L0D6E			;Store it back
            jmp L14AB			;

;Get keyboard state			
L1464:      lda SKSTAT			;$FF = No keys pressed $FB = other key press
            and #$04			;Mask of bit 3, Will be $04 if no key press
            cmp COLCRS			;Compare to COLCRS = $04
            beq L1478			;Branch if no new keypress
            sta COLCRS			;Otherwise store $04 in COLCRS
            lsr					;
            beq L1473			;Should never be 0?
            rts					;

;Gets Keyboard code for processing			
L1473:      lda KBCODE			;Get keyboard code
            sta FMSZPG+5		;Store in $48
L1478:      lda FMSZPG+5		;Load keycode
            beq L14A6			;L key pressed? Rotate joystick clockwise 90 degrees Player 1(Left handed)
            cmp #$28			;R key pressed?
            beq L149F			;Rotate joystick counter clockwise 90 degrees Player 1
            cmp #$40			;Shift-L pressed?
            beq L1498			;Rotate joystick counter clockwise 90 degrees Player 2
            cmp #$68			;Shift-R Pressed?
            beq L1491			;Rotate joystick counter clockwise 90 degrees Player 1
            cmp #$90			;CTRL-V Pressed?
            beq L14B1			;Displays Development information at top of screen
            cmp #$3E			;S Key pressed
            beq L1459			;Toggles sound on or off
            rts
            
L1491:      lda #$01			;
            sta L0D6D			;Right handed player 2
            bne L14AB			;
L1498:      lda #$00			;
            sta L0D6D			;Left handed player 2
            beq L14AB			;
L149F:      lda #$01			;
            sta L0D6C			;1 = Right handed player 1
            bne L14AB			;
L14A6:      lda #$00			;
            sta L0D6C			;0 = Left handed player 1
L14AB:      lda #$FF			;
            sta FMSZPG+5		;Clear keyboard code
            bne L1478			;Process keyboard input again
	
;Sets Display List to displays development info
L14B1:      lda #$42
            cmp L0EF4			;Already $42? - Then branch to turn off
            beq L14C7			;
            sta L0EF4			;This is the display list area
            lda #$C9			;
            sta L0EF5			;
            lda #$3C			;$3CC9 - Contains the development info line
            sta L0EF6			;
            bne L14AB			;

;Sets Display list to display blank lines where Dev. Info. was			
L14C7:      lda #$20			;
            sta L0EF4			;
            sta L0EF5			;
            lda #$10			;Chnages DL to display blank lines
            sta L0EF6			;
            bne L14AB			;

;Displays the number of lives on the screen		
L14D6:      pha					;
            jsr L2994			;Saves Hi nibble value in Low nibble
            ora #$10			;OR to display a number
            cmp #$1A			;
            bcc L14E3			;Branch if less than $1A - 
            clc					;
            adc #$07			;
L14E3:      sta L78A5,Y			;Store hi byte value
            pla					;get original byte value
            and #$0F			;Mask off high and save low nibble
            ora #$10			;OR to display a number
            cmp #$1A			;
            bcc L14F2			;Branch if less than $1A
            clc					;
            adc #$07			;
L14F2:      sta L78A6,Y			;Store low byte value
            rts

;Writes '**PAUSED**' to top score screen area            
L14F6:      lda #$0B
            ldx #$01
            ldy #$0F
            jmp L11E2

;Writes top score to screen/erases '**PAUSED**'			
L14FF:      lda #$0C			;
            ldx #$01			;
            ldy #$0F			;
            jmp L11E2			;

;Main game loop			
L1508:      lda #$02			;
            sta FMSZPG+2		;Screen Delay = 2 VBI's
            jsr L1312			;Check for Start button push during gameplay
            lda L00F8			;Is player on screen?
            beq L1523			;Branch if player is not on screen
            jsr L1464			;Checks for keyboard input and sets related bits accordingly
            jsr L1345			;Checks to see if game is paused and debounces keyboard	
            jsr L135D			;Checks if need to Pauses/resume game
            lda L00F9			;Load Pause status and keyboard debounce byte
            bpl L1523			;Branch if not paused(%0xxxxxxx)
            jmp L159C			;Jump if paused
			
L1523:      lda NINJAHP			;
            and #$87			;%10000111 - Not sure yet?????
            sta NINJAHP			;
            jsr L13CC			;Draw and erase '1 UP' from screen   
            jsr L15A3			;Simply returns - should be removed - 3 NOP's
            jsr L37A4			;Creates and stores a lot of random numbers
            lda DELTAC			;
            bne L153F			;
            jsr L0A07			;Test Ninja and Yamo Timers
            jsr L0972			;Create instance of Yamo
            jsr L0A14			;Create instance of Ninja
L153F:      lda DELTAC+1		;
            bne L1549			;
            lda #$02			;
            sta DELTAC+1		;
            bne L154B			;
L1549:      dec DELTAC+1		;
L154B:      jsr L318F			;Returns to an address based on screen number

            lda P0PF			;Checks for Playfield to Player 0 collosion - P0 = Bruce       - $154E
            sta L00A7			;Stores collsion status in $00A7
            ora P1PF			;Playfield to Player 1 collosion OR with P0 - P1 = Bruce
            and #$0F			;Save low nibble
            sta L00B6			;Store Collision status here
            lda P3PF			;Yamo Collision W/PF
            sta L00A8			;Save Collision status
            ora P2PF			;Playfield to Player 2 collosion OR with P2 - P3
            and #$0F			;Save low nibble
            sta L00B7			;Store collision status here
            lda M0PF			;Load Ninja PF Collision
            ora M1PF			;and other part of ninja PF Collision
            ora M2PF			;and other part of ninja PF Collision
            ora M3PF			;and other part of ninja PF Collision
            and #$0F			;Save low nibble
            sta L00A9			;Store collision status here
            sta L00B8			;And here
            jsr L2634			;Lamp collisions and other stuff????
            jsr L2205			;Sets collision info. and substracts points for collisions
            jsr L2926			;Computes score and high score and store vales on screen
            jsr L11B9			;Updates sounds and other stuff????	
            jsr L2532			;Calculates screen position of lowest player, saves is OLDROW
L1587:      lda VCOUNT			;
            cmp OLDROW			;Is drawing beam past lowest player position or screen position?
            bcc L1587			;Loop until it is
            jsr L1F40			;Flip player status bit, erase players
            jsr L1E45			;Draw players, store player color, size
            lda #$00			;
            sta HITCLR			;Clear Player/Missile collision registers
            jsr L2552			;Checks to see if players have been killed
L159C:      lda FMSZPG+2		;
            bne L159C			;Timer delay
            jmp L1508			;Jump to Main Loop
L15A3:      rts

;
L15A4:      lda L009B,X			;Players horizontal position		
            sec				;
            sbc #$30			;Subtract 30 from player horizontal position
            lsr				;
            lsr				;
            sta L00E9,X
            lda L009E,X
            sec
            sbc #$0D
            lsr
            lsr
            lsr
            lsr
            sta L00EC,X
            rts
 
; 
L15B9:      lda #$08
            sta L0083
            lda L00FA,X
            beq L15C4
            dec L00FA,X
            rts
            
L15C4:      sta L7899,X			;
            lda L7815,X			;
            ora L7818,X			;
            ora L781B,X			;
            ora L781E,X			;
            beq L15EB			;
            lda #$27			;
            sta ZCHAIN+1		;
            txa					;
            clc					;
            adc #$75			;
            tay					;
L15DE:      lda L7815,Y			;
            sta L7821,Y			;
            dey					;
            dey					;
            dey					;
            dec ZCHAIN+1		;
            bpl L15DE			;
L15EB:      lda #$00			;
            sta L7815,X			;
            sta L7818,X			;
            sta L781B,X			;
            sta L781E,X			;
            lda L00C2,X			;
            beq L1609			;
            cmp L00C5,X			;
            bne L1609			;
            lda L00CE,X			;
            beq L160D			;
            dec L00CE,X			;
            bpl L160D			;
L1609:      lda #$06			;
            sta L00CE,X			;
L160D:      lda L00C2,X			;
            sta L00C5,X			;
            cmp #$19			;
            bne L1618			;
            jmp L16CC			;
			
L1618:      cmp #$18
            bne L1623
            lda L00D1,X
            beq L1623
            jmp L1D5F
			
L1623:      lda L00B6,X
            and #$08
            bne L162C
            jmp L16C4			;Process Joystick input
			
L162C:      lda #$00
            sta L00CB,X
L1630:      lda #$01
            sta L0082
L1634:      dec L7821,X
            bmi L1641
            lsr L0082
            jsr L1791
            jmp L1634
			
L1641:      dec L7824,X
            bmi L164C
            jsr L174A
            jmp L1641
			
L164C:      dec L7827,X
            bmi L1659
            lsr L0082
            jsr L181C
            jmp L164C
			
L1659:      dec L782A,X
            bmi L1666
            lsr L0082
            jsr L17DE
            jmp L1659
			
L1666:      lda #$23
            sta ZCHAIN+1
            txa
            tay
L166C:      lda L782D,Y
            sta L7815,Y
            iny
            iny
            iny
            dec ZCHAIN+1
            bpl L166C
            lda #$00
            sta L00FA,X
            sta L7881,X
            sta L7884,X
            sta L7887,X
            sta L788A,X
            sta L788D,X
            sta L7890,X
            sta L7893,X
            sta L7896,X
            dec L0083
            bmi L16BB
            lda L00B6,X
            and #$04
            bne L16BB
            lda L0082
            beq L16A8
            lda #$00
            jmp L15C4
			
L16A8:      lda L0083
            cmp #$07
            beq L16BB
            lda L00A1,X
            bne L16B8
            jsr L181C
            jmp L16BB
			
L16B8:      jsr L17DE
L16BB:      lda #$18
            sta L00C2,X
            lda #$40
            sta L00D1,X
            rts

;This routine is processing joystick input            
L16C4:      sta L00CB,X
            lda #$FF
            sta L00C8,X
            lda #$00
L16CC:      ldy L00D1,X
            beq L16D3
            jmp L1929
			
L16D3:      lda L00C5,X
            cmp #$0E
            bne L1722
            txa
            beq L16EE
            lda L00B6,X
            and #$05
            beq L1714
            lda L00A1,X
            cmp #$01
            bne L16EB
            jmp L181C
			
L16EB:      jmp L17DE

L16EE:      lda L00A7,X
            and #$01
            beq L170E
            lsr L00B0,X
            beq L1714
            lda L00A1,X
            beq L1705
            jsr L181C
            jsr L1791
            jmp L1714
			
L1705:      jsr L17DE
            jsr L1791
            jmp L1714
			
L170E:      lda L00B6,X
            and #$05
            bne L1754
L1714:      jsr L1791
            lda #$0E
            jmp L18EA
			
L171C:      lda #$02
            sta L00B0,X
            bne L1714
L1722:      lda L00B6,X
            and #$05
            beq L171C
            lda L0095,X
            cmp #$0E
            bne L176B
            lda L009E,X
            cmp #$33
            bcc L1764
            jsr L1919			;Play Bruce move/run/jump/climb sound - Stick up($009E = $90, or $9E if on last screen)
            lda L00CE,X
            bne L173E
            jsr L1744
L173E:      jsr L1744
            jsr L1744
L1744:      lda L00B6,X
            and #$04
            beq L1760
L174A:      lda L009E,X
            cmp #$33
            bcc L1754
            lda L00CB,X
            and #$01
L1754:      bne L1764
            dec L009E,X
            inc L7815,X
            lda #$01
            jmp L18EA
			
L1760:      lda L00B6,X
            and #$08
L1764:      bne L17DB
            lda #$05
            jmp L18F7
			
L176B:      cmp #$0D
            bne L17B1
            lda L00B6,X
            and #$04
            bne L177B
            lda L00B6,X
            and #$01
            bne L17A1
L177B:      lda L009E,X			;
            cmp #$CA
            bcs L17DB
            jsr L1919			;Play Bruce move/run/jump/climb sound - Stick down($009E = $B1)
            lda L00CE,X
            bne L178B
            jsr L1791
L178B:      jsr L1791
            jsr L1791
L1791:      lda L009E,X
            cmp #$CA
            bcs L17DB
            inc L009E,X
            inc L7818,X
            lda #$02
            jmp L18EA
			
L17A1:      txa
            beq L17A7
            jmp L1852
			
L17A7:      lda L00A1
            beq L17AE
            jmp L1875
			
L17AE:      jmp L1843

;
L17B1:      cmp #$0B			;
            bne L17F2			;
            lda L009B,X			;
            cmp #$31			;
            bcc L17DB			;
            jsr L1919			;Play Bruce move/run/jump/climb sound - Stick left($009B = $9B)
            lda L00CE,X			;
            bne L17C5			;
            jsr L17C8			;
L17C5:      jsr L17C8			;
L17C8:      lda L00C5,X			;
            cmp #$03			;
            bne L17DE			;
            lda L00CE,X			;
            cmp #$04			;
            bcs L17DE			;
            lda L0098,X			;
            bne L17DE			;
            jmp L18BC			;
			
L17DB:      jmp L18E1

L17DE:      lda L009B,X
            cmp #$31
            bcc L17DB
            dec L009B,X
            inc L781B,X
            lda #$00
            sta L00A1,X
            lda #$03
            jmp L18EA
			
L17F2:      cmp #$07
            bne L1830
            lda L009B,X
            cmp #$C8
            bcs L17DB
            jsr L1919			;Play Bruce move/run sound - Stick right ($009B = $A1)
            lda L00CE,X
            bne L1806
            jsr L1809
L1806:      jsr L1809
L1809:      lda L00C5,X
            cmp #$04
            bne L181C
            lda L00CE,X
            cmp #$04
            bcs L181C
            lda L0098,X
            bne L181C
            jmp L18C5
			
L181C:      lda L009B,X
            cmp #$C8
            bcs L17DB
            inc L009B,X
            inc L781E,X
            lda #$01
            sta L00A1,X
            lda #$04
            jmp L18EA
			
L1830:      cmp #$09
            bne L1862
            txa
            bne L1852
            lda L00B6,X
            and #$04
L183B:      bne L17DB
            lda L00B6,X
            and #$01
            beq L185F
L1843:      lda L009B,X
            cmp #$BD
            bcs L185F
            lda #$00
            sta L00A1,X
            lda #$1A
            jmp L18EA
			
L1852:      cmp #$01
            bne L185F
            lda L00B6,X
            and #$04
            bne L185F
            jmp L1B2F
			
L185F:      jmp L18E1

L1862:      cmp #$05
            bne L1884
            txa
            bne L1852
            lda L00B6,X
            and #$04
            bne L183B
            lda L00B6,X
            and #$01
            beq L185F
L1875:      lda L009B,X
            cmp #$3C
            bcc L185F
            lda #$01
            sta L00A1,X
            lda #$1A
            jmp L18EA
			
L1884:      pha
            lda L00B6,X
            and #$08
            beq L188F
            pla
            jmp L18CE
			
L188F:      pla
            cmp #$0A
            bne L18A6
            lda L00B6,X
            and #$04
            bne L183B
            lda #$00
            sta L00A1,X
            jsr L1919
            lda #$06
            jmp L18F7
			
L18A6:      cmp #$06
            bne L18CE
            lda L00B6,X
            and #$04
            bne L183B
            lda #$01
            sta L00A1,X
            jsr L1919
            lda #$07
            jmp L18F7
			
L18BC:      lda #$00
            sta L00A1,X
            lda #$0C
            jmp L1904
			
L18C5:      lda #$01
            sta L00A1,X
            lda #$0D
            jmp L1904
			
L18CE:      cmp #$0F
            bne L18E1
            lda L0098,X
            bne L18E1
L18D6:      lda L00B6,X
            and #$04
            bne L18E1
            lda #$11
            jmp L1911
			
L18E1:      lda L00C5,X
            bne L18E8
            inc L7899,X
L18E8:      lda #$00
L18EA:      sta L00C2,X
            tay
            lda L3E6F,Y
            sta L00FA,X
            lda #$00
            sta L00D1,X
            rts
            
L18F7:      sta L00C2,X
            tay
            lda L3E6F,Y
            sta L00FA,X
            lda #$19
            sta L00D1,X
            rts
L1904:      sta L00C2,X
            tay
            lda L3E6F,Y
            sta L00FA,X
            lda #$0C
            sta L00D1,X
            rts
            
L1911:      jsr L1904
            lda #$08
            sta L00D1,X
            rts
  
;Bruce run/climb/jump sound  
L1919:      pha					;
            txa					;
            pha					;
            tya					;
            pha					;
            ldy #$07			;
            jsr L1DB0			;Stores sound info in memory
            pla					;
            tay					;
            pla					;
            tax					;
            pla					;
            rts					;

;Possibly testing joystick directions or player status and movement????            
L1929:      sty ATRACT
            lda L00C2,X			;Player status
            cmp #$05			;Jump status
            bne L195D
            lda L00B6,X
            and #$04			;Run right
            bne L1995
            cpy #$17
            bne L193B
L193B:      cpy #$15
            bcs L1950
            cpy #$03			;Run Left
            bcc L1950
            cpy #$0C			;Kicking left
            bcs L1955
            lda L00B6,X
            and #$01			
            bne L1995
            jsr L1791
L1950:      lda #$05	
            jmp L1D9C			;Store jump up($05) in player status
			
L1955:      jsr L174A
            lda #$05			;
            jmp L1D9C			;Store jump up($05) in player status
	
;Yamo/Bruce Kicking sound	
L195D:      cmp #$0C			;
            bne L19A2
            lda L00B6,X
            and #$0C
            bne L1995
            cpy #$0C
            bne L1976
            stx DSTAT
            ldy #$01			;Yamo/Bruce kicking sound
            jsr L1DB0			;Stores sound info in memory
            ldx DSTAT
            ldy ATRACT
L1976:      cpy #$0A
            bcc L1985
            jsr L174A
            jsr L17DE
            lda #$0C
            jmp L1D9C			;Store Kick left status in player status
			
L1985:      cpy #$02
            bcc L1991
            jsr L17DE
            lda #$0C
            jmp L1D9C			;Store Kick left status in player status
			
L1991:      lda L00B6,X
            and #$01
L1995:      bne L1A00
            jsr L1791
            jsr L17DE
            lda #$0C
            jmp L1D9C			;Store Kick left status in player status
			
L19A2:      cmp #$0D
            bne L19E7
            lda L00B6,X
            and #$0C
            bne L1A00
            cpy #$0C
            bne L19BB
            stx DSTAT
            ldy #$01			;Play kick sound
            jsr L1DB0			;Stores sound info in memory
            ldx DSTAT
            ldy ATRACT
L19BB:      cpy #$0A
            bcc L19CA
            jsr L174A
            jsr L181C
            lda #$0D
            jmp L1D9C			;Store Kick right status in player status
			
L19CA:      cpy #$02
            bcc L19D6
            jsr L181C
            lda #$0D
            jmp L1D9C			;Store Kick right status in player status
			
L19D6:      lda L00B6,X
            and #$01
            bne L1A00
            jsr L1791
            jsr L181C
            lda #$0D
            jmp L1D9C			;Store Kick right status in player status
			
L19E7:      cmp #$06
            bne L1A20
            lda L00B6,X
            and #$04
            bne L1A00
            cpy #$10
            bcc L1A03
            jsr L174A
            jsr L17DE
            lda #$06
            jmp L1D9C			;Store Diagonal jump left status in player status
			
L1A00:      jmp L1DAB

L1A03:      cpy #$0B
            bcc L1A0F
            jsr L17DE
            lda #$06
            jmp L1D9C			;Store Diagonal jump left status in player status
			
L1A0F:      lda L00B6,X
            and #$01
            bne L1A00
            jsr L17DE
            jsr L1791
            lda #$06
            jmp L1D9C			;Store Diagonal jump left status in player status
			
L1A20:      cmp #$07
            bne L1A56
            lda L00B6,X
            and #$04
            bne L1A00
            cpy #$10
            bcc L1A39
            jsr L174A
            jsr L181C
            lda #$07
            jmp L1D9C			;Store Diagonal jump right status in player status
			
L1A39:      cpy #$0B
            bcc L1A45
            jsr L181C
            lda #$07
            jmp L1D9C			;Store Diagonal jump right status in player status
			
L1A45:      lda L00B6,X
            and #$01
            bne L1A00
            jsr L181C
            jsr L1791
            lda #$07
            jmp L1D9C			;Store Diagonal jump right status in player status
			
L1A56:      cmp #$19
            bne L1A6B
            cpx #$00
            bne L1A62
            cpy #$01
            beq L1A65
L1A62:      jmp L1D9C

L1A65:      jmp L1210

L1A68:      jmp L1DAB

L1A6B:      cmp #$17
            beq L1A72
            jmp L1B20
			
L1A72:      lda L00B6,X
            and #$04
            beq L1A68
            lda #$01
            sta L00AA,X
            txa
            beq L1A94
            lda L398F			;Computer/Opponent status
            bne L1A94			;Branch if Opponent controls Yamo
            lda L00A1,X
            cmp #$01
            bne L1A90
            lda #$07
            sta L0095,X
            bne L1A94
L1A90:      lda #$0B
            sta L0095,X
L1A94:      lda L00AD,X
            beq L1A9D
            dec L00AD,X
            jmp L1AD9
			
L1A9D:      lda L0095,X
            cmp #$0E
            bne L1AAC
            jsr L174A
            jsr L174A
            jmp L1AD0
			
L1AAC:      cmp #$0D
            bne L1AB9
            jsr L1791
            jsr L1791
            jmp L1AD0
			
L1AB9:      cmp #$0B
            bne L1AC6
            jsr L17DE
            jsr L17DE
            jmp L1AD0
			
L1AC6:      cmp #$07
            bne L1AD9
            jsr L181C
            jsr L181C
L1AD0:      lsr L00AA,X
            lda #$04
            sta L00AD,X
            jsr L1919
L1AD9:      lda OLDCOL
            cmp #$01
            bne L1AF2
            lda PALNTS
            beq L1AEC
            jsr L1791
            jsr L1791
            jmp L1AF2
			
L1AEC:      jsr L174A
            jsr L174A
L1AF2:      lda #$0F
            sta L0095,X
            lda #$01
            sta L0098,X
            inc ATRACT
            lda L7815,X
            sec
            sbc L7818,X
            bpl L1B13
            eor #$FF
            adc #$01
            sta L7818,X
            lda #$00
            sta L7815,X
            beq L1B1B
L1B13:      sta L7815,X
            lda #$00
            sta L7818,X
L1B1B:      lda #$17
            jmp L1D9C				;Store some status in player status
			
L1B20:      cmp #$10
            bne L1B54
            lda L00D1,X
            cmp #$01
            beq L1B2F
            lda #$10
            jmp L1D9C				;Store some status in player status
	
;	
L1B2F:      lda L009B,X
            cmp L009B
            bcc L1B4F
            lda #$00
L1B37:      sta L00A1,X
            lda #$12
            sta L00C2,X
            lda #$10
            sta L00D1,X
            lda #$00
            sta L00FA,X
            txa
            pha
            ldy #$0A				;Yamo spawn moo sound
            jsr L1DB0				;Stores sound info in memory
            pla
            tax
            rts
            
L1B4F:      lda #$01
            jmp L1B37
			
L1B54:      cmp #$11
            bne L1BA8
            lda L00B6,X
            and #$0C
            bne L1BB0
            cpy #$08
            bne L1B6D
            stx DSTAT
            ldy #$00				;Punch sound
            jsr L1DB0				;Stores sound info in memory
            ldx DSTAT
            ldy ATRACT
L1B6D:      cpy #$01
            beq L1B76
            lda #$11
            jmp L1D9C				;Store punch status in player status
			
L1B76:      lda #$00
            sta L00C2,X
            lda #$10
            sta L00D1,X
            lda #$00
            sta L00FA,X
            txa
            bne L1B8F
            jsr L0CCD
            bvs L1B9E
            bcs L1BA0
            lsr L00D1,X
            rts
            
L1B8F:      jsr L0CCD
            bvs L1BA3
            bcs L1B9B
            lda FTYPE
            bne L1BA3
            rts
L1B9B:      lsr L00D1,X
            rts
            
L1B9E:      asl L00D1,X
L1BA0:      asl L00D1,X
            rts
L1BA3:      lda #$01
            sta L00D1,X
            rts
            
L1BA8:      cmp #$16
            bne L1BDE
            lda L00B6,X
            and #$08
L1BB0:      beq L1BB5
            jmp L1DAB
			
L1BB5:      cpy #$0C
            bne L1BC4
            stx DSTAT
            ldy #$00				;Ninja swing, Bruce/Yamo punch sound
            jsr L1DB0				;Stores sound info in memory
            ldx DSTAT
            ldy ATRACT
L1BC4:      cpy #$01
            beq L1BDB
            lda L00A1,X
            cmp #$01
            bne L1BD3
            inc L781E,X
            bne L1BD6
L1BD3:      inc L781B,X
L1BD6:      lda #$16
            jmp L1D9C				;Store some value in player status
			
L1BDB:      jmp L1B76

L1BDE:      cmp #$14
            beq L1BE5
            jmp L1CB6
			
L1BE5:      lda L00B6,X
            and #$01
            beq L1C5C
            jsr L25D9
            lda OLDCHR
            and #$7F
            cmp #$10
            bcs L1C4C
            lda L00A1,X
            ldy OLDADR
            bmi L1BFE
            eor #$01
L1BFE:      cmp #$01
            beq L1C65
            tya
            and #$7F
            cmp #$21
            bcc L1C12
            lda L00A1,X
            eor #$01
            sta L00A1,X
            jmp L1C3C
			
L1C12:      lda L009B
            ldy OLDADR
            bpl L1C1D
            sec
            sbc #$0F
            bne L1C20
L1C1D:      clc
            adc #$0F
L1C20:      sec
            sbc L009B,X
            bcs L1C29
            eor #$FF
            adc #$01
L1C29:      cmp #$05
            bcs L1C2F
            lda #$05
L1C2F:      sta L00D1,X
            lda #$15
            sta L00C2,X
            lda #$00
            sta L00FA,X
            sta L00CB,X
            rts
            
L1C3C:      lda L00A1,X
            cmp #$01
            bne L1C56
            jsr L1806
L1C45:      inc ATRACT
            lda #$14
            jmp L1D9C				;Store some value in player status
			
L1C4C:      lda OLDCHR
            bmi L1C3C
            jsr L2617
            jmp L1B76
			
L1C56:      jsr L17C5
            jmp L1C45
			
L1C5C:      lda L00B6,X
            and #$04
            bne L1C3C
L1C62:      jmp L171C

L1C65:      lda L0092,X
            and #$81
            cmp #$81
            bne L1CA1
            lda OLDADR
            and #$7F
            cmp #$05
L1C73:      bcc L1C12
            cmp #$0C
            bcs L1C86
            jsr L18D6
            lda L00C2,X
            cmp #$11
            bne L1C83
            rts
            
L1C83:      jmp L1B76

L1C86:      cmp #$13
            bcs L1C3C
            lda L00A1,X
            cmp #$01
            beq L1C9D
            lda #$0C
L1C92:      sta L00C2,X
            lda #$0C
            sta L00D1,X
            lda #$00
            sta L00FA,X
            rts
            
L1C9D:      lda #$0D
            bne L1C92
L1CA1:      lda OLDADR
            and #$7F
            cmp #$0D
            bcs L1C3C
            cmp #$05
            bcc L1C73
            lda #$16
            sta L00C2,X
            lda #$13
            sta L00D1,X
            rts
            
L1CB6:      cmp #$15
            bne L1CEF
            lda L00B6,X
            and #$01
            beq L1C62
            lda L00D1,X
            cmp #$01
            bne L1CD9
            lda L00A1,X
            eor #$01
            sta L00A1,X
            lda #$14
            sta L00C2,X
            lda #$00
            sta L00FA,X
            lda #$80
            sta L00D1,X
            rts
            
L1CD9:      lda L00A1,X
            cmp #$01
            bne L1CE7
            jsr L1806
            lda #$15
            jmp L1D9C				;Store some value in player status
			
L1CE7:      jsr L17C5
            lda #$15
            jmp L1D9C				;Store some value in player status
			
L1CEF:      cmp #$12
            bne L1CF6
            jmp L1D9C				;Store some value in player status
			
L1CF6:      cmp #$0F
            bne L1D22
            txa
            beq L1D01
            cpy #$02
            bcc L1D1F
L1D01:      lda L00A1,X
            cmp #$01
            bne L1D13
            jsr L17DE
            lda #$01
            sta L00A1,X
            lda #$0F
            jmp L1D9C				;Store some value in player status
			
L1D13:      jsr L181C
            lda #$00
            sta L00A1,X
            lda #$0F
            jmp L1D9C				;Store some value in player status
			
L1D1F:      jmp L1B76

L1D22:      cmp #$13
            bne L1D5B
            txa
            beq L1D31
            lda BRUCEHP,X
            bmi L1D31
            cpy #$02
            bcc L1D58
L1D31:      lda L00B6,X
            and #$05
            bne L1D3A
            jsr L1791
L1D3A:      lda L00A1,X
            cmp #$01
            bne L1D4C
            jsr L17DE
            lda #$01
            sta L00A1,X
            lda #$13
            jmp L1D9C				;Store got kicked in player status
			
L1D4C:      jsr L181C
            lda #$00
            sta L00A1,X
            lda #$13
            jmp L1D9C				;Store got kicked in player status
			
L1D58:      jmp L1B76

L1D5B:      cmp #$18
            bne L1D9C				;Store some value in player status
L1D5F:      lda L00B6,X
            and #$08
            bne L1D6E
            lda #$01
            sta ATRACT
            lda #$18
            jmp L1D9C				;Store some value in player status
			
L1D6E:      txa
            pha
            lda #$00
            ldy #$27
L1D74:      ora L7821,X
            inx
            inx
            inx
            dey
            bpl L1D74
            tay
            pla
            tax
            tya
            bne L1D95
            lda #$00
            sta DSTAT
            ldx SCRNMBR
            stx ZCHAIN+1
            lda L3FB9,X
            tay
            lda L3FA5,X
            jmp L2774
			
L1D95:      lda L00A1,X
            sta FMSZPG+6
            jmp L1630
			
;Writes to player status and other
L1D9C:      sta L00C2,X				;Store value in player status
            tay						;Same value to Y
            lda L3E6F,Y				;
            sta L00FA,X				;
            dec ATRACT				;
            lda ATRACT				;
            sta L00D1,X				;
            rts
            
L1DAB:      lda #$00
            jmp L18EA

;Stores sound information to be played during VBI and other stuff????			
L1DB0:      lda #$FF
            sta ZCHAIN
            ldx #$03
L1DB6:      lda L008E,X
            cmp #$01
            bcc L1DC8
            bne L1DC0
            stx ZCHAIN
L1DC0:      dex
            bpl L1DB6
            ldx ZCHAIN
            bpl L1DC8
            rts
            
L1DC8:      lda L0D6F,Y
            sta L008E,X
            tya
            asl
            tay
            txa
            asl
            tax
            lda L0D7B,Y
            sta DSKUTL+1,X
            lda L0D7C,Y
            sta ABUFPT,X
            rts
 
;Plays sounds 
L1DDE:      ldy #$32			;
            lda NEWCOL+1,Y		;
            cmp #$44			;
            bne L1DEA			;
            jmp (LD500)
			
L1DEA:      lda L0D6E			;
            bne L1E34			;Clear audio registers
            ldy #$03			;
L1DF1:      sty HOLD1			;
            lda L008E,Y			;
            beq L1E15			;
            tya					;
            asl					;
            tax					;
            inc DSKUTL+1,X		;Point to next frequency
            bne L1E01
            inc ABUFPT,X
L1E01:      lda (DSKUTL+1,X)	;Indexed Indirect pointing to sound address
            cmp #$FF			;
            beq L1E1B			;End of sound
            sta AUDF1,X			;Store frequency
            inc DSKUTL+1,X		;Point to Distortion/Volume
            bne L1E10			;
            inc ABUFPT,X
L1E10:      lda (DSKUTL+1,X)
            sta AUDC1,X			;Store Distortion and Volume
L1E15:      ldy HOLD1
            dey
            bpl L1DF1
            rts
            
L1E1B:      jsr L1E21
            jmp L1E15
			
L1E21:      ldy HOLD1
            lda #$00
            sta L008E,Y
            tya
            asl
            tay
            lda #$00
            sta AUDF1,Y
            sta AUDC1,Y
            rts

;Writes 0 to $D200 - $D208(AUDC1,AUDF1 - AUDC4,AUDF4) and $8E - $91. 			
L1E34:      ldx #$08
            lda #$00
L1E38:      sta AUDF1,X
            cpx #$04
            bcs L1E41
            sta L008E,X
L1E41:      dex
            bpl L1E38
            rts
  
;Draw players, store player color, size
L1E45:      ldx #$02				;
L1E47:      stx DSTAT				;
            lda L0092,X				;Get player status
            and #$01				;
            beq L1E93				;Skip if player not on screen
            lda L0092,X				;
            ora #$02				;Turn on status bit  
            sta L0092,X				;
            lda L009E,X				;
            sta L00BC,X				;Store vertical position
            jsr L1F85				;Stores Player vertical position and calculates High byte for memory
            lda L780C,X				;Index to get sprite table data
            tax						;A -> X
            jsr L1FA9				;Get player graphics addresses, store @ $L1F73(Low Bytes) $L1F74(High Byte)
            stx FMSZPG+6			;X -> $49
            ldx DSTAT				;Current player
            sta L00DD,X				;Not sure???
            lda FMSZPG+6			;Not sure???
            sta L00D7,X				;Not sure???
            tya						;Y = Number of sprite lines to draw
            sta L00E3,X				;Number of lines to draw store here
            jsr L1F72				;Load sprite graphics in to Player/Missile memory
            lda L00F2,X				;Check if a second player/missile needs and update(Bruce, Yamo), >0 is amount used to offset to $78
            beq L1E93				;Skip if Ninja
            lda L009E,X				;Top of player vertical pos. 
            jsr L1F97				;Stores Player vertical position and calculates High byte for second Player/Missile
            lda L780F,X				;Index to get sprite table data
            tax						;
            jsr L1FA9				;Get player graphics addresses,store @ $L1F73(Low Bytes) $L1F74(High Byte)
            stx FMSZPG+6			;$49
            ldx DSTAT				;
            sta L00E0,X				;Not sure???
            lda FMSZPG+6			;???
            sta L00DA,X				;???
            tya						;
            sta L00E6,X				;Number of bytes to store
            jsr L1F72				;Copy sprite info to Player/Missile area
L1E93:      ldx DSTAT				;Get current player
            dex						;Get next player
            bpl L1E47				;Loop untl no more players
            ldx #$02				;
L1E9A:      stx DSTAT				;Current Player
            lda L0092,X				;
            and #$01				;On Screen or Alive?
            beq L1F03				;Skip if not on screen
            lda L009B,X				;Player Horizontal position
            sta L00B9,X				;Store it
            sta ZCHAIN+1			;and here
            lda #$02				;
            sta L00A4,X				;Store 2 here
            lda L00D7,X				;
            cmp #$55				;??? Color????
            bne L1EC1				;
            asl L00A4,X				;
            lda L00A1,X				;
            cmp #$01				;???
            beq L1EC1				;
            lda ZCHAIN+1			;Horizontal position
            sec						;
            sbc #$08
            sta ZCHAIN+1			;store modified horizontal position
L1EC1:      lda L00EF,X				;Index for calculating P/M area for current player
            jsr L1F22				;Stores horizontal position of player
            lda L00D7,X				;Load current player size
            sta FMSZPG+6			;A -> $49
            lda L00DD,X				;Current player color
            sta ZCHAIN+1			;A -> $4B
            lda L00EF,X				;Player index
            jsr L1F09				;Store player size and color
            lda L00F2,X				;Value used to calculate P/M offset
            beq L1F03				;Branch if Ninja
            ldy L7809,X				;Index to ???
            lda L009B,X				;Player horizontal position
            cpy #$05				;?????
            beq L1EEC				;
            cpy #$3F				;
            beq L1EEC				;
            cpy #$43				;
            beq L1EEC				;
            cpy #$19				;
            bne L1EEF				;
L1EEC:      sec						;Set Carry
            sbc #$08				;Subtract 8
L1EEF:      sta ZCHAIN+1			;Store horizontal position of current player
            lda L00F2,X				;Value used to calculate P/M offset
            jsr L1F22				;Stores horizontal position of player
            lda L00DA,X				;Size of current player
            sta FMSZPG+6			;Store at $49
            lda L00E0,X				;Color of current player
            sta ZCHAIN+1			;Store Color in tmep register
            lda L00F2,X				;Horizontal pos. table index
            jsr L1F09				;Store player size and color
L1F03:      ldx DSTAT				;Get current player index
            dex						;Next player
            bpl L1E9A				;Process next player
            rts
  
;Store player size  
L1F09:      sec						;Set carry
            sbc #$03				;Subtract 3
            tax						;A -> X
            lda L42D8,X				;Get player number. $42D8 - $42DB = player 0 - 3
            tax						;Player number -> X
            lda FMSZPG+6			;Load player size
            sta SIZEP0,X			;Store it
            lda ZCHAIN+1			;Load player color
            cpx #$04				;
            beq L1F1F				;Don't store if its already $04
            sta COLPM0,X			;Store player color
L1F1F:      ldx DSTAT				;
            rts
            
;Stores player horizontal position
L1F22:      sec						;Set carry
            sbc #$03				;Subtract 3
            tay						;
            beq L1F32				;If zero process Ninja
            lda L42D8,Y				;
            tay						;
            lda ZCHAIN+1			;Player horizontal pos.
            sta HPOSP0,Y			;Store horizontal position
            rts

;Store all missile Horizontal positions		
L1F32:      lda ZCHAIN+1
            ldy #$03
L1F36:      sta HPOSM0,Y			;Store horizontal position
            clc
            adc L00A4,X
            dey
            bpl L1F36
            rts

;Calculates Sprite positions and erases them			
L1F40:      ldx #$02				;Player index
L1F42:      stx DSTAT				;Store player index
            lda L0092,X				;
            and #$02
            beq L1F6C				;Skip if Player not on screen/alive
            lda L0092,X				;
            eor #$02				;Flip status bit
            sta L0092,X				;Store back in status
            lda L00BC,X				;Load vertical position of current player
            jsr L1F85				;Stores Player vertical position, calculates High byte memory
            lda L00E3,X				;Get sprite height
            tay						;A -> Y
            jsr L1F7C				;Erase sprite at current location
            ldx DSTAT				;Load current player
            lda L00F2,X				;Does current player use multiple Player/Missile locations(Bruce, Yamo)	
            beq L1F6C				;Branch if no
            lda L00BC,X				;Else
            jsr L1F97				;Process second player memory area
            lda L00E6,X				;Second player height
            tay						;A -> Y
            jsr L1F7C				;Erase second sprite at current location
L1F6C:      ldx DSTAT				;Get current player
            dex						;Next player
            bpl L1F42				;Loop through all players
            rts
			
;Draws sprite at specified location. Y = Number of lines to draw           
L1F72:      lda LE000,Y				;Read sprites from this address
            sta LE000,Y				;Store sprites at this address
            dey						;
            bpl L1F72				;Loop until sprites are drawn
            rts
 
;Erases sprite at specified location
L1F7C:      lda #$00				;
L1F7E:      sta LE000,Y				;Store 0 in Player/Missile memory location
            dey						;Point to next location
            bpl L1F7E				;loop
            rts

;Stores Player vertical position and calculates High byte for memory(used to draw and erase sprite)           
L1F85:      sta L1F76				;Stores Player vertical position
            sta L1F7F				;Stores Player vertical position
            lda #$78
            clc
            adc L00EF,X				;Calculates memory offset high byte
            sta L1F77				;Stores for later use
            sta L1F80				;Stores for later use
            rts

;Same as above($1F85), but for second player/missile memory area(Bruce, Yamo use 2 player/missile slots each)            
L1F97:      sta L1F76				;Stores Player vertical position
            sta L1F7F				;Stores Player vertical position
            lda #$78
            clc
            adc L00F2,X				;Calculates memory offset high byte
            sta L1F77				;Stores for later use
            sta L1F80				;Stores for later use
            rts

;Get player graphics addresses 			
L1FA9:      lda L42E7,X				;Load low byte for player graphics
            sta L1F73				;Store low byte
            lda L43B9,X				;Load high byte for player graphics
            sta L1F74				;Address to read sprite bytes from
            ldy L448B,X				;Get number of lines to draw for current sprite
            lda L455D,X				;Not sure
            pha
            lda L45E9,X				;????
            tax
            pla
L1FC1:      rts

;Types of collisions????
L1FC2:      lda L7899,X
            bne L1FC1
            inc L7899,X
            lda L7806,X
            sta L7812,X
            ldy L00A1,X
            lda L00C2,X
            cmp #$0E
            bne L1FE8
            lda L00B6,X
            and #$08
            beq L1FE3
            ldy #$08
            jmp L21E3
			
L1FE3:      ldy #$44
            jmp L21E3
			
L1FE8:      cmp #$1A
            bne L1FFA
            cpy #$01
            bne L1FF5
            ldy #$42
            jmp L21E3
			
L1FF5:      ldy #$40
            jmp L21E3
			
L1FFA:      cmp #$19
            bne L2003
            ldy #$08
            jmp L21E3
			
L2003:      cmp #$18
            bne L201C
            ldy L7812,X
            cpy #$44
            beq L2017
            lda L00D7,X
            ora L00DA,X
            bne L2017
            jmp L21E3
			
L2017:      ldy #$08
            jmp L21E3
			
L201C:      cmp #$1B
            bne L2042
            lda L00D1,X
            cpy #$00
            beq L2034
            cmp #$04
            bcc L202F
            ldy #$38
            jmp L21E3
			
L202F:      ldy #$3A
            jmp L21E3
			
L2034:      cmp #$04
            bcc L203D
            ldy #$3C
            jmp L21E3
			
L203D:      ldy #$3E
            jmp L21E3
			
L2042:      cmp #$13
            bne L2068
            lda L00D1,X
            cmp #$0C
            bcc L205A
            cpy #$00
            bne L2055
            ldy #$3C
            jmp L21E3
			
L2055:      ldy #$38
            jmp L21E3
			
L205A:      cpy #$00
            bne L2063
            ldy #$3E
            jmp L21E3
			
L2063:      ldy #$3A
            jmp L21E3
			
L2068:      cmp #$10
            bne L2071
            ldy #$2A
            jmp L21E3
			
L2071:      cmp #$11
            bne L2083
            cpy #$01
            bne L207E
            ldy #$06
            jmp L21E3
			
L207E:      ldy #$04
            jmp L21E3
			
L2083:      cmp #$12
            bne L2095
            cpy #$01
            bne L2090
            ldy #$2E
            jmp L21E3
			
L2090:      ldy #$2C
            jmp L21E3
			
L2095:      cmp #$16
            bne L20BB
            lda L00D1,X
            cmp #$0B
            bcc L20AD
            cpy #$01
            bne L20A8
            ldy #$34
            jmp L21E3
			
L20A8:      ldy #$30
            jmp L21E3
			
L20AD:      cpy #$01
            bne L20B6
            ldy #$36
            jmp L21E3
			
L20B6:      ldy #$32
            jmp L21E3
			
L20BB:      cmp #$0F
            bne L20CD
            cpy #$01
            bne L20C8
            ldy #$02
            jmp L21E3
			
L20C8:      ldy #$00
            jmp L21E3
			
L20CD:      cmp #$0C
            bne L20E1
            lda L00D1,X
            cmp #$0A
            bcc L20DC
            ldy #$16
            jmp L21E3
			
L20DC:      ldy #$18
            jmp L21E3

L20E1:      cmp #$0D
            bne L20F5
            lda L00D1,X
            cmp #$0A
            bcc L20F0
            ldy #$1A
            jmp L21E3
			
L20F0:      ldy #$1C
            jmp L21E3
			
L20F5:      cmp #$14
            bne L20FF
            cpy #$01
            beq L212B
            bne L210D
L20FF:      cmp #$15
L2101:      bne L2109
L2103:      cpy #$01
            beq L212B
            bne L210D
L2109:      cmp #$03
            bne L2127
L210D:      lda L00B6,X
            and #$04
            beq L2116
            jmp L21C7
			
L2116:      ldy L7806,X
            cpy #$0E
            beq L2122
            ldy #$0E
            jmp L21E3
			
L2122:      ldy #$10
            jmp L21E3
			
L2127:      cmp #$04
            bne L2145
L212B:      lda L00B6,X
            and #$04
            beq L2134
            jmp L21C7
			
L2134:      ldy L7806,X
            cpy #$12
            beq L2140
            ldy #$12
            jmp L21E3
			
L2140:      ldy #$14
            jmp L21E3
			
L2145:      cmp #$05
            bne L2174
            ldy L00D1,X
            cpy #$18
            bcc L2154
            ldy #$08
            jmp L21E3
			
L2154:      cpy #$15
            bcc L215D
            ldy #$1E
            jmp L21E3
			
L215D:      cpy #$03
            bcc L2166
            ldy #$20
            jmp L21E3
			
L2166:      cpy #$01
            bcc L216F
            ldy #$1E
            jmp L21E3
			
L216F:      ldy #$08
            jmp L21E3
			
L2174:      cmp #$06
            bne L218C
            ldy L00D1,X
            cpy #$15
            bcc L2183
L217E:      ldy #$22
            jmp L21E3
			
L2183:      cpy #$04
            bcc L217E
            ldy #$24
            jmp L21E3
			
L218C:      cmp #$07
            bne L21A4
            ldy L00D1,X
            cpy #$15
            bcc L219B
L2196:      ldy #$26
            jmp L21E3
			
L219B:      cpy #$04
            bcc L2196
            ldy #$28
            jmp L21E3
			
L21A4:      cmp #$17
            bne L21B2
            ldy L7812,X
            lda L00AA,X
            beq L21C7
            jmp L21E3
			
L21B2:      cmp #$00
            bne L21C7
            lda L00B6,X
            and #$04
            beq L21D8
            ldy L7812,X
            cpy #$0A
            beq L21D0
            cpy #$0C
            beq L21D0
L21C7:      ldy L7812,X
            cpy #$0A
            beq L21D3
            ldy #$0A
L21D0:      jmp L21E3

L21D3:      ldy #$0C
            jmp L21E3
			
L21D8:      cpy #$01
            beq L21E1
            ldy #$00
            jmp L21E3
			
L21E1:      ldy #$02
L21E3:      tya
            sta L7806,X
            clc
            adc #$01
            sta L7809,X
            lda L0092,X
            rol
            rol
            rol
            and #$03
            tay
            lda L42CF,Y
            clc
            adc L7806,X
            sta L780C,X
            adc #$01
            sta L780F,X
            rts

;Sets collision info.			
L2205:      lda #$00			;
            ldx #$04			;
L2209:      ora P3PF,X			;Missile to player collision
            dex					;Next missile to check
            bne L2209			;Loop
            sta SAVADR			;Store collision status
            sta FMSZPG+6		;and here to
L2213:      lda P0PL,X			;Player to player collision check
            lsr FMSZPG+6		;Shift Missile to player collision right
            bcc L221D			;branch if bit was 0
            ora L42E1			;OR player to player collision with memory
L221D:      sta ADRESS,X		;Store player to player collision info
            inx					;Next register to check
            cpx #$04			;
            bcc L2213			;Loop. P2P collision info stored at $64-$67
            lda #$00			;
            ldx #$02			;
L2228:      sta L00B3,X			;Clear collision status.
            sta L00BF,X			;Clear this adress. What is it????
            dex					;Next address
            bpl L2228			;Loop
            ldy #$04			;
L2231:      ldx L7801,Y			;Test player areas($7801-$7805) - Has to do with player status????
            bmi L223D			;Skip if negative
            lda ADRESS,Y		;Else load collision info
            ora L00B3,X			;OR current status
            sta L00B3,X			;Save status
L223D:      dey					;Next test
            bpl L2231			;Loop
            ldy #$04			;
L2242:      ldx L7801,Y			;Test player areas($7801-$7805)
            bmi L224E			;Skip if negative
            lda L00B3,X			;
            and L42E2,Y			;
            sta L00B3,X			;
L224E:      dey					;
            bpl L2242			;
            ldx #$02			;
L2253:      lda L00B3,X			;
            sta FMSZPG+6		;Sta $49
            ldy #$00			;
L2259:      lsr FMSZPG+6		;Shift Player to Player collision right
            bcs L2268			;Branch if bit was 1
L225D:      iny					;
            cpy #$05			;
            bcc L2259			;
            dex					;
            bpl L2253			;
            jmp L2351			;
			
L2268:      sty ATRACT
            lda L00C2,X
            cmp #$18
            beq L225D
            cmp #$1A
            beq L225D
            cmp #$0F
            beq L225D
            cmp #$13
            beq L225D
            cmp #$19
            beq L225D
            cmp #$1B
            beq L225D
            lda L7801,Y
            bmi L22A1
            tay
            lda L00C2,Y
            cmp #$16
            beq L22A6
            cmp #$11
            beq L22D0
            cmp #$0D
            beq L22EF
            cmp #$0C
            beq L22EF
            cmp #$0E
            beq L2315
L22A1:      ldy ATRACT
            jmp L225D
			
L22A6:      lda L00D1,Y
            cmp #$08
            bcs L22A1
            lda #$04
            sta OLDCOL+1
            jsr L2456
            bcc L22A1
            bmi L22A1
            txa
            pha
            tya
            pha
            ldy #$02			;Ninja hit someone sound
            jsr L1DB0			;Stores sound info in memory
            pla
            tay
            pla
            tax
            jsr L2341
            lda L00BF,X
            ora #$02
            sta L00BF,X
            bne L22A1
L22D0:      lda #$06
            sta OLDCOL+1
            jsr L2456
            bcc L22A1
            bmi L22A1
            jsr L2624
            jsr L2341
            lda L00BF,X
            ora #$04
            cpy #$00
            bne L22EB
            ora #$80
L22EB:      sta L00BF,X
            bne L22A1
L22EF:      lda L00D1,Y
            cmp #$0A
            bcs L233E
            lda #$06
            sta OLDCOL+1
            jsr L2456
            bcc L233E
            bmi L233E
            jsr L2624
            jsr L2341
            lda L00BF,X
            ora #$08
            cpy #$00
            bne L2311
            ora #$80
L2311:      sta L00BF,X
            bne L233E
L2315:      lda L009E,X
            sec
            sbc L009E,Y
            cmp #$0A
            bmi L233E
            bcc L233E
            lda L00C2,X
            cmp #$0C
            beq L233E
            cmp #$0D
            beq L233E
            cmp #$11
            beq L233E
            jsr L2624
            lda L00BF,X
            ora #$10
            cpy #$00
            bne L233C
            ora #$80
L233C:      sta L00BF,X
L233E:      jmp L22A1

L2341:      lda L00BF,Y
            ora #$01
            sta L00BF,Y
            lda L00A1,Y
            eor #$01
            sta L00A1,X
            rts
			
;This routine might be updating hit points based on collisions???           
L2351:      ldx #$02				;Load index of someone(Bruce, Yamo, or Ninja)
L2353:      stx DSTAT				;Store player value in DSTAT
            lda L00BF,X				;Who was hit?
            and #$01				;What type of collision?
            beq L239C
            lda #$00
            sta L00C2,X
            lda #$04
            sta L00FA,X
L2363:      lda #$18
            sta L00D1,X
            inc L7899,X
            txa
            beq L2385
            jsr L0CCD
            bvs L2381
            bcs L237B
            lda FTYPE
            bne L2381
            jmp L239C
			
L237B:      lda #$10
            sta L00D1,X
            bne L239C
L2381:      lda #$02
            sta L00D1,X
L2385:      jsr L0CCD
            bvs L2398
L238A:      bcs L2392
            lda #$04
            sta L00D1,X
            bne L239C
L2392:      lda #$0C
            sta L00D1,X
L2396:      bne L239C
L2398:      lda #$10
            sta L00D1,X
L239C:      lda L00BF,X
            and #$02				;Ninja stick hit?			
            beq L23B3
            lda BRUCEHP,X
            sec
            sbc #$02				;-2 usually means Ninja stick hit			
            sta BRUCEHP,X
            bmi L2426
            lda #$0F
            sta L00C2,X
            lda #$05
            sta L00D1,X
L23B3:      lda L00BF,X
            and #$04				;Bruce or Yamo punch
            beq L23D7
            lda L00BF,X
            bpl L23C6
            lda #$64
            ldx #$02
            jsr L2917
            ldx DSTAT
L23C6:      lda BRUCEHP,X
            sec
            sbc #$03				;-3 could be Yamo, or Bruce punch
            sta BRUCEHP,X
            bmi L2426
            lda #$0F
            sta L00C2,X
            lda #$08
            sta L00D1,X
L23D7:      lda L00BF,X
            and #$08
            beq L23FB
            lda L00BF,X
            bpl L23EA
            lda #$4B
            ldx #$02
            jsr L2917
            ldx DSTAT
L23EA:      lda BRUCEHP,X
            sec
            sbc #$07
            sta BRUCEHP,X			;-7 is Yamo or Bruce Kick
            bmi L2426
            lda #$13
            sta L00C2,X
            lda #$18
            sta L00D1,X
L23FB:      lda L00BF,X
            and #$10
            beq L241F
            lda L00BF,X
            bpl L240E
            lda #$32
            ldx #$02
            jsr L2917
            ldx DSTAT
L240E:      lda BRUCEHP,X
            sec
            sbc #$05
            sta BRUCEHP,X			;-5 from someone's hit points, someone has been fallen on
            bmi L2426
            lda #$1B
            sta L00C2,X
            lda #$08
            sta L00D1,X
L241F:      dex						;X = next player to test
            bmi L2425				;If no more players leave routine
            jmp L2353				;Test next player for collisions	
L2425:      rts

L2426:      lda L00BF,X
            and #$80
            beq L2449
            stx DSTAT
            cpx #$01
            bne L2442
            lda #$01
            tax
            jsr L2917
            lda #$C2
            ldx #$02
            jsr L2917
            jmp L2449
			
L2442:      lda #$C8
            ldx #$02
            jsr L2917
L2449:      ldx DSTAT
            lda #$13
            sta L00C2,X
            lda #$18
            sta L00D1,X
            jmp L23FB
			
L2456:      lda L009B,Y
            sec
            sbc L009B,X
            pha
            php
            lda L00A1,Y
            cmp #$01
            bne L246D
            plp
            pla
            eor #$FF
            adc #$01
            pha
            php
L246D:      plp
            pla
            cmp OLDCOL+1
            rts
            
L2472:      lda OLDCOL
            bmi L247B
            dec OLDCOL
            beq L2494
            rts
            
L247B:      and #$7F
            sec
            sbc #$01
            beq L2487
            ora #$80
            sta OLDCOL
            rts
            
L2487:      ldx L39C2
            lda L40A9,X
            sta OLDCOL
            dec LOGCOL
            bmi L24B6
            rts
            
L2494:      lda #$92
            sta KEYDEF+1
            lda #$39
            sta SWPFLG
            lda SCRNMBR
            cmp #$0A
            bcc L24AA
            lda #$AA
            sta KEYDEF+1
            lda #$39
            sta SWPFLG
L24AA:      ldx L39C2
            lda L40A9,X
            sta OLDCOL
            dec LOGCOL
            bpl L24D2
L24B6:      dec L39C2
            bpl L24C6
            ldx #$07
            stx L39C2
            lda PALNTS
            eor #$01
            sta PALNTS
L24C6:      ldx L39C2
            lda L40A9,X
            sta OLDCOL
            lda #$10
            sta LOGCOL
L24D2:      lda PALNTS
            bne L24E0
            inc OLDADR+1
            lda OLDADR+1
            cmp #$08
            bcc L24EB
            bcs L24E7
L24E0:      dec OLDADR+1
            bpl L24EB
            lda #$07
            ;bit $00A9 - Doesn't assemble correctly - Had to use line below
            .byte $2C,$A9,$00
            sta OLDADR+1
L24EB:      ldx #$02
L24ED:      stx DSTAT
            txa
            asl
            asl
            asl
            clc
            adc KEYDEF+1
            sta L251C
            lda SWPFLG
            adc #$00
            sta L251D
            txa
            clc
            adc #$61
            sta L3A2B
            jsr L12F9
            lda L3A2B
            sta BUFADR
            lda L3A2A
            clc
            adc KEYDEF
            sta BUFADR+1
            ldy #$00
            ldx OLDADR+1
L251B:      lda LE000,X
            sta (BUFADR),Y
            iny
            inx
            cpx #$08
            bne L2528
            ldx #$00
L2528:      cpy #$08
            bne L251B
            ldx DSTAT
            dex
            bpl L24ED
            rts
 
;Finds lowest vertical player position
L2532:      ldx #$02			;
            lda #$00			;
            sta OLDROW			;
L2538:      lda L0092,X			;
            and #$01			;
            beq L2546			;Is current player on screen? Branch if no
            lda L009E,X			;Load verticle position of current player
            cmp OLDROW			;
            bcc L2546			;Branch if player position < OLDROW
            sta OLDROW			;Store new lowest vertical position
L2546:      dex					;Next player
            bpl L2538			;Loop
            lda OLDROW			;Lowest vertical player position
            lsr					; /2 - Two scanlines per row
            clc					;
            adc #$0C			;
            sta OLDROW			;Save calculated screen row
            rts
            
;Checks for dead players
L2552:      ldx #$02
L2554:      lda L0092,X				;Current player status
            and #$01				;
            beq L2572				;Skip if player not on screen
            lda L00C2,X				;Player status
            cmp #$13				;Player Falling from punch or kick?
            beq L2564				;
            cmp #$19				;Player died from Playfield collision(e.g. spike)
            bne L2568				;
L2564:      lda L00D1,X				;Alive or dead status???
            bne L2572				;
L2568:      lda BRUCEHP,X			;Get player hit points
            bpl L2572				;Branch if hit points positive
            txa						;X -> A
            beq L2576				;If player is Bruce and hit points negative
            jsr L27E8				;Hit poitns negative but player is not Bruce
L2572:      dex						;Next player
            bpl L2554				;Process next player
            rts
            
L2576:      jmp L1210				;Out of hit points, lose a life

;Possibly has something to do with players on the screen????
L2579:      ldx #$02				;Index = 2
L257B:      lda BRUCEHP,X			;X = 2 is Ninja. X =1 is Yamo, X = 0 is Bruce.
            bmi L25B8				;Skip player with negative hit points
            lda L398F				;Computer/Opponent status
            bne L258C				;Branch if Opponent controls Yamo
            lda L0092,X
            and #$81
            cmp #$81
            beq L2594
L258C:      lda L0092,X
            and #$41
            cmp #$41
            bne L25B8
L2594:      lda L00C2,X
            cmp #$00
            bne L25B8
            lda L00D1,X
            bne L25B8
            lda L00B6,X
            and #$05
            beq L25B8
            lda L00C5,X
            cmp #$0D
            beq L25BC
            cmp #$0C
            beq L25BC
            lda #$14
            sta L00C2,X
            sta L00D1,X
            lda #$00
            sta L00FA,X
L25B8:      dex
            bpl L257B
            rts
            
L25BC:      jsr L1B76
            lda #$18
            sta L00D1,X
            jsr L0CCD
            bvs L25D4
            bcs L25CF
            lda FTYPE
            bne L25D4
            rts
            
L25CF:      lda #$03
            sta L00D1,X
            rts
            
L25D4:      lda #$01
            sta L00D1,X
            rts
            
L25D9:      lda L009E,X
            sec
            sbc L009E
            php
            bcs L25E5
            eor #$FF
L25E3:      adc #$01
L25E5:      cmp #$31
            bcc L25EB
            lda #$30
L25EB:      plp
            bcs L25F0
            ora #$80
L25F0:      sta OLDCHR
            lda L009B,X
            sec
            sbc L009B
            php
L25F8:      bcs L25FE
            eor #$FF
            adc #$01
L25FE:      cmp #$31
            bcc L2604
            lda #$30
L2604:      plp
            bcs L2609
            ora #$80
L2609:      sta OLDADR
            rts
            
L260C:      lda #$00
            sta L00C2,X
L2610:      lda #$00
            sta L00D1,X
            sta L00FA,X
            rts
            
L2617:      lda OLDADR
            bpl L261F
            lda #$01
            bne L2621
L261F:      lda #$00
L2621:      sta L00A1,X
            rts
    
;Someone got kicked, punched, dragon fireballs, or fallen on	
L2624:      pha
            txa
            pha
            tya
            pha
            ldy #$03			;Got kicked/punched/fallen on/dragon fireballs sound
            jsr L1DB0			;Stores got kicked sound in mmemory area????
            pla
            tay
            pla
            tax
            pla
            rts
            
;
L2634:      ldx #$02
L2636:      stx DSTAT
            lda L0092,X
            and #$01
            beq L265E
            lda L00C2,X
            cmp #$19
            beq L265E
            cmp #$17
            bne L264B
            jsr L260C
L264B:      lda L00B6,X
            and #$02
            sta DRKMSK
            jsr L15A4
            jsr L2664
            ldx DSTAT
            inc L00EC,X			;$EC = current lamp row
            jsr L2664
L265E:      ldx DSTAT
            dex
            bpl L2636
            rts
			
; 
L2664:      lda L00EC,X
            tax
            jsr L13B7
            ldx DSTAT
            ldy L00E9,X
            lda #$02
            sta FMSZPG+6
L2672:      lda (RTCLOK+1),Y
            jsr L267D
            iny
            dec FMSZPG+6
            bpl L2672
            rts
            
L267D:      cmp #$85
            bne L2684
            jmp L2761
			
L2684:      cmp #$82
            bne L268B
            jmp L2722
			
L268B:      cmp #$83
            bne L2692
            jmp L2737
			
L2692:      cmp #$84
            bne L2699
            jmp L274C
			
L2699:      cmp #$62
            beq L26E8
L269D:      cmp #$2D
            beq L26DE
            cmp #$2E
            beq L26DE
            asl DRKMSK
            beq L26DD
            cmp #$93
            beq L26F8
            cmp #$94
            beq L26FF
            cmp #$B1
            beq L2706
            cmp #$E4
            beq L26F5
            cmp #$E6
            beq L26EE
            cmp #$8F
            beq L26F5
            cmp #$C0
            beq L26F5
            cmp #$D7
            beq L26D1
            cmp #$D4
            bcc L26DD
            cmp #$DB
            bcc L26F5
L26D1:      cmp #$F1
            bcc L26D9
            cmp #$FD
            bcc L26F5
L26D9:      cmp #$E0
            beq L26EB
L26DD:      rts

L26DE:      lda SCRNMBR
            cmp #$10
            beq L26E5
            rts
            
L26E5:      jmp L27BD

L26E8:      jmp L28AF

L26EB:      jmp L2824

L26EE:      lda SCRNMBR
            cmp #$0A
            bcs L26F5
            rts
            
L26F5:      jmp L280B

;Removes lamps from table memory, updates score, and other stuff????
L26F8:      txa
            bne L26DD
            lda #$9E
            bne L270B
L26FF:      txa
            bne L26DD
            lda #$9F
            bne L270B
L2706:      txa
            bne L26DD
            lda #$92
L270B:      sta (RTCLOK+1),Y
            jsr L0868
            jsr L2A80			;Decrements number of Lamps and writes a zero to lamp table where lamp was
            lda #$7D
            ldx #$02
            jsr L2917			;Updates score and other stuff????
            ldy #$04			;Lamp collision sound
            jsr L1DB0			;Stores sound info in memory
            jmp L086F			;
			
L2722:      jsr L2877
            bcs L26DD
            ldx SCRNMBR
            lda L3F55,X
            sta ZCHAIN+1
            lda L4009,X
            tay
            lda L3FF5,X
            bne L2774
L2737:      jsr L2877
            bcs L26DD
            ldx SCRNMBR
            lda L3F69,X
            sta ZCHAIN+1
            lda L4031,X
            tay
            lda L401D,X
            bne L2774
L274C:      jsr L2877
L274F:      bcs L26DD
            ldx SCRNMBR
            lda L3F7D,X
L2756:      sta ZCHAIN+1
            lda L4059,X
            tay
            lda L4045,X
L275F:      bne L2774
L2761:      jsr L2877
            bcs L274F
            ldx SCRNMBR
            lda L3F91,X
            sta ZCHAIN+1
            lda L4081,X
            tay
            lda L406D,X
L2774:      ldx DSTAT
            beq L2780
            jsr L27E8
            pla
            pla
            jmp L265E

;			
L2780:      sta L009B,X				;Players horizontal position
            tya						;
            sta L009E,X				;Players vertical position
            lda ZCHAIN+1			;Temp screen number
            sta SCRNMBR				;Save screen number
            ldx #$02				;
L278B:      lda L0092,X
            and #$01
            beq L279F
            lda BRUCEHP,X			;Player hit points
            sta L008B,X
            lda L009B
            sta L0087,X
            lda L009E
            sta L0089,X
            bne L27A5
L279F:      lda #$00
            sta L0087,X
            sta L0089,X
L27A5:      jsr L27E8
            dex
            bne L278B
            jsr L09A5
            ldx #$FF
            txs
            jsr L1F40
            jsr L06F3
            jsr L1E45			;Draw players, store player color, size
            jmp L1508
			
L27BD:      txa
            beq L27C1
L27C0:      rts

;Increase lives from Yin-Yang collection
L27C1:      lda L009E
            cmp #$A0
            bcc L27C0
            ldx RTCLOK
            dec L4278,X
            inc LIVES
            jsr L141D			;Computes LIVES packed bytes and stores in screen memory
            ldy #$04			;Play Lamp sound
            jsr L1DB0			;Stores sound info in memory
L27D6:      lda #$56			;----------------------------------------
            ldx #$0A			;
            ldy #$24			;Erase Yin-Yang from screen
            jsr L11E2			;----------------------------------------
            lda #$56			;----------------------------------------
            ldx #$0B			;
            ldy #$24			;Erase Yin-Yang from screen
            jmp L11E2			;----------------------------------------	
			
;Negative hit points but player tested is not Bruce
L27E8:      lda #$01			;
            eor #$FF			;$FE
            and L0092,X			;Mask off low bit because player died
            sta L0092,X			;Store
            lda L00EF,X			;
            beq L27FC
            jsr L0A84
            lda #$FF
            sta L7801,Y
L27FC:      lda L00F2,X
            beq L2808
            jsr L0A84
            lda #$FF
            sta L7801,Y
L2808:      jmp L09A5

;Death sound from white stick things
L280B:      pha
            txa
            pha
            tya
            pha
            ldy #$08			;White stick things collision sound
            jsr L1DB0			;Stores sound info in memory
            pla
            tay
            pla
            tax
            pla
            ldx DSTAT
            beq L2821
            jmp L27E8
			
L2821:      jmp L3765

L2824:      lda L789C
            bne L283F
            lda #$01
            sta L789C
            lda L00EC,X
            sta L78A2
            sty L789F
            dec L789F
            dec L78A2
            jmp L2872
			
L283F:      lda L789D
            bne L285A
            lda #$01
            sta L789D
            lda L00EC,X
            sta L78A3
            sty L78A0
            dec L78A0
            dec L78A3
            jmp L2872
			
L285A:      lda L789E
            bne L2876
            lda #$01
            sta L789E
            lda L00EC,X
            sta L78A4
            sty L78A1
            dec L78A1
            dec L78A4
L2872:      lda #$60
            sta (RTCLOK+1),Y
L2876:      rts

L2877:      lda SCRNMBR
            cmp #$0B
            beq L28AD
            sec
            lda L009B,X
            cmp #$32
            bcs L2889
            lda L781B,X
            bne L28AD
L2889:      lda #$C6
            cmp L009B,X
            bcs L2894
            lda L781E,X
            bne L28AD
L2894:      lda #$C8
            cmp L009E,X
            bcs L28A0
            lda L00C2,X
            cmp #$0E
            beq L28AD
L28A0:      lda L009E,X
            cmp #$34
            bcs L28AB
            lda L7815,X
            bne L28AD
L28AB:      sec
            rts
            
L28AD:      clc
            rts
            
L28AF:      lda L00C2,X
            cmp #$19
            beq L28C9
            lda L00B6,X
            and #$04
            beq L28C9
            lda #$17
            sta L00C2,X
            lda #$10
            sta L00D1,X
            lda #$00
            sta L00FA,X
            sta L00AA,X
L28C9:      lda (RTCLOK+1),Y
            jmp L269D

;Updates score and other stuff????			
L28CE:      ldx #$02
            clc
L28D1:      lda FEOF,X
            adc ICSTAZ,X
            sta FEOF,X
            dex
            bpl L28D1
            ldx #$00
L28DC:      lda FEOF,X
            cmp L3A01,X
            bcc L28FC
            inx
            cpx #$03
            bcc L28DC
            ldx #$02
            clc
L28EB:      lda L3A01,X
            adc L39FD,X
            sta L3A01,X
            dex
            bpl L28EB
            inc LIVES			;Increments Bruce Lives
            jsr L141D			;Updates LIVES packed bytes and stores in screen memory
L28FC:      jsr L2A4E			;Updates player score and stores in screen memory
            ldy #$3C			;Position on screen
            lda L3A0B			;Values to store(Packed byte)
            jsr L1447			;Stores Score bytes on screen
            ldy #$3E			;Position on screen
            lda L3A0C			;Values to store(Packed byte)
            jsr L1447			;Stores Score bytes on screen
            ldy #$40			;Position on screen
            lda L3A0D			;Values to store(Packed byte)
            jmp L1447			;Stores Score bytes on screen

;			
L2917:      pha
            lda #$00
            sta ICSTAZ
            sta ICBALZ
            sta ICBAHZ
            pla
            sta ICSTAZ,X
            jmp L28CE			;Updates score and other stuff????

;Computes High Score and displays on screen			
L2926:      lda L00F8			;
            beq L28FC			;Compute 1up score
            ldx #$00			;
L292C:      lda L39F7,X			;Get high score byte
            cmp FEOF,X			;Compare to current score
            bcc L293E			;branch if new high score
            beq L2937			;if equal compare next byte
            bcs L28FC			;if not equal, no high score just update regular score
L2937:      inx					;
            cpx #$03			;Checked all bytes?
            bcc L292C			;Loop
            bcs L28FC			;
L293E:      ldx #$03			;Three bytes for high score
L2940:      lda FEOF,X			;$39, $40, $41
            sta L39F7,X			;Stores new high score
            dex					;
            bpl L2940			;loop
L2948:      ldx #$03			;
L294A:      lda L39F7,X			;	
            sta L3A07,X			;Copy score here
            lda #$00			;
            sta L3A0A,X			;Clear this address for 
            dex					;computing decimal values below
            bpl L294A			;loop
            sta L3A0D			;$3A0D = 0
            php
            sed					;Set decimal mode for screen display
            ldx #$17			;------------------------------
L295F:      asl L3A09			;
            rol L3A08			;Converts hex
            rol L3A07			;values to 	
            ldy #$03			;4 packed bytes
L296A:      lda L3A0A,Y			;and saves them in
            adc L3A0A,Y			;$3A0A - $3A0D
            sta L3A0A,Y			;
            dey					;
            bpl L296A			;
            dex					;
            bpl L295F			;-------------------------------
            plp
            ldy #$48			;Position on screen
            lda L3A0B			;Values to store(Packed byte)
            jsr L1447			;Stores Score bytes on screen
            ldy #$4A			;Position on screen
            lda L3A0C			;Values to store(Packed byte)
            jsr L1447			;Stores Score bytes on screen
            ldy #$4C			;Position on screen
            lda L3A0D			;Values to store(Packed byte)
            jmp L1447			;Stores Score bytes on screen

;Saves Hi nibble value in Low nibble		
            bcs L2998			;
L2994:      lsr					;
            lsr					;
            lsr					;
            lsr					;
L2998:      and #$0F			;Mask off high nibble in to low nibble
            rts

;			
L299B:      lda #$FF
            sta FMSZPG+5		;$FF in keyboard code = no key press
            lda #$00			;
            sta DSTAT			;Index of current player????
            txa					;
            sta ZCHAIN+1		;
            lda L3FB9,X			;
            tay					;
            lda L3FA5,X			;
            jmp L2774			;
			
L29B0:      ldx #$02
            stx DSTAT
L29B4:      ldx DSTAT
            lda L789C,X
            beq L2A36
            inc L789C,X
            cmp #$0C
            bne L29E5
            jsr L2A3E			;Play electricity sound	
L29C5:      ldx DSTAT			;----------------------------------------
            ldy L789F,X			;
            lda L78A2,X			;
            tax					;Shoots electricity? out of the ground
            lda #$2F			;when players run over Frame 1 and 3
            jsr L11E2			;----------------------------------------
            ldx DSTAT			;----------------------------------------
            ldy L789F,X			;
            lda L78A2,X			;
            tax					;
            inx					;Shoots electricity? out of the ground
            lda #$30			;when players run over Frame 1 and 3
            jsr L11E2			;----------------------------------------
            jmp L2A36
            
L29E5:      cmp #$12
            bne L2A07
            ldy L789F,X			;----------------------------------------
            lda L78A2,X			;Shoots electricity? out of the ground
            tax					;when players run over Frame 2
            lda #$31			;
            jsr L11E2			;----------------------------------------
            ldx DSTAT			;----------------------------------------
            ldy L789F,X			;Shoots electricity? out of the ground
            lda L78A2,X			;when players run over Frame 2
            tax					;
            inx					;
            lda #$32			;
            jsr L11E2			;----------------------------------------
            jmp L2A36
            
L2A07:      cmp #$18
            beq L29C5
            cmp #$1E
            bne L2A2D
            ldy L789F,X			;----------------------------------------
            lda L78A2,X			;Restores graphics back to normal after
            tax					;Electricity? has shot out from the
            lda #$00			;ground
            jsr L11E2			;----------------------------------------
            ldx DSTAT			;----------------------------------------
            ldy L789F,X			;Restores ground back to normal after
            lda L78A2,X			;Electricity? has shot out from the
            tax					;ground
            inx					;
            lda #$33			;
            jsr L11E2			;----------------------------------------
            jmp L2A36
            
L2A2D:      cmp #$24
            bne L2A36
            lda #$00
            sta L789C,X
L2A36:      dec DSTAT
            bmi L2A3D
            jmp L29B4
            
L2A3D:      rts

;Play electricity sound
L2A3E:      pha
            txa
            pha
            tya
            pha
            ldy #$05			;Play electricity sound
            jsr L1DB0			;Stores sound info in memory
            pla
            tay
            pla
            tax
            pla
            rts

;Computes player Score and stores it on screen            
L2A4E:      ldx #$02			;
L2A50:      lda FEOF,X			;Load score byte
            sta L3A07,X			;Store score byte
            lda #$00			;
            sta L3A0A,X			;Clear memory
            dex				;
            bpl L2A50			;Loop
            sta L3A0D			;Store 
            php
            sed				;Set decimal mode for screen display
            ldx #$17			;-------------------------------
L2A64:      asl L3A09			;
            rol L3A08			;
            rol L3A07			;Converts hex
            ldy #$03			;values to
L2A6F:      lda L3A0A,Y			;4 packed bytes
            adc L3A0A,Y			;and saves them in
            sta L3A0A,Y			;$3A0A - $3A0D
            dey				;
            bpl L2A6F			;
            dex				;
            bpl L2A64			;
            plp				;-------------------------------
            rts

;Decrements Lamp values based on screen number and writes a zero to lamp table where lamp was	
L2A80:      ldx DSTAT			;???? - Not screen number
            lda L00EC,X			;Row of lamp collision
            sta RMARGN			;
            sty LMARGN			;Column of lamp collision
            ldx SCRNMBR			;
            dec ICBLLZ,X		;Decrement number of lamps on screen using screen number as index
            txa				;Screen number 
            asl				;Multiply by 2
            tax				;Store in X
            lda L40C5,X			;Get lamp index based on screen number(Low byte)
            sta DSKFMS+1		;Store
            lda L40C6,X			;Get lamp index based on screen number(High byte)
            sta DSKUTL			;Store
            ldy #$00			;Index in to lamp table
L2A9B:      lda #$01			;
            sta ROWCRS			;Reset match value - When a match is found ROWCRS = 1
            lda (DSKFMS+1),Y	;Index in to the lamp table
            bmi L2AC1			;If negative value return
            bne L2AA7			;Branch if 1, possible address match
            lsr ROWCRS			;Set to zero - no match
L2AA7:      iny					;
            iny					;point to next address
            lda (DSKFMS+1),Y	;Load column value
            cmp LMARGN			;Compare with current lamp column value
            beq L2AB1			;Branch if columns match
            lsr ROWCRS			;Set to zero - no match found
L2AB1:      iny					;Next address is row value
            lda (DSKFMS+1),Y	;Load row value
            cmp RMARGN			;Compare with current lamp row value
            beq L2ABA			;Branch if 
            lsr ROWCRS			;Set to zero - no match found
L2ABA:      lda ROWCRS			;Load match value
            bne L2AC2			;Branch if Lamp address match found(ROWCRS = 1)
            iny					;index for next address
            bne L2A9B			;Loop and test next address
L2AC1:      rts					;

L2AC2:      dey					;
            dey					;
            dey					;Decrement Y for proper address
            lda #$00			;
            sta (DSKFMS+1),Y	;And store 0, for a removed lamp
            rts
            
L2ACA:      lda SCRNMBR
            asl
            tax
            lda L40C5,X
            sta DSKFMS+1
            lda L40C6,X
            sta DSKUTL
            ldy #$00
L2ADA:      lda (DSKFMS+1),Y
            bmi L2B00
            bne L2AFA
            iny
            lda (DSKFMS+1),Y
            pha
            iny
            lda (DSKFMS+1),Y
            pha
            iny
            sty ATRACT
            lda (DSKFMS+1),Y
            tax
            jsr L13B7
            pla
            tay
            pla
            sta (RTCLOK+1),Y
            ldy ATRACT
            bne L2AFD
L2AFA:      iny
            iny
            iny
L2AFD:      iny
            bne L2ADA
L2B00:      ldx #$04
            lda #$00
L2B04:      sta L427A,X
            dex
            bpl L2B04
            lda SCRNMBR
            asl
            tax
            lda L4280,X
            pha
            lda L427F,X
            pha
            rts
            
;Not sure what this code does. Could be a checksum, or a memory test?????
L2B17:      lda #$13
            sta ZCHAIN+1
L2B1B:      lda ZCHAIN+1
            asl
            tax
            jsr L2B27
            dec ZCHAIN+1
            bpl L2B1B
            rts
			
;Continues from above. This code might not be necessary. Have play tested it all the way through without.            
L2B27:      lda L40C5,X
            sta DSKFMS+1
            lda L40C6,X
            sta DSKUTL
            ldy #$00
L2B33:      lda (DSKFMS+1),Y
            bmi L2B41
            lda #$01
            sta (DSKFMS+1),Y
            jsr L319C
            jmp L2B33
L2B41:      rts

            rts
            
            jsr L30A9
            beq L2B4B
            jmp (LD500)
            
L2B4B:      lda #$03
            sta L427A
            rts
            
            lda #$03
            sta L427A
            rts
            
            lda #$1F
            sta L427D
            lda #$01
            sta BITMSK
            lda #$0B
            sta ROWAC+1
            lda #$0B
            sta SHFAMT
            lda #$07
            sta COLAC
            sta COLAC+1
            lda #$1A
            sta ROWAC
            lda #$FF
            sta ENDPT
            sta ENDPT+1
            lda #$F4
            sta DELTAR
            rts
            
            lda #$1B
            sta BITMSK
            sta SHFAMT
            lda #$01
            sta ROWAC
            lda #$09
            sta ROWAC+1
            lda #$0A
            sta COLAC
            lda #$05
            sta COLAC+1
            lda #$FF
            sta ENDPT
            lda #$FC
            sta ENDPT+1
            lda #$F8
            sta DELTAR
            rts
            
            lda #$05
            sta BUFCNT
            sta BUFSTR+1
            lda #$0B
            sta BUFSTR
            lda #$22
            sta BITMSK
            lda #$04
            sta ROWAC+1
            lda #$FF
            sta ENDPT
            rts
            
            lda #$06
            sta BITMSK
            lda #$1B
            sta SHFAMT
            lda #$05
            sta ROWAC+1
            sta COLAC
            lda #$FF
            sta ENDPT
            lda #$F2
            sta ENDPT+1
            rts
            
            lda #$04
            sta BUFCNT
            sta BUFSTR+1
            lda #$0C
            sta BUFSTR
            lda #$10
            sta BITMSK
            sta SHFAMT
            lda #$05
            sta ROWAC+1
            lda #$06
            sta COLAC
            lda #$FC
            sta ENDPT
            lda #$FF
            sta ENDPT+1
            rts
            
            lda #$01
            sta L427A
L2BF4:      rts

            ldx #$04
L2BF7:      lda #$02
            sta L0100,X
            lda #$82
            sta L0105,X
            dex
            bpl L2BF7
            lda #$00
            sta L0109
            sta L0103
            lda #$06
            sta L0129
            sta L010F
            sta L0123
            sta L012D
            sta L012E
            lda #$02
            sta L010C
            sta L0120
            sta L012A
            sta L012C
            ldx FTYPE
            bne L2C31
            lda #$06
L2C31:      sta L0111
            sta L0125
            sta L012F
            lda #$12
            ldx FTYPE
            bne L2C42
            lda #$14
L2C42:      sta L0128
            sta L0139
            lda #$15
            ldx FTYPE
            bne L2C50
            lda #$13
L2C50:      sta L010B
            sta L011F
            sta L0133
            lda #$16
            sta L0110
            sta L0124
            sta L010E
            sta L0122
            ldx FTYPE
            bne L2C6D
            lda #$14
L2C6D:      sta L0112
            sta L0126
            sta L0130
            lda #$21
            sta L010A
            sta L011E
            sta L0132
            ldx FTYPE
            beq L2C87
            lda #$25
L2C87:      sta L0134
            sta L0136
            lda #$26
            ldx FTYPE
            bne L2C95
            lda #$22
L2C95:      sta L0137
            sta L0138
            sta L013A
            lda #$05
            sta L0119
            sta L011A
            lda #$07
            sta L0114
            sta L011B
            lda #$0A
            sta L0115
            sta L011C
            lda #$0C
            sta L0116
            sta L0118
            rts
            
            lda #$01
            sta L427A
            rts
            
            lda #$01
            sta L427A
            sta L427B
            sta L427C
            rts
            
            ldx RTCLOK
            lda L4278,X
            bne L2CDB
            jsr L27D6
L2CDB:      rts

            lda #$01
            sta L427A
            sta L427B
            lda #$08
            sta BITMSK
            sta SHFAMT
            sta ROWAC
            lda #$03
            sta ROWAC+1
            lda #$05
            sta BUFSTR
            lda #$07
            sta COLAC
            lda #$09
            sta COLAC+1
            lda #$0B
            sta BUFCNT
            lda #$F8
            sta ENDPT
            lda #$F1
            sta ENDPT+1
            lda #$EA
            sta DELTAR
            rts
            
            lda #$01
            sta L427A
            sta L427B
            lda #$00
            sta SIZEP2
            sta SIZEP3
            sta L39CF
            sta L39D0
            sta L39D1
            lda #$1B
            sta L39D2
            lda #$06
            sta L39D7
            lda #$07
            sta L39D8
            rts

;Checks I/O, checks lamp status, and other stuff????          
L2D36:      jsr L30A9			;Checks for I/O
            bne L2D36			;Loop forever
            lda ICAX5Z			;A = address $2E
            bne L2D71
            lda DELTAC+1
            bne L2D71
            dec L427A
            bpl L2D71
            lda L427B
            bne L2D60
            ldy #$0A			;Play cow moo sound screen 0
            jsr L1DB0			;Stores sound info in memory
            lda #$1D			;---------------------------------------
            ldx #$09			;Makes cow moo on screen 0
            ldy #$07			;
            jsr L11E2			;---------------------------------------
            inc L427B
            bne L2D71
L2D60:      lda #$1E			;---------------------------------------
            ldx #$09			;Makes cow moo on screen 0
            ldy #$07			;
            jsr L11E2			;---------------------------------------
            dec L427B
            lda #$05
            sta L427A
L2D71:      rts

;Have all lamps been collected from rooms 0,1,& 2? Opens floor if so
            lda DELTAC+1		;
            bne L2D9E			;Branch if zero????
            lda L427A			;
            bmi L2D9E			;
            lda ICAX5Z			;Load lamp count from screen 6
            beq L2D9E			;Don't open floor again if screen 6 already clear
            lda ICBLLZ			;Load lamp count screen 0
            ora ICBLHZ			;Load lamp count screen 1
            ora ICAX1Z			;Load lamp count screen 2
            bne L2D9E			;If all lamps not collected then return
            dec L427A			;Initial value is 3
            lda L427A			;
            cmp #$02			;
            bne L2D94			;Skip sound if not first time through
            jsr L391E			;Play open floor sound
L2D94:      clc				;
            adc #$10			;-----------------------------------------------
            ldx #$0C			;This draws hole in floor over 4 seperate frames
            ldy #$11			;Animating the whole sequence
            jmp L11E2			;-----------------------------------------------
L2D9E:      rts

;Opens wall room 2 if screen 6 retrieved, makes cows moo
            lda ICAX5Z			;Load lamp location $2E(Screen 6)
            bne L2DF2			;Return if not zero
            lda L427B			;Load location		
            bmi L2DC0			;If already set skip next section
            dec L427B			;Set to negative for all subsequent passes
            jsr L391E			;????
            lda #$1A			;
            ldx #$0B			;
            ldy #$25			;
            jsr L11E2			;This copies Blank spaces to wall section
            lda #$07			;
            ldx #$0C			;
            ldy #$25			;
            jsr L11E2			;This copies Blank spaces to wall section
L2DC0:      lda DELTAC+1		;
            bne L2DF2			;If not zero return
            dec L427C			;
            bpl L2DF2			;
            lda L427A			;
            bne L2DE1			;Branch to open cow's mouth
            ldy #$0A			;Play cow moo sound for screen 2
            jsr L1DB0			;Stores sound info in memory
            lda #$1D			;
            ldx #$09			;
            ldy #$21			;
            jsr L11E2			;Make cow's mouth open
            inc L427A			;
            bne L2DF2			;
L2DE1:      lda #$1E			;
            ldx #$09			;
            ldy #$21			;
            jsr L11E2			;Make cow's mouth open
            dec L427A			;
            lda #$05			;
            sta L427C			;
L2DF2:      rts

;
            lda DELTAC+1
            bne L2E17
            lda L427A
            bmi L2E17
            lda ICAX2Z
            bne L2E17
            dec L427A
            lda L427A
            cmp #$02
            bne L2E0D
            jsr L391E
L2E0D:      clc
            adc #$10			;----------------------------------------
            ldx #$0C			;Open floor location on screen 3
            ldy #$1D			;
            jsr L11E2			;----------------------------------------
L2E17:      dec L427C
            bmi L2E1D
            rts
            
L2E1D:      lda #$30
            sta L427C
            lda L427B
            beq L2E3C
            dec L427B
            lda #$06			;----------------------------------------
            ldx #$06			;Erase and draw left moving platform
            ldy #$09			;on screen 3
            jsr L11E2			;----------------------------------------
            lda #$60			;----------------------------------------
            ldx #$06			;Erase and draw left moving platform
            ldy #$15			;on screen 3
            jmp L11E2			;----------------------------------------
			
L2E3C:      inc L427B			;
            lda #$60			;----------------------------------------
            ldx #$06			;Erase and draw right moving platform
            ldy #$09			;on screen 3
            jsr L11E2			;----------------------------------------
			
            lda #$06			;----------------------------------------
            ldx #$06			;Erase and draw right moving platform
            ldy #$15			;on screen 3
            jmp L11E2			;----------------------------------------
			
            lda L4153
            beq L2E7E
            inc L427C
            lda L427C
            cmp #$20
            bne L2E6C
            lda #$34			;-------------------------------------------
            ldx #$04			;Turns left lamp on screen 4 to white
            ldy #$0B			;
            jsr L11E2			;-------------------------------------------
            jmp L2E7E
			
L2E6C:      cmp #$40
            bne L2E7E
            lda #$00
            sta L427C
            lda #$36			;-------------------------------------------
            ldx #$04			;Turns left lamp on screen 4 to black
            ldy #$0B			;
            jsr L11E2			;-------------------------------------------
L2E7E:      lda L4153
            bne L2EA5
            lda L427A
            bmi L2EA5
            dec L427A
            jsr L391E
            lda #$16			;-------------------------------------------
            ldx #$08			;Opens left floor on screen 4
            ldy #$0B			;
            jsr L11E2			;-------------------------------------------
            lda #$16			;-------------------------------------------
            ldx #$09			;Opens left floor on screen 4
            ldy #$0B			;
            jsr L11E2			;-------------------------------------------
            lda #$06
            jsr L3778
L2EA5:      lda L4157
            beq L2ED2
            inc L427D
            lda L427D
            cmp #$20
            bne L2EC0
            lda #$35			;-------------------------------------------
            ldx #$04			;Turns right lamp on screen 4 to white
            ldy #$1C			;
            jsr L11E2			;-------------------------------------------
            jmp L2ED2
			
L2EC0:      cmp #$40
            bne L2ED2
            lda #$00
            sta L427D
            lda #$37			;-------------------------------------------
            ldx #$04			;Turns right lamp on screen 4 to black
            ldy #$1C			;
            jsr L11E2			;-------------------------------------------
L2ED2:      lda L4157
            bne L2F02
            lda L427B
            bmi L2F02
            dec L427B
            lda #$00
            sta PALNTS
            lda #$07
            sta L39C2
            jsr L391E
            lda #$16			;-------------------------------------------
            ldx #$08			;Opens right floor on screen 4
            ldy #$19			;
            jsr L11E2			;-------------------------------------------
            lda #$16			;-------------------------------------------
            ldx #$09			;Opens right floor on screen 4
            ldy #$19			;
            jsr L11E2			;-------------------------------------------
            lda #$06
            jsr L3782
L2F02:      lda DELTAC+1
            beq L2F09
            jmp L2FA0
			
L2F09:      inc ENDPT
            bmi L2F38
            lda ENDPT
            cmp #$03
            beq L2F1D
            cmp #$07
            beq L2F30
L2F17:      jsr L378C
            jmp L2F38
			
L2F1D:      ldx BITMSK
            cpx #$03
            bcs L2F17
            lda #$06
            jsr L378C
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L2F17
L2F30:      lda #$C0
            sta ENDPT
            lda #$01
            sta BITMSK
L2F38:      lda L4153
            beq L2F6C
            inc ENDPT+1
            bmi L2F6C
            lda ENDPT+1
            cmp #$03
            beq L2F51
            cmp #$07
            beq L2F64
L2F4B:      jsr L3778
            jmp L2F6C
			
L2F51:      ldx SHFAMT
            cpx #$0C
            bcs L2F4B
            lda #$06
            jsr L3778
            inc SHFAMT
            lda #$02
            sta ENDPT+1
            bne L2F4B
L2F64:      lda #$F4
            sta ENDPT+1
            lda #$0B
            sta SHFAMT
L2F6C:      lda L4157
            beq L2FA0
            inc DELTAR
            bmi L2FA0
            lda DELTAR
            cmp #$03
            beq L2F85
            cmp #$07
            beq L2F98
L2F7F:      jsr L3782
            jmp L2FA0
			
L2F85:      ldx ROWAC
            cpx #$1B
            bcs L2F7F
            lda #$06
            jsr L3782
            inc ROWAC
            lda #$02
            sta DELTAR
            bne L2F7F
L2F98:      lda #$F4
            sta DELTAR
            lda #$1A
            sta ROWAC
L2FA0:      jmp L2472

            lda L417C
            bne L2FC3
            lda L427C
            bmi L2FC3
            dec L427C
            lda #$0A
            ldy #$19
            jsr L31AA			;Opens first door on screen 5
            lda #$0A
            ldy #$1A
            jsr L31AA			;Opens first door on screen 5
            lda #$06
            jsr L3778
L2FC3:      lda L4174
            bne L2FE0
            lda L427D
            bmi L2FE0
            dec L427D
            lda #$0A
            ldy #$00
            jsr L31AA			;Opens second door on screen 5
            lda #$15
            ldx #$0B
            ldy #$00
            jsr L11E2			;Opens second door on screen 5, possibly a wall too????
L2FE0:      lda ICAX5Z			;Load lamp count on screen 6
            ora L4164			;????
            beq L2FEE
            lda ICAX5Z
            ora L416C
            bne L300D
L2FEE:      lda L427E
            bmi L300D
            dec L427E
            lda #$19
            ldx #$02
            ldy #$22
            jsr L11E2			;Opens walls on screen 5
            lda #$03
            ldy #$1E
            jsr L31AA
            lda #$06
            ldy #$20
            jsr L31AA
L300D:      lda DELTAC+1
            beq L3014
            jmp L30A6
			
L3014:      inc ENDPT
            bmi L3043
            lda ENDPT
            cmp #$03
            beq L3028
            cmp #$07
            beq L303B
L3022:      jsr L376E
            jmp L3043
			
L3028:      ldx BITMSK
            cpx #$1C
            bcs L3022
            lda #$06
            jsr L376E
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L3022
L303B:      lda #$F0
            sta ENDPT
            lda #$1B
            sta BITMSK
L3043:      lda L417C
            beq L3077
            inc ENDPT+1
            bmi L3077
            lda ENDPT+1
            cmp #$03
            beq L305C
            cmp #$07
            beq L306F
L3056:      jsr L3778
            jmp L3077
			
L305C:      ldx SHFAMT
            cpx #$1C
            bcs L3056
            lda #$06
            jsr L3778
            inc SHFAMT
            lda #$02
            sta ENDPT+1
            bne L3056
L306F:      lda #$F0
            sta ENDPT+1
            lda #$1B
            sta SHFAMT
L3077:      inc DELTAR
            bmi L30A6
            lda DELTAR
            cmp #$03
            beq L308B
            cmp #$07
            beq L309E
L3085:      jsr L379C
            jmp L30A6
			
L308B:      ldx ROWAC
            cpx #$02
            bcs L3085
            lda #$06
            jsr L379C
            inc ROWAC
            lda #$02
            sta DELTAR
            bne L3085
L309E:      lda #$F2
            sta DELTAR
            lda #$01
            sta ROWAC
L30A6:      jmp L2472

;Checks if the code from the address range 06F3 - 07F2 has been altered - if so crash computer
L30A9:      lda #$00
            tay
L30AC:      eor L06F3,Y
            iny
            bne L30AC
            cmp #$62
            bne L30B7			;If computed values is not #$62 then branch and program will crash
            rts

;Intentionally crash computer	- Should be removed at some point      
L30B7:      ldx #$FF	
            asl L30C4			;Is changing address L30C4 below
            lsr L0101,X
            lsr L0117,X
            ldx HOLDCH
L30C4:      eor LA540			;TXS - ASL L30C4 from above changes this at run time
            rol L0FD0			;RTI
			
;$30C6
	    ;lda ICAX5Z			;Assembles after ASL above
	    ;bne L30D9			;Assembles after ASL above
            lda L427A
            bmi L30D9
            dec L427A
            lda #$05
            ldy #$01
            jsr L31C0
L30D9:      jsr L29B0
            jmp L2472
			
            jsr L29B0
            lda L41A6
            ora L41AA
            ora L41AE
            ora L41B2
            ora L41B6
            bne L3102
            lda L427A
            bmi L3102
            dec L427A
            lda #$02
            ldy #$21
            jmp L31C0
			
L3102:      lda L41BA
            ora L41BE
            ora L41C2
            ora L41C6
            ora L41CA
            ora L41CE
            bne L3125
            lda L427B
            bmi L3125
            dec L427B
            lda #$05
            ldy #$26
            jmp L31C0
            
L3125:      lda DELTAC+1
            bne L3158
            inc ENDPT
            bmi L3158
            lda ENDPT
            cmp #$03
            beq L313D
            cmp #$07
            beq L3150
L3137:      jsr L378C
            jmp L3158
            
L313D:      ldx BITMSK
            cpx #$24
            bcs L3137
            lda #$06
            jsr L378C
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L3137
L3150:      lda #$22
            sta BITMSK
            lda #$ED
            sta ENDPT
L3158:      dec L427C
            beq L318E
            bpl L3164
            lda #$01
            sta L427C
L3164:      lda L41D2
            ora L41D6
            beq L317D
            lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$23
            bcc L317A
            lda #$05
            sta BUFCNT
L317A:      jmp L3736

L317D:      lda BUFCNT
            sta BUFSTR+1
            dec BUFCNT
            cmp #$06
            bcs L318B
            lda #$24
            sta BUFCNT
L318B:      jmp L3736

L318E:      rts

;Returns to an address based on screen number
L318F:      lda SCRNMBR
            asl
            tax
            lda L42A8,X
            pha
            lda L42A7,X
            pha
            rts
			
;Not sure what this code does. Might be able to remove it.
L319C:      lda DSKFMS+1
            clc
            adc #$04
            sta DSKFMS+1
            lda DSKUTL
            adc #$00
            sta DSKUTL
            rts
            
L31AA:      jsr L391E
            sta SAVADR+1
            sty RAMTOP
            lda #$13
            jsr L31EA
            lda #$13
            jsr L31EA
            lda #$14
            jmp L31EA
			
L31C0:      jsr L31AA
            dec SAVADR+1
            lda #$17
            jmp L31EA
			
L31CA:      jsr L31AA
            dec SAVADR+1
            lda #$2D
            jmp L31EA
			
L31D4:      jsr L391E
            sta SAVADR+1
            sty RAMTOP
            lda #$63
            jsr L31EA
            lda #$63
            jsr L31EA
            lda #$64
            jmp L31EA
			
L31EA:      ldx SAVADR+1		;---------------------------------
            ldy RAMTOP			;Opens doors on screens based on 
            jsr L11E2			;values passed in
            inc SAVADR+1		;---------------------------------
            rts
            
            lda ICAX6Z			;
            ora L41E3			;
            bne L320A
            lda L427C
            bmi L320A
            dec L427C
            lda #$07
            ldy #$0E
            jsr L31AA
L320A:      lda L41DB
            ora L41DF
            bne L322F
            lda L427D
            bmi L322F
            dec L427D
            lda L41E7
            beq L3228
            lda #$01
            sta PALNTS
            lda #$07
            sta L39C2
L3228:      lda #$07
            ldy #$19
            jsr L31AA
L322F:      lda STATUS
            ora L41F4
            ora L41F8
            bne L3248
            lda L427E
            bmi L3248
            dec L427E
            lda #$02
            ldy #$26
            jsr L31CA
L3248:      lda L41E3
            bne L325C
            lda L427A
            bmi L325C
            dec L427A
            lda #$0A
            ldy #$01
            jsr L31AA
L325C:      lda ICAX6Z
            ora STATUS
            bne L3271
            lda L427B
            bmi L3271
            dec L427B
            lda #$0A
            ldy #$26
            jsr L31AA
L3271:      lda DELTAC+1
            beq L3276
            rts
            
L3276:      inc ENDPT
            bmi L32A5
            lda ENDPT
            cmp #$03
            beq L328A
            cmp #$07
            beq L329D
L3284:      jsr L376E
            jmp L32A5
            
L328A:      ldx BITMSK
            cpx #$0B
            bcs L3284
            lda #$06
            jsr L376E
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L3284
L329D:      lda #$06
            sta BITMSK
            lda #$F2
            sta ENDPT
L32A5:      inc ENDPT+1
            bmi L32D4
            lda ENDPT+1
            cmp #$03
            beq L32B9
            cmp #$07
            beq L32CC
L32B3:      jsr L3778
            jmp L32D4
            
L32B9:      ldx SHFAMT
            cpx #$20
            bcs L32B3
            lda #$06
            jsr L3778
            inc SHFAMT
            lda #$02
            sta ENDPT+1
            bne L32B3
L32CC:      lda #$1B
            sta SHFAMT
            lda #$F2
            sta ENDPT+1
L32D4:      jmp L2472

            lda L427C
            bmi L32ED
            lda L41EC
            bne L32ED
            dec L427C
            lda #$01
            sta PALNTS
            lda #$07
            sta L39C2
L32ED:      lda L41F0
            bne L330A
            lda L427A
            bmi L330A
            dec L427A
            lda #$07
            ldy #$17
            jsr L31AA
            lda #$00
            sta PALNTS
            lda #$07
            sta L39C2
L330A:      lda CHKSUM
            bne L332B
            lda L427B
            bmi L332B
            dec L427B
            lda #$00
            sta PALNTS
            lda #$07
            sta L39C2
            jsr L391E
            lda #$18			;----------------------------------
            ldx #$02			;Removes spikes at the top of the 
            ldy #$23			;Moving thing on screen 9
            jsr L11E2			;----------------------------------
L332B:      dec L427D
            beq L3360
            bpl L3337
            lda #$01
            sta L427D
L3337:      lda L41F4
            ora L41F8
            bne L334F
            lda BUFCNT
            sta BUFSTR+1
            dec BUFCNT
            cmp #$05
            bcs L335D
            lda #$18
            sta BUFCNT
            bne L335D
L334F:      lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$18
            bcc L335D
            lda #$04
            sta BUFCNT
L335D:      jsr L3736
L3360:      lda DELTAC+1
            beq L3367
            jmp L33C5
            
L3367:      inc ENDPT
            bmi L3396
            lda ENDPT
            cmp #$03
            beq L337B
            cmp #$07
            beq L338E
L3375:      jsr L378C
            jmp L3396
            
L337B:      ldx BITMSK
            cpx #$14
            bcs L3375
            lda #$06
            jsr L378C
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L3375
L338E:      lda #$10
            sta BITMSK
            lda #$D0
            sta ENDPT
L3396:      inc ENDPT+1
            bmi L33C5
            lda ENDPT+1
            cmp #$03
            beq L33AA
            cmp #$07
            beq L33BD
L33A4:      jsr L3794
            jmp L33C5
            
L33AA:      ldx SHFAMT
            cpx #$14
            bcs L33A4
            lda #$06
            jsr L3794
            inc SHFAMT
            lda #$02
            sta ENDPT+1
            bne L33A4
L33BD:      lda #$10
            sta SHFAMT
            lda #$D0
            sta ENDPT+1
L33C5:      jmp L2472

            lda L427A
            bmi L33DF
            lda L4201
            ora L4205
            bne L33DF
            dec L427A
            lda #$04
            ldy #$26
            jsr L31D4
L33DF:      jmp L29B0

            lda L427A
            bmi L33F8
            lda L4216
            bne L33F8
            dec L427A
            lda #$00
            sta PALNTS
            lda #$07
            sta L39C2
L33F8:      jsr L29B0
            jmp L2472
            
            lda L427A
            bne L3406
            jmp L34CA
			
L3406:      lda L4269
            bne L3437
            sta L427A
            jsr L38FF
            lda #$61			;----------------------------------------
            ldx #$0B			;Animates dragon guy dying
            ldy #$00			;
            jsr L11E2			;----------------------------------------
            lda #$B8
            ldx #$02
            jsr L2917
            lda #$0B
            ldx #$01
            jsr L2917
            ldx #$01
            lda #$00
            sta L427D
            lda #$50
            sta L427B
            jmp L3463
            
L3437:      jsr L37FD
            lda MLTTMP
            ora MLTTMP+1
            and #$03
            beq L344D
            ldx #$00
            lda L00C2
            cmp #$19
            beq L344D
            jsr L3765
L344D:      dec L427B
            bne L3495
            lda #$08
            sta L427B
            lda L009B
            ldx #$02
L345B:      cmp L3E67,X
            bcs L3463
            dex
            bne L345B
L3463:      stx L427C
            lda #$38			;----------------------------------------
            clc				;Animates fireballs dragon guy shoots
            adc L427C			;
            ldx #$02			;
            ldy #$10			;
            jsr L11E2			;----------------------------------------
            lda L427D
            bne L3488
            inc L427D
            lda #$06
            jsr L3496
            lda #$06
            jsr L34A3
            jmp L3495
            
L3488:      dec L427D
            lda #$00
            jsr L3496
            lda #$00
            jsr L34A3
L3495:      rts

L3496:      clc
            adc #$3B			;----------------------------------------
            adc L427C			;Animates fireballss dragon guy shoots
            ldx #$03			;
            ldy #$12			;
            jmp L11E2			;----------------------------------------
            
L34A3:      clc
            adc #$3E			;----------------------------------------
            adc L427C			;Animates fireballss dragon guy shoots
            ldx #$04			;
            ldy #$12			;
            jmp L11E2			;----------------------------------------
            
L34B0:      lda #$00			;----------------------------------------
            sta AUDC1			;Displays dragon guy screen after
            sta AUDF1			;he is dead
            lda #$5E			;
            ldx #$0B			;
            ldy #$25			;
            jsr L11E2			;----------------------------------------
            
            lda #$5F			;----------------------------------------
            ldx #$0C			;Displays dragon guy screen after
            ldy #$26			;he is dead
            jmp L11E2			;----------------------------------------
            
L34CA:      lda L427B
            beq L34B0
            tax
            lda RANDOM
            and #$0F
            ora #$80
            sta AUDC1
            lda RANDOM
            sta AUDF1
            sta L0145
            cpx #$10
            bcs L34EA
            stx L0145
L34EA:      dec L427B
            lda #$74
            sta KEYDEF
            cpx #$11
            bcc L3500
            lda RANDOM
            cmp #$10
            bcs L3500
            lda #$70
            sta KEYDEF
L3500:      lda L427D
            eor #$01
            sta L427D
            lda #$47
            clc
            adc L427D			;----------------------------------------
            ldx #$03			;Animates dragon guy dying
            ldy #$0C			;
            jsr L11E2			;----------------------------------------
            lda #$49
            clc
            adc L427D			;----------------------------------------
            ldx #$03			;Animates dragon guy dying
            ldy #$19			;
            jsr L11E2			;----------------------------------------
            lda #$4B			
            clc					
            adc L427D			;----------------------------------------
            ldx #$06			;Animates dragon guy dying
            ldy #$0E			;
            jsr L11E2			;----------------------------------------
            lda #$4D			
            clc
            adc L427D			;----------------------------------------
            ldx #$06			;Animates dragon guy dying
            ldy #$17			;
            jmp L11E2			;----------------------------------------
            
            lda L427A
            bmi L3550
            lda L4223
            bne L3550
            dec L427A
            lda #$0A
            ldy #$26
            jsr L31D4
L3550:      lda L427B
            bmi L3569
            lda BFENLO
            ora L4235
            ora L4239
            bne L3569
            dec L427B
            lda #$07
            ldy #$26
            jsr L31D4
L3569:      jmp L29B0

            lda RTCLOK
            asl
            asl
            tax
            lda L009E
            cmp #$64
            bcc L35AC
            cmp #$8A
            bcs L3586
            lda L013C,X
            beq L35AC
            dec L013C,X
            jmp L359F
            
L3586:      inx
            cmp #$B6
            bcs L3596
            lda L013C,X
            beq L35AC
            dec L013C,X
            jmp L359F
            
L3596:      inx
            lda L013C,X
            beq L35AC
            dec L013C,X
L359F:      lda #$01
            tax
            jsr L2917
            lda #$F4
            ldx #$02
            jmp L2917
            
L35AC:      lda DELTAC+1
            bne L35B3
            jsr L0C48
L35B3:      rts

            lda L427A
            bmi L35CB
            lda L422D
            ora L4231
            bne L35CB
            dec L427A
            lda #$04
            ldy #$26
            jsr L31D4
L35CB:      jmp L29B0

            lda L427A
            bmi L35F0
            lda L423E
            bne L35F0
            lda #$57			;----------------------------------------
            ldx #$03			;Erases wall on screen $0F
            ldy #$11			;
            jsr L11E2			;----------------------------------------
            lda #$58			;----------------------------------------
            ldx #$04			;Erases wall on screen $0F
            ldy #$11			;
            jsr L11E2			;----------------------------------------
            dec L427A
            jsr L391E
L35F0:      lda L427B
            bmi L3618
            lda L4242
            ora L4246
            ora L424E
            bne L3618
            lda #$57			;----------------------------------------
            ldx #$03			;Erases wall on screen $0F
            ldy #$17			;
            jsr L11E2			;----------------------------------------
            lda #$58			;----------------------------------------
            ldx #$04			;Erases wall on screen $0F
            ldy #$17			;
            jsr L11E2			;----------------------------------------
            dec L427B
            jsr L391E
L3618:      lda L427C
            bmi L3642
            lda LTEMP+1
            bne L3642
            lda #$59			;----------------------------------------
            ldx #$09			;Erases wall on screen $0F
            ldy #$25			;
            jsr L11E2			;----------------------------------------
            lda #$5A			;----------------------------------------
            ldx #$08			;Erases wall on screen $0F
            ldy #$25			;
            jsr L11E2			;----------------------------------------
            lda #$5B			;----------------------------------------
            ldx #$07			;Erases wall on screen $0F
            ldy #$25			;
            jsr L11E2			;----------------------------------------
            jsr L391E
            dec L427C
L3642:      rts

            lda L427A
            bmi L3656
            lda BUFRFL
            bne L3656
            dec L427A
            lda #$07
            ldy #$01
            jsr L31D4
L3656:      jmp L29B0

            dec L427D
            beq L3676
            bpl L3665
            lda #$01
            sta L427D
L3665:      lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$1B
            bcc L3673
            lda #$0B
            sta BUFCNT
L3673:      jsr L3736
L3676:      lda L427A
            beq L368C
            lda L4260
            bne L368C
            dec L427A
            lda #$5D			;----------------------------------------
            ldx #$0A			;Adds ladder part to screen $11
            ldy #$25			;
            jsr L11E2			;----------------------------------------
L368C:      lda L427B
            beq L36A2
            lda L4264
            bne L36A2
            dec L427B
            lda #$5C			;----------------------------------------
            ldx #$0A			;Adds ladder part to screen $11
            ldy #$18			;
            jsr L11E2			;----------------------------------------
L36A2:      jsr L29B0
            lda DELTAC+1
            beq L36AA
            rts
            
L36AA:      dec L427C
            bpl L36C0
            lda #$04
            sta L427C
            lda #$2C
            cmp L0146
            bne L36BD
            lda #$2A
L36BD:      sta L0146
L36C0:      lda #$02
            sta FMSZPG+6
L36C4:      ldx FMSZPG+6
            inc ENDPT,X
            bmi L3731
            lda ENDPT,X
            cmp #$03
            beq L36EE
            cmp #$07
            beq L3721
L36D4:      cpx #$00
            bne L36DE
            jsr L376E
            jmp L3731
            
L36DE:      cpx #$01
            bne L36E8
            jsr L3778
            jmp L3731
            
L36E8:      jsr L3782
            jmp L3731
            
L36EE:      ldy BITMSK,X
            cpx #$00
            bne L36FA
            cpy #$23
            bcs L36D4
            bcc L36FE
L36FA:      cpy #$25
            bcs L36D4
L36FE:      lda #$06
            cpx #$00
            bne L370A
            jsr L376E
            jmp L3717
			
L370A:      cpx #$01
            bne L3714
            jsr L3778
            jmp L3717
            
L3714:      jsr L3782
L3717:      ldx FMSZPG+6
            inc BITMSK,X
            lda #$02
            sta ENDPT,X
            bne L36D4
L3721:      lda #$EA
            sta ENDPT,X
            lda #$08
            sta BITMSK,X
            cpx #$00
            bne L3731
            lda #$E8
            sta ENDPT,X
L3731:      dec FMSZPG+6
            bpl L36C4
            rts
  
;Updates screen 7 and 9 moving thing at bottom  
L3736:      jsr L3760			;Play moving thing sound 
            lda #$1C			;----------------------------------------
            ldx BUFSTR			;draws moving thing at bottom of screen
            ldy BUFSTR+1		;7, 9
            jsr L11E2			;----------------------------------------
            lda #$1B			;----------------------------------------
            ldx BUFSTR			;draws moving thing at bottom of screen
            ldy BUFCNT			;7, 9
            jmp L11E2			;----------------------------------------

;Updates screen $0D moving things
L374B:      jsr L3760			;Play moving thing sound 
            lda #$55			;----------------------------------------
            ldx BUFSTR			;Draws moving things on screen $0D
            ldy BUFSTR+1		;
            jsr L11E2			;----------------------------------------
            lda #$54			;----------------------------------------
            ldx BUFSTR			;Draws moving things on screen $0D
            ldy BUFCNT			;
            jmp L11E2			;----------------------------------------

;Moving thing sound			
L3760:      ldy #$0B			;Moving thing sound
            jmp L1DB0			;Stores sound info in memory
			
L3765:      lda #$19
            sta L00C2,X
            lda #$10
            sta L00D1,X
            rts
 
;Animates playfield things that scroll across the screen
L376E:      clc				;--------------------------------------------
            adc #$1F			;Animates playfield things that scroll across
            ldx ROWAC+1			;the screen horizontally that kill the
            ldy BITMSK			;players if they touch them
            jmp L11E2			;--------------------------------------------

;Animates playfield things that scroll across the screen        
L3778:      clc				;--------------------------------------------
            adc #$1F			;Animates playfield things that scroll across
            ldx COLAC			;the screen horizontally that kill the
            ldy SHFAMT			;players if they touch them
            jmp L11E2			;--------------------------------------------

;Animates playfield things that scroll across the screen        
L3782:      clc				;--------------------------------------------
            adc #$1F			;Animates playfield things that scroll across
            ldx COLAC+1			;the screen horizontally that kill the
            ldy ROWAC			;players if they touch them
            jmp L11E2			;--------------------------------------------
            
L378C:      clc
            adc #$07
            jmp L376E
            
            bne L376E
L3794:      clc
            adc #$07
            jmp L3778
            
            bne L3778
L379C:      clc
            adc #$07
            jmp L3782
            
            bne L3782
			
;Creates and stores a lot of random numbers
L37A4:      dec L00F5
            bne L37C3
L37A8:      lda RANDOM
            and #$0F
            beq L37A8
            sta L00F5
            lda RANDOM
            and #$30
            sta L6C9D
            ora #$CC
            sta L689D
            and #$B8
            sta L6B35
L37C3:      dec L00F6
            bne L37DD
L37C7:      lda RANDOM
            and #$0F
            beq L37C7
            sta L00F6
            lda RANDOM
            and #$30
            sta L6D8D
            ora #$CC
            sta L698D
L37DD:      dec L00F7
            bne L37FC
L37E1:      lda RANDOM
            and #$0F
            beq L37E1
            sta L00F7
            lda RANDOM
            and #$0C
            sta L6CA5
            ora #$33
            sta L68A5
            and #$2E
            sta L6B3D
L37FC:      rts

L37FD:      ldx #$03
L37FF:      lda RANDOM
            and L39C3,X
            sta L39C7,X
            lda RANDOM
            and L39C3,X
            sta L39CB,X
            dex
            bpl L37FF
            jsr L38FF
            lda L39CF
            bne L382A
            lda L39D1
            bne L3827
            jsr L38DB
            jmp L383D
            
L3827:      dec L39D1
L382A:      lda L39D0
            bne L383D
            lda L39D2
            bne L383A
            jsr L38ED
            jmp L383D
            
L383A:      dec L39D2
L383D:      ldx #$01
L383F:      lda L39CF,X
            beq L385B
            lda L39D5,X
            clc
            adc #$03
            sta L39D5,X
            cmp #$E0
            bcc L385B
            lda #$00
            sta L39CF,X
            lda #$02
            sta L39D1,X
L385B:      dex
            bpl L383F
            lda L39CF
            beq L3881
            lda #$C7
            sta L1F73
            lda #$39
            sta L1F74
            lda L39D5
            sta L1F76
            lda L39D7
            clc
            adc #$78
            sta L1F77
            ldy #$03
            jsr L1F72			;Draws
L3881:      lda L39D0
            beq L38A4
            lda #$CB
            sta L1F73
            lda #$39
            sta L1F74
            lda L39D6
            sta L1F76
            lda L39D8
            clc
            adc #$78
            sta L1F77
            ldy #$03
            jsr L1F72			;Draws
L38A4:      ldx #$01
L38A6:      lda L39CF,X
            beq L38D7
            ldy #$00
            lda L39D5,X
            cmp #$98
            bcs L38B5
            iny
L38B5:      lda L39D3,X
            cmp L009B
            bcs L38C1
            inc L39D3,X
            bne L38C6
L38C1:      beq L38C6
            dec L39D3,X
L38C6:      dey
            bpl L38B5
            lda L39D3,X
            sta HPOSP2,X
            lda RANDOM
            ora #$0A
            sta COLPM2,X
L38D7:      dex
            bpl L38A6
            rts
            
L38DB:      lda #$01
            sta L39CF
            lda #$77
            sta L39D3
            lda #$3C
            sta L39D5
            jmp L2624
            
L38ED:      lda #$01
            sta L39D0
            lda #$81
            sta L39D4
            lda #$3C
            sta L39D6
            jmp L2624

;            
L38FF:      ldx #$01			;
L3901:      lda L39CF,X			;
            beq L391A			;
            lda L39D5,X			;
            sta L1F7F			;
            lda L39D7,X			;
            clc					;
            adc #$78			;
            sta L1F80			;
            ldy #$03			;
            jsr L1F7C			;
L391A:      dex					;
            bpl L3901			;
            rts					;

;Door/Wall/Floor opening sound          
L391E:      pha
            txa
            pha
            tya
            pha
            ldy #$06			;Door/Wall/Floor opening sound   
            jsr L1DB0			;Stores sound info in memory
            pla
            tay
            pla
            tax
            pla
            rts
            
            lda #$58
            sta FMSZPG+3
            lda #$04
            sta FMSZPG+4
            rts
            
            lda FMSZPG+3
            ora FMSZPG+4
            bne L396A
            inc FTYPE
            lda RTCLOK
            asl
            asl
            tax
            ldy #$03
            lda #$01
L3948:      sta L013C,X
            inx
            dey
            bpl L3948
            jsr L0CC2
            jsr L2B17
            jsr L0CDD
            lda #$20
            sta L0EF4
            sta L0EF5
            lda #$10
            sta L0EF6
            ldx #$00
            jmp L299B
            
L396A:      lda RANDOM
            sta L014B
            lda RANDOM
            sta L014D
            lda #$42
            sta L0EF4
            lda #$A5
            sta L0EF5
            lda #$78			;---------------------------------------
            sta L0EF6			;Changes colors on last screen - $13
            lda #$04			;Gold room
            ldx #$00			;
            ldy #$0A			;
            jmp L11E2			;---------------------------------------
            
L398E:      .byte $00
L398F:      .byte $00
L3990:      .byte $00
L3991:      .byte $00,$0C,$33,$03,$CC,$03,$33,$0C,$C3,$CC,$FF,$33,$FF,$3C,$FF,$F3
            .byte $3F,$30,$CC,$C0,$33,$C0,$CC,$30,$C3,$C3,$30,$3F,$30,$C3,$00,$FF
            .byte $00,$C3,$FF,$3C,$FF,$C3,$FF,$3C,$FF,$C3,$0C,$FC,$0C,$C3,$00,$FF
            .byte $00
L39C2:      .byte $00
L39C3:      .byte $18,$3C,$3C,$18
L39C7:      .byte $00,$00,$00,$00
L39CB:      .byte $00,$00,$00,$00
L39CF:      .byte $00
L39D0:      .byte $00
L39D1:      .byte $00
L39D2:      .byte $00
L39D3:      .byte $00
L39D4:      .byte $00
L39D5:      .byte $00
L39D6:      .byte $00
L39D7:      .byte $00
L39D8:      .byte $00
L39D9:      .byte $27
L39DA:      .byte $0A,$AA,$BD,$C5,$40,$85,$19,$BD,$C6,$40,$85,$1A,$A0,$00
L39E8:      .byte $B1
L39E9:      .byte $19,$30,$22,$D0,$1A,$C8,$B1,$19,$48,$C8,$B1,$19,$48,$C8
L39F7:      .byte $00,$00,$00
L39FA:      .byte $00,$9C,$40
L39FD:      .byte $00,$75,$30,$01
L3A01:      .byte $00,$00,$00
L3A04:      .byte $00,$00,$00
L3A07:      .byte $00
L3A08:      .byte $00
L3A09:      .byte $00
L3A0A:      .byte $00
L3A0B:      .byte $00
L3A0C:      .byte $00
L3A0D:      .byte $00
L3A0E:      .byte $A2,$04,$A9,$00,$9D,$7A,$42,$CA,$10,$FA,$A5,$27,$0A,$AA,$BD,$80
            .byte $42,$48,$BD,$7F,$42,$48,$60,$A9,$13,$85,$4B,$A5
L3A2A:      .byte $4B
L3A2B:      .byte $0A
L3A2C:      .byte $AA
L3A2D:      .byte $F7
L3A2E:      .byte $3A,$FB,$3A,$FF,$3A,$03,$3B,$1A,$3D,$07,$3B,$0D,$3B,$15,$3B,$19
            .byte $3B,$23,$3B,$26,$3B
L3A43:      .byte $34,$3B,$41,$3B,$4E,$3B,$58,$3B,$72,$3B,$6C,$3B,$66,$3B,$60,$3B
            .byte $78,$3B,$7A,$3B,$7C,$3B,$7E,$3B,$83,$3B,$85,$3B,$8A
L3A60:      .byte $3B,$8E,$3B,$92,$3B,$94,$3B,$9A,$3B,$9C,$3B,$9E,$3B,$A0,$3B,$A2
            .byte $3B,$A5,$3B,$A8,$3B,$AB,$3B,$AE,$3B,$B1,$3B,$B3,$3B,$B5,$3B,$B8
            .byte $3B,$BB,$3B,$BE,$3B,$C1,$3B,$C4,$3B,$C6,$3B,$C8
L3A8C:      .byte $3B,$CC,$3B,$D0,$3B,$D4,$3B,$D8,$3B,$DC,$3B,$DE,$3B,$E0,$3B,$E2
            .byte $3B,$01,$3C,$E4,$3B,$1E,$3C,$0A,$3C,$ED,$3B,$27,$3C,$0F
L3AAA:      .byte $3C,$F2,$3B,$2C,$3C,$14,$3C,$F7,$3B,$31,$3C,$19,$3C,$FC,$3B,$36
            .byte $3C,$3B,$3C,$3F,$3C,$43,$3C,$47,$3C,$4B,$3C,$4F,$3C,$53,$3C,$56
            .byte $3C,$59,$3C,$79,$3C,$9E,$3C,$B7,$3C,$C0,$3C,$96
L3AD6:      .byte $3B,$98,$3B,$F9,$3C,$FC,$3C,$FE,$3C,$00,$3D,$04,$3D,$08,$3D,$0C
            .byte $3D
L3AE7:      .byte $10,$3D,$13,$3D,$17,$3D,$30,$3D,$38,$3D,$3A,$3D,$4C,$3D,$4E,$3D
            .byte $20,$20,$20,$A0,$31,$55,$50,$A0,$32,$55,$50,$A0,$54,$4F,$50,$A0
            .byte $46,$41,$4C,$4C,$53,$A0,$6B,$6B,$6B,$6B,$6B,$6B,$6B,$A0,$B1,$B1
            .byte $B1,$A0,$42,$52,$55,$43,$45,$20,$4C,$45,$45,$A0,$42,$59,$A0,$52
            .byte $4F,$4E,$20,$4A,$20,$46,$4F,$52,$54,$49,$45,$52,$A0,$2A,$2A,$20
            .byte $50,$41,$55,$53
L3B3B:      .byte $45,$44,$20,$2A,$2A,$A0,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
            .byte $20,$20,$A0,$47,$41,$4D,$45,$20,$4F,$56,$45,$52,$A0,$50,$4C,$41
            .byte $59,$45,$52,$20,$A0,$31,$7C,$7D,$7E,$7F,$A0,$31,$42,$42,$A3,$A3
            .byte $A0,$7C,$7D,$7E,$A3,$A3,$A0,$42,$42,$A3,$A3,$A3,$A0,$20,$A0,$DE
            .byte $A0,$A2,$A0,$20,$20,$20,$20,$A0,$B1,$A0,$81,$A4,$A4,$83,$A0,$81
            .byte $A5,$83,$A0,$20,$20,$A5
L3B91:      .byte $A0,$04,$A0,$05,$A0,$06,$A0,$07,$A0,$E6,$A0,$E7,$A0,$F6,$A0,$F5
            .byte $A0,$F5,$F6,$A0,$F4,$F5,$A0,$20,$F5,$A0,$20,$F4,$A0,$20,$20,$A0
            .byte $FA,$A0,$F9,$A0,$F9,$FA
L3BB7:      .byte $A0,$F8,$F9,$A0,$20,$F9,$A0,$20,$F8,$A0,$20,$20,$A0,$B1,$A0,$4A
            .byte $A0,$11,$12,$13,$A0,$14,$15,$16,$A0,$17,$18,$19,$A0,$1A,$1B,$1C
            .byte $A0,$1D,$00,$1D,$A0,$B3,$A0,$B4,$A0,$06,$A0,$07,$A0,$A7,$A8,$A9
            .byte $AA,$AB,$AC,$AD,$AE,$A0,$BD,$BE,$BF,$C0,$A0,$12,$18,$1C,$D4,$A0
            .byte $BD
L3BF8:      .byte $D3,$DD,$C0,$A0,$12,$DE,$EF,$D4,$A0,$20,$07,$08,$09,$0A,$0B,$0C
            .byte $20,$A0,$B0,$B1,$10,$11,$A0,$B6,$BC,$C1,$17,$A0,$0E,$0F,$10,$11
            .byte $A0,$14,$15,$16,$17,$A0,$20,$C8,$AF,$F9,$19,$1A,$1B,$20,$A0,$03
            .byte $F3,$C9,$CA,$A0,$12,$D0,$D1,$D2,$A0,$03,$F3,$F4,$00,$A0,$12,$05
            .byte $06,$B5,$A0,$B7,$B8,$B9,$A0,$BC,$B8,$1C,$A0
L3C43:      .byte $C4
L3C44:      .byte $C5,$C6,$A0,$B0,$C5,$C1,$A0,$F5,$F6,$F7,$A0,$BE,$BF,$18,$A0,$F2
            .byte $02,$A0,$B1,$B6,$A0,$20,$62,$CF,$D0,$D4,$C9
L3C5F:      .byte $CF,$CE,$76,$2D,$62,$31,$20,$50,$4C,$41,$59,$45,$52,$20,$2D,$76
            .byte $32,$20,$50,$4C,$41,$59,$45,$52,$53,$A0,$20,$50,$52,$45,$53,$53
            .byte $20,$62,$D3,$C5,$CC,$C5,$C3,$D4,$76,$2D,$62,$43,$4F,$4D,$50,$55
            .byte $54,$45,$52,$20,$2D,$76,$4F,$50,$50,$4F,$4E,$45
L3C9B:      .byte $4E,$54,$A0,$20,$62,$D3,$D4,$C1,$D2,$D4,$76,$20,$2D,$20,$54
L3CAA:      .byte $4F,$20,$42,$45,$47,$49,$4E,$20,$47,$41,$4D,$45,$A0,$50
L3CB8:      .byte $4C,$41,$59,$45,$52,$20,$31,$A0,$50,$4C,$41,$59,$45,$52
L3CC6:      .byte $20,$32,$A0,$80,$80,$80,$80,$22,$32,$35,$23,$25,$00
L3CD3:      .byte $2C
L3CD4:      .byte $25,$25,$00,$08,$23,$09,$00,$11,$19,$18,$14,$00,$24,$21,$34,$21
            .byte $33,$2F,$26,$34,$00,$32,$25,$36,$0E,$13,$00,$22,$39,$00,$32,$2A
            .byte $26,$80,$80,$80,$80,$20,$20,$A0,$20
L3CFD:      .byte $A0,$4F,$A0,$CF,$CF,$CF,$A0,$20,$20,$A3,$A0,$20,$20,$A3,$A0,$69
            .byte $69,$69,$A0,$64,$64,$A0,$20
L3D14:      .byte $20,$A3,$A0,$7A,$7A,$A0,$2A,$2A,$20,$43
L3D1E:      .byte $4F,$4E,$47,$52,$41,$54,$55,$4C,$41
L3D27:      .byte $54,$49,$4F,$4E,$53,$20,$2A,$2A,$A0,$29,$29,$29,$29,$29,$29,$29
            .byte $A0,$A6,$A0
L3D3A:      .byte $44,$41,$54,$41,$53,$4F,$46
L3D41:      .byte $54,$20,$50,$52,$45,$53,$45,$4E,$54,$53,$A0,$27,$A0,$AE,$A0,$00
            .byte $00,$00,$01,$31,$39,$09,$39,$39,$19,$3D
L3D5B:      .byte $7D,$7F,$7F,$BD,$99,$3D,$3C,$64,$46,$42,$C3,$C3,$00,$00,$00,$80
            .byte $8C,$9C,$90,$9C,$9C,$98,$BC
L3D72:      .byte $BE,$FE,$FE,$BD,$99,$BC,$3C,$26,$62,$42,$C3,$C3,$00,$00,$01,$02
            .byte $1C,$1C,$0C,$3E,$5E,$CE,$4E,$7E,$3E,$0F,$1F,$36,$26,$64,$64,$C2
            .byte $03,$01,$01,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$20
            .byte $10,$30,$38,$18,$F8,$18,$38,$2C,$34,$16,$12
L3DAD:      .byte $12,$00,$00,$80,$40,$38,$38,$30,$3C,$7A,$73,$72,$7E,$7C,$F0,$F8
            .byte $6C,$64,$26,$26,$43,$C0,$80,$80,$C0,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$04,$04,$08,$0C,$1C,$18,$1F,$18,$1C,$34,$2C,$68,$48
            .byte $48,$10,$08,$04,$02,$01,$61,$72,$36,$7C,$7C,$38,$78,$78,$78,$7C
            .byte $BC,$B8,$18,$1C,$1C,$0E,$06,$02,$06,$20,$10,$08,$04,$02,$61,$73
            .byte $36,$7C,$7C,$38,$78,$78,$7C,$FC,$B8,$38,$3C,$27,$21,$11,$18,$08
            .byte $18,$08,$10,$20,$40,$80,$86,$4E,$6C,$3E,$3E,$1C,$1E,$1E,$1E,$3E
            .byte $3D,$1D,$18,$38,$38,$70
L3E23:      .byte $60,$40,$60,$04,$08,$10,$20,$40,$86,$CE,$6C,$3E,$3E,$1C,$1E,$1E
            .byte $3E,$3D,$1D,$1C,$3C,$E4,$84
L3E3A:      .byte $88,$18,$10,$18
L3E3E:      .byte $A2,$05
L3E40:      .byte $BD,$FA,$CF,$DD,$FA,$FF,$D0,$1A,$CA,$10,$F5,$A2,$14,$BD,$2B,$3F
            .byte $85,$13,$BD,$40,$3F,$85,$14,$C6,$14,$A0,$FF,$A9,$7F,$91,$13,$CA
            .byte $D0,$EB,$60
L3E63:      .byte $00,$08,$04,$0C
L3E67:      .byte $00,$64,$94
L3E6A:      .byte $32,$00,$0A,$00,$00
L3E6F:      .byte $00,$06,$06,$01,$01,$00,$00,$00,$06,$06,$06,$06,$01,$01,$00,$00
            .byte $00,$00,$00,$00,$01,$01,$00,$00,$00
L3E88:      .byte $00,$02,$01
L3E8B:      .byte $B3
L3E8C:      .byte $3E,$B3,$3E,$B3,$3E,$B3,$3E,$C7,$3E,$C7,$3E,$C7,$3E,$CC,$3E,$CC
            .byte $3E,$CC,$3E,$D1,$3E,$E0,$3E,$D1,$3E,$E5,$3E,$D1,$3E,$EF,$3E,$D1
            .byte $3E,$FE,$3E,$08,$3F,$0D,$3F,$04,$00,$06,$88,$0E,$04,$00,$0A,$0E
            .byte $34,$06,$00,$0A,$0E,$34,$04,$00,$0A,$0E,$34,$84,$00,$70,$0E,$60
            .byte $34,$00,$32,$0E,$40,$74,$00,$0E,$04,$88,$08,$00,$0E,$04,$88,$08
            .byte $00,$2C,$04,$88,$66,$00,$8E,$02
L3EE4:      .byte $88,$96,$00,$00,$0E,$7C,$96,$00,$0E,$00
L3EEE:      .byte $7C,$86,$00,$60,$02,$7A,$02,$00
L3EF6:      .byte $60,$0E,$7A,$04,$00,$60,$06,$7E
L3EFE:      .byte $08,$00,$2C,$04,$38,$08,$00,$2C,$04,$38,$00,$82,$82,$68,$8C,$84
            .byte $00,$70,$0F,$30,$84,$00,$70,$0F,$30
L3F17:      .byte $68,$68,$68,$68,$68,$68,$68,$68,$68,$68,$6C,$6C,$6C,$6C,$6C,$6C
            .byte $6C,$6C,$70,$6C
L3F2B:      .byte $59,$69,$9E,$FD,$7B,$E2
L3F31:      .byte $3D,$87,$71,$F1,$38
L3F36:      .byte $AC,$A3,$26,$A6,$14,$BC,$ED
L3F3D:      .byte $F0,$40,$E0
L3F40:      .byte $4F,$50,$51,$52,$54
L3F45:      .byte $55,$57,$58,$59,$5A,$5C,$5D,$5E,$60,$60,$62,$62,$63,$64,$66,$67
L3F55:      .byte $01,$00,$00,$00,$05,$04,$05,$00,$07,$08,$03,$0A,$00,$0F,$00,$0D
            .byte $00,$0F,$11,$00
L3F69:      .byte $00,$05,$00,$0A,$07,$06,$05,$08,$09,$08,$0B,$0C
L3F75:      .byte $0B,$00,$0B,$11,$0B,$12,$13,$00
L3F7D:      .byte $00,$00,$01,$02,$00,$06,$02,$08,$07,$06,$00,$0E,$0E,$00,$0C,$00
            .byte $0E,$00,$00,$00
L3F91:      .byte $01,$02,$03,$00,$00,$01,$00,$00,$09,$00,$00,$10,$00,$00,$10,$00
            .byte $00,$00,$00,$00
L3FA5:      .byte $3F,$36,$42,$38,$C0,$97,$A8,$3E,$3A,$36,$4D,$67,$9C,$BF,$38,$34
            .byte $3F,$37,$34,$3E
L3FB9:      .byte $C4,$62,$C4,$C4,$B4,$52,$B4,$44,$46,$C6,$8C,$4E,$5E,$32,$5E,$C3
            .byte $5E,$B4,$C6,$96
L3FCD:      .byte $C4,$A0,$A0,$38,$C0,$3D,$61,$44,$00,$00,$BD,$00,$4E,$00,$BF,$7A
            .byte $81,$00,$00,$00
L3FE1:      .byte $62,$92,$C4,$C4,$B4,$C2,$72,$74,$00,$00,$5E,$00,$BE,$00,$BE,$C4
            .byte $8E,$00,$00,$00
L3FF5:      .byte $34,$C5,$00,$00,$32,$C2,$C7,$50,$C7,$C7,$C3,$C5,$00,$32,$00,$C8
            .byte $00,$C6,$C4,$00
L4009:      .byte $92,$92,$00,$00,$C2,$51,$80,$51,$74,$47,$C4,$5A,$00,$C3,$00,$C4
            .byte $00,$93,$44,$00
L401D:      .byte $00,$50,$00,$34,$42,$3A,$C5,$32,$34,$C7,$34,$34,$58,$00,$7C,$37
            .byte $A0,$34,$3E,$00
L4031:      .byte $00,$36,$00,$B0,$36,$40,$66,$46,$53,$C0,$C4,$5C,$BE,$00,$BE,$B3
            .byte $BE,$C6,$96,$00
L4045:      .byte $00,$C5,$C5,$C5,$00,$38,$50,$32,$C7,$C2,$00,$34,$36,$00,$C4,$00
            .byte $BC,$00,$00,$00
L4059:      .byte $00,$62,$62,$C5,$00,$74,$51,$C0,$B5,$C6,$00,$5E,$BE,$00,$BE,$00
            .byte $BE,$00,$00,$00
L406D:      .byte $34,$34,$32,$36,$00,$7A,$50,$50,$34,$00,$00,$34,$00,$00,$34,$00
            .byte $00,$00,$00,$00
L4081:      .byte $62,$62,$C4,$62,$00,$66,$51,$51,$C6,$00,$00,$5C,$00,$00,$BE,$00
            .byte $00,$00,$00,$00
L4095:      .byte $00,$00,$00,$FF,$00,$00,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00
            .byte $00,$FF,$FF,$FF
L40A9:      .byte $84,$08,$06,$04,$02,$04,$06,$08
L40B1:      .byte $06,$06,$0A,$02,$02,$0A,$08,$0D,$04,$05,$03,$03,$03,$00,$04,$06
            .byte $02,$02,$01,$00
L40C5:      .byte $EF
L40C6:      .byte $40,$08,$41,$21,$41,$4A,$41,$53,$41,$5C,$41,$85,$41,$A6,$41,$DB
            .byte $41,$EC,$41,$01,$42,$0E,$42,$1B,$42,$28,$42,$2D,$42,$3E,$42,$57
            .byte $42,$60,$42,$69,$42,$6E,$42,$73,$42,$01,$9F,$1F,$07,$01,$92,$26
            .byte $07,$01,$9F,$02,$0A,$01,$9F,$19,$0A,$01,$92,$1D,$0A,$01,$92,$26
            .byte $0A,$FF,$01,$9E,$09,$07,$01,$9F,$1E,$07,$01,$92,$06,$0A,$01,$9E
            .byte $0F,$0A,$01,$9F,$18,$0A,$01,$92,$20,$0A,$FF,$01,$92,$05,$07,$01
            .byte $9E,$09,$07,$01,$9F,$16,$07,$01,$9E,$1A,$07,$01,$9F,$1E,$07,$01
            .byte $9E,$05,$0A,$01,$9F,$09,$0A,$01,$9E,$0F,$0A,$01,$9F,$15,$0A,$01
            .byte $9E,$1B,$0A,$FF,$01,$9E,$1D,$0A,$01,$9F,$26,$0A,$FF
L4153:      .byte $01,$9E,$0B,$04
L4157:      .byte $01,$9F,$1C,$04,$FF,$01,$9E,$02,$03,$01,$9E,$06,$03
L4164:      .byte $01,$9F,$1C,$03,$01,$9E,$20,$03
L416C:      .byte $01,$9F,$26,$03,$01,$9F,$1E,$06
L4174:      .byte $01,$9E,$02,$0A,$01,$9F,$17,$0A
L417C:      .byte $01,$9F,$1A,$0A,$01,$9E,$1E,$0A,$FF,$01,$9F,$08,$05,$01,$9E,$0A
            .byte $05,$01,$9F,$0E,$05,$01,$9F,$16,$05,$01,$9F,$1A,$05,$01,$9E,$1C
            .byte $05,$01,$9F,$06,$09,$01,$9E,$1E,$09,$FF
L41A6:      .byte $01,$9E,$03,$02
L41AA:      .byte $01,$9F,$0C,$02
L41AE:      .byte $01,$9E,$0D,$02
L41B2:      .byte $01,$9F,$19,$02
L41B6:      .byte $01,$9E,$1A,$02
L41BA:      .byte $01,$9F,$05,$05
L41BE:      .byte $01,$9E,$06,$05
L41C2:      .byte $01,$9F,$0C,$05
L41C6:      .byte $01,$9E,$0D,$05
L41CA:      .byte $01,$9F,$19,$05
L41CE:      .byte $01,$9E,$1A,$05
L41D2:      .byte $01,$9F,$02,$09
L41D6:      .byte $01,$9E,$03,$09,$FF
L41DB:      .byte $01,$9F,$0F,$03
L41DF:      .byte $01,$9F,$18,$03
L41E3:      .byte $01,$9E,$06,$07
L41E7:      .byte $01,$9F,$21,$07,$FF
L41EC:      .byte $01,$9F,$20,$02
L41F0:      .byte $01,$9E,$0F,$07
L41F4:      .byte $01,$9E,$1B,$0A
L41F8:      .byte $01,$9F,$1C,$0A,$01,$9E,$20,$0A,$FF
L4201:      .byte $01,$9F,$01,$04
L4205:      .byte $01,$9F,$1E,$07,$01,$9F,$1E,$0A,$FF,$01,$9E,$12,$03,$01,$9F,$15
            .byte $03
L4216:      .byte $01,$9F,$07,$0A,$FF,$01,$9E,$24,$04,$01,$9E,$24,$07
L4223:      .byte $01,$9E,$24,$0A,$FF,$01,$00,$00,$00,$FF
L422D:      .byte $01,$9F,$09,$07
L4231:      .byte $01,$9E,$1E,$07
L4235:      .byte $01,$9F,$09,$0A
L4239:      .byte $01,$9E,$1E,$0A,$FF
L423E:      .byte $01,$9F,$13,$03
L4242:      .byte $01,$9E,$15,$03
L4246:      .byte $01,$9E,$0E,$04,$01,$9F,$1A,$04
L424E:      .byte $01,$9E,$0D,$06,$01,$9F,$1B,$06,$FF,$01,$9E,$20,$04,$01,$9F,$05
            .byte $07,$FF
L4260:      .byte $01,$9E,$26,$0A
L4264:      .byte $01,$9E,$1F,$0B,$FF
L4269:      .byte $01,$9E,$25,$0B,$FF,$01,$00,$00,$00,$FF,$01,$00,$00,$00,$FF
L4278:      .byte $00
L4279:      .byte $00
L427A:      .byte $00
L427B:      .byte $00
L427C:      .byte $00
L427D:      .byte $00
L427E:      .byte $00
L427F:      .byte $41
L4280:      .byte $2B,$42,$2B,$41,$2B,$50,$2B,$56,$2B,$7C,$2B,$41,$2B,$9F,$2B,$B6
            .byte $2B,$CD,$2B,$41,$2B,$41,$2B,$EE,$2B,$F4,$2B,$BE,$2C,$C4,$2C,$D0
            .byte $2C,$DB,$2C,$0C,$2D,$2D,$39
L42A7:      .byte $35
L42A8:      .byte $2D,$71,$2D,$9E,$2D,$F2,$2D,$50,$2E,$A2,$2F,$C5,$30,$DE,$30,$F3
            .byte $31,$D6,$32,$C7,$33,$E1,$33,$3B,$35,$6B,$35,$B3,$35,$CD,$35,$42
            .byte $36,$58,$36,$FD,$33,$36,$39
L42CF:      .byte $00,$8C,$46
L42D2:      .byte $04,$03,$06
L42D5:      .byte $05,$00,$07
L42D8:      .byte $04,$00,$01,$02,$03,$01,$02,$04,$08
L42E1:      .byte $10
L42E2:      .byte $1E,$1D,$1B,$17,$0F
L42E7:      .byte $BB,$C7,$DE,$EA,$01,$18,$25,$3C,$8F,$9B,$6D,$78,$4B,$56,$D7,$E5
            .byte $B2,$C0,$FC,$09,$20,$2E,$45,$52,$69,$79,$8B,$99,$B0,$C0,$D2,$E1
            .byte $F8,$04,$34,$1B,$5A,$43,$81,$68,$A7,$90,$BB,$C7,$BB,$C7,$BB,$C7
            .byte $BB,$C7,$BB,$C7,$BB,$C7,$BB,$C7,$E0,$ED,$05,$1B,$33,$41,$59,$70
            .byte $88,$9F,$B6,$CD,$F8,$04,$B5,$CD,$DD,$F5,$0D,$1E,$36,$47,$A3,$BB
            .byte $E4,$FC,$11,$29,$5F,$77,$88,$A0,$B1,$C9,$DA,$F2,$03,$1B,$2C,$3E
            .byte $54,$6C,$7D,$8E,$8C,$A4,$BC,$D4,$39,$51,$EC,$03,$62,$7A,$1A,$31
            .byte $A3,$BB,$CE,$E6,$F7,$0F,$A3,$BB,$A3,$BB,$A3,$BB,$A3,$BB,$20,$38
            .byte $50,$68,$80,$98,$B0,$C8,$A3,$BB,$A3,$BB,$A3,$BB,$50,$00,$67,$00
            .byte $50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$DE,$00,$F6,$00,$0E,$00
            .byte $26,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00
            .byte $50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$7E,$00,$96,$00
            .byte $AE,$00,$C6,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00,$50,$00
            .byte $42,$00
L43B9:      .byte $46,$46,$46,$46,$47,$47,$47,$47,$47,$47,$47,$47,$47,$47,$47,$47
            .byte $47,$47,$47,$48,$48,$48,$48,$48,$48,$48,$48,$48,$48,$48,$48,$48
            .byte $48,$49,$49,$49,$49,$49,$49,$49,$49,$49,$46,$46,$46,$46,$46,$46
            .byte $46,$46,$46,$46,$46,$46,$46,$46,$4C,$4C,$4D,$4D,$4D,$4D,$4D,$4D
            .byte $4D,$4D,$4D,$4D,$48,$49,$49,$49,$49,$49,$4A,$4A,$4A,$4A,$4B,$4B
            .byte $4D,$4D,$4E,$4E,$4A,$4A,$4A,$4A,$4A,$4A,$4A,$4A,$4B,$4B,$4B,$4B
            .byte $4B,$4B,$4B,$4B,$4E,$4E,$4E,$4E,$4E,$4E,$4E,$4F,$4E,$4E,$4F,$4F
            .byte $4B,$4B,$4B,$4B,$4B,$4C,$4B,$4B,$4B,$4B,$4B,$4B,$4B,$4B,$4C,$4C
            .byte $4C,$4C,$4C,$4C,$4C,$4C,$4B,$4B,$4B,$4B,$4B,$4B,$3D,$00,$3D,$00
            .byte $3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3E,$00
            .byte $3E,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00
            .byte $3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00
            .byte $3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00,$3D,$00
            .byte $4F,$00
L448B:      .byte $0B,$16,$0B,$16,$16,$0C,$16,$0E,$0B,$16,$0A,$16,$0A,$16,$0D,$16
            .byte $0D,$16,$0C,$16,$0D,$16,$0C,$16,$0F,$11,$0D,$16,$0F,$11,$0E,$16
            .byte $0B,$16,$0E,$16,$0D,$16,$0E,$16,$0D,$16,$0B,$16,$0B,$16,$0B,$16
            .byte $0B,$16,$0B,$16,$0B,$16,$0B,$16,$0C,$16,$15,$16,$0D,$16,$16,$16
            .byte $16,$16,$16,$16,$0B,$16,$16,$0F,$16,$16,$10,$16,$10,$16,$16,$12
            .byte $16,$14,$16,$0F,$16,$10,$16,$10,$16,$10,$16,$10,$16,$10,$11,$15
            .byte $16,$10,$10,$14,$16,$16,$16,$16,$16,$10,$16,$16,$16,$11,$16,$10
            .byte $16,$12,$16,$10,$16,$10,$16,$12,$16,$12,$16,$12,$16,$12,$16,$16
            .byte $16,$16,$16,$16,$16,$16,$16,$12,$16,$12,$16,$12,$16,$00,$16,$00
            .byte $16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00
            .byte $16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00
            .byte $16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00
            .byte $16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00,$16,$00
            .byte $16,$00
L455D:      .byte $2A,$00,$2A,$00,$00,$2A,$00,$2A,$2A,$00,$2A,$00,$2A,$00,$2A,$00
            .byte $2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00
            .byte $2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00
            .byte $2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00,$2A,$00
            .byte $2A,$00,$2A,$00,$2A,$00,$CA,$00,$CA,$00,$00,$CA,$00,$CA,$CA,$00
            .byte $CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$00,$CA
            .byte $CA,$00,$00,$CA,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00
            .byte $CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00,$CA,$00
            .byte $00,$CA,$CA,$00,$00,$CA,$CA,$00,$CA,$00,$CA,$00
L45E9:      .byte $00,$00,$00,$00,$00,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01
            .byte $00,$01,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$01,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
            .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$01,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$00
            .byte $00,$00,$55,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$08,$0C,$14,$1C,$1C,$0C,$0E,$1E,$36,$72,$1C,$0C,$0E
            .byte $1E,$1E,$1E,$1C,$04,$06,$0E,$9E,$FE,$1C,$1C,$1C,$1C,$14,$24,$24
            .byte $24,$24,$24,$66,$E7,$00,$10,$30,$28,$38,$38,$30,$70,$78,$6C,$4E
            .byte $38,$30,$70,$78,$70,$70,$30,$30,$30,$28,$39,$3F,$38,$38,$38,$38
            .byte $28,$24,$24,$24,$24,$24,$66,$E7,$00,$00,$00,$60,$E0,$30,$10,$00
            .byte $00,$00,$00,$60,$40,$0C,$0C,$0C,$0E,$0E,$0A,$0A,$09,$19,$39,$00
            .byte $00,$00,$00,$08,$0C,$0C,$3C,$26,$06,$06,$06,$02,$00,$00,$00,$06
            .byte $07,$0C,$08,$00,$00,$00,$00,$06,$02,$30,$30,$30,$70,$70,$50,$50
            .byte $90,$98,$9C,$00,$00,$00,$00,$10,$30,$30,$3C,$64,$60,$60,$60,$40
            .byte $40,$40,$00,$20,$20,$30,$B0,$98,$FC,$7E,$3E,$1E,$1A,$98,$BC,$FC
            .byte $BC,$9C,$98,$FC,$7E,$1E,$1F,$1B,$18,$38,$78,$48,$48,$C8,$C8,$08
            .byte $08,$08,$0C,$0C,$00,$04,$04,$0C,$0D,$19,$3F,$7E,$7C,$78,$58,$19
            .byte $39,$3B,$39,$38,$10,$00,$00,$00,$80,$98,$18,$1C,$1E,$12,$12,$12
            .byte $13,$13,$10,$10,$30,$30,$00,$00,$0C,$18,$1C,$1C,$18,$3C,$7E,$7E
            .byte $7E,$5A,$18,$3C,$3C,$3C,$3C,$3C,$18,$3C,$7E,$7E,$7E,$DB,$99,$18
            .byte $18,$18,$18,$18,$18,$18,$18,$3C,$3C,$00,$00,$00,$C0,$40,$C0,$E0
            .byte $7E,$3E,$7A,$7A,$78,$50,$40,$00,$00,$E0,$30,$B0,$30,$10,$00,$00
            .byte $00,$02,$7A,$DA,$9E,$1C,$38,$3C,$6C,$66,$43,$41,$41,$C0,$00,$00
            .byte $00,$80,$40,$C0,$E0,$70,$38,$38,$38,$3C,$30,$10,$00,$00,$E0,$30
            .byte $B0,$30,$10,$10,$00,$00,$00,$00,$04,$2E,$3C,$18,$18,$18,$1C,$0C
            .byte $0C,$04,$04,$00,$00,$00,$03,$02,$07,$0F,$0E,$1C,$1C,$1C,$3C,$08
            .byte $00,$00,$07,$0F,$0F,$0F,$0F,$0E,$1C,$1C,$1C,$2C,$2C,$7C,$3C,$18
            .byte $18,$18,$38,$30,$30,$20,$20,$00,$00,$00,$03,$02,$03,$03,$06,$7C
            .byte $5E,$5E,$1E,$0A,$02,$00,$00,$07,$0F,$0F,$0F,$0F,$0E,$7C,$5E,$5E
            .byte $5E,$5B,$7B,$38,$1C,$1C,$36,$66,$C2,$82,$82,$03,$00,$00,$0C,$16
            .byte $1A,$1E,$FE,$FC,$BE,$3E,$1A,$0A,$02,$00,$06,$0F,$1F,$1F,$1F,$FE
            .byte $FC,$3E,$BE,$FA,$3A,$7A,$FB,$FF,$DC,$CC,$6C,$7C,$78,$3C,$30,$38
            .byte $00,$00,$0C,$16,$1A,$7E,$FC,$FE,$9F,$5B,$39,$11,$00,$00,$00,$80
            .byte $00,$02,$03,$03,$03,$07,$0E,$0E,$0F,$05,$FC,$FC,$45,$05,$04,$04
            .byte $1C,$1C,$00,$00,$30,$68,$58,$78,$7F,$3F,$7D,$7C,$7C,$58,$50,$40
            .byte $00,$60,$F0,$F8,$F8,$F8,$7F,$3F,$7D,$7D,$7F,$5C,$5E,$5F,$5F,$7B
            .byte $32,$36,$3E,$1C,$3C,$0C,$1C,$00,$00,$30,$68,$58,$7E,$3F,$7F,$F9
            .byte $DA,$9C,$88,$00,$00,$00,$01,$00,$40,$80,$C0,$C0,$80,$00,$00,$30
            .byte $20,$3F,$3F,$B2,$A0,$20,$20,$38,$38,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$18,$7E,$7E,$DB,$99,$00,$00,$00,$00,$18,$3C,$3C,$3C
            .byte $3C,$18,$81,$81,$81,$00,$00,$18,$3C,$7E,$E7,$C3,$66,$24,$66,$00
            .byte $00,$00,$00,$81,$81,$DB,$7E,$7E,$3C,$3C,$18,$99,$BD,$FF,$BD,$3C
            .byte $18,$00,$00,$00,$00,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$3C
            .byte $24,$42,$00,$00,$00,$E0,$30,$B0,$30,$10,$00,$00,$00,$00,$00,$04
            .byte $14,$30,$30,$30,$30,$3C,$1E,$12,$0A,$08,$18,$00,$00,$00,$00,$C0
            .byte $40,$C0,$E0,$E0,$78,$7C,$74,$74,$30,$20,$00,$00,$00,$70,$18,$58
            .byte $98,$88,$00,$40,$40,$00,$00,$10,$F0,$F0,$98,$58,$48,$2C,$24,$26
            .byte $02,$00,$00,$00,$00,$60,$20,$60,$70,$38,$3C,$38,$30,$30,$20,$00
            .byte $00,$00,$07,$0C,$0D,$0C,$08,$00,$00,$00,$00,$00,$20,$28,$0C,$0C
            .byte $0C,$0C,$3C,$78,$48,$50,$10,$18,$00,$00,$00,$00,$03,$02,$03,$07
            .byte $07,$1E,$3E,$2E,$2E,$0C,$04,$00,$00,$00,$0E,$18,$1A,$19,$11,$00
            .byte $02,$02,$00,$00,$08,$0F,$0F,$19,$1A,$12,$34,$24,$64,$40,$00,$00
            .byte $00,$00,$06,$04,$06,$0E,$1C,$3C,$1C,$0C,$0C,$04,$00,$18,$3C,$14
            .byte $3C,$3C,$3E,$0E,$3E,$1B,$33,$73,$7E,$00,$00,$22,$36,$36,$36,$22
            .byte $22,$22,$66,$EE,$01,$07,$03,$2A,$02,$02,$00,$30,$00,$04,$8C,$8C
            .byte $80,$3E,$3E,$1C,$00,$18,$3C,$28,$3C,$3C,$7C,$70,$7C,$E8,$EE,$CE
            .byte $7C,$00,$00,$44,$6C,$6C,$6C,$44,$44,$44,$66,$77,$80,$E0,$C0,$54
            .byte $40,$40,$00,$0C,$00,$11,$11,$31,$00,$7C,$7C,$38,$00,$00,$00,$00
            .byte $44,$44,$66,$77,$04,$9C,$2C,$08,$08,$48,$68,$60,$00,$00,$00,$00
            .byte $08,$C8,$F0,$F0,$60,$04,$0C,$0C,$0C,$0C,$04,$04,$0C,$7C,$7E,$5E
            .byte $0E,$0E,$0E,$0E,$0E,$06,$04,$06,$06,$07,$05,$05,$0D,$20,$39,$34
            .byte $10,$10,$12,$16,$06,$00,$00,$00,$00,$10,$13,$0F,$0F,$06,$20,$30
            .byte $30
L4A4A:      .byte $30,$30,$20,$20,$30,$3E,$7E,$7A,$70,$70,$70,$70,$70,$60,$20,$60
            .byte $60,$E0,$A0,$A0,$B0,$00,$60,$70,$D0,$F0,$F0,$78,$38,$38,$7C,$7C
            .byte $3C,$38,$20,$04,$04,$0C,$1C,$1C,$0C,$0E,$06,$02,$06,$04,$1C,$0C
            .byte $28,$08,$08,$00,$40,$40,$00,$00,$00,$06,$1C,$38,$38,$10,$00,$60
            .byte $70,$D0,$F0,$F0,$78,$38,$7E,$7F,$3C,$7C,$F8,$80,$04,$04,$2C,$3C
            .byte $3C,$37,$37,$21,$61,$60,$04,$1C,$0C,$28,$08,$08,$00,$40,$00,$00
            .byte $01,$01,$04,$3C,$B8,$B8,$10,$00,$06,$0E,$0B,$0F,$0F,$1E,$1C,$1C
            .byte $1E,$3E,$3C,$1C,$04,$04,$20,$30,$38,$38,$30,$70,$60,$40,$60,$20
            .byte $38,$30,$14,$10,$10,$00,$02,$02,$00,$00,$00,$60,$38,$3C,$1C,$18
            .byte $00,$06,$0E,$0B,$0F,$0F,$1E,$1C,$7E,$FE,$3C,$3E,$1F,$01,$20,$20
            .byte $34,$3C,$FC,$EC,$8C,$84,$06,$06,$20,$38,$30,$14,$10,$10,$00,$02
            .byte $00,$00,$80,$80,$20,$3C,$1D,$1D,$08,$00,$0C,$18,$38,$34,$3C,$1C
            .byte $3E,$E6,$E4,$BE,$3F,$1F,$4D,$C0,$C4,$EC,$CC,$6C,$7C,$78,$3C,$30
            .byte $38,$00,$01,$27,$03,$0A,$02,$00,$18,$18,$00,$80,$80,$20,$30,$3D
            .byte $39,$10,$01,$27,$0A,$02,$02,$02,$12,$1A,$18,$00,$00,$00,$00,$02
            .byte $32,$3C,$3C,$18,$02,$06,$06,$06,$06,$06,$02,$02,$06,$3E,$3F,$2F
            .byte $07,$07,$07,$FF,$FF,$43,$02,$0A,$1E,$1E,$00,$30,$18,$3C,$28,$3C
            .byte $7C,$67,$27,$7D,$FC,$FC,$F8,$B2,$03,$23,$37,$33,$37,$3E,$1E,$3C
            .byte $0C,$1C,$80,$80,$E4,$C0,$50,$40,$00,$18,$18,$00,$01,$01,$04,$0C
            .byte $BC,$9C,$08,$80,$E4,$D0,$40,$40,$40,$48,$58,$18,$00,$00,$00,$40
            .byte $4C,$3C,$3C,$18,$40,$60,$60,$60,$60,$60,$40,$40,$60,$7C,$FC,$F4
            .byte $E0,$E0,$FF,$FF,$C2,$40,$50,$78,$78,$00,$18,$3C,$14,$3C,$3C,$3E
            .byte $2E,$3E,$1E,$7F,$7F,$7F,$41,$41,$63,$34,$36,$36,$14,$14,$1C,$3C
            .byte $7C,$01,$07,$03,$2B,$02,$02,$00,$10,$00,$00,$00,$00,$00,$3E,$3E
            .byte $9C,$43,$41,$01,$18,$1C,$34,$3C,$3C,$04,$06,$24,$BE,$9F,$FB,$F3
            .byte $72,$3E,$00,$00,$22,$36,$36,$22,$22,$22,$66,$EE,$05,$23,$0B,$03
            .byte $82,$9A,$D8,$98,$00,$00,$04,$0C,$0C,$00,$3E,$3E,$1C,$18,$38,$2C
            .byte $3C,$3C,$20,$60,$24,$7D,$F9,$DF,$CF,$4E,$7C,$00,$00,$44,$6C,$6C
            .byte $44,$44,$44,$66,$77,$20,$C4,$D0,$C0,$41,$59,$1B,$19,$00,$00,$20
            .byte $30,$30,$00,$7C,$7C,$38,$00,$30,$78,$50,$78,$78,$F8,$C0,$F8,$B0
            .byte $BC,$BE,$B6,$E6,$00,$00,$88,$D8,$F8,$68,$28,$3A,$1E,$1C,$80,$C0
            .byte $80,$A8,$80,$80,$00,$38,$00,$40,$40,$48,$19,$F9,$F9,$F9,$F8,$D8
            .byte $F8,$68,$28,$3A,$1E,$1C,$00,$00,$00,$00,$00,$00,$80,$E4,$50,$40
            .byte $40,$48,$58,$18,$00,$00,$00,$02,$42,$4C,$3C,$3C,$78,$43,$00,$00
            .byte $00,$00,$00,$00,$40,$60,$60,$60,$60,$40,$40,$60,$60,$F0,$F0,$F0
            .byte $F0,$F4,$F4,$FC,$7C,$7E,$00,$0C,$1E,$0A,$1E,$1E,$1F,$03,$1F,$0D
            .byte $3D,$6D,$67,$40,$00,$11,$1B,$1B,$1F,$16,$14,$5C,$78,$38,$01,$03
            .byte $01,$15,$01,$01,$00,$1C,$00,$02,$02,$12,$18,$9F,$9F,$8E,$00,$00
            .byte $00,$00,$00,$00,$38,$38,$00,$00,$00,$00,$00,$00,$01,$27,$0B,$02
            .byte $02,$12,$1A,$18,$00,$00,$00,$40,$42,$32,$3C,$3C,$1E,$C2,$00,$00
            .byte $00,$00,$00,$00,$02,$06,$06,$06,$06,$02,$02,$06,$06,$0F,$0F,$0F
            .byte $0F,$2F,$2F,$3F,$3E,$7E,$00,$00,$20,$60,$50,$70,$70,$60,$E0,$F0
            .byte $F8,$DC,$54,$00,$60,$C0,$90,$A0,$80,$00,$00,$00,$00,$00,$20,$22
            .byte $72,$70,$70,$50,$38,$28,$28,$1C,$1F,$0E,$04,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$30,$60,$58,$78,$3C,$7E,$73,$F6,$DE,$9C
            .byte $88,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$C0,$C0,$C0,$00
            .byte $00,$28,$28,$38,$3C,$34,$34,$BE,$BE,$00,$00,$04,$06,$0A,$0E,$0E
            .byte $06,$07,$0F,$1F,$3B,$2B,$01,$00,$06,$03,$09,$05,$01,$00,$00,$00
            .byte $00,$00,$04,$44,$4E,$0E,$0E,$0A,$1C,$14,$14,$38,$F8,$70,$20,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$06,$1A,$1E,$3C,$7E
            .byte $CE,$6F,$7B,$39,$11,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $02,$03,$03,$03,$00,$00,$14,$14,$1C,$3C,$2C,$2C,$7D,$7D,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$30
            .byte $18,$28,$3E,$31,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$40,$62,$62,$6B,$7F,$FE,$FE,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$18,$14
            .byte $BC,$CC,$C8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$02,$46,$46,$D6,$FE,$7F,$7F,$00,$10,$32,$32,$20,$20
            .byte $20,$B2,$BE,$DE,$FF,$7F,$3E,$00,$00,$22,$37,$33,$37,$16,$13,$10
            .byte $30,$70,$0C,$1C,$BE,$BE,$BE,$FE,$BE,$BE,$BE,$DE,$FF,$7F,$3F,$3F
            .byte $3E,$3E,$36,$02,$02,$02,$02,$00,$08,$4C,$4C,$04,$04,$04,$4D,$7D
            .byte $7B,$FF,$FE,$7C,$00,$04,$44,$EC,$CC,$EC,$68,$C8,$08,$0C,$0E,$30
            .byte $38,$7D,$7D,$7F,$7D,$7C,$7D,$7D,$7B,$7E,$7C,$FC,$FC,$7C,$38,$00
            .byte $60,$70,$D0,$F0,$F0,$78,$38,$7E,$7F,$3C,$7C,$F8,$80,$04,$04,$2C
            .byte $7C,$6C,$46,$C6,$C3,$01,$01,$04,$7C,$7C,$F8,$F8,$F8,$78,$78,$7E
            .byte $7F,$3D,$7D,$FD,$BC,$BC,$B8,$30,$00,$0E,$0E,$0B,$0F,$0F,$0E,$0C
            .byte $1E,$7E,$FC,$3E,$1F,$01,$20,$20,$34,$3E,$36,$62,$E3,$C3,$80,$80
            .byte $20,$3E,$3E,$1F,$1F,$1E,$1E,$1E,$1E,$7E,$FC,$BE,$BF,$3D,$3D,$3D
            .byte $3C,$3E,$00,$00,$00,$00,$00,$00,$00,$04,$08,$0C,$78,$7C,$38,$7E
            .byte $FE,$FF,$81,$00,$44,$6E,$E7,$C3,$66,$E7,$00,$00,$00,$00,$60,$78
            .byte $3C,$7C,$7C,$7C,$7C,$7C,$38,$7E,$FE,$FE,$FC,$FD,$FD,$FF,$E7,$C3
            .byte $66,$E7,$08,$08,$04,$04,$85,$8D,$89,$FF,$FF,$FF,$FE,$7E,$7C,$7C
            .byte $7C,$00,$00,$44,$6C,$6C,$44,$44,$6C,$C6,$39,$FD,$FF,$FD,$7D,$7D
            .byte $39,$7F,$7F,$7F,$FE,$7E,$7C,$7C,$7C,$7C,$7C,$7C,$7C,$6C,$40,$40
            .byte $6C,$06,$00,$60,$70,$D0,$F0,$F8,$78,$38,$3C,$6C,$6C,$2C,$78,$60
            .byte $04,$04,$6C,$EC,$CE,$6E,$26,$62,$42,$04,$7C,$7C,$F8,$F8,$F8,$78
            .byte $78,$7C,$7C,$7C,$3C,$FE,$FC,$3C,$3C,$7C,$EC,$CE,$6E,$26,$62,$42
            .byte $00,$06,$0E,$0B,$0F,$0F,$1E,$3C,$3C,$6E,$6E,$7C,$3E,$06,$20,$20
            .byte $36,$37,$73,$76,$64,$46,$42,$20,$38,$3C,$1C,$18,$18,$18,$3A,$3A
            .byte $7C,$7C,$3C,$FF,$7D,$3C,$3C,$18,$04,$FF,$06,$32,$3A,$0A,$3A,$3A
            .byte $1A,$7E,$7E,$FC,$F8,$B8,$10,$38,$78,$68,$4C,$64,$64,$24,$24,$16
            .byte $89,$8D,$8A,$A3,$B5,$B3,$B5,$B6,$8A,$A3,$B3,$B5,$A3,$B5,$B6,$05
            .byte $89,$84,$A3,$B3,$B4,$B3,$02,$B4,$86,$B3,$B4,$B5,$B6,$A3,$8C,$02
            .byte $B4,$88,$B5,$B6,$8A,$A3,$B5,$B6,$8A,$8E,$03,$00,$82,$07,$37,$03
            .byte $00,$83,$07,$00,$07,$02,$00,$85,$8B,$B6,$89,$8A,$8E,$02,$00,$83
            .byte $37,$00,$08,$02,$00,$81,$08,$03,$00,$83,$37,$00,$08,$1B,$00,$83
            .byte $EB,$EC,$ED,$23,$00,$85,$85,$90,$EE,$EF,$F0,$02,$AA,$04,$90,$03
            .byte $AA,$03,$90,$81,$AA,$05,$2A,$81,$AA,$02,$90,$81,$2A,$05,$00,$81
            .byte $A6,$08,$8D,$12,$00,$02,$20,$81,$21,$0A,$00,$82,$94,$92,$04,$A8
            .byte $83,$92,$B1,$92,$03,$8D,$81,$A5,$03,$00,$85,$C1,$C2,$C3,$C4,$C5
            .byte $06,$00,$02,$20,$81,$21,$0C,$00,$81,$95,$02,$96,$81,$97,$02,$00
            .byte $84,$82,$BB,$00,$C0,$04,$00,$86,$C6,$C8,$C9,$CA,$CB,$CC,$05,$00
            .byte $02,$20,$81,$21,$04,$00,$81,$A6,$07,$8D,$04,$A9,$03,$8D,$83,$B2
            .byte $00,$94,$05,$00,$81,$17,$02,$9C,$81,$15,$06,$00,$03,$2C,$04,$00
            .byte $86,$94,$92,$A8,$92,$B1,$92,$06,$A8,$84,$92,$B1,$BB,$B2,$07,$00
            .byte $04,$9C,$0F,$00,$81,$89,$03,$00,$86,$9C,$95,$97,$95,$97,$9C,$02
            .byte $00,$82,$B2,$B9,$06,$91,$81,$CD,$04,$CE,$81,$D2,$0E,$91,$81,$AD
            .byte $03,$91,$81,$99,$02,$9A,$02,$98,$81,$99,$02,$91,$81,$B9,$80,$12
            .byte $89,$82,$8A,$A3,$02,$B3,$82,$B5,$B6,$10,$89,$88,$8A,$A3,$B3,$B4
            .byte $B5,$33,$34,$35,$02,$B3,$82,$B5,$B6,$04,$89,$82,$8A,$8E,$02,$00
            .byte $86,$37,$00,$37,$00,$8B,$B6,$04,$89,$81,$A3,$02,$B3,$02,$B4,$82
            .byte $B5,$B6,$03,$89,$84,$00,$37,$07,$08,$02,$00,$84,$37,$00,$07,$37
            .byte $02,$00,$84,$8B,$B6,$8A,$8E,$0B,$00,$88,$8B,$B6,$8E,$07,$00,$37
            .byte $00,$07,$02,$00,$84,$8B,$B6,$8A,$84,$26,$00,$81,$85,$09,$8D,$81
            .byte $A5,$04,$00,$81,$2A,$03,$90,$04,$2A,$03,$90,$81,$2A,$04,$00,$81
            .byte $A6,$09,$8D,$02,$92,$03,$A8,$02,$92,$83,$A8,$92,$93,$09,$00,$82
            .byte $3D,$2B,$09,$00,$84,$94,$92,$A8,$92,$03,$A8,$88,$92,$BB,$92,$82
            .byte $00,$95,$96,$97,$02,$00,$81,$89,$0B,$00,$82,$24,$3A,$0B,$00,$88
            .byte $89,$00,$9B,$96,$9D,$00,$B2,$00,$02,$8D,$03,$A9,$02,$8D,$81,$A9
            .byte $07,$8D,$81,$A5,$03,$00,$82,$20,$21,$03,$00,$81,$A6,$07,$8D,$82
            .byte $A9,$8D,$03,$A9,$85,$8D,$B8,$8D,$BB,$92,$03,$A8,$83,$92,$B1,$92
            .byte $03,$A8,$02,$92,$83,$A8,$92,$93,$03,$00,$02,$2C,$03,$00,$84,$94
            .byte $92,$A8,$92,$03,$A8,$83,$92,$B1,$92,$03,$A8,$88,$92,$BB,$92,$B2
            .byte $00,$95,$96,$97,$03,$00,$83,$95,$96,$97,$02,$00,$81,$89,$0C,$00
            .byte $85,$89,$00,$9B,$96,$9D,$03,$00,$8B,$9B,$96,$9D,$00,$B2,$00,$B9
            .byte $91,$98,$99,$9A,$03,$91,$83,$98,$99,$9A,$02,$91,$81,$AD,$05,$91
            .byte $02,$A2,$05,$91,$85,$AD,$91,$98,$99,$9A,$03,$91,$86,$98,$99,$9A
            .byte $91,$B9,$91,$80,$28,$89,$8A,$33,$34,$35,$23,$35,$36,$23,$33,$34
            .byte $B3,$02,$B4,$87,$B5,$B6,$A3,$B3,$B4,$B5,$A3,$02,$B3,$88,$B4,$B5
            .byte $23,$33,$34,$35,$36,$23,$02,$33,$83,$34,$35,$36,$06,$89,$81,$37
            .byte $02,$00,$81,$37,$03,$00,$83,$B7,$07,$37,$04,$00,$81,$07,$02,$08
            .byte $03,$00,$82,$07,$08,$02,$00,$81,$37,$04,$00,$83,$37,$00,$37,$02
            .byte $00,$87,$0B,$B6,$89,$8A,$B6,$8A,$84,$21,$00,$83,$EB,$EC,$ED,$03
            .byte $00,$09,$8D,$81,$A5,$02,$91,$81,$11,$04,$80,$03,$11,$02,$80,$81
            .byte $A6,$03,$8D,$81,$A5,$03,$80,$03,$91,$84,$11,$EE,$EF,$F0,$03,$91
            .byte $82,$BB,$92,$02,$A8,$86,$92,$B1,$92,$A8,$92,$93,$07,$00,$8A,$2C
            .byte $21,$20,$00,$80,$94,$92,$A8,$92,$93,$03,$80,$84,$94,$B2,$D1,$D0
            .byte $03,$80,$82,$CF,$D0,$02,$B2,$83,$00,$95,$97,$03,$00,$81,$89,$09
            .byte $00,$02,$21,$81,$20,$04,$00,$81,$89,$02,$00,$81,$80,$02,$00,$8C
            .byte $80,$B2,$80,$C1,$C2,$C3,$C4,$C5,$80,$B2,$B8,$8D,$02,$A9,$86,$8D
            .byte $A5,$00,$89,$00,$A6,$05,$8D,$82,$A5,$00,$02,$21,$83,$20,$80,$A6
            .byte $02,$8D,$81,$A9,$02,$8D,$81,$A5,$03,$80,$8A,$B9,$80,$C6,$C8,$C9
            .byte $CA,$CB,$CC,$B9,$BB,$02,$92,$8E,$A8,$92,$93,$00,$89,$00,$94,$92
            .byte $A8,$92,$A8,$92,$93,$00,$03,$2C,$88,$80,$94,$92,$A8,$92,$A8,$92
            .byte $93,$03,$80,$81,$89,$02,$00,$82,$9C,$1C,$02,$9C,$81,$80,$02,$B2
            .byte $02,$00,$81,$89,$03,$00,$81,$89,$03,$00,$83,$89,$00,$89,$09,$00
            .byte $83,$89,$00,$89,$05,$00,$81,$89,$02,$00,$82,$9C,$1C,$02,$9C,$83
            .byte $80,$B2,$B9,$02,$91,$81,$AD,$03,$91,$81,$AD,$03,$91,$83,$AD,$91
            .byte $AD,$09,$91,$83,$AD,$91,$AD,$05,$91,$83,$AD,$91,$CD,$04,$CE,$82
            .byte $91,$B9,$80,$84,$A3,$B3,$B5,$B6,$02,$89,$81,$A3,$02,$B3,$89,$B5
            .byte $A3,$B3,$B5,$B3,$B5,$A3,$B5,$B6,$02,$89,$94,$A3,$B3,$B5,$B6,$A3
            .byte $B3,$B5,$B3,$B5,$B6,$A3,$B5,$B3,$B5,$A3,$B5,$B3,$B5,$B6,$89,$02
            .byte $07,$02,$00,$84,$8B,$8E,$00,$07,$02,$00,$81,$07,$07,$00,$83,$8B
            .byte $8E,$07,$04
L533D:      .byte $00,$81,$07,$04,$00,$81,$07,$03,$00,$83,$07,$00,$07,$02,$00,$81
            .byte $8B,$07,$00,$97,$68,$3C,$68,$3C,$6A,$3C,$6A,$3C,$69,$3C,$69,$00
            .byte $68,$3C,$68,$3C,$6A,$3C,$6A,$3C,$69,$3C,$69,$02,$00,$8D,$68,$3C
            .byte $68,$3C,$69,$3C,$69,$80,$68,$3C,$6A,$3C,$69,$03,$00,$81,$36,$02
            .byte $09,$83,$96,$09,$96,$02,$09,$81,$0A,$03,$00,$81,$36,$02,$09,$83
            .byte $96,$09,$96,$02,$09,$81,$0A,$04,$00,$81,$36,$03,$09,$82,$0A,$00
            .byte $02,$AA,$03,$09,$04,$2A,$81,$AA,$07,$09,$05,$AA,$07,$4B,$02,$AA
            .byte $04,$2A,$03,$09,$02,$AA,$8A,$B2,$00,$09,$16,$09,$00,$21,$20,$00
            .byte $B2,$07,$00,$85,$B2,$97,$16,$95,$B2,$07,$00,$81,$B2,$02,$00,$86
            .byte $21,$20,$00,$09,$16,$09,$02,$00,$8A,$B2,$00,$09,$1C,$09,$00,$21
            .byte $20,$00,$B2,$07,$00,$85,$B2,$1C,$96,$1C,$B2,$07,$00,$81,$B2,$02
            .byte $00,$86,$21,$20,$00,$09,$1C,$09,$02,$00,$8A,$B2,$00,$09,$16,$09
            .byte $00,$21,$20,$00,$B2,$07,$00,$85,$B2,$1C,$16,$1C,$B2,$07,$00,$95
            .byte $B2,$AA,$00,$21,$20,$00,$09,$16,$09,$00,$AA,$B2,$00,$15,$16,$17
            .byte $00,$21,$20,$00,$B2,$07,$00,$85,$B2,$1C,$16,$1C,$B2,$07,$00,$90
            .byte $B2,$93,$00,$21,$20,$00,$15,$16,$17,$00,$94,$B2,$84,$1C,$16,$1C
            .byte $04,$00,$81,$B2,$07,$00,$85,$B2,$9C,$16,$9C,$B2,$07,$00,$81,$B2
            .byte $05,$00,$83,$1C,$16,$1C,$02,$00,$86,$B2,$91,$AD,$91,$AD,$91,$02
            .byte $22,$82,$91,$B9,$07,$8F,$81,$B9,$03,$AD,$81,$B9,$07,$8F,$81,$B9
            .byte $02,$91,$02,$22,$84,$91,$AD,$91,$AD,$02,$91,$81,$B9,$80,$81,$99
            .byte $0F,$AE,$02,$C0,$81,$61,$02,$62,$81,$63,$02,$C0,$0F,$AE,$84,$99
            .byte $B2,$D1,$D0,$04,$CF,$85,$20,$21,$D1,$B2,$D1,$02,$CF,$82,$D0,$CF
            .byte $02,$00,$81,$61,$02,$62,$81,$63,$02,$00,$03,$CF,$86,$D0,$D1,$B2
            .byte $D1,$20,$21,$03,$CF,$02,$D0,$83,$CF,$D0,$B2,$06,$00,$85,$20,$21
            .byte $00,$B2,$93,$06,$00,$81,$61,$02,$62,$81,$63,$06,$00,$85,$94,$B2
            .byte $00,$20,$21,$06,$00,$82,$82,$B2,$04,$00,$86,$AA,$00,$20,$21,$00
            .byte $B2,$03,$00,$04,$AA,$81,$61,$02,$62,$81,$63,$04,$AA,$03,$00,$86
            .byte $B2,$00,$20,$21,$00,$AA,$04,$00,$83,$AA,$B2,$9B,$02,$9C,$87,$9D
            .byte $B2,$00,$20,$21,$00,$B2,$03,$00,$85,$B2,$D7,$B2,$C0,$61,$02,$62
            .byte $85,$63,$C0,$B2,$D7,$B2,$03,$00,$87,$B2,$00,$20,$21,$00,$B2,$9B
            .byte $02,$9C,$81,$9D,$02,$B2,$81,$95,$02,$96,$87,$97,$B2,$00,$20,$21
            .byte $00,$B2,$03,$00,$85,$D1,$B2,$C0,$00,$61,$02,$62,$85,$63,$00,$C0
            .byte $B2,$D1,$03,$00,$87,$B2,$00,$20,$21,$00,$B2,$95,$02,$96,$81,$97
            .byte $02,$B2,$81,$95,$02,$96,$87,$97,$B2,$00,$20,$21,$00,$B2,$04,$AA
            .byte $81,$B2,$02,$00,$81,$61,$02,$62,$81,$63,$02,$00,$81,$B2,$04,$AA
            .byte $87,$B2,$00,$20,$21,$00,$B2,$95,$02,$96,$81,$97,$02,$B2,$81,$9B
            .byte $02,$9C,$83,$9D,$B2,$00,$02,$2C,$87,$00,$CF,$D0,$D3,$CF,$D1,$B2
            .byte $02,$00,$81,$61,$02,$62,$81,$63,$02,$00,$02,$CF,$82,$D0,$CF,$02
            .byte $D0,$81,$00,$02,$2C,$83,$00,$CF,$9B,$02,$9C,$81,$9D,$02,$B2,$04
            .byte $00,$81,$B2,$09,$00,$81,$B2,$02,$00,$81,$61,$02,$62,$81,$63,$11
            .byte $00,$02,$B2,$04,$00,$81,$B2,$09,$91,$81,$B9,$02,$91,$81,$61,$02
            .byte $62,$81,$63,$11,$91,$82,$B9,$B2,$04,$83,$81,$B2,$0C,$D7,$04,$8F
            .byte $12,$D7,$02,$00,$80,$82,$3E,$AE,$03,$3E,$82,$AE,$AF,$04,$00,$82
            .byte $B0,$AE,$03,$A8,$81,$3E,$03,$A8,$08,$3E,$81,$AE,$03,$3E,$82,$AE
            .byte $AF,$03,$C0,$8A,$B0,$AE,$3E,$B2,$A7,$93,$CF,$D0,$A7,$93,$05,$00
            .byte $9D,$CF,$95,$96,$97,$CF,$95,$96,$97,$CF,$D0,$CF,$00,$CF,$D0,$D3
            .byte $00,$94,$A7,$B2,$A7,$93,$00,$61,$62,$63,$00,$94,$A7,$B2,$0C,$00
            .byte $87,$95,$96,$97,$00,$95,$96,$97,$0A,$00,$81,$B2,$03,$00,$83,$61
            .byte $62,$63,$02,$00,$82,$83,$B2,$03,$00,$81,$90,$08,$3E,$03,$AD,$81
            .byte $3E,$03,$AD,$0A,$3E,$81,$AE,$02,$3E,$85,$AF,$61,$62,$63,$B0,$02
            .byte $3E,$81,$B2,$05,$00,$83,$D3,$D0,$D3,$02,$00,$82,$D3,$CF,$03,$9C
            .byte $81,$D0,$02,$9C,$86,$1C,$D0,$CF,$D0,$CF,$00,$02,$CF,$8A,$D0,$D3
            .byte $CF,$94,$A7,$B2,$00,$61,$62,$63,$02,$00,$82,$D3,$B2,$0C,$00,$87
            .byte $95,$96,$97,$00,$95,$96,$97,$0C,$00,$85,$B2,$00,$61,$62,$63,$02
            .byte $00,$82,$84,$B2,$0C,$3E,$03,$AD,$81,$3E,$03,$AD,$06,$3E,$81,$AF
            .byte $03,$00,$88,$B0,$3E,$AE,$AF,$61,$62,$63,$B0,$02,$3E,$02,$B2,$81
            .byte $D1,$02,$CF,$85,$D1,$D0,$CF,$D1,$00,$02,$CF,$81,$D1,$03,$9C,$81
            .byte $D0,$03,$9C,$84,$D0,$D1,$CF,$D1,$03,$B2,$03,$00,$02,$B2,$02,$00
            .byte $83,$61,$62,$63,$02,$00,$02,$B2,$82,$A7,$93,$0A,$00,$87,$95,$96
            .byte $97,$00,$95,$96,$97,$03,$00,$84,$94,$A7,$B2,$93,$03,$00,$89,$94
            .byte $B2,$00,$00,$61,$62,$63,$00,$00,$02,$B2,$0C,$00,$87,$95,$96,$97
            .byte $00,$95,$96,$97,$05,$00,$81,$B2,$05,$00,$81,$B2,$02,$00,$83,$61
            .byte $62,$63,$02,$00,$82,$B2,$AE,$0C,$3E,$03,$AD,$81,$3E,$03,$AD,$05
            .byte $3E,$81,$AE,$05,$3E,$89,$AE,$3E,$AF,$61,$62,$63,$B0,$3E,$AE,$80
            .byte $84,$D1,$CF,$D0,$CF,$02,$D3,$81,$CF,$02,$D0,$84,$CF,$D1,$D0,$CF
            .byte $02,$D0,$81,$CF,$02,$D1,$86,$D3,$CF,$D0,$CF,$D3,$CF,$02,$D0,$84
            .byte $CF,$D3,$CF,$D1,$03,$CF,$82,$D0,$CF,$04,$C0,$81,$D7,$07,$00,$81
            .byte $A6,$15,$8D,$81,$A5,$05,$00,$81,$61,$02,$62,$83,$63,$D7,$AA,$07
            .byte $00,$81,$EB,$02,$A6,$81,$A8,$02,$92,$81,$C0,$03,$92,$81,$A8,$03
            .byte $92,$81,$C0,$02,$92,$81,$A8,$02,$A5,$81,$ED,$06,$00,$81,$61,$02
            .byte $62,$84,$63,$D7,$A7,$B2,$06,$00,$84,$94,$00,$93,$89,$02,$00,$81
            .byte $94,$03,$00,$81,$89,$03,$00,$81,$94,$02,$00,$84,$89,$94,$00,$93
            .byte $06,$00,$81,$61,$02,$62,$84,$63,$D7,$82,$B2,$09,$00,$81,$89,$06
            .byte $00,$81,$89,$06,$00,$81,$89,$09,$00,$81,$61,$02,$62,$84,$63,$D7
            .byte $91,$B2,$03,$11,$81,$A6,$05,$8D,$81,$A9,$06,$8D,$81,$A9,$06,$8D
            .byte $81,$A9,$05,$8D,$81,$A5,$03,$00,$81,$61,$02,$62,$82,$63,$D7,$02
            .byte $E2,$03,$28,$85,$00,$FE,$92,$A8,$92,$04,$A8,$09,$92,$04,$A8,$84
            .byte $92,$A8,$92,$FF,$04,$00,$81,$61,$02,$62,$82,$63,$D7,$02,$E2,$03
            .byte $28,$86,$00,$94,$00,$89,$00,$9B,$02,$9C,$81,$9D,$09,$00,$81,$9B
            .byte $02,$9C,$85,$9D,$00,$89,$00,$93,$04,$00,$81,$61,$02,$62,$82,$63
            .byte $D7,$02,$E2,$03,$28,$03,$00,$83,$89,$00,$9B,$02,$9C,$81,$9D,$09
            .byte $00,$81,$9B,$02,$9C,$83,$9D,$00,$89,$06,$00,$81,$61,$02,$62,$82
            .byte $63,$D7,$02,$E2,$03,$28,$03,$91,$82,$AD,$91,$04,$AD,$04,$91,$81
            .byte $E0,$04,$91,$04,$AD,$82,$91,$AD,$06,$91,$81,$61,$02,$62,$81,$63
            .byte $24,$D7,$81,$61,$02,$62,$82,$63,$D7,$80,$02,$B2,$82,$D1,$93,$04
            .byte $00,$88,$A7,$CF,$D0,$CF,$94,$93,$D3,$CF,$07,$A8,$02,$D3,$8D,$94
            .byte $93,$CF,$A7,$D0,$CF,$A7,$D0,$B2,$CF,$A7,$CF,$D1,$04,$B2,$0E,$00
            .byte $87,$9B,$9C,$9D,$9C,$9B,$9C,$9D,$0A,$00,$81,$B2,$04,$00,$04,$B2
            .byte $05,$91,$81,$E0,$08,$91,$85,$98,$99,$9A,$98,$99,$02,$9A,$06,$91
            .byte $81,$E0,$03,$91,$81,$B2,$04,$00,$02,$B2,$88,$A7,$B2,$D1,$D0,$D3
            .byte $94,$93,$CF,$03,$A8,$85,$D3,$94,$93,$CF,$D0,$02,$A7,$03,$CF,$82
            .byte $D0,$CF,$02,$D3,$83,$94,$93,$D3,$03,$A8,$02,$CF,$81,$A7,$04,$00
            .byte $84,$B2,$A7,$00,$B2,$06,$00,$83,$9B,$9C,$9D,$11,$00,$83,$9B,$9C
            .byte $9D,$07,$00,$86,$B2,$83,$91,$B2,$91,$E0,$04,$91,$83,$98,$99,$9A
            .byte $06,$91,$81,$E0,$03,$91,$81,$E0,$06,$91,$83,$98,$99,$9A,$07,$91
            .byte $82,$B2,$91,$29,$D7,$88,$D1,$94,$93,$D3,$CF,$D0,$CF,$D3,$02,$00
            .byte $84,$D3,$D0,$CF,$D0,$02,$CF,$81,$D0,$02,$00,$02,$D3,$82,$CF,$D0
            .byte $03,$CF,$83,$D0,$CF,$D3,$02,$00,$84,$CF,$D3,$D0,$D3,$04,$CF,$81
            .byte $D7,$26,$00,$83,$84,$D7,$AA,$02,$22,$81,$AA,$1F,$E4,$04,$AA,$28
            .byte $D7,$02,$00,$80,$82,$CF,$D0,$02,$CF,$83,$A7,$CF,$D3,$03,$CF,$92
            .byte $D3,$CF,$D0,$E1,$D1,$C0,$00,$61,$62,$63,$61,$62,$63,$00,$C0,$D1
            .byte $E3,$CF,$02,$D0,$02,$CF,$82,$D3,$CF,$02,$D3,$85,$CF,$D3,$B2,$D0
            .byte $82,$0C,$00,$8E,$E1,$00,$94,$00,$61,$62,$63,$61,$62,$63,$00,$94
            .byte $00,$E3,$0B,$00,$82,$B2,$83,$02,$AA,$03,$2A,$81,$AA,$07,$00,$81
            .byte $E1,$03,$00,$86,$61,$62,$63,$61,$62,$63,$03,$00,$81,$E3,$07,$00
            .byte $81,$AA,$03,$2A,$88,$B2,$AA,$E2,$D7,$61,$62,$63,$E2,$07,$00,$81
            .byte $E1,$03,$AA,$86,$61,$62,$63,$61,$62,$63,$03,$AA,$81,$E3,$07,$00
            .byte $85,$E2,$61,$62,$63,$D7,$02,$E2,$86,$D7,$61,$62,$63,$E2,$AA,$06
            .byte $00,$8E,$E1,$B2,$D0,$C0,$61,$62,$63,$61,$62,$63,$C0,$D0,$B2,$E3
            .byte $06,$00,$86,$AA,$E2,$61,$62,$63,$D7,$02,$E2,$86,$D7,$61,$62,$63
            .byte $E2,$93,$07,$00,$81,$B2,$02,$00,$86,$61,$62,$63,$61,$62,$63,$02
            .byte $00,$81,$B2,$07,$00,$86,$94,$E2,$61,$62,$63,$D7,$02,$E2,$85,$D7
            .byte $61,$62,$63,$E2,$08,$00,$81,$B2,$02,$00,$86,$61,$62,$63,$61,$62
            .byte $63,$02,$00,$81,$B2,$08,$00,$8C,$E2,$61,$62,$63,$D7,$E2,$E1,$E2
            .byte $61,$62,$63,$C0,$05,$00,$81,$B0,$02,$BE,$8C,$AE,$AF,$00,$61,$62
            .byte $63,$61,$62,$63,$00,$B0,$AE,$02,$BE,$81,$AF,$05,$00,$8B,$C0,$61
            .byte $62,$63,$E2,$E3,$00,$B2,$61,$62,$63,$07,$00,$83,$E1,$E2,$E3,$02
            .byte $00,$86,$61,$62,$63,$61,$62,$63,$02,$00,$83,$E1,$E2,$E3,$07,$00
            .byte $8A,$61,$62,$63,$B2,$00,$84,$B2,$61,$62,$63,$07,$00,$83,$E1,$E2
            .byte $E3,$02,$00,$86,$61,$62,$63,$61,$62,$63,$02,$00,$83,$E1,$E2,$E3
            .byte $07,$00,$8B,$61,$62,$63,$B2,$85,$BE,$B2,$61,$62,$63,$B0,$02,$BE
            .byte $81,$AF,$02,$8F,$83,$B0,$BE,$E2,$02,$BE,$81,$AF,$06,$8F,$81,$B0
            .byte $02,$BE,$83,$E2,$BE,$AF,$02,$8F,$81,$B0,$02,$BE,$86,$AF,$61,$62
            .byte $63,$B2,$BE,$80,$82,$D1,$D0,$02,$CF,$85,$D3,$D1,$D3,$CF,$D0,$0B
            .byte $00,$84,$D3,$D0,$E2,$D1,$02,$CF,$82,$D0,$D3,$04,$00,$83,$94,$92
            .byte $E2,$04,$C0,$81,$E2,$0A,$00,$06,$2A,$06,$00,$81,$E2,$06,$00,$05
            .byte $2A,$82,$E2,$61,$02,$62,$83,$63,$E2,$82,$08,$00,$81,$61,$04,$62
            .byte $81,$63,$07,$00,$81,$E2,$06,$00,$81,$61,$03,$62,$83,$63,$E2,$61
            .byte $02,$62,$82,$63,$E2,$03,$AA,$04,$00,$81,$61,$03,$62,$02,$63,$03
            .byte $8F,$06,$00,$81,$E2,$04,$00,$81,$61,$03,$62,$02,$63,$83,$00,$E2
            .byte $61,$02,$62,$82,$63,$E2,$03,$B2,$02,$00,$81,$61,$03,$62,$02,$63
            .byte $02,$8F,$03,$E2,$06,$00,$84,$E2,$B2,$00,$61,$03,$62,$02,$63,$03
            .byte $00,$82,$C0,$61,$02,$62,$81,$63,$03,$E2,$83,$B2,$00,$61,$02,$62
            .byte $02,$63,$02,$8F,$03,$E2,$82,$A7,$93,$07,$00,$82,$B2,$61,$02,$62
            .byte $02,$63,$06,$00,$81,$61,$02,$62,$81,$63,$03,$E2,$81,$B2,$02,$61
            .byte $02,$62,$82,$63,$8F,$03,$E2,$81,$A7,$0A,$00,$82,$B2,$61,$02,$62
            .byte $82,$63,$8F,$06,$00,$81,$61,$02,$62,$81,$63,$03,$E2,$81,$B2,$05
            .byte $BF,$02,$E2,$81,$AE,$05,$BE,$81,$AF,$04,$00,$83,$B0,$BE,$AE,$05
            .byte $BF,$04,$BE,$83,$AF,$00,$61,$02,$62,$82,$63,$E2,$03,$A7,$83,$CF
            .byte $D0,$CF,$02,$D0,$84,$CF,$D0,$CF,$D0,$02,$CF,$02,$D0,$05,$00,$84
            .byte $D3,$CF,$D0,$CF,$02,$D0,$82,$93,$94,$03,$E2,$81,$93,$02,$00,$81
            .byte $61,$02,$62,$83,$63,$E2,$83,$1D,$00,$81,$E2,$04,$00,$81,$61,$02
            .byte $62,$82,$63,$E2,$04,$AA,$15,$E4,$02,$AA,$02,$A2,$83,$AA,$E2,$AA
            .byte $02,$A2,$82,$AA,$61,$02,$62,$82,$63,$E2,$80,$81,$0B,$02,$0C,$82
            .byte $0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A
            .byte $0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B
            .byte $02,$0C,$82,$0A,$0B,$02,$0C,$83,$0A,$0B,$0C,$02,$43,$81,$C5,$02
            .byte $7F,$86,$48,$08,$2D,$2E,$48,$08,$02,$00,$82,$48,$08,$02,$00,$82
            .byte $48,$08,$02,$7F,$82,$48,$08,$02,$7F,$82,$48,$08,$02,$7F,$82,$48
            .byte $08,$02,$00,$86,$48,$08,$2D,$2E,$48,$08,$03,$0C,$82,$C5,$94,$02
            .byte $00,$8D,$47,$46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$35,$3D,$02
            .byte $00,$82,$35,$3D,$02,$00,$82,$35,$3D,$02,$00,$8E,$35,$3D,$46,$07
            .byte $09,$47,$46,$07,$09,$47,$46,$C5,$01,$C5,$04,$00,$82,$48,$08,$02
            .byte $00,$82,$48,$08,$02,$00,$82,$48,$08,$0E,$00,$82,$48,$08,$02,$00
            .byte $82,$48,$08,$02,$00,$84,$46,$C5,$83,$C5,$04,$00,$03,$8E,$03,$0E
            .byte $04,$8E,$04,$8D,$81,$E0,$04,$8D,$81,$E0,$04,$8D,$0B,$8E,$81,$C5
            .byte $04,$00,$83,$46,$07,$00,$03,$44,$02,$00,$85,$46,$07,$11,$46,$07
            .byte $07,$00,$86,$46,$07,$10,$46,$07,$94,$07,$00,$83,$46,$C3,$C5,$04
            .byte $00,$82,$46,$07,$06,$00,$85,$46,$07,$11,$46,$07,$07,$00,$85,$46
            .byte $07,$10,$46,$07,$08,$00,$83,$46,$C3,$C5,$04,$8D,$02,$8E,$81,$8D
            .byte $03,$0D,$02,$8D,$05,$8E,$03,$8D,$81,$E0,$03,$8D,$05,$8E,$04,$8D
            .byte $81,$E0,$03,$8D,$88,$8E,$C3,$01,$46,$07,$11,$46,$07,$02,$00,$03
            .byte $44,$02,$00,$85,$46,$07,$11,$46,$07,$07,$00,$86,$46,$07,$10,$46
            .byte $07,$94,$07,$00,$88,$46,$C3,$82,$46,$07,$11,$46,$07,$07,$00,$85
            .byte $46,$07,$11,$46,$07,$07,$00,$85,$46,$07,$10,$46,$07,$08,$00,$82
            .byte $46,$C3,$06,$8E,$03,$8D,$81,$E0,$03,$8D,$05,$8E,$03,$8D,$81,$E0
            .byte $03,$8D,$05,$8E,$04,$8D,$81,$E0,$03,$8D,$02,$8E,$02,$00,$80,$83
            .byte $38,$39,$E2,$03,$62,$0D,$C0,$82,$48,$08,$10,$C0,$86,$E2,$32,$33
            .byte $3B,$3C,$E2,$03,$62,$0C,$00,$84,$93,$48,$08,$94,$0F,$00,$86,$E2
            .byte $36,$37,$10,$11,$E2,$03,$62,$1F,$00,$86,$E2,$10,$11,$10,$11,$E2
            .byte $03,$62,$04,$F0,$81,$E0,$12,$F0,$81,$E0,$04,$F0,$03,$00,$86,$E2
            .byte $10,$11,$10,$11,$E2,$03,$62,$81,$E2,$02,$90,$04,$81,$05,$90,$04
            .byte $81,$05,$90,$04,$81,$02,$90,$81,$E2,$03,$00,$86,$E2,$10,$11,$10
            .byte $11,$E2,$03,$62,$83,$E2,$10,$81,$04,$83,$81,$81,$03,$10,$81,$81
            .byte $04,$84,$81,$81,$03,$10,$81,$81,$04,$85,$83,$81,$10,$E2,$03,$00
            .byte $86,$E2,$10,$11,$10,$11,$E2,$03,$62,$81,$E2,$02,$10,$04,$01,$05
            .byte $10,$04,$01,$05,$10,$04,$01,$02,$10,$81,$E2,$03,$00,$83,$E2,$10
            .byte $11,$03,$C0,$03,$62,$81,$E2,$02,$C0,$04,$62,$05,$C0,$04,$62,$05
            .byte $C0,$04,$62,$03,$C0,$03,$00,$83,$E2,$10,$11,$03,$01,$03,$62,$82
            .byte $E2,$94,$02,$00,$02,$44,$07,$00,$02,$44,$07,$00,$02,$44,$07,$00
            .byte $84,$E2,$10,$11,$82,$02,$01,$03,$62,$81,$E2,$1E,$00,$83,$E2,$10
            .byte $11,$03,$CA,$03,$62,$81,$E2,$08,$F0,$81,$E0,$08,$F0,$81,$E0,$0C
            .byte $F0,$83,$E2,$10,$11,$80,$81,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82
            .byte $0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A
            .byte $0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B
            .byte $02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$C5,$02,$0C,$82,$48,$08,$02
            .byte $0C,$9A,$48,$08,$2D,$2E,$48,$08,$2D,$2E,$48,$08,$2D,$2E,$48,$08
            .byte $2D,$2E,$48,$08,$2D,$2E,$48,$08,$2D,$2E,$48,$08,$02,$00,$82,$48
            .byte $08,$02,$00,$82,$C3,$C5,$02,$01,$82,$48,$08,$02,$01,$A2,$09,$47
            .byte $46,$07,$09,$47,$35,$3D,$09,$47,$35,$3D,$09,$47,$35,$3D,$09,$47
            .byte $46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$09,$93,$46,$07,$C3,$C5
            .byte $02,$01,$82,$48,$08,$02,$01,$02,$00,$82,$48,$08,$0E,$00,$82,$48
            .byte $08,$02,$00,$82,$46,$07,$02,$00,$82,$48,$08,$02,$00,$86,$48,$08
            .byte $C3,$C5,$FE,$8E,$02,$8D,$82,$8E,$FE,$02,$8D,$02,$8E,$04,$8D,$81
            .byte $E0,$03,$8D,$81,$E0,$03,$8D,$88,$FE,$12,$27,$41,$15,$FE,$46,$07
            .byte $02,$00,$83,$48,$08,$FE,$03,$8E,$82,$FE,$C5,$0B,$10,$81,$3D,$09
            .byte $00,$89,$35,$11,$10,$17,$18,$19,$11,$46,$07,$02,$00,$88,$48,$08
            .byte $00,$93,$46,$C5,$01,$C5,$0B,$10,$0B,$00,$88,$30,$1A,$1B,$1C,$10
            .byte $11,$46,$07,$02,$00,$82,$48,$08,$02,$00,$8A,$46,$C5,$83,$C5,$FE
            .byte $4B,$4C,$20,$21,$FE,$05,$8E,$03,$8D,$81,$E0,$03,$8D,$81,$E0,$03
            .byte $8D,$81,$FE,$04,$8E,$83,$FE,$46,$07,$02,$00,$83,$48,$08,$FE,$03
            .byte $8E,$87,$FE,$C5,$10,$23,$24,$25,$26,$04,$10,$83,$46,$07,$3D,$09
            .byte $00,$89,$35,$46,$07,$10,$11,$10,$11,$46,$07,$02,$00,$8E,$48,$08
            .byte $00,$93,$46,$C5,$01,$C5,$10,$11,$29,$2A,$2B,$2C,$03,$10,$82,$46
            .byte $07,$0B,$00,$88,$46,$07,$10,$11,$10,$11,$46,$07,$02,$00,$82,$48
            .byte $08,$02,$00,$84,$46,$C5,$84,$FE,$0B,$8E,$03,$8D,$81,$E0,$03,$8D
            .byte $81,$E0,$03,$8D,$10,$8E,$81,$FE,$80,$A2,$C5,$C3,$11,$10,$11,$C5
            .byte $00,$2D,$2E,$00,$C3,$10,$11,$10,$11,$C5,$00,$2D,$2E,$00,$C3,$10
            .byte $11,$10,$11,$C5,$00,$2D,$2E,$00,$C3,$10,$11,$C5,$04,$00,$84,$C5
            .byte $C3,$00,$C3,$24,$00,$81,$C5,$02,$00,$81,$C3,$24,$00,$81,$C5,$02
            .byte $00,$81,$C3,$04,$00,$1C,$E7,$04,$D0,$84,$C5,$00,$C5,$C3,$24,$00
            .byte $84,$C5,$C3,$C5,$C3,$04,$AF,$1C,$E5,$04,$00,$84,$C5,$C3,$00,$C3
            .byte $24,$00,$84,$C5,$00,$81,$C3,$24,$00,$84,$C5,$01,$81,$C3,$04,$00
            .byte $1C,$E7,$04,$D0,$84,$EF,$01,$81,$C3,$24,$00,$84,$01,$82,$81,$C3
            .byte $20,$E5,$04,$AF,$02,$CA,$02,$00,$80,$02,$45,$83,$0C,$0A,$0B,$02
            .byte $0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C
            .byte $82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82
            .byte $0A,$0B,$02,$0C,$83,$0A,$0B,$0C,$02,$43,$81,$C5,$02,$0C,$86,$48
            .byte $08,$2D,$2E,$48,$08,$02,$00,$82,$48,$08,$02,$00,$82,$48,$08,$02
            .byte $00,$82,$48,$08,$02,$00,$82,$48,$08,$02,$00,$82,$48,$08,$02,$00
            .byte $87,$48,$08,$2D,$2E,$48,$08,$07,$02,$0C,$81,$C5,$02,$01,$A6,$09
            .byte $47,$46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$09
            .byte $47,$46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$09,$47,$46,$07,$09
            .byte $47,$46,$C5,$01,$C5,$02,$01,$02,$00,$82,$48,$08,$02,$00,$82,$48
            .byte $08,$02,$00,$82,$48,$08,$02,$7F,$82,$48,$08,$02,$7F,$82,$48,$08
            .byte $02,$7F,$82,$48,$08,$02,$00,$82,$48,$08,$02,$00,$82,$48,$08,$02
            .byte $00,$88,$46,$C5,$83,$FE,$4B,$4C,$20,$21,$02,$FE,$08,$8E,$81,$09
            .byte $03,$00,$82,$46,$07,$03,$00,$81,$47,$07,$8E,$02,$FE,$90,$12,$27
            .byte $41,$15,$8E,$FE,$C5,$23,$24,$25,$26,$10,$11,$46,$07,$94,$09,$00
            .byte $82,$46,$07,$09,$00,$93,$93,$46,$07,$11,$10,$17,$18,$19,$10,$C3
            .byte $C5,$10,$29,$2A,$2B,$2C,$11,$46,$07,$0A,$00,$82,$46,$07,$0A,$00
            .byte $8A,$46,$07,$30,$1A,$1B,$1C,$1D,$10,$C3,$FE,$08,$8E,$05,$8D,$81
            .byte $E0,$04,$8D,$02,$8E,$04,$8D,$81,$E0,$05,$8D,$08,$8E,$84,$FE,$01
            .byte $46,$07,$04,$10,$83,$46,$07,$94,$09,$00,$82,$46,$07,$09,$00,$83
            .byte $93,$46,$07,$04,$11,$86,$46,$07,$01,$84,$46,$07,$04,$10,$82,$46
            .byte $07,$0A,$00,$82,$46,$07,$0A,$00,$82,$46,$07,$04,$11,$84,$46,$07
            .byte $85,$FE,$08,$8E,$05,$8D,$81,$E0,$04,$8D,$02,$8E,$04,$8D,$81,$E0
            .byte $05,$8D,$08,$8E,$81,$FE,$80,$0F,$00,$82,$0C,$8A,$03,$99,$81,$8D
            .byte $03,$A3,$82,$8B,$0C,$1F,$00,$87,$C5,$00,$93,$80,$94,$00,$C3,$1E
            .byte $00,$81,$93,$02,$AF,$81,$C5,$05,$42,$81,$C3,$02,$AF,$81,$94,$1D
            .byte $00,$82,$A3,$C5,$02,$49,$03,$10,$82,$C3,$99,$0F,$00,$03,$8C,$0A
            .byte $00,$81,$93,$03,$AF,$81,$C5,$02,$49,$03,$10,$81,$C3,$03,$AF,$81
            .byte $94,$09,$00,$03,$8C,$83,$C3,$46,$07,$0D,$00,$82,$A3,$C5,$02,$49
            .byte $03,$42,$82,$C3,$99,$0C,$00,$86,$46,$07,$C5,$C3,$46,$07,$0E,$00
            .byte $81,$C5,$03,$10,$02,$49,$81,$C3,$0D,$00,$84,$46,$07,$C5,$C3,$05
            .byte $C2,$81,$42,$03,$80,$81,$42,$06,$C2,$81,$C5,$03,$42,$02,$49,$81
            .byte $C3,$05,$C2,$81,$42,$03,$00,$81,$42,$05,$C2,$81,$C5,$12,$10,$02
            .byte $49,$13,$10,$82,$C5,$82,$26,$10,$81,$C5,$27,$AF,$81,$C5,$80,$87
            .byte $0C,$0B,$0A,$45,$43,$0B,$0A,$1A,$0C,$8A,$0B,$0A,$45,$43,$0B,$0A
            .byte $0C,$C5,$46,$07,$02,$0C,$82,$46,$07,$07,$22,$82,$2D,$2E,$07,$22
            .byte $82,$2D,$2E,$08,$22,$82,$46,$07,$02,$0C,$86,$46,$07,$C3,$C5,$46
            .byte $07,$02,$01,$82,$46,$07,$06,$00,$8D,$47,$46,$07,$09,$46,$07,$00
            .byte $46,$07,$C7,$46,$07,$09,$06,$00,$8B,$93,$46,$07,$10,$11,$46,$07
            .byte $C3,$C5,$46,$07,$02,$01,$82,$46,$07,$07,$00,$8B,$46,$07,$00,$46
            .byte $07,$00,$46,$07,$00,$46,$07,$08,$00,$88,$46,$07,$10,$11,$48,$08
            .byte $C3,$FE,$06,$8E,$03,$8D,$81,$E0,$03,$8D,$0B,$8E,$03,$8D,$81,$E0
            .byte $04,$8D,$8D,$8E,$FE,$10,$11,$48,$08,$C3,$01,$C5,$01,$48,$08,$94
            .byte $04,$00,$02,$46,$81,$07,$07,$00,$82,$46,$07,$07,$00,$81,$46,$02
            .byte $07,$8D,$11,$48,$08,$10,$11,$48,$08,$C3,$83,$C5,$01,$48,$08,$05
            .byte $00,$02,$46,$81,$07,$07,$00,$82,$46,$07,$07,$00,$81,$46,$02,$07
            .byte $89,$11,$48,$08,$10,$11,$48,$08,$C3,$FE,$04,$8E,$05,$8D,$03,$8E
            .byte $03,$8D,$81,$E0,$03,$8D,$02,$8E,$03,$8D,$81,$E0,$03,$8D,$0A,$8E
            .byte $84,$FE,$01,$46,$07,$07,$10,$02,$46,$81,$07,$07,$00,$82,$46,$07
            .byte $07,$00,$81,$46,$02,$07,$03,$11,$88,$00,$2D,$2E,$00,$C3,$84,$46
            .byte $07,$07,$10,$02,$46,$81,$07,$07,$00,$82,$46,$07,$07,$00,$81,$46
            .byte $02,$07,$03,$11,$86,$00,$2D,$2E,$00,$C3,$FE,$0C,$8E,$03,$8D,$81
            .byte $E0,$03,$8D,$02,$8E,$03,$8D,$81,$E0,$03,$8D,$0A,$8E,$81,$FE,$80
            .byte $82,$00,$C5,$05,$00,$81,$01,$05,$4D,$81,$00,$04,$4D,$81,$00,$04
            .byte $4D,$81,$00,$04,$4D,$81,$00,$04,$4D,$81,$00,$02,$4D,$03,$C5,$83
            .byte $00,$C5,$CA,$05,$2F,$81,$CA,$1D,$00,$02,$01,$84,$83,$C5,$01,$00
            .byte $03,$44,$1A,$00,$81,$8F,$04,$00,$02,$4A,$83,$CA,$C5,$CA,$09,$AF
            .byte $11,$E4,$04,$2F,$81,$C3,$04,$00,$02,$49,$84,$C3,$C5,$C3,$4D,$03
            .byte $49,$82,$4D,$81,$05,$4D,$81,$00,$04,$4D,$81,$00,$04,$4D,$81,$00
            .byte $04,$4D,$04,$44,$81,$C3,$04,$00,$02,$49,$83,$C3,$C5,$C3,$05,$00
            .byte $81,$01,$1F,$00,$83,$C3,$C5,$C3,$05,$AF,$81,$CA,$05,$00,$02,$D1
            .byte $03,$51,$81,$D1,$04,$00,$81,$D1,$03,$51,$02,$D1,$03,$00,$81,$C3
            .byte $04,$00,$02,$49,$81,$C3,$02,$01,$05,$00,$81,$01,$1F,$00,$83,$C5
            .byte $82,$01,$05,$00,$81,$01,$06,$00,$81,$C9,$03,$00,$81,$C9,$04,$00
            .byte $81,$C9,$03,$00,$81,$C9,$04,$00,$81,$C3,$05,$00,$82,$93,$C3,$02
            .byte $CA,$05,$AF,$81,$CA,$06,$00,$81,$01,$03,$00,$81,$01,$04,$00,$81
            .byte $01,$03,$00,$81,$01,$03,$00,$82,$93,$C3,$06,$AF,$89,$C3,$00,$C3
            .byte $90,$91,$90,$91,$90,$C5,$06,$AF,$81,$CA,$03,$AF,$81,$CA,$04,$AF
            .byte $81,$CA,$03,$AF,$81,$CA,$04,$AF,$87,$C3,$91,$90,$91,$90,$91,$C5
            .byte $03,$00,$80,$8E,$00,$12,$13,$01,$05,$12,$13,$01,$05,$12,$13,$01
            .byte $05,$04,$02,$00,$88,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$02,$00,$8D
            .byte $4D,$12,$13,$01,$05,$12,$13,$01,$05,$12,$13,$01,$05,$03,$00,$81
            .byte $3C,$02,$00,$81,$3C,$02,$00,$81,$3C,$02,$00,$93,$3C,$97,$98,$99
            .byte $9A,$9B,$ED,$9D,$B3,$BD,$A0,$E1,$A2,$A3,$A4,$A5,$A6,$A7,$3C,$02
            .byte $00,$81,$3C,$02,$00,$81,$3C,$02,$00,$81,$3C,$03,$00,$81,$3C,$02
            .byte $00,$81,$3C,$02,$00,$81,$3C,$02,$00,$93,$3C,$AB,$AC,$AD,$AE,$AF
            .byte $F3,$F2,$BE,$CF,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$3C,$02,$00,$81
            .byte $3C,$02,$00,$81,$3C,$02,$00,$81,$3C,$02,$00,$82,$4E,$50,$02,$4E
            .byte $81,$50,$02,$4E,$81,$50,$02,$4E,$90,$50,$4E,$40,$C1,$C2,$C3,$C4
            .byte $C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$4D,$02,$4E,$81,$50,$02,$4E,$81
            .byte $50,$02,$4E,$81,$50,$02,$4E,$94,$50,$00,$7E,$5C,$51,$5E,$7E,$5C
            .byte $51,$5E,$7E,$5C,$51,$5E,$7E,$5C,$D5,$D6,$D7,$D8,$04,$5C,$83,$E4
            .byte $D2,$E2,$02,$5C,$8D,$5F,$7D,$5D,$5C,$5F,$7D,$5D,$5C,$5F,$7D,$5D
            .byte $5C,$5F,$14,$7E,$14,$5F,$81,$00,$03,$5C,$02,$3C,$82,$5C,$04,$04
            .byte $3C,$82,$5C,$04,$03,$3C,$06,$5C,$02,$3C,$82,$5C,$04,$04,$3C,$82
            .byte $5C,$04,$03,$3C,$04,$5C,$81,$00,$02,$5C,$03,$00,$83,$5C,$04,$3C
            .byte $03,$00,$83,$5C,$04,$3C,$03,$00,$04,$5C,$03,$00,$83,$5C,$04,$3C
            .byte $03,$00,$83,$5C,$04,$3C,$04,$00,$02,$5C,$81,$00,$02,$5C,$10,$00
            .byte $02,$5C,$11,$00,$02,$5C,$81,$82,$02,$5C,$10,$00,$02,$5C,$10,$00
            .byte $81,$93,$02,$5C,$81,$5A,$02,$5B,$10,$5A,$02,$5B,$11,$5A,$02
L663C:      .byte $5B,$02,$00,$80,$83,$11,$10,$11,$02,$86,$82,$8A,$8B,$06,$86,$82
            .byte $8A,$8B,$08,$86,$82,$8A,$8B,$06,$86,$82,$8A,$8B,$04,$86,$84,$10
            .byte $11,$10,$11,$03,$86,$03,$11,$84,$86,$E1,$E3,$86,$03,$11,$04,$10
            .byte $02,$86,$04,$11,$03,$10,$84,$86,$E1,$E3,$86,$03,$10,$05,$86,$81
            .byte $10,$04,$86,$03,$11,$84,$86,$E1,$E3,$86,$02,$11,$82,$2D,$2E,$03
            .byte $10,$02,$86,$03,$11,$82,$2D,$2E,$02,$10,$84,$86,$E1,$E3,$86,$03
            .byte $10,$81,$ED,$06,$86,$83,$E1,$E3,$86,$02,$11,$81,$ED,$04,$86,$81
            .byte $EE,$02,$11,$03,$10,$04,$86,$03,$11,$02,$10,$81,$ED,$04,$86,$81
            .byte $EE,$04,$10,$83,$86,$E1,$E3,$02,$86,$A6,$E1,$E3,$86,$10,$11,$10
            .byte $86,$24,$18,$86,$11,$10,$9B,$AA,$11,$ED,$86,$8A,$8B,$86,$EE,$10
            .byte $9B,$AA,$11,$10,$86,$24,$18,$86,$11,$10,$11,$10,$11,$86,$E1,$E3
            .byte $04,$86,$85,$EE,$10,$11,$10,$1B,$02,$E7,$83,$2A,$11,$10,$02,$00
            .byte $88,$11,$10,$86,$A4,$98,$86,$11,$10,$02,$00,$83,$11,$10,$1B,$02
            .byte $E7,$91,$2A,$11,$10,$11,$10,$11,$86,$E1,$E3,$86,$10,$11,$10,$11
            .byte $10,$11,$10,$04,$00,$82,$11,$10,$02,$00,$83,$11,$10,$1B,$02,$E7
            .byte $83,$2A,$11,$10,$02,$00,$82,$11,$10,$04,$00,$89,$11,$10,$11,$10
            .byte $11,$86,$E1,$E3,$86,$04,$C2,$83,$10,$11,$10,$04,$00,$88,$11,$10
            .byte $00,$5A,$11,$10,$00,$5A,$02,$00,$82,$11,$10,$02,$00,$82,$11,$10
            .byte $04,$00,$88,$11,$10,$11,$10,$11,$86,$E1,$E3,$05,$86,$9E,$10,$11
            .byte $10,$6A,$57,$58,$59,$11,$10,$53,$5E,$11,$10,$5D,$6B,$5D,$59,$11
            .byte $10,$57,$5A,$11,$10,$5D,$58,$59,$00,$11,$10,$11,$02,$C2,$04,$86
            .byte $82,$11,$ED,$02,$86,$8C,$10,$11,$5E,$5C,$5D,$5C,$5E,$11,$10,$5C
            .byte $5A,$11,$02,$5E,$90,$6A,$5E,$5D,$11,$10,$53,$5E,$11,$10,$5A,$6B
            .byte $5C,$5D,$11,$10,$C2,$04,$86,$87,$EE,$10,$11,$10,$11,$86,$C2,$02
            .byte $5E,$94,$68,$69,$5E,$53,$5E,$C2,$5E,$5F,$C2,$5E,$6B,$6C,$68,$69
            .byte $C2,$5E,$69,$5E,$69,$C2,$02,$5E,$84,$6C,$68,$6A,$C2,$04,$86,$83
            .byte $10,$11,$10,$80,$81,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B
            .byte $02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02,$0C,$82,$0A,$0B,$02
            .byte $0C,$82,$0A,$0B
	    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00				;First character set start $6800
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$01,$00,$00,$00
            .byte $00,$00,$00,$00,$40,$40,$00,$00,$00,$00,$00,$00,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A8,$80,$00,$AA,$2A,$0A,$02
            .byte $00,$00,$00,$00,$A5,$95,$95,$55,$55,$55,$55,$55,$00,$00,$00,$14
            .byte $55,$55,$FE,$FA,$A8,$A0,$A0,$80,$80,$00,$00,$00,$08,$08,$08,$08
            .byte $08,$88,$A8,$59,$00,$00,$00,$55,$55,$55,$55,$FF,$00,$00,$00,$00
            .byte $00,$55,$AA,$FF,$FA,$FA,$FB,$00,$00,$00,$00,$00,$C0,$F0,$F0,$20
            .byte $A8
L689D:      .byte $FC,$A8,$20,$03,$0F,$0F,$08,$2A
L68A5:      .byte $3F,$2A,$08,$80,$AA,$80,$80,$80,$AA,$82,$82,$82,$AA,$82,$82,$AA
            .byte $82,$00,$00,$02,$AA,$02,$02,$02,$AA,$82,$82,$AA,$80,$80,$80,$AA
            .byte $55,$AA,$FC,$82,$AA,$82,$82,$AA,$55,$AA,$F3,$AA,$02,$02,$02,$AA
            .byte $55,$AA,$CF,$AA,$80,$80,$80,$AA,$88,$AA,$88,$82,$AA,$82,$82,$AA
            .byte $82,$AA,$82,$AA,$02,$02,$02,$AA,$22,$AA,$22,$C0,$F0,$F0,$00,$00
            .byte $00,$00,$00,$03,$0F,$0F,$00,$00,$00,$00,$00,$3F,$C0,$FC,$C0,$3F
            .byte $C0,$FC,$C0,$3F,$03,$FC,$03,$3F,$03,$FC,$03,$00,$00,$00,$55,$14
            .byte $55,$55,$00,$AA,$AA,$AA,$A5,$95,$51,$01,$05,$00,$00,$00,$00,$00
            .byte $00,$11,$15,$00,$00,$A0,$50,$55,$55,$0C,$0C,$00,$00,$0A,$05,$55
            .byte $55,$30,$30,$F3,$CF,$FF,$00,$00,$00,$00,$00,$FA,$FA,$FB,$FF,$AA
            .byte $82,$82,$82,$AA,$82,$AA,$96,$55,$55,$FE,$FA,$00,$00,$00,$00,$00
            .byte $00,$55,$FF,$AA,$02,$A8,$02,$28,$00,$00,$00,$3F,$03,$FC,$03,$3F
            .byte $03,$FC,$00,$AA,$82,$AA,$96,$55,$55,$AA,$FC,$F3,$CF,$F3,$77,$55
            .byte $77,$55,$11,$00,$00,$01,$14,$50,$55,$50,$04,$00,$00,$40,$14,$05
            .byte $55,$05,$10,$FA,$FA,$FB,$20,$A8
L698D:      .byte $FC,$A8,$20,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$AA,$A5,$55,$55,$55
            .byte $55,$45,$05,$5A,$55,$55,$55,$55,$55,$54,$50,$AA,$AA,$6A,$5A,$55
            .byte $55,$54,$10,$AA,$AA,$AA,$AA,$AA,$2A,$02,$00,$14,$04,$00,$00,$00
            .byte $00,$00,$00,$F3,$CF,$F3,$D7,$55,$55,$FE,$FA,$F3,$CF,$F3,$CF,$D7
            .byte $55,$AA,$FF,$00,$00,$00,$00,$00,$00,$44,$54,$FA,$FA,$FB,$FF,$FF
            .byte $CF,$F3,$CF,$00,$00,$00,$00,$82,$AA,$82,$AA,$AA,$80,$28,$80,$2A
            .byte $00,$00,$00,$00,$00,$00,$44,$55,$44,$55,$11,$55,$55,$55,$55,$55
            .byte $55,$55,$55,$3F,$2A,$08,$08,$08,$08,$08,$08,$00,$80,$80,$28,$02
            .byte $0A,$0F,$2A,$00,$00,$00,$00,$C3,$AA,$BE,$AA,$00,$00,$00,$0A,$A3
            .byte $BA,$AA,$AA,$00,$80,$80,$00,$AE,$AA,$AA,$AA,$00,$00,$00,$00,$00
            .byte $E0,$A8,$AA,$BB,$AA,$3F,$AA,$0A,$00,$15,$02,$BB,$AA,$3F,$3F,$AA
            .byte $0A,$15,$02,$AA,$AA,$EA,$AA,$AB,$3F,$55,$AA,$BA,$BA,$EA,$FA,$FE
            .byte $CA,$55,$AA,$AA,$AA,$AA,$AA,$8F,$BF,$55,$AA,$AA,$AA,$AA,$AA,$2A
            .byte $A8,$55,$AA,$80,$80,$80,$00,$00,$00,$40,$00,$02,$00,$0A,$00,$02
            .byte $55,$AA,$3C,$02,$20,$22,$20,$AA,$55,$AA,$3C,$D3,$CF,$30,$03,$00
            .byte $00,$00,$00,$CC,$7F,$D0,$CC,$30,$00,$00,$00,$F3,$3C,$CF,$30,$3C
            .byte $CC,$00,$C0,$00,$00,$80,$00,$00,$55,$AA,$3C,$CF,$0C,$30,$00,$00
            .byte $00,$00,$00,$00,$00,$02,$04,$19,$04,$02,$00,$00,$00,$4A,$04,$98
            .byte $04,$4A,$00,$00,$20,$80,$20,$00,$20,$80,$20,$33,$CC,$30,$CC,$03
            .byte $CC,$30,$CC,$00,$00,$00,$00,$00,$06,$00,$06,$00,$00,$00,$00,$00
            .byte $66,$00,$66,$00,$00,$00,$00,$00,$60,$00,$60,$03,$03,$0C,$0C,$30
            .byte $30,$C0,$C0,$00,$00,$00,$05,$01,$55,$A5,$50,$00,$00,$00,$55,$41
            .byte $55,$55,$00,$00,$00,$00,$50,$40,$50,$50,$00,$00,$00,$00,$00,$00
            .byte $05,$0A,$05,$00,$00,$20,$22,$2A,$55,$AA,$3C,$0C,$33,$03,$CC,$03
            .byte $33,$0C,$C3,$CC,$FF,$33,$FF,$3C,$FF,$F3,$3F,$30,$CC,$C0,$33,$C0
            .byte $CC,$30,$C3,$00,$00,$00,$88,$44,$44,$44,$55,$00,$00,$00,$00,$44
            .byte $44,$44,$55,$C0,$F0,$F0,$30,$FC
L6B35:      .byte $A8,$FC,$30,$03,$0F,$0F,$0C,$3F
L6B3D:      .byte $2A,$3F,$0C,$00,$00,$AA,$AA,$AA,$2A,$2A,$02,$00,$00,$AA,$AA,$AA
            .byte $A8,$A8,$80,$00,$00,$82,$AA,$AA,$AA,$AA,$AA,$00,$00,$30,$30,$33
            .byte $3F,$07,$01,$E3,$FF,$14,$3C,$FF,$FF,$7D,$D7,$00,$00,$0C,$0C,$CC
            .byte $FC,$D0,$40,$30,$33,$3F,$01,$17,$55,$50,$00,$BE,$FF,$FF,$D7,$D7
            .byte $55,$69,$3C,$0C,$CC,$FC,$40,$D4,$55,$05,$00,$00,$00,$00,$00,$00
            .byte $00,$02,$00,$00,$00,$00,$00,$00,$20,$20,$82,$00,$00,$00,$00,$00
            .byte $00,$80,$00,$20,$08,$02,$00,$00,$55,$AA,$3C,$88,$88,$A4,$26,$9A
            .byte $59,$9A,$3C,$20,$28,$80,$00,$00,$55,$AA,$3C,$00,$00,$08,$02,$00
            .byte $00,$22,$20,$22,$08,$08,$22,$A8,$20,$20,$82,$00,$00,$20,$28,$80
            .byte $80,$88,$00,$08,$82,$22,$0A,$00,$55,$AA,$35,$28,$20,$A4,$66,$9A
            .byte $59,$6A,$88,$22,$28,$80,$6A,$00,$55,$6A,$94,$00,$00,$00,$00,$00
            .byte $55,$AA,$FF,$03,$03,$33,$33,$3F,$03,$03,$03,$C0,$C0,$CC,$CC,$FC
            .byte $C0,$C0,$C0,$00,$00,$00,$00,$00,$00,$00,$00,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$02,$02,$02,$AA
L6C3C:      .byte $02,$02,$02,$02,$02,$02,$02,$02,$AA,$02,$02,$02,$80,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$3F,$3F,$3F,$FF,$BF,$00,$00,$00,$FC
            .byte $FC,$FC,$FF,$FE,$00,$00,$00,$00,$00,$00,$FF,$AA,$00,$41,$55,$FF
            .byte $C3,$FF,$3C,$3C,$AA,$69,$55,$FF,$C3,$FF,$3C,$3C,$08,$08,$08,$08
            .byte $08,$89,$A9,$59,$20,$2A,$A8,$08,$08,$A8,$2A,$20,$08,$A8,$2A,$20
            .byte $20,$2A,$A8,$08,$AA,$69,$55,$81,$80,$AA,$28,$28,$00,$00,$A0,$08
            .byte $08
L6C9D:      .byte $38,$28,$28,$00,$00,$0A,$20,$20
L6CA5:      .byte $2C,$28,$28,$AA,$69,$55,$25,$55,$96,$5A,$5A,$20,$2A,$A8,$08,$08
            .byte $A8,$29,$21,$15,$98,$15,$12,$55,$48,$55,$22,$55,$88,$55,$21,$55
            .byte $85,$56,$1A,$5A,$5A,$6A,$6A,$A8,$A8,$A0,$AA,$25,$24,$95,$91,$55
            .byte $5A,$AA,$A8,$55,$89,$56,$6A,$AA,$AA,$A0,$80,$6A,$AA,$AA,$AA,$82
            .byte $82,$82,$82,$A0,$20,$2A,$A8,$08,$08,$A8,$2A,$00,$00,$00,$08,$08
            .byte $A8,$28,$28,$00,$00,$00,$20,$20,$2A,$28,$28,$AA,$69,$55,$89,$55
            .byte $26,$54,$84,$AA,$69,$55,$42,$02,$AA,$28,$28,$82,$28,$00,$00,$00
            .byte $00,$00,$00,$A5,$A5,$A9,$A9,$2A,$2A,$0A,$AA,$55,$22,$55,$48,$55
            .byte $52,$95,$A4,$54,$26,$54,$84,$55,$21,$55,$88,$08,$A8,$2A,$20,$20
            .byte $2A,$68,$48,$AA,$69,$55,$62,$55,$98,$15,$12,$0A,$08,$A8,$2A,$20
            .byte $20,$2A,$A8,$A9,$AA,$AA,$AA,$82,$82,$82,$82,$55,$62,$95,$A9,$AA
            .byte $AA,$0A,$02,$58,$18,$56,$46,$55,$A5,$AA,$2A,$20,$2A,$A8,$08,$08
            .byte $58,$5A,$A5,$02,$2B,$AF,$AB,$AA,$AF,$2A,$02,$C0,$FC,$AF,$FF,$BF
            .byte $AF,$BC,$C0,$00,$00,$00,$00,$44,$55,$55,$FF,$08,$A8,$2A,$20,$20
            .byte $25,$A5,$5A,$00,$02,$AA,$96,$95
L6D8D:      .byte $95,$AA,$00,$2A,$A5,$65,$A5,$A5,$A5,$A5,$25,$AA,$56,$56,$96,$96
            .byte $96,$AA,$98,$0A,$00,$00,$00,$00,$00,$00,$00,$A8,$0A,$02,$02,$02
            .byte $02,$00,$00,$25,$25,$25,$2A,$08,$A8,$2A,$20,$A8,$60,$6A,$A2,$22
            .byte $2A,$A8,$08,$AA,$95,$95,$96,$96,$96,$AA,$26,$A8,$5A,$59,$5A,$5A
            .byte $5A,$5A,$58,$00,$80,$AA,$96,$56,$56,$AA,$00,$2A,$09,$A9,$8A,$88
            .byte $A8,$2A,$20,$58,$58,$58,$A8,$20,$2A,$A8,$08,$2A,$A0,$80,$80,$80
            .byte $80,$00,$00,$A0,$00,$00,$00,$00,$00,$00,$00,$88,$AA,$88,$AA,$88
            .byte $48,$55,$FF,$FF,$2A,$08,$08,$08,$08,$08,$08,$AA,$69,$55,$22,$55
            .byte $88,$55,$22,$20,$2A,$A8,$08,$08,$64,$55,$FF,$FC,$FC,$CC,$CF,$CF
            .byte $CF,$CF,$FF,$FF,$C3,$FF,$C3,$00,$00,$00,$00,$3F,$3F,$33,$F3,$F3
            .byte $F3,$F3,$FF,$80,$80,$80,$AA,$80,$80,$80,$80,$02,$00,$00,$00,$00
            .byte $00,$00,$00,$80,$80,$80,$80,$AA,$80,$80,$80,$3C,$C3,$FF,$C3,$FF
            .byte $C3,$3C,$C3,$AA,$AA,$AA,$AA,$AA,$55,$FF,$FF,$AA,$69,$55,$58,$55
            .byte $96,$95,$A5,$AA,$69,$55,$88,$55,$22,$55,$88,$AA,$04,$FF,$00,$00
            .byte $00,$00,$00,$AA,$00,$FF,$00,$00,$00,$00,$00,$AA,$04,$FF,$04,$04
            .byte $FF,$00,$00,$00,$00,$55,$FF,$FC,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$55,$FF,$00,$44,$55,$77,$FF,$AA,$AA,$AA,$41,$1C,$FC,$7F,$31
            .byte $D0,$C4,$13,$00,$02,$A8,$02,$2B,$02,$A8,$02,$00,$02,$88,$97,$75
            .byte $97,$88,$02,$00,$00,$28,$80,$00,$80,$28,$00,$00,$00,$00,$00,$00
            .byte $00,$30,$01,$00,$00,$00,$00,$03,$40,$40,$43,$00,$00,$00,$00,$00
            .byte $00,$13,$10,$0C,$0C,$0D,$30,$34,$41,$41,$3D,$44,$04,$3C,$30,$74
            .byte $74,$4C,$CC,$70,$57,$DC,$D7,$D4,$DF,$D7,$D7,$30,$54,$DC,$44,$41
            .byte $F0,$D4,$D5,$75,$05,$44,$30,$44,$51,$1D,$C4,$CC,$0C,$FC,$FF,$3F
            .byte $10,$34,$45,$82,$69,$55,$55,$41,$FF,$3C,$3C,$C3,$30,$3F,$30,$C3
            .byte $00,$FF,$00,$C3,$FF,$3C,$FF,$C3,$FF,$3C,$FF,$C3,$0C,$FC,$0C,$C3
            .byte $00,$FF,$00,$00,$00,$00,$88,$44,$55,$77,$FF,$00,$00,$00,$00,$44
            .byte $55,$77,$FF,$88,$44,$55,$77,$FF,$00,$00,$00,$00,$44,$55,$77,$FF
            .byte $00,$00,$00,$DF,$DF,$4F,$1F,$C3,$10,$41,$05,$F5,$F1,$F0,$F1,$C0
            .byte $07,$D0,$01,$41,$34,$3F,$FD,$4C,$07,$13,$C4,$47,$3C,$75,$C7,$C5
            .byte $75,$3C,$47,$D1,$3C,$5D,$53,$D3,$5D,$3C,$D1,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$0F,$0F,$FF,$FF,$FF,$FF,$FF,$FF,$F0,$F0,$3F,$33,$33,$F3,$FF
            .byte $AA,$AA,$AA,$00,$41,$55,$FF,$C3,$FF,$3C,$3C,$00,$00,$00,$00,$02
            .byte $03,$2C,$03,$00,$00,$20,$30,$30,$33,$20,$33,$00,$00,$00,$00,$80
            .byte $00,$E0,$00,$00,$41,$55,$FF,$C3,$FF,$3C,$3C,$F3,$3C,$55,$D7,$41
            .byte $DF,$34,$3C,$20,$41,$55,$FF,$C3,$FF,$3C,$3C,$00,$0C,$AC,$00,$33
            .byte $A0,$0C,$23,$8C,$C8,$30,$30,$80,$32,$20,$33,$00,$C0,$C8,$F0,$C2
            .byte $0C,$F0,$00,$00,$41,$55,$FF,$C3,$FF,$3C,$3C,$F3,$3C,$55,$D7,$41
            .byte $F7,$14,$7D,$20,$41,$55,$FF,$C3,$FF,$3C,$3C,$00,$41,$55,$FF,$C3
            .byte $FF,$3C,$3C,$AA,$69,$55,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00
            .byte $00,$00,$AA,$00,$00,$00,$00,$00,$00,$00,$00,$00,$43,$BC,$93,$BC
            .byte $55,$6A,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$A7,$A4,$A7,$A4,$A4,$A4,$A4,$A5,$F2,$0E,$32,$C2,$02
            .byte $56,$AA,$02,$00,$00,$00,$00,$00,$00,$00,$00,$28,$0A,$02,$00,$00
            .byte $00,$00,$00,$00,$00,$A0,$2A,$02,$00,$3C,$FF,$00,$00,$00,$80,$AA
            .byte $2A,$3F,$FD,$00,$00,$00,$00,$AF,$BF,$FD,$5D,$00,$00,$00,$00,$FA
            .byte $FE,$7F,$75,$00,$00,$00,$02,$AA,$A8,$FC,$7F,$00,$00,$0A,$A8,$80
            .byte $00,$3C,$FF,$28,$A0,$80,$00,$00,$00,$00,$00,$00,$00,$A0,$2A,$0A
            .byte $02,$3F,$FF,$FF,$C4,$D5,$57,$55,$11,$55,$15,$FF,$F1,$D5,$F5,$D5
            .byte $04,$55,$55,$8F,$B0,$8C,$83,$80,$00,$0A,$A0,$00,$C0,$3E,$C2,$3E
            .byte $02,$A8,$00,$A0,$A0,$AC,$80,$80,$BC,$A0,$90,$54,$A0,$20,$AA,$00
            .byte $00,$02,$AA,$0A,$08,$20,$02,$A8,$00,$80,$AA,$01,$05,$15,$11,$05
            .byte $05,$01,$00,$15,$10,$46,$46,$66,$56,$44,$04,$40,$50,$50,$5C,$74
            .byte $75,$D7,$D7,$00,$00,$00,$02,$AA,$2A,$7E,$5E,$00,$00,$00,$AB,$AA
            .byte $AA,$AF,$BC,$A9,$88,$82,$AA,$00,$03,$3C,$F2,$FF,$BC,$6D,$55,$D5
            .byte $F5,$C5,$C1,$FF,$13,$57,$5F,$57,$40,$04,$15,$FF,$C4,$D5,$F5,$D5
            .byte $01,$10,$54,$FF,$3E,$79,$55,$57,$5F,$53,$43,$40,$0F,$00,$AA,$00
            .byte $C0,$3C,$8F,$00,$00,$00,$EA,$AA,$AA,$FA,$3E,$00,$00,$00,$80,$AA
            .byte $A8,$BD,$B5,$01,$05,$05,$35,$1D,$5D,$54,$57,$55,$54,$C5,$C1,$C5
            .byte $C5,$C1,$D0,$40,$50,$54,$54,$54,$50,$40,$08,$00,$00,$00,$00,$00
            .byte $00,$20,$C0,$08,$02,$00,$00,$00,$00,$3C,$3C,$FF,$4F,$57,$5F,$57
            .byte $10,$55,$55,$FF,$13,$57,$D5,$55,$44,$55,$55,$00,$00,$00,$00,$00
            .byte $A8,$00,$00,$04,$24,$A4,$A7,$A4,$A6,$A4,$A7,$5F,$FF,$0C,$C0,$F3
            .byte $BC,$FF,$BF,$6A,$6A,$6B,$FF,$03,$FC,$0F,$0F,$AA,$AA,$EA,$FC,$FF
            .byte $FF,$3F,$3F,$C1,$3C,$00,$AA,$00,$03,$3C,$F2,$6A,$22,$82,$AA,$00
            .byte $C0,$3C,$8F,$A8,$20,$08,$2A,$00,$00,$02,$AA,$0F,$13,$57,$5F,$57
            .byte $40,$00,$04,$0C,$30,$00,$AA,$00,$00,$02,$AA,$CA,$F2,$2A,$83,$3F
            .byte $3F,$FF,$FF,$AA,$AA,$AF,$FC,$F3,$CF,$CF,$F0,$A9,$AD,$FD,$0C,$F3
            .byte $0C,$0C,$FC,$55,$56,$54,$57,$DA,$FB,$FA,$FE,$D0,$D8,$D8,$DA,$DA
            .byte $DA,$DA,$DA,$02,$2B,$02,$08,$00,$00,$00,$00,$F8,$A0,$F8,$C0,$20
            .byte $00,$00,$00,$90,$90,$90,$90,$90,$90,$90,$90,$F0,$C4,$D5,$F5,$D5
            .byte $01,$00,$10,$55,$2A,$80,$AA,$00,$03,$3C,$F2,$C0,$C0,$00,$00,$FF
            .byte $A8,$A0,$01,$A4,$A4,$A4,$A8,$A7,$A6,$A6,$A9,$AF,$2A,$0A,$02,$FF
            .byte $AB,$BC,$C2,$FC,$03,$F8,$A0,$00,$00,$03,$0F,$F0,$00,$05,$55,$35
            .byte $F5,$FD,$FF,$02,$50,$50,$40,$50,$50,$54,$5F,$AA,$AA,$2A,$2A,$0A
            .byte $00,$00,$00,$F2,$BC,$AB,$AA,$AA,$0A,$00,$00,$8F,$3E,$EA,$AA,$AA
            .byte $A8,$00,$00,$AA,$AA,$A8,$A8,$A0,$00,$00,$03,$40,$15,$05,$01,$05
            .byte $05,$15,$F7,$0F,$40,$54,$55,$7D,$7F,$FF,$FF,$03,$FC,$00,$2A,$08
            .byte $00,$02,$CA,$FA,$E8,$AC,$83,$0A,$EA,$3E,$83,$DA,$1A,$DA,$1A,$1A
            .byte $1A,$1A,$6A,$00,$00,$00,$00,$FF,$AA,$AA,$40,$55,$A8,$82,$AA,$80
            .byte $C0,$3C,$8F,$90,$90,$90,$D3,$FF,$FF,$FA,$00,$0A,$AA,$AA,$AA,$AA
            .byte $AF,$F0,$0A,$FF,$FF,$0F,$03,$80,$A0,$A8,$A8,$FF,$F0,$FD,$75,$55
            .byte $55,$54,$05,$0F,$4F,$57,$5F,$57,$04,$00,$10,$2A,$03,$AF,$FA,$A0
            .byte $0A,$AA,$AA,$BF,$FF,$C0,$00,$AA,$AA,$AA,$AA,$FF,$FC,$00,$0A,$AA
            .byte $AA,$AA,$AA,$FF,$02,$00,$AA,$AA,$AA,$AA,$AA,$00,$00,$00,$00,$AB
            .byte $AA,$FF,$F5,$00,$00,$00,$00,$00,$00,$44,$55,$AA,$00,$AA,$AA,$AA
            .byte $AA,$66,$55,$AA,$00,$AA,$AA,$AA,$AA,$AA,$AA,$A0,$AA,$AA,$AA,$AA
            .byte $FA,$0F,$A0,$0A,$AA,$AA,$AF,$F0,$0A,$AA,$AA,$A0,$FA,$0F,$A0,$AA
            .byte $AA,$AA,$AA,$0F,$13,$57,$D5,$55,$04,$01,$41,$F0,$C0,$00,$00,$3F
            .byte $A8,$A0,$01,$CA,$FA,$FE,$FE,$FA,$3A,$BA,$AA,$FF,$CB,$E5,$D5,$25
            .byte $E9,$AF,$EC,$FF,$83,$00,$A0,$AA,$AA,$AA,$AA,$05,$F1,$00,$AA,$00
            .byte $03,$3C,$F2,$55,$6A,$22,$AA,$02,$C0,$3C,$8F,$00,$08,$0A,$02,$00
            .byte $00,$00,$03,$00,$00,$00,$A0,$AA,$2A,$0F,$37,$00,$00,$00,$00,$BF
            .byte $FF,$5F,$5D,$00,$00,$00,$00,$EA,$AA,$FF,$5F,$00,$00,$0A,$A8,$A0
            .byte $80,$FC,$FF,$20,$80,$00,$00,$00,$00,$3C,$FC,$0F,$03,$00,$03,$0C
            .byte $0F,$FB,$8B,$F0,$C4,$15,$57,$55,$10,$40,$41,$F0,$F1,$D5,$F5,$D5
            .byte $10,$00,$04,$FF,$0F,$7F,$5D,$55,$55,$15,$54,$FF,$EB,$5B,$57,$58
            .byte $6B,$FA,$3B,$C0,$30,$0C,$02,$A8,$00,$80,$AA,$AF,$BC,$0F,$03,$AA
            .byte $F0,$FE,$F2,$15,$0A,$08,$22,$A8,$00,$80,$AA,$55,$A9,$88,$AA,$80
            .byte $03,$3C,$F2,$50,$43,$0C,$AA,$00,$C0,$3C,$8F,$CF,$0F,$03,$AA,$00
            .byte $00,$02,$AA,$55,$AA,$22,$AA,$00,$03,$3C,$F2,$00,$00,$00,$00,$FE
            .byte $FF,$F5,$75,$00,$00,$00,$0A,$AA,$A8,$F0,$DC,$00,$20,$A0,$80,$00
            .byte $00,$00,$C0,$55,$A8,$20,$AA,$00,$C0,$3C,$8F,$A0,$AA,$AA,$FA,$0F
            .byte $A0,$AA,$AA,$0A,$AF,$F0,$0A,$AA,$AA,$AA,$AA,$0F,$4F,$57,$5F,$57
            .byte $04,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$43,$BC,$93,$BC
            .byte $55,$6A,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$A7,$A4,$A7,$A4,$A4,$A4,$A4,$A5,$F2,$0E,$32,$C2,$02
            .byte $56,$AA,$02,$00,$00,$00,$00,$00,$00,$00,$00,$3C,$0F,$03,$00,$00
            .byte $00,$00,$00,$00,$00,$F0,$3F,$03,$00,$3C,$FF,$00,$00,$00,$C0,$FF
            .byte $3F,$3F,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$FF
            .byte $FF,$FF,$FF,$00,$00,$00,$03,$FF,$FC,$FC,$FF,$00,$00,$0F,$FC,$C0
            .byte $00,$3C,$FF,$3C,$F0,$C0,$00,$00,$00,$00,$00,$00,$00,$F0,$3F,$0F
            .byte $0F,$3F,$FF,$0C,$0F,$0F,$0F,$0F,$0F,$0F,$3F,$FF,$FF,$3F,$0F,$03
            .byte $83,$A3,$A2,$8F,$B0,$8C,$83,$80,$00,$0A,$A0,$00,$C0,$3E,$C2,$3E
            .byte $02,$A8,$00,$A0,$A0,$AC,$80,$80,$BC,$A0,$90,$FC,$F0,$30,$FF,$00
            .byte $00,$03,$FF,$EA,$FA,$FA,$FA,$EA,$AA,$AA,$AA,$32,$0E,$CE,$32,$0F
            .byte $CF,$3F,$0F,$A4,$A4,$A7,$A7,$A7,$A7,$A7,$A7,$0C,$3C,$FC,$F0,$F0
            .byte $F0,$F0,$FC,$00,$00,$00,$03,$FF,$3F,$FF,$FF,$00,$00,$00,$FF,$FF
            .byte $FF,$FF,$FC,$02,$F2,$0E,$0E,$F2,$0F,$0F,$FF,$FF,$FC,$FF,$FF,$FF
            .byte $FF,$CF,$C3,$2A,$02,$AA,$AA,$AB,$AF,$AE,$AA,$BF,$BF,$FF,$FF,$F0
            .byte $80,$02,$2A,$FF,$3F,$FF,$FF,$FF,$FF,$F3,$C3,$80,$8F,$B0,$B0,$8F
            .byte $F0,$F0,$FF,$00,$00,$00,$FF,$FF,$FF,$FF,$3F,$00,$00,$00,$C0,$FF
            .byte $FC,$FF,$FF,$30,$3C,$3F,$0F,$0F,$0F,$0F,$3F,$1A,$1A,$DA,$DA,$DA
            .byte $DA,$DA,$DA,$8C,$B0,$B3,$8C,$F0,$F3,$FC,$0C,$00,$00,$00,$00,$00
            .byte $00,$30,$C0,$0C,$03,$00,$00,$00,$00,$3C,$3C,$FF,$3F,$FF,$FF,$FF
            .byte $30,$FF,$FF,$FF,$C3,$FF,$FF,$FF,$CC,$FF,$FF,$00,$00,$00,$00,$00
            .byte $FC,$00,$00,$A7,$A7,$A4,$A4,$A4,$A4,$A4,$A7,$FF,$FF,$FF,$FF,$3F
            .byte $FF,$0C,$C0,$FF,$FF,$FF,$FF,$03,$FC,$0F,$0F,$FF,$FF,$FF,$FC,$FF
            .byte $FF,$3F,$3F,$C3,$3C,$00,$FF,$00,$03,$3C,$F3,$FF,$33,$C3,$FF,$00
            .byte $C0,$3C,$CF,$FC,$30,$0C,$FF,$00,$00,$03,$FF,$0F,$33,$FF,$FF,$FF
            .byte $C0,$00,$0C,$0C,$30,$00,$FF,$00,$00,$03,$FF,$CF,$F3,$3F,$C3,$3F
            .byte $3F,$FF,$FF,$FF,$FF,$FF,$FC,$F3,$CF,$CF,$F0,$FF,$FF,$FF,$0C,$F3
            .byte $0C,$0C,$FC,$FF,$FF,$FF,$FF,$FC,$FF,$30,$03,$DA,$DA,$1A,$1A,$1A
            .byte $1A,$1A,$DA,$03,$3F,$03,$0C,$00,$00,$00,$00,$FC,$F0,$FC,$C0,$30
            .byte $00,$00,$00,$90,$90,$90,$90,$90,$90,$90,$90,$F0,$CC,$FF,$FF,$FF
            .byte $03,$00,$30,$FF,$3F,$C0,$FF,$00,$03,$3C,$F3,$C0,$C0,$00,$00,$FF
            .byte $FC,$F0,$03,$A4,$A4,$A4,$A8,$A7,$A6,$A6,$A9,$FF,$3F,$0F,$03,$FF
            .byte $FF,$FC,$C3,$FC,$03,$FC,$F0,$00,$00,$03,$0F,$FC,$00,$0F,$FF,$FF
            .byte $FF,$FF,$FF,$03,$F0,$F0,$C0,$F0,$F0,$FC,$FF,$FF,$FF,$3F,$3F,$0F
            .byte $00,$00,$00,$F3,$FC,$FF,$FF,$FF,$0F,$00,$00,$CF,$3F,$FF,$FF,$FF
            .byte $FC,$00,$00,$FF,$FF,$FC,$FC,$F0,$00,$00,$03,$C0,$3F,$0F,$03,$0F
            .byte $0F,$3F,$FF,$0F,$C0,$FC,$FF,$FF,$FF,$FF,$FF,$03,$FC,$00,$3F,$0C
            .byte $00,$03,$CF,$FF,$FC,$FC,$C3,$0F,$FF,$3F,$C3,$DA,$1A,$DA,$1A,$1A
            .byte $1A,$1A,$1A,$00,$00,$00,$00,$FF,$AA,$AA,$40,$FF,$FC,$C3,$FF,$C0
            .byte $C0,$3C,$CF,$90,$90,$90,$D3,$FF,$FF,$FA,$00,$0A,$AA,$AA,$AA,$AA
            .byte $AF,$F0,$0A,$FF,$FF,$0F,$03,$80,$A0,$A8,$A8,$FF,$F0,$FF,$FF,$FF
            .byte $FF,$FC,$0F,$0F,$CF,$FF,$FF,$FF,$0C,$00,$30,$2A,$03,$AF,$FA,$A0
            .byte $0A,$AA,$AA,$BF,$FF,$C0,$00,$AA,$AA,$AA,$AA,$FF,$FC,$00,$0A,$AA
            .byte $AA,$AA,$AA,$FF,$02,$00,$AA,$AA,$AA,$AA,$AA,$00,$00,$00,$00,$FF
            .byte $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$44,$55,$AA,$00,$AA,$AA,$AA
            .byte $AA,$66,$55,$AA,$00,$AA,$AA,$AA,$AA,$AA,$AA,$A0,$AA,$AA,$AA,$AA
            .byte $FA,$0F,$A0,$0A,$AA,$AA,$AF,$F0,$0A,$AA,$AA,$A0,$FA,$0F,$A0,$AA
            .byte $AA,$AA,$AA,$0F,$33,$FF,$FF,$FF,$0C,$03,$C3,$F0,$C0,$00,$00,$3F
            .byte $FC,$F0,$03,$FA,$FA,$FE,$FE,$FA,$3A,$BA,$AA,$FF,$CF,$FF,$FF,$3F
            .byte $FF,$FF,$FC,$FF,$83,$00,$A0,$AA,$AA,$AA,$AA,$0F,$F3,$00,$FF,$00
            .byte $03,$3C,$F3,$FF,$FF,$33,$FF,$03,$C0,$3C,$CF,$00,$0C,$0F,$03,$00
            .byte $00,$00,$03,$00,$00,$00,$F0,$FF,$3F,$0F,$3F,$00,$00,$00,$00,$FF
            .byte $FF,$FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$00,$00,$0F,$FC,$F0
            .byte $C0,$FC,$FF,$30,$C0,$00,$00,$00,$00,$3C,$FC,$0F,$03,$00,$03,$0C
            .byte $0F,$FF,$CF,$F0,$CC,$FF,$FF,$FF,$30,$C0,$C3,$F0,$F3,$FF,$FF,$FF
            .byte $30,$00,$0C,$FF,$0F,$FF,$FF,$FF,$FF,$3F,$FC,$FF,$FF,$FF,$FF,$FC
            .byte $FF,$FF,$3F,$C0,$30,$0C,$03,$FC,$00,$C0,$FF,$FF,$FC,$0F,$03,$FF
            .byte $F0,$FF,$F3,$3F,$0F,$0C,$33,$FC,$00,$C0,$FF,$FF,$FF,$CC,$FF,$C0
            .byte $03,$3C,$F3,$F0,$C3,$0C,$FF,$00,$C0,$3C,$CF,$CF,$0F,$03,$FF,$00
            .byte $00,$03,$FF,$FF,$FC,$C0,$02,$2A,$AA,$AA,$AA,$00,$00,$00,$00,$FF
            .byte $FF,$FF,$FF,$00,$00,$00,$0F,$FF,$FC,$F0,$FC,$00,$30,$F0,$C0,$00
            .byte $00,$00,$C0,$30,$F0,$F0,$F0,$F0,$F0,$F0,$FC,$A0,$AA,$AA,$FA,$0F
            .byte $A0,$AA,$AA,$0A,$AF,$F0,$0A,$AA,$AA,$AA,$AA,$0F,$CF,$FF,$FF,$FF
            .byte $0C,$00,$30
			
L7800:      .byte $20
L7801:      .byte $48,$AD,$00,$21,$48
L7806:      .byte $AD,$FA,$20
L7809:      .byte $AE,$FB,$20
L780C:      .byte $AC,$FC,$20
L780F:      .byte $40,$00,$00
L7812:      .byte $00,$00,$00
L7815:      .byte $00,$00,$00
L7818:      .byte $00,$00,$00
L781B:      .byte $00,$00,$00
L781E:      .byte $00,$00,$00
L7821:      .byte $00,$00,$00
L7824:      .byte $00,$00,$00
L7827:      .byte $00,$00,$00
L782A:      .byte $00,$00,$00
L782D:      .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00
            jmp L3A43
 
;The code below falls in the screen memory area and is not used 
            jsr L2396
            bmi L788B
            beq L788B
            jsr L239F
            cmp #$1B
            beq L788B
            jsr L25E3
            ldx #$50
            lda #$00
            sta L00B3
L785A:      sta L2101,X
            dex
            bne L785A
            ldx #$00
            jsr L25F8
            jsr L2601
            jsr L2601
            jsr L236F
            jsr L2363
            bmi L7888
            beq L7888
            ldy #$00
            jsr L238A
            cmp #$1B
            beq L7888
            ldy #$00
            sty L009F
            jsr L3A8C
            jmp L3A60
            
L7888:      jsr L3F75
L788B:      rts

            lda #$00
            sta L00AD
L7890:      jsr L2399
L7893:      cmp #$2F
            beq L78B3
            cmp #$2B
L7899:      beq L78C3
            dec L009F
L789D:      jsr L3AE7
L78A0:      jsr L3BB7
L78A3:      bne L78B2
L78A5:      jsr L3BF8
            bne L78B2
            jsr L3EF6
            bne L78D4
            jsr L3F45
L78B2:      rts

L78B3:      jsr L3EE4
            bne L78D0
            lda L0084
            sta LOMEM
            lda L0085
            sta LOMEM+1
            jmp L3AAA
			
L78C3:      jsr L3EEE
            bne L78D0
            lda L0084
            jsr L3F36
            jmp L3AAA
            
L78D0:      lda #$0D
            bne L78D6
L78D4:      lda #$0A
L78D6:      pha
            ldx #$0B
            jsr L2610
            pla
            tax
            jsr L2610
            ldx #$00
            stx L00AD
            dex
            rts
            
            jsr L3EF6
            beq L792D
            ldy L009F
            lda (L0092),Y
            cmp #$4C
            bne L792D
            iny
            lda (L0092),Y
            cmp #$30
            bcc L792D
            cmp #$3A
            bcs L792D
L78FF:      and #$0F
L7901:      sta L00B4
            iny
            lda (L0092),Y
            cmp #$20
L7908:      bne L792D
L790A:      sty L009F
            lda L00B4
            asl
            tax
            lda L2102,X
            sta L0082
            lda L2103,X
            sta L0083
            lda LOMEM
            sta L2102,X
            lda LOMEM+1
            sta L2103,X
            ldx L0082
            dex
            bne L792D
            lda L0083
            beq L792E
L792D:      rts

L792E:      ldx #$00
L7930:      cpx L00B3
            beq L792D
            lda L2116,X
            cmp L00B4
            beq L7940
L793B:      inx
            inx
            inx
            bne L7930
L7940:      lda L2117,X
            sta L0082
            lda L2118,X
            sta L0083
            lda LOMEM
            sta L0084
            lda LOMEM+1
            sta L0085
            txa
            pha
            ldy #$00
            lda (L0082),Y
            and #$1F
            cmp #$10
            bne L7975
            jsr L3EFE
            bne L799A
            pha
            inc L0082
            bne L796A
            inc L0083
L796A:      ldx #$02
            jsr L2756
            pla
            sta (L0086),Y
            jmp L3B91
            
L7975:      inc L0082
            bne L797B
            inc L0083
L797B:      ldx #$02
            jsr L2756
            lda LOMEM
            sta (L0086),Y
            inc L0082
            bne L798A
            inc L0083
L798A:      jsr L2756
            lda LOMEM+1
            sta (L0086),Y
            pla
            tax
            lda #$FF
            sta L2116,X
            bne L793B
L799A:      jsr L3CFD
            jsr L2601
            lda #$41
            jsr L25E6
            lda #$54
            jsr L25E6
            jsr L2601
            ldx #$02
            jsr L2604
            pla
            tax
            jmp L3B3B
            
            jsr L3EF6
            beq L79F3
            ldx #$00
            stx L00B1
L79C0:      ldy L009F
L79C2:      lda L2B10,X
            and #$7F
            cmp (L0092),Y
            bne L79D5
            iny
            lda L2B10,X
            bmi L79E4
            inx
            bne L79C2
L79D4:      inx
L79D5:      lda L2B10,X
            bpl L79D4
            inc L00B1
            inx
            lda L2B10,X
            cmp #$2A
            bne L79C0
L79E4:      lda (L0092),Y
            cmp #$20
            beq L79EE
            cmp #$9B
            bne L79F3
L79EE:      sty L009F
            lda #$00
            rts
            
L79F3:      lda #$0C
            jmp L3AD6
            
            jsr L3D72
            bne L7A62
            ldx L00B1
            ldy L2BF4,X
            ldx #$00
L7A04:      tya
            beq L7A12
            lda L2C2C,X
            inx
            cmp #$FF
            bne L7A04
            dey
            bne L7A04
L7A12:      lda L2C2C,X
            cmp #$FF
            beq L7A20
            cmp L00B2
            beq L7A33
            inx
            bne L7A12
L7A20:      ldx L00B1
            lda L2BF4,X
            cmp #$06
            bne L7A62
            lda L00B2
            cmp #$08
            bne L7A62
            lda #$09
            sta L00B2
L7A33:      ldx L00B1
            lda L2BF4,X
            asl
            tax
            lda L3C44,X
            pha
            lda L3C43,X
            pha
            rts
            
            sei
            .byte $3C
            jmp (L6C3C)
            
            .byte $3C
            ror NOCKSM
            ror NOCKSM
            jmp (L663C)
            
            .byte $3C
            adc #$3C
            ror NOCKSM
            adc #$3C
            .byte $6F,$3C
            ror NOCKSM
            ror L8C3C,X
            .byte $3C
            lda #$00
            rts
            
L7A62:      lda #$0D
            jmp L3AD6
            
            jsr L3CAA
            jsr L3C9B
            jmp L3CC6
            
            jsr L3C9B
            jsr L3CB8
            jmp L3CC6
            
            lda #$0B
            sta L00B2
            bne L7AC6
            jsr L3C9B
            jsr L3CB8
            lda L00B2
            cmp #$02
            beq L7A62
            bne L7AC6
            jsr L3C9B
            jsr L3CAA
            lda L00B2
            cmp #$01
            beq L7A62
            bne L7AC6
            lda L0085
            bne L7AA9
            lda L00B2
            cmp #$00
            bne L7AA9
            lda #$03
L7AA7:      sta L00B2
L7AA9:      rts

            lda L0085
            bne L7AA9
            lda L00B2
            cmp #$01
            bne L7AA9
            lda #$04
            bne L7AA7
            lda L0085
            bne L7AA9
            lda L00B2
            cmp #$02
            bne L7AA9
            lda #$05
            bne L7AA7
L7AC6:      lda L00B2
            asl
            tax
            lda L3CD4,X
            pha
            lda L3CD3,X
            pha
            rts
            
            ora (BPTR,X)
            .byte $23
            and L3D27,X
            .byte $37
            and L3D41,X
            eor (BPTR,X)
            eor BPTR
            eor #$3D
            eor L533D
            and L3D5B,X
            cpx L6C3C
            and L80A5,X
            sta L0082
            lda LOMEM+1
            sta L0083
            jsr L3F3D
            jsr L3EFE
            beq L7B1E
            lda #$0E
            jmp L3AD6
            
            ldy #$00
            ldx L00B1
            lda L2BF4,X
            cmp #$02
            beq L7B13
            cmp #$05
            beq L7B13
            ldy #$0C
L7B13:      tya
L7B14:      jsr L3F31
            lda L0084
            jsr L3F36
            lda L0085
L7B1E:      jsr L3F36
            jmp L3C5F
			
            lda #$1C
            bne L7B14
            ldy #$18
            ldx L00B1
            lda L2BF4,X
            cmp #$0A
            bne L7B35
            ldy #$1C
L7B35:      tya
            bne L7B14
            lda #$04
L7B3A:      jsr L3F31
            lda L0084
            jmp L3D1E
			
            lda #$14
            bne L7B3A
            lda #$00
            beq L7B3A
            lda #$10
            bne L7B3A
            jsr L3F3D
            jmp L3C5F
			
            lda #$08
            jsr L3F31
            jmp L3C5F
			
            ldy #$00
            ldx L00B1
            lda L2BF4,X
            cmp #$03
            bne L7B69
            ldy #$08
L7B69:      tya
            jmp L3D3A
            
            lda #$20
            jmp L3D14
            
            ldx #$04
            jsr L275F
            lda #$08
            sta L00B2
            jsr L3EF6
            beq L7B8D
            jsr L3E40
            beq L7B8D
            jsr L3E23
            beq L7B8D
            jsr L3E88
L7B8D:      rts

            lda L009F
            pha
            jsr L2399
            cmp #$4C
            bne L7BAA
            jsr L2393
            cmp #$30
            bcc L7BAA
            cmp #$3A
            bcs L7BAA
            and #$0F
            sta L00B4
            jmp L3DAD
            
L7BAA:      jmp L3E3A

            asl
            tax
            lda L2102,X
            sta L0084
            lda L2103,X
            sta L0085
            bne L7C1C
            ldy L0084
            beq L7BC2
            dey
            bne L7C1C
L7BC2:      lda #$01
            sta L2102,X
            lda #$00
            sta L2103,X
            ldx #$00
L7BCE:      cpx L00B3
            beq L7BDC
            lda L2116,X
            bmi L7BEE
            inx
            inx
            inx
            bne L7BCE
L7BDC:      cpx #$3C
            bcc L7BE8
            lda #$0F
            jsr L3AD6
            jmp L2203
            
L7BE8:      txa
            clc
            adc #$03
            sta L00B3
L7BEE:      lda L00B4
            sta L2116,X
            lda LOMEM
            sta L2117,X
            sta L0084
            lda LOMEM+1
            sta L2118,X
            .byte $85
            
            ;org $7C00
            
;SetPgZero:	lda #$01 - This code is not necessary
;            sta $004D
;            ldx #$00
; zeroLoop:	lda $7C80,X
;            sta $80, X
;            inx
;            bpl zeroLoop
;            rts
;            
;            org $7C80
;            
;            .byte $96,$C2,$54,$95,$BF,$27,$94,$AE,$34,$93,$9F,$03,$92,$86,$08,$81
;            .byte $7B,$EB,$80,$5A,$C8,$7F,$A3,$C7,$4E,$72,$24,$3C,$FE,$A7,$3D,$7D
;            .byte $22,$40,$41,$E0,$7F,$7B,$E0,$76,$6F,$F2,$75,$5E,$01,$34,$09,$0F
;            .byte $D8,$A8,$40,$B7,$C5,$3F,$C6,$C3,$CE,$D5,$E2,$FD,$E4,$DD,$FC,$E3
;            .byte $E0,$C3,$E2,$DF,$FA,$E1,$D6,$F1,$E0,$C9,$E0,$DF,$F4,$DF,$DE,$B4
;            .byte $1C,$58,$F4,$5B,$5C,$B4,$93,$D1,$EB,$E2,$B0,$F8,$ED,$B9,$F7,$F0
;            .byte $A8,$F8,$EF,$B5,$F7,$DE,$C4,$B5,$0B,$56,$F5,$3A,$64,$F3,$2B,$6A
;            .byte $D3,$4A,$28,$F1,$67,$22,$D1,$7E,$38,$CF,$7F,$36,$CF,$7E,$34,$CD
            
         
            org $8000

L8000       lda #$3C
            sta PBCTL
            lda #$FF
            sta PORTB
            lda #$01
            sta BASICF
            jsr Display 	;Displays the initial boot screen
            jsr SetPic		;Displays the Bruce Lee picture
            jsr SetVBL		;Sets Vertical blank - So Music will play
            ldy #$62
            ldx #$E4
            lda #$07
            jsr SETVBV
            lda #$74
            sta DOSINI
            sta DOSVEC
            lda #$E4
            sta DOSINI+1
            sta DOSVEC+1
            lda #$00
            sta COLDST
            ;jsr SetPgZero 	;Set page zero locations
            jmp GameOn
            rts

;This routine displays the intial boot screen
Display:    	
	    lda #<InitScrn
            sta SDLSTL
            lda #>InitScrn
            sta SDLSTH
            lda #$94
            sta CHBAS
            lda #$00
            sta $86
NextByte:   sta VSCROL
            jsr LoadChar
            jsr ScrnDelay
            jsr ScrnDelay
            inc $86
            lda $86
            cmp #$08
            bcc NextByte
            lda #$E0
            sta CHBAS
            jmp ScrnDelay

;Waits one Vblank period(1/60th second)           
ScrnDelay:  lda RTCLOK+2
Wait:       cmp RTCLOK+2
            beq Wait
            rts
;Sets Display list to the Bruce Lee picture    
SetPic:       
            lda #<Picture
            sta SDLSTL
            lda #>Picture
            sta SDLSTH
            ldx #$04
NextColor:  lda Colors,X
            sta COLOR0,X
            dex
            bpl NextColor
            jsr ScrnDelay
            rts
 
;Copies the Character set at $E000 to $2000 1 byte per char 
;For the scrolling effect on the inital boot screen                    
LoadChar:   ldx $86
            lda #$3A
            sta $87
            lda #$00
            sta NxtByte+1
            sta NxtByte+4
            lda #$E0
            sta NxtByte+2
            lda #$94
            sta NxtByte+5
NxtByte:    lda $E000,X
            sta $9400,X
            dec $87
            bmi DoneMove
            lda NxtByte+1
            clc
            adc #$08
            sta NxtByte+1
            bcc SkipHiStr
            inc NxtByte+2
SkipHiStr:  lda NxtByte+4
            clc
            adc #$08
            sta NxtByte+4
            bcc SkipHiDes
            inc NxtByte+5
SkipHiDes:  jmp NxtByte
DoneMove:   rts

Colors:     .byte $8E,$00,$76,$00,$70

Unknown:    .byte $68,$08,$48,$8A,$48,$98,$48 	;This may be unused

;Initial Screen Dislay List
InitScrn:   .byte $70,$70,$70,$62,$00,$90,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22
            .byte $22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$02,$02,$02,$02,$41
            .word InitScrn

;Screen Blank Display List - Not used in this version        
BlankList:  .byte $70,$41
			.word BlankList

;Bruce Lee Picture Display List
Picture:    .byte $70,$70,$70,$4E,$10,$A0,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$4E
            .byte $00,$B0,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
            .byte $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$41
            .word Picture
            
SetVBL:     lda #$07		;Deferred VBI
            ldy #<VBlank	;
            ldx #>VBlank	;
            jsr SETVBV		;Set VBlank
            lda #<Music		;
            sta $C0			;Music Data Low address
            lda #>Music		;
            sta $C1			;Music Data high address
            lda #$02		;
            sta $E4			;Play through song two times
            jsr Reset		;Reset Audio
WaitKey:    lda CONSOL		;
            cmp #$07		;
            bne Done		;Wait for console WaitKey then start game
            lda CH			;
            cmp #$FF		;Has a key been pressed? 
            beq NoKey		;Branch if no key pressed
Done:       lda #$00		;
            sta $E2			;
            ldx #$07		;Clean up audio registers and start game
ClAdRg:     sta AUDF1,X		;
            dex				;
            bpl ClAdRg		;Clear next audio register
            rts		        ;
            
NoKey:      lda $E2
            bne WaitKey		;Branch if song is to be played again
            rts				;Otherwise start game
            
Reset:      lda #$00		;
            sta L00E6		;
            sta AUDCTL		;
            lda #$03		;
            sta SKCTL		;
            sta SSKCTL		;
NtDtSg:     ldy L00E6		;
            inc L00E6		;
            inc L00E6		;
            lda ($C0),Y		;
            bne NonZero		;
            dec $E4			;
            bne Reset		;
            sta $E2			;
            ldx #$07		;
ClAdRg2:    sta AUDF1,X		;
            dex				;
            bpl ClAdRg2		;
            rts				;
            
NonZero:    sta $C3
            iny
            lda ($C0),Y
            sta $C2
            ldy #$00
Init:       lda ($C2),Y
            sta $00CC,Y
            iny
            cpy #$0B
            bcc Init
            tya
            clc
            adc $C2
            sta $C2
            bcc SkipHi
            inc $C3
SkipHi:     ldx #$01
            stx $E0
            dex
CptAdr:     lda #$01
            sta L00DF,X
            ldy #$00
            lda ($C2),Y
            sta L00D7,X
            lda $C2
            clc
            adc #$03
            sta $C4,X
            lda $C3
            adc #$00
            sta $C5,X
            iny
            lda ($C2),Y
            clc
            adc $C2
            pha
            iny
            lda ($C2),Y
            adc $C3
            sta $C3
            pla
            clc
            adc #$03
            sta $C2
            bcc SkipHi2
            inc $C3
SkipHi2:    inx
            inx
            cpx #$08
            bcc CptAdr
            lda #$01
            sta $E2
            rts
            
VBlank:     lda $E2			;VBlank
            bne Cont
VBIDone:    jmp ExitVBV

Cont:       ldx #$06
NxtCnl:     lda L00D8,X
            cmp L00D0,X
            beq LdNxt
            dec L00D8,X
            lda L00D8,X
            clc
            adc L00D7,X
            sta AUDC1,X
LdNxt:      dex
            dex
            bpl NxtCnl
            dec $E0
            bne VBIDone
            lda $00CC
            bne CntSg
            dec L00CD
            bpl CntSg
            jsr NtDtSg
            bne VBIDone
CntSg:      dec $00CC
            lda L00CE
            sta $E0
            ldx #$06
NxtVlu:     dec L00DF,X
            bne SkpNt
            lda L00CF,X
            sta L00D8,X
            clc
            adc L00D7,X
            sta AUDC1,X
            lda ($C4,X)
            bne StrNt
            sta AUDC1,X
            lda L00D0,X
            sta L00D8,X
StrNt:      sta AUDF1,X
            inc $C4,X
            bne SkipHi3
            inc $C5,X
SkipHi3:    lda ($C4,X)
            sta L00DF,X
            inc $C4,X
            bne SkpNt
            inc $C5,X
SkpNt:      dex
            dex
            bpl NxtVlu
ExitVBV:    jmp XITVBV

Music:      ;Music Data
	    .DBYTE (Music + $0F)	;Must use MADS(2.0.4 b7)or later to use .DBYTE 
	    .DBYTE (Music + $18A) 	;
	    .DBYTE (Music + $1C5) 	;
	    .DBYTE (Music + $200) 	;
	    .DBYTE (Music + $273) 	;
	    .DBYTE (Music + $2EE) 	;
	    .DBYTE (Music + $369) 	;
	    .byte $00,$E0,$00,$04
            .byte $08,$01,$08,$00,$0A,$02,$0A,$02,$A0,$70,$00,$FF,$04,$80,$04,$AD
            .byte $04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD
            .byte $04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD
            .byte $04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$C1,$04,$60,$04,$C1
            .byte $04,$60,$04,$C1,$04,$60,$04,$C1,$04,$60,$04,$FF,$04,$80,$04,$AD
            .byte $04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD
            .byte $04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$C1,$04,$60,$04,$C1
            .byte $04,$60,$04,$C1,$04,$60,$04,$C1,$04,$60,$04,$A0,$50,$00,$00,$20
            .byte $00,$20,$00,$20,$00,$20,$40,$02,$6C,$02,$55,$02,$51,$02,$55,$02
            .byte $6C,$02,$39,$02,$40,$02,$00,$10,$40,$02,$6C,$02,$55,$02,$51,$02
            .byte $55,$02,$6C,$02,$39,$02,$40,$02,$00,$10,$13,$01,$17,$01,$1F,$01
            .byte $28,$01,$2F,$01,$40,$01,$51,$01,$60,$01,$00,$08,$13,$01,$17,$01
            .byte $1F,$01,$28,$01,$2F,$01,$40,$01,$51,$01,$60,$01,$00,$08,$A0,$52
            .byte $00,$00,$20,$55,$04,$60,$04,$55,$08,$00,$10,$55,$04,$60,$04,$55
            .byte $08,$00,$10,$40,$02,$40,$02,$40,$02,$40,$02,$48,$04,$40,$04,$40
            .byte $02,$40,$02,$40,$02,$40,$02,$48,$04,$40,$04,$55,$04,$60,$04,$55
            .byte $08,$00,$10,$55,$04,$60,$04,$55,$08,$00,$10,$40,$02,$40,$02,$40
            .byte $02,$40,$02,$48,$04,$40,$04,$40,$02,$40,$02,$40,$02,$40,$02,$48
            .byte $04,$40,$04,$A0,$52,$00,$00,$20,$40,$04,$48,$04,$40,$08,$00,$10
            .byte $40,$04,$48,$04,$40,$08,$00,$10,$2F,$02,$2F,$02,$2F,$02,$2F,$02
            .byte $35,$04,$2F,$04,$2F,$02,$2F,$02,$2F,$02,$2F,$02,$35,$04,$2F,$04
            .byte $40,$04,$48,$04,$40,$08,$00,$10,$40,$04,$48,$04,$40,$08,$00,$10
            .byte $2F,$02,$2F,$02,$2F,$02,$2F,$02,$35,$04,$2F,$04,$2F,$02,$2F,$02
            .byte $2F,$02,$2F,$02,$35,$04,$2F,$04,$10,$00,$04,$08,$01,$08,$01,$08
            .byte $02,$08,$02,$A0,$0C,$00,$72,$02,$72,$02,$72,$02,$72,$02,$80,$04
            .byte $72,$04,$A0,$0C,$00,$AD,$02,$AD,$02,$AD,$02,$AD,$02,$C1,$04,$AD
            .byte $04,$A0,$06,$00,$44,$08,$4C,$04,$44,$04,$A0,$06,$00,$55,$08,$60
            .byte $04,$55,$04,$10,$00,$04,$08,$01,$08,$01,$08,$02,$08,$02,$A0,$0C
            .byte $00,$72,$02,$72,$02,$72,$02,$72,$02,$80,$04,$72,$04,$A0,$0C,$00
            .byte $AD,$02,$AD,$02,$AD,$02,$AD,$02,$C1,$04,$AD,$04,$A0,$06,$00,$44
            .byte $08,$4C,$04,$44,$04,$A0,$06,$00,$39,$08,$40,$04,$39,$04,$20,$00
            .byte $04,$08,$01,$08,$00,$0A,$02,$0A,$02,$A0,$18,$00,$72,$02,$72,$02
            .byte $72,$02,$72,$02,$80,$04,$72,$04,$AD,$02,$AD,$02,$AD,$02,$AD,$02
            .byte $AD,$02,$00,$06,$A0,$20,$00,$AD,$02,$AD,$02,$AD,$02,$AD,$02,$C1
            .byte $04,$AD,$04,$14,$01,$1C,$01,$21,$01,$2A,$01,$39,$01,$44,$01,$55
            .byte $01,$72,$01,$55,$02,$00,$06,$A0,$12,$00,$44,$0C,$00,$04,$14,$01
            .byte $2A,$01,$00,$04,$14,$01,$2A,$01,$00,$04,$00,$04,$A0,$12,$00,$2A
            .byte $0C,$00,$04,$1F,$01,$40,$01,$00,$04,$1F,$01,$40,$01,$00,$04,$00
            .byte $04,$40,$00,$04,$07,$01,$04,$00,$09,$02,$09,$02,$A0,$20,$00,$FF
            .byte $04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF
            .byte $04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$A0
            .byte $24,$00,$40,$02,$6C,$02,$55,$02,$51,$02,$55,$02,$6C,$02,$39,$02
            .byte $40,$02,$00,$10,$40,$02,$6C,$02,$55,$02,$51,$02,$55,$02,$6C,$02
            .byte $39,$02,$40,$02,$00,$10,$A0,$10,$00,$55,$04,$60,$04,$55,$08,$00
            .byte $10,$55,$04,$60,$04,$55,$08,$00,$10,$A0,$10,$00,$40,$04,$48,$04
            .byte $40,$08,$00,$10,$40,$04,$48,$04,$40,$08,$00,$10,$40,$00,$04,$05
            .byte $01,$03,$00,$07,$02,$07,$02,$A0,$20,$00,$FF,$04,$80,$04,$AD,$04
            .byte $A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD,$04
            .byte $A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$A0,$24,$00,$40,$02,$6C
            .byte $02,$55,$02,$51,$02,$55,$02,$6C,$02,$39,$02,$40,$02,$00,$10,$40
            .byte $02,$6C,$02,$55,$02,$51,$02,$55,$02,$6C,$02,$39,$02,$40,$02,$00
            .byte $10,$A0,$10,$00,$55,$04,$60,$04,$55,$08,$00,$10,$55,$04,$60,$04
            .byte $55,$08,$00,$10,$A0,$10,$00,$40,$04,$48,$04,$40,$08,$00,$10,$40
            .byte $04,$48,$04,$40,$08,$00,$10,$40,$00,$04,$03,$01,$02,$00,$04,$01
            .byte $04,$01,$A0,$20,$00,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80
            .byte $04,$AD,$04,$A2,$04,$FF,$04,$80,$04,$AD,$04,$A2,$04,$FF,$04,$80
            .byte $04,$AD,$04,$A2,$04,$A0,$24,$00,$40,$02,$6C,$02,$55,$02,$51,$02
            .byte $55,$02,$6C,$02,$39,$02,$40,$02,$00,$10,$40,$02,$6C,$02,$55,$02
            .byte $51,$02,$55,$02,$6C,$02,$39,$02,$40,$02,$00,$10,$A0,$10,$00,$55
            .byte $04,$60,$04,$55,$08,$00,$10,$55,$04,$60,$04,$55,$08,$00,$10,$A0
            .byte $10,$00,$40,$04,$48,$04,$40,$08,$00,$10,$40,$04,$48,$04,$40,$08
            .byte $00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
      	    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
      	    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $4D,$18,$06,$1A,$0A,$63,$62,$1B,$79,$68,$1D,$18,$00,$6D,$00,$00
            .byte $63,$0C,$1F,$09,$0B,$1B,$0E,$0F,$1C,$74,$08,$6B,$6A,$09,$11,$08
            .byte $01,$0C,$14,$63,$06,$0C,$0E,$0F,$1C,$74,$0D,$0D,$64,$02,$0F,$1F
            .byte $13,$65,$63,$07,$64,$63,$07,$64,$6D,$18,$06,$1A,$0A,$43,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00
            
            org $9000	;Initial boot screen data
            
Screen1:    .sb "                                        "
			.sb "                                        "
			.sb "                                        "
            .sb "         DATASOFT (R) PRESENTS          "
            .sb "                                        "
            .sb "             BRUCE LEE (TM)             "
            .sb "                                        "
            .sb "                                        "
            .sb "           (C) 1984 BRUCE LEE           "
            .sb "          ALL RIGHTS RESERVED           "
            .sb "       LIC. BY ZIV INTERNATIONAL        "
            .sb "                                        "
            .sb "                                        "
            .sb "      PROGRAMMED BY  RON J FORTIER      "
            .sb "                                        "
            .sb "  GAME GRAPHICS (C) 1984 DATASOFT INC.  "
            .sb "                                        "
            .sb "                                        "
            .sb "       TM DESIGNATES A TRADEMARK        "
            .sb "              OF LINDA LEE              "
            
            org $A010 	;Bruce Lee Picture Data
            
            .byte $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$0F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F0
            .byte $3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC,$3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$FF,$FF,$FF,$FC
            .byte $3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$F5,$7F,$FF,$FF,$FC,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F5,$5F,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$F5,$57,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F5,$5F,$FD,$7F,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$F5,$7F,$F5,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FB,$FF
            .byte $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F5,$75,$55,$5F,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$D5,$DD,$FF,$FF,$FF,$FA,$FF,$FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$55,$55,$5F,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$D5,$FF,$FF,$FF,$FB,$BF
            .byte $FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$55,$FD,$75,$7F,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FA,$AB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA
            .byte $AF,$F7,$DD,$FF,$FF,$EA,$AA,$EF,$FF,$BF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FD,$55,$5F,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$AA,$FF,$FF,$FF
            .byte $FF,$FF,$AF,$FA,$AF,$FF,$FE,$AA,$AA,$BF,$FF,$FF,$FF,$EA,$AA,$BB
            .byte $FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$55,$5F,$FF,$FF,$FF
            .byte $FF,$FF,$FE,$AA,$AA,$FF,$FF,$FF,$FF,$FF,$AF,$EA,$AA,$FF,$FA,$AA
            .byte $AA,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$AB,$EF,$FF,$FF,$AA,$AB,$FF,$FF
            .byte $FF,$FF,$FD,$55,$77,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$FF,$FE,$AF
            .byte $FF,$FF,$AF,$EB,$FA,$BF,$AA,$AA,$AA,$FF,$FF,$FF,$FE,$AA,$AA,$AA
            .byte $AA,$EB,$FF,$FA,$AA,$AB,$FF,$FF,$FF,$FF,$F5,$D5,$F7,$FF,$FF,$FF
            .byte $FF,$FF,$EB,$FF,$EA,$FF,$FA,$AB,$FF,$FF,$AF,$AF,$FE,$BA,$AA,$AA
            .byte $AA,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$AA,$FB,$FF,$AA,$AA,$AB,$FF,$FF
            .byte $FF,$FF,$D5,$D5,$FD,$7F,$FF,$FF,$FF,$FE,$AB,$FF,$EA,$FF,$EA,$AA
            .byte $EF,$FF,$AF,$BF,$FF,$AA,$FF,$FA,$AF,$FF,$FF,$FF,$AA,$AA,$AA,$AA
            .byte $AA,$BA,$FA,$AA,$AB,$FF,$FF,$FF,$FF,$FF,$D7,$D5,$FD,$57,$FF,$FF
            .byte $FF,$FE,$AF,$FF,$EA,$FF,$AF,$AA,$EF,$FF,$BE,$BF,$EF,$AE,$FF,$FE
            .byte $AF,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$BE,$AA,$AA,$AA,$AF,$FF,$FF
            .byte $FF,$FF,$DF,$D5,$FD,$55,$7F,$FF,$FF,$FE,$AF,$FF,$AA,$FE,$BF,$EA
            .byte $EF,$FF,$BE,$BF,$EF,$AE,$FF,$FF,$FF,$FF,$FF,$FE,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FF,$FF,$7F,$D5,$FF,$55,$5F,$FF
            .byte $FF,$FE,$FF,$FF,$AB,$FA,$FF,$EA,$EF,$FF,$BA,$BF,$AF,$AE,$FF,$FF
            .byte $FF,$FF,$FF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF
            .byte $FF,$FD,$FF,$D5,$FF,$55,$7F,$FF,$FF,$FE,$EF,$FE,$AB,$EB,$FF,$EA
            .byte $EF,$FF,$BA,$BF,$AF,$BE,$FF,$FF,$FF,$FF,$FF,$FB,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$F7,$FF,$D7,$FF,$D5,$FF,$FF
            .byte $FF,$FF,$EF,$FE,$AB,$AF,$FF,$AB,$EF,$FF,$BA,$FE,$AA,$BE,$FF,$FF
            .byte $FF,$FF,$FF,$FA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF
            .byte $FF,$F7,$FF,$D7,$FF,$D7,$FF,$FF,$FF,$FF,$EF,$EA,$AF,$EF,$FF,$AB
            .byte $AF,$FF,$BA,$FF,$AA,$FE,$FF,$FF,$FF,$FF,$FF,$EE,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$FF,$DF,$FF,$D7,$FE,$FF,$FF,$FF
            .byte $FF,$FF,$EF,$AA,$AF,$EF,$FE,$AF,$AF,$FF,$AA,$FF,$EB,$FE,$FF,$FF
            .byte $FF,$FF,$FF,$EA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF
            .byte $FF,$7F,$FF,$DF,$AA,$FF,$FF,$FF,$FF,$FF,$EE,$AA,$AB,$FB,$FA,$BF
            .byte $AF,$FF,$AA,$FF,$FF,$FE,$EA,$BF,$BF,$FF,$FF,$FA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AB,$FF,$FD,$FF,$F5,$55,$FA,$BF,$FF,$FF
            .byte $FF,$FF,$EA,$AA,$AB,$FB,$EA,$BF,$AF,$FF,$AA,$FF,$FF,$FA,$AA,$AA
            .byte $BF,$FF,$FF,$FA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB,$FF
            .byte $FF,$FA,$AF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$FA,$AA,$BF
            .byte $AF,$FF,$AA,$BF,$FF,$EA,$AA,$AA,$BF,$FF,$FF,$EA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AB,$FF,$FF,$FF,$FF,$FF,$AA,$FF,$FF,$FF
            .byte $FF,$FF,$AA,$FF,$FA,$FA,$AA,$FF,$AF,$FF,$AA,$BF,$FF,$AA,$FA,$AA
            .byte $BF,$FF,$FF,$EA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF
            .byte $FF,$FF,$FF,$EF,$AB,$FF,$FF,$FF,$FF,$FF,$AB,$FF,$FA,$FA,$AA,$FF
            .byte $AB,$FF,$AA,$AF,$FF,$FE,$FF,$AA,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FF,$FF,$EA,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$AF,$FF,$FA,$FA,$AA,$BF,$AB,$FA,$AA,$AB,$FF,$FE,$FF,$FB
            .byte $FF,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF
            .byte $FF,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$AA,$FF,$EA,$FA,$FA,$BF
            .byte $AA,$AA,$BE,$AA,$FF,$FE,$FF,$FF,$FF,$FF,$FE,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FF,$FF,$EA,$AF,$FF,$FF,$FF
            .byte $FF,$FE,$AA,$FF,$EB,$FA,$FE,$AF,$EA,$AA,$BF,$AA,$BF,$FE,$BF,$FF
            .byte $FF,$FF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF
            .byte $FF,$FF,$FF,$EA,$AF,$FF,$FF,$FF,$FF,$FE,$AA,$FF,$EB,$FB,$FE,$AF
            .byte $EA,$AA,$BF,$AA,$AB,$FA,$BF,$FF,$FF,$FF,$FA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$FF,$EA,$BF,$FF,$BF,$FF
            .byte $FF,$FE,$AB,$FF,$AF,$EB,$FE,$AB,$EA,$AA,$BF,$EA,$AA,$BA,$BF,$FF
            .byte $FF,$FF,$FA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF
            .byte $FF,$FF,$FF,$EA,$BF,$FF,$BF,$FF,$FF,$FA,$AF,$FA,$AF,$EB,$FF,$AB
            .byte $EA,$AA,$FF,$FA,$AA,$BA,$AF,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$FF,$EA,$BF,$FE,$AF,$FF
            .byte $FF,$FA,$FF,$EA,$AF,$AA,$FF,$AB,$FA,$AA,$FF,$FE,$AA,$FA,$AF,$FF
            .byte $FF,$FF,$EE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF
            .byte $FF,$FF,$FF,$EA,$AA,$AA,$AF,$FF,$FF,$EB,$FE,$AA,$BF,$AA,$FF,$AA
            .byte $FA,$AB,$FF,$FF,$AA,$FA,$AF,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FE,$AA,$AA,$AA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$FA,$AA,$BF,$AA,$FF,$EA,$BE,$BF,$FF,$FF,$FA,$FA,$AB,$FE
            .byte $BF,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$FF,$FE,$AA,$AA,$FF,$AA,$FF,$EA
            .byte $BF,$FF,$FF,$FF,$FE,$FA,$AA,$AA,$AF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$AA,$AB,$FF,$EA,$FF,$FA,$AF,$FF,$FF,$FF,$FF,$FF,$AA,$AA
            .byte $AB,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$FF,$FF,$EA,$BF,$FF,$FA,$FF,$FA
            .byte $AA,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AB,$FF,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB,$FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FE,$FF,$FE,$AA,$AA,$FF,$FF,$FF,$FF,$FE,$AA
            .byte $AA,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FE
            .byte $AA,$AB,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$FE,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB,$FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$AF,$EA,$AB,$FF,$FF,$AA,$AF
            .byte $FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EF,$FF,$FF
            .byte $FA,$BF,$AA,$AA,$AF,$FE,$AA,$AA,$BF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FE,$AA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$EF,$FF,$FF,$FF,$FE,$AA,$AA,$BF,$FA,$AA,$AA
            .byte $FF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AB
            .byte $FF,$FF,$FF,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF
            .byte $FF,$EA,$AA,$AA,$BF,$AA,$AA,$AA,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FF,$EA,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF,$FE,$AA,$AA,$AA,$BA,$AA,$AA,$AA
            .byte $FF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$EA,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF
            .byte $FE,$BF,$FE,$AB,$FA,$FF,$FA,$AF,$FF,$FA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$FF,$FF,$FF,$FB,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF,$FB,$BF,$FF,$AB,$EE,$FF,$FE,$AF
            .byte $FF,$EA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF
            .byte $FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AF,$FF,$FF,$FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF
            .byte $FF,$EA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF
            .byte $FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF,$FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF
            .byte $FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF
            .byte $FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$EB,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF,$FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF
            .byte $FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF
            .byte $FF,$BA,$AF,$EF,$FE,$EA,$BF,$BF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$EA,$AB,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$AB,$FF,$FF,$FE,$AA,$AA,$AF,$FA,$AA,$AA,$BF
            .byte $FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$EA,$AF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF
            .byte $EA,$AA,$AA,$AF,$EA,$AA,$AA,$BF,$FE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$EA,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AB,$FF,$FE,$AA,$BE,$AA,$AE,$AA,$FA,$AA,$BF
            .byte $FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF
            .byte $FF,$BF,$EA,$BF,$FE,$FF,$AA,$FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$BF,$FF,$FF,$EA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF,$FF,$BF,$FE,$FF,$FE,$FF,$FB,$FF
            .byte $FF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF
            .byte $FF,$BF,$FF,$FF,$FE,$FF,$FF,$FF,$FF,$FA,$AA,$AA,$AA,$AA,$AE,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$FF,$EA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF,$FF,$AF,$FF,$FF,$FE,$BF,$FF,$FF
            .byte $FF,$EA,$AA,$AA,$AA,$AA,$AE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AF,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF
            .byte $FE,$AF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$AA,$AA,$AA,$BA,$AA,$AE,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$7F,$EA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AB,$FF,$FF,$FE,$AF,$FF,$FF,$FA,$BF,$FF,$FF
            .byte $FF,$AA,$AA,$AA,$BA,$EA,$BE,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AF,$FF,$7F,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AA,$FF,$FF
            .byte $FE,$AB,$FF,$FF,$FA,$AF,$FF,$FF,$FF,$EA,$AA,$AA,$BE,$EA,$BE,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$5F,$EA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AA,$FF,$FF,$FE,$AB,$FF,$FF,$FA,$AF,$FF,$FF
            .byte $FF,$EA,$AA,$AA,$FF,$EA,$BF,$BA,$AE,$AA,$AA,$AA,$AA,$AA,$AA,$AA
            .byte $AF,$FF,$5F,$EA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FE,$AA,$FF,$FE
            .byte $BE,$AB,$FF,$FF,$FA,$AF,$FF,$FF,$FF,$EA,$AA,$AA,$FF,$EA,$FF,$BF
            .byte $AF,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AF,$FF,$57,$EA,$BE,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FE,$AA,$BF,$EA,$BE,$AA,$FF,$AF,$FA,$AB,$FE,$BF
            .byte $FF,$EA,$AA,$AF,$FF,$FA,$FF,$BF,$EF,$AA,$AA,$EA,$AA,$AA,$AA,$AA
            .byte $AF,$FF,$57,$EA,$BE,$BF,$FF,$FF,$FF,$FF,$B3,$7F,$FA,$AA,$AA,$AA
            .byte $BE,$AA,$AA,$AB,$FA,$AA,$AA,$AF,$FF,$AA,$AA,$AF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$AA,$EA,$AA,$AA,$AA,$AB,$AF,$FF,$55,$EA,$BF,$BF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$EA,$AA,$AA,$AF,$EA,$AA,$AA,$FF,$AA,$AA,$AB
            .byte $FF,$AA,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$FA,$AA,$AA,$AA,$AA
            .byte $AF,$FF,$55,$EA,$BF,$AF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FE,$AA,$AA
            .byte $AB,$FA,$AA,$AA,$FF,$EA,$AA,$AB,$FF,$AA,$AA,$BF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$EA,$FE,$AA,$AA,$AA,$AA,$EF,$FF,$57,$EA,$BF,$AF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$EA,$AA,$AA,$FF,$AA,$AA,$BF,$FE,$AA,$AA
            .byte $FF,$AA,$AA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$AA,$AA,$AA
            .byte $EF,$FD,$57,$FA,$BF,$EB,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$EA
            .byte $FF,$FF,$FF,$AB,$FF,$FF,$FE,$AF,$FF,$AA,$AB,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$FF,$FD,$5F,$FA,$BF,$EB,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$AA,$AB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$AA
            .byte $FF,$FD,$7F,$FA,$BF,$FA,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AA,$AB,$AF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$FF,$F5,$7F,$FA,$BF,$FA,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FE,$AA,$BE,$AA,$FF,$FF,$FF,$FF,$FF,$AF,$FF,$FF,$EA,$AA,$AA,$AA
            .byte $FF,$F5,$FF,$FA,$BF,$FA,$BF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$BA,$AA,$BF,$FF,$FF,$FF
            .byte $FE,$AA,$BF,$FF,$EA,$AA,$AA,$AA,$BF,$D5,$FF,$FA,$BF,$FE,$BF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$AA,$AA,$AA,$AB,$FF,$FF,$FF,$EA,$AA,$AF,$FF,$FA,$AA,$AA,$AA
            .byte $BF,$D7,$FF,$FA,$BF,$FE,$AF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$AA,$FF,$FF,$FB
            .byte $AA,$AA,$AB,$FF,$FA,$AA,$AA,$AA,$BF,$5F,$FF,$FA,$BF,$FE,$AF,$FF
            .byte $FF,$FF,$B3,$7C,$0C,$0C,$0C,$0C,$0C,$0C,$F3,$3C,$C0,$C3,$FF,$0F
            .byte $33,$EA,$AA,$AA,$AA,$BF,$FF,$AA,$AA,$AA,$AA,$FF,$FA,$AA,$AA,$AA
            .byte $BF,$7F,$FF,$FA,$BF,$FF,$AB,$FF,$FF,$FF,$B3,$7C,$CC,$CC,$CC,$FC
            .byte $CC,$CC,$03,$00,$CF,$CC,$FF,$33,$33,$EA,$AA,$AA,$AA,$AB,$FE,$AA
            .byte $AA,$AA,$AA,$BF,$FA,$AA,$AA,$AA,$BD,$FF,$FF,$FA,$BF,$FF,$AB,$FF
            .byte $FF,$FF,$B3,$7C,$0C,$3C,$CC,$CC,$3C,$0C,$F3,$3C,$C3,$CC,$FF,$0F
            .byte $CF,$FA,$AB,$AA,$AA,$AB,$FE,$AA,$AA,$AA,$AA,$FF,$FA,$AA,$AA,$AA
            .byte $BF,$FF,$FF,$FA,$BF,$FF,$AA,$FF,$FF,$FF,$B3,$7C,$FC,$CC,$0C,$0C
            .byte $CC,$CC,$F3,$3C,$C0,$C3,$FF,$03,$CF,$EA,$AE,$BA,$EA,$AA,$FA,$AA
            .byte $AA,$AA,$AB,$FF,$FA,$AA,$AA,$AA,$BF,$FF,$FF,$FA,$BF,$FF,$AA,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$EA,$AA,$FB,$FE,$AA,$FA,$AA,$AA,$AF,$FF,$FF,$FA,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$EB,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$EA,$AF,$AA,$FA,$AA
            .byte $AA,$FF,$FF,$FF,$FA,$AA,$AA,$AA,$FF,$FF,$FF,$FA,$BF,$FF,$EB,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$EA,$AA,$AA,$AB,$AA,$BA,$AA,$AE,$AA,$BF,$FF,$FE,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$EB,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$AA,$AA,$AA,$AA,$BA,$AA
            .byte $AA,$AA,$AF,$FF,$FE,$AA,$AA,$AA,$FF,$FF,$FF,$FA,$BF,$FF,$EF,$FF
            .byte $FF,$FF,$B3,$7D,$5F,$55,$DF,$7F,$F7,$D5,$75,$5D,$5F,$57,$75,$5D
            .byte $5F,$EA,$AA,$AA,$AA,$AA,$FE,$AA,$AA,$AA,$AB,$FF,$FE,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$EF,$FF,$FF,$FF,$B3,$7D,$F7,$7D,$DF,$7F
            .byte $F7,$DF,$F7,$DD,$F7,$DF,$77,$FD,$F7,$FA,$AA,$AE,$AA,$AA,$FE,$AA
            .byte $AA,$AA,$AB,$FF,$FE,$AA,$AA,$AA,$FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7D,$F7,$7D,$D7,$7F,$F7,$DF,$F7,$DD,$F7,$DF,$77,$FD
            .byte $F7,$FA,$AA,$BE,$EA,$AB,$FF,$AA,$AE,$EA,$FF,$FF,$FA,$AA,$AA,$AA
            .byte $FF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7D,$5F,$7D,$DD,$7F
            .byte $F7,$D7,$F7,$DD,$5F,$DF,$75,$FD,$5F,$FB,$AE,$AE,$AA,$AB,$FF,$AA
            .byte $AE,$AA,$FF,$FF,$FA,$AA,$AA,$AA,$FF,$FF,$FA,$EA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7D,$F7,$7D,$DF,$7D,$F7,$DF,$F7,$DD,$F7,$DF,$77,$FD
            .byte $F7,$FB,$AE,$FF,$AA,$FB,$FF,$EA,$BE,$AB,$FF,$FF,$FA,$AA,$AA,$AB
            .byte $FF,$FF,$FE,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7D,$F7,$55,$DF,$7F
            .byte $5F,$DF,$F5,$5D,$F7,$DF,$75,$5D,$F7,$FF,$AE,$BF,$EB,$FF,$FF,$FE
            .byte $AF,$AB,$FF,$FF,$FA,$AA,$AA,$AB,$FF,$FF,$FE,$AA,$BF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$AE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$AA,$AA,$AB
            .byte $FF,$FF,$FF,$AA,$BF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AF,$FF,$FB,$FB,$FF,$FF
            .byte $FE,$AF,$FF,$FF,$EA,$AA,$EA,$AB,$FF,$FF,$FF,$EA,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$EA,$FF,$FF,$FB,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$BF,$EA,$AB
            .byte $FF,$FF,$FF,$EA,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EB,$FF,$FB,$EB,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$EB,$FF,$EA,$AB,$FF,$FF,$FF,$FB,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7C,$0C,$0C,$0C,$0C,$CC,$C0,$FF,$C0,$C0,$C0,$FF,$0F
            .byte $33,$FF,$EB,$BF,$FF,$EB,$FF,$FF,$FF,$FF,$FF,$FF,$EB,$FF,$EA,$AB
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7C,$FC,$CC,$CC,$CC
            .byte $CC,$CF,$FF,$CC,$CC,$F3,$FF,$33,$33,$FF,$FB,$BF,$FF,$EB,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$EB,$FF,$EA,$AB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7C,$CC,$3C,$0C,$0C,$0C,$CF,$FF,$C0,$C3,$F3,$FF,$0F
            .byte $CF,$FF,$FB,$BB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AB,$FF,$AA,$AB
            .byte $FF,$FF,$FF,$FE,$FF,$FF,$FF,$FF,$FF,$FF,$B3,$7C,$0C,$CC,$CC,$FC
            .byte $CC,$C0,$FF,$CC,$CC,$F3,$FF,$03,$CF,$FF,$FA,$BB,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$AB,$FE,$AA,$AB,$FF,$FF,$FF,$FE,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FE,$FF,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$EA,$AA,$AB
            .byte $FF,$FF,$FA,$BE,$AA,$FF,$BF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$EF,$FF,$EF,$FF,$FF
            .byte $FF,$FF,$FF,$FE,$AF,$EA,$AA,$AB,$FF,$FA,$AA,$FE,$AA,$FE,$BF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FE,$EF,$FF,$AF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$EA,$AA,$AB
            .byte $FF,$AA,$AA,$FE,$AB,$FA,$AF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$BF,$FF,$FF
            .byte $FF,$FF,$FF,$FE,$BF,$EA,$AA,$AB,$FF,$FA,$AB,$FE,$AB,$AA,$AF,$FF
            .byte $FF,$FF,$B3,$7D,$F7,$55,$DF,$F7,$DF,$DF,$F5,$7D,$57,$7F,$7F,$FF
            .byte $F0,$0F,$FE,$FF,$FE,$BF,$FF,$FE,$FF,$FF,$FF,$FE,$BF,$EA,$AA,$AB
            .byte $FF,$FA,$AB,$FE,$AA,$AA,$AB,$FF,$FF,$FF,$B3,$7D,$F7,$7F,$DF,$F7
            .byte $DF,$DF,$F7,$DD,$F7,$7F,$7F,$C0,$03,$CF,$FE,$BF,$FE,$BF,$FF,$FE
            .byte $FF,$FF,$FF,$FA,$BF,$EA,$AA,$AB,$FF,$FA,$AF,$EE,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7D,$DF,$7F,$DF,$F7,$D5,$5F,$F7,$DD,$F7,$55,$7F,$C3
            .byte $33,$CF,$FF,$BF,$FA,$FF,$FF,$FE,$BF,$FF,$FF,$FA,$FF,$EA,$AA,$AB
            .byte $FF,$FA,$AF,$AE,$AF,$FF,$FF,$FF,$FF,$FF,$B3,$7D,$7F,$5F,$DF,$F7
            .byte $FD,$FF,$F7,$DD,$57,$F7,$FF,$CC,$C3,$CF,$FF,$BF,$FA,$FF,$FF,$FF
            .byte $BF,$FF,$FF,$FA,$FF,$EA,$AA,$AB,$FF,$FA,$BE,$AA,$AF,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7D,$DF,$7F,$DF,$F7,$FD,$FF,$F7,$DD,$F7,$F7,$FF,$C3
            .byte $33,$CF,$FF,$BF,$FA,$FF,$FF,$FF,$BF,$FF,$FF,$FE,$FF,$EA,$AA,$AB
            .byte $FA,$AA,$AA,$FE,$AF,$FE,$FF,$FF,$FF,$FF,$B3,$7D,$F7,$55,$D5,$75
            .byte $5D,$FF,$F5,$7D,$F7,$F7,$FF,$CC,$C3,$CF,$FF,$BF,$FA,$FF,$FF,$FF
            .byte $AF,$FF,$FF,$FF,$FF,$EA,$AA,$AB,$FF,$BF,$FE,$FE,$AF,$FE,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$C0
            .byte $03,$C0,$0F,$BF,$EB,$BF,$FF,$FE,$AF,$FF,$FF,$FF,$FF,$EA,$AA,$AB
            .byte $FF,$DF,$FE,$BE,$AF,$FE,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$F0,$03,$C0,$03,$CF,$AF,$EA,$AF,$FE,$BF
            .byte $AF,$FF,$FF,$FF,$FF,$EA,$AA,$AB,$FF,$DF,$FA,$AE,$AA,$AA,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F3
            .byte $CF,$F3,$CF,$EF,$EA,$AB,$EA,$AB,$FB,$FF,$FF,$FF,$FF,$FA,$AA,$AB
            .byte $FF,$F7,$FA,$FE,$AF,$EA,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$EE,$FE,$AA,$AA,$AB
            .byte $FB,$FF,$FF,$FF,$FF,$FA,$AA,$AF,$FF,$F7,$FB,$FE,$BF,$EB,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3
            .byte $CF,$F3,$CF,$EE,$FE,$AA,$AA,$AB,$FF,$FF,$FF,$FF,$FF,$FA,$AA,$AF
            .byte $FF,$F7,$FB,$FE,$BF,$EB,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$F3
            .byte $CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$EA,$FE,$AA,$AA,$AF
            .byte $FF,$FF,$FF,$FF,$FF,$FA,$AA,$AF,$FF,$D7,$DF,$FE,$FF,$EB,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$F0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03
            .byte $C0,$03,$CF,$FA,$BA,$AA,$AA,$AF,$FF,$FF,$FF,$FF,$FF,$FA,$AA,$AF
            .byte $FF,$D5,$DF,$DE,$FF,$EB,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$F3,$C0
            .byte $03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$FB,$BA,$AA,$AA,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FA,$AA,$BF,$FF,$D5,$7F,$5F,$FF,$AB,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$F3,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3
            .byte $33,$C3,$33,$FA,$BA,$AA,$AB,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$AA,$BF
            .byte $FF,$D5,$75,$57,$FF,$AB,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$F3,$CC
            .byte $C3,$CC,$C3,$CC,$C3,$CC,$C3,$CC,$C3,$CC,$C3,$FA,$AA,$AE,$AF,$FF
            .byte $FF,$FF,$FF,$FF,$BF,$EA,$AA,$BF,$F5,$55,$55,$57,$FF,$AF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$F3,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3
            .byte $33,$C3,$33,$FB,$AA,$BF,$BF,$FF,$FF,$FF,$FF,$FF,$BF,$EA,$AA,$FF
            .byte $FF,$FF,$FF,$FF,$7F,$BF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$F3,$CC
            .byte $C3,$CC,$C3,$CC,$C3,$CC,$C3,$CC,$C3,$CC,$C3,$FE,$BA,$BB,$FB,$FF
            .byte $FF,$FF,$FF,$FE,$FF,$EE,$AA,$FF,$FF,$AF,$FB,$FF,$7F,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0
            .byte $03,$C0,$03,$FE,$AB,$EA,$EA,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$AB,$FF
            .byte $FF,$AA,$AB,$FF,$7F,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$C0,$03
            .byte $C0,$03,$C0,$03,$C0,$03,$C0,$0F,$F0,$03,$FF,$FF,$AA,$AA,$AA,$BF
            .byte $FF,$FF,$FF,$FA,$FF,$FF,$AB,$FF,$FF,$AF,$FA,$FF,$5F,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF
            .byte $FF,$F3,$FF,$FE,$AA,$AA,$AA,$AF,$FF,$FF,$FF,$FB,$FF,$FF,$AB,$FF
            .byte $FF,$AF,$FA,$FF,$5F,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$CF,$F3
            .byte $CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF,$FF,$F3,$FF,$FE,$BA,$AA,$AA,$AA
            .byte $EF,$FF,$FF,$EB,$FF,$FF,$AB,$FF,$FF,$AA,$AA,$FF,$5F,$FD,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF
            .byte $FF,$F3,$FF,$FE,$AA,$AA,$AA,$AA,$AF,$FF,$FF,$EB,$FF,$FF,$EB,$FF
            .byte $FF,$AB,$EA,$BF,$55,$55,$7F,$FF,$FF,$FF,$B3,$7F,$CF,$F3,$CF,$F3
            .byte $CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF,$FF,$F3,$FF,$FF,$BA,$AA,$AB,$AA
            .byte $AF,$FF,$FF,$BB,$FF,$FF,$FB,$FF,$FF,$AB,$EA,$BF,$5F,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$FF
            .byte $FF,$F3,$FF,$FF,$AA,$AE,$AF,$FF,$EF,$FF,$FF,$AF,$FF,$FF,$FA,$FF
            .byte $FF,$AB,$EA,$FF,$5F,$FD,$FF,$FF,$FF,$FF,$B3,$7F,$03,$C0,$03,$C0
            .byte $03,$C0,$03,$C0,$03,$C0,$03,$FF,$FF,$FF,$FF,$FF,$AA,$AF,$FF,$FF
            .byte $FF,$FF,$FE,$AF,$FF,$FF,$FE,$BF,$FF,$AA,$AA,$FF,$5F,$55,$7F,$FF
            .byte $FF,$FF,$B3,$7F,$F3,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$FF
            .byte $FF,$FF,$FF,$FF,$EE,$AB,$FF,$AF,$FF,$FF,$FE,$EF,$FF,$FF,$FE,$BF
            .byte $FF,$AB,$EA,$FD,$55,$FF,$FF,$FF,$FF,$FF,$B3,$7F,$F3,$CC,$C3,$CC
            .byte $C3,$CC,$C3,$CC,$C3,$CC,$C3,$FF,$FF,$FF,$FF,$FF,$EA,$AB,$FE,$AF
            .byte $FF,$FF,$FA,$AF,$FF,$FF,$FF,$AF,$FF,$AB,$EA,$FD,$5F,$FF,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$F3,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$FF
            .byte $FF,$FF,$FF,$FF,$EE,$EA,$AA,$AF,$FF,$FF,$FA,$BF,$FF,$FF,$FF,$EB
            .byte $FF,$AB,$EA,$FD,$5F,$FD,$FF,$FF,$FF,$FF,$B3,$7F,$F3,$CC,$C3,$CC
            .byte $C3,$CC,$C3,$CC,$C3,$CC,$C3,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AA,$AB
            .byte $FF,$FF,$EA,$BF,$FF,$FF,$FF,$EB,$FF,$AF,$EA,$FD,$5F,$F5,$7F,$FF
            .byte $FF,$FF,$B3,$7F,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$FF
            .byte $FF,$FF,$FF,$FF,$FA,$BA,$AA,$AB,$FF,$FF,$EA,$BF,$FF,$FF,$FF,$FA
            .byte $FE,$AF,$EB,$FD,$55,$5F,$FF,$FF,$FF,$FF,$B3,$7F,$C0,$03,$C0,$03
            .byte $C0,$03,$C0,$03,$C0,$03,$C0,$FF,$FF,$FF,$FF,$FF,$FB,$BA,$AA,$AB
            .byte $FF,$FF,$AA,$BF,$FF,$FF,$FF,$FE,$FE,$AF,$EB,$FD,$5F,$FD,$FF,$FF
            .byte $FF,$FF,$B3,$7F,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF
            .byte $FF,$FF,$FF,$FF,$FB,$AA,$AA,$AF,$FF,$FF,$AA,$BF,$FF,$FF,$FF,$FE
            .byte $BE,$AF,$EB,$FD,$5F,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$CF,$F3,$CF,$F3
            .byte $CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF,$FF,$FF,$FF,$FF,$FB,$AB,$FF,$AF
            .byte $FF,$FE,$AA,$BF,$FF,$FF,$FF,$FF,$AE,$AF,$EB,$FD,$5F,$FD,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FA,$AF,$FF,$FF,$FF,$FA,$AE,$FF,$FF,$FF,$FF,$FF
            .byte $AE,$AF,$EB,$FD,$5F,$F5,$7F,$FF,$FF,$FF,$FF,$FF,$CF,$F3,$CF,$F3
            .byte $CF,$F3,$CF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$FF,$FF
            .byte $FF,$EA,$AE,$FF,$FF,$FF,$FF,$FF,$EA,$AF,$EB,$FD,$55,$F5,$7F,$FF
            .byte $FF,$FF,$F0,$0F,$C0,$03,$C0,$03,$C0,$03,$C0,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FE,$EF,$FF,$FF,$FF,$EE,$AE,$FF,$FF,$FF,$FF,$FF
            .byte $FA,$BF,$EB,$FD,$55,$55,$7F,$FF,$FF,$C0,$03,$C0,$03,$C0,$03,$C0
            .byte $03,$C0,$03,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$FF,$FF
            .byte $FE,$EE,$AE,$FF,$FF,$FF,$FF,$FF,$FA,$BE,$AB,$FD,$55,$55,$7F,$FF
            .byte $FF,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FE,$BB,$FF,$FF,$FE,$EA,$EE,$FF,$FF,$FF,$FF,$FF
            .byte $FE,$BF,$AF,$FD,$55,$55,$5F,$FF,$FF,$CC,$C3,$CC,$C3,$CC,$C3,$CC
            .byte $C3,$CC,$C3,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$AA,$BF,$FF
            .byte $EE,$EA,$EA,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$EF,$FF,$55,$55,$5F,$FF
            .byte $FF,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$C3,$33,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$BB,$AA,$AB,$AA,$AA,$EB,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$AB,$FF,$FF,$55,$55,$5F,$FF,$FF,$CC,$C3,$CC,$C3,$CC,$C3,$CC
            .byte $C3,$CC,$C3,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$AA,$AE
            .byte $AA,$EA,$EB,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$FF,$FF,$55,$7F,$FF,$FF
            .byte $FF,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$C0,$03,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FA,$EA,$AA,$AA,$AA,$EB,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FA,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$C0,$03,$C0,$03,$C0,$03
            .byte $C0,$03,$C0,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AE,$AA
            .byte $AE,$AE,$AF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$F3,$CF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$AE,$AA,$AA,$AE,$AF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$AF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$CF,$F3,$CF,$F3,$CF,$F3
            .byte $CF,$F3,$CF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$AA
            .byte $AA,$AE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EB,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$CF,$F3,$CF,$F3,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FA,$EA,$AA,$AE,$BF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FA,$FF,$FF,$F7,$3B,$FF,$FF,$FF,$CF,$F3,$CF,$F3,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$BF,$AA,$EA
            .byte $AA,$EE,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$BF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$C0,$03,$C0,$03,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FE,$AA,$AA,$AB,$AA,$AA,$FA,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$AF,$FF,$F7,$3B,$FF,$FF,$FF,$C3,$C0,$03,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$AF,$AA,$BF,$AA
            .byte $AE,$EE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$F3,$C3,$33,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FE,$AA,$BF,$FF,$FF,$EA,$AE,$EA,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF,$FF,$FF,$F3,$CC,$C3,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$AF,$FF,$FF,$FF,$EA
            .byte $AA,$EB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$F3,$C3,$33,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$EE,$EB,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF,$FF,$FF,$F3,$CC,$C3,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA
            .byte $EE,$EB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$F3,$C0,$03,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$EA,$AF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF,$FF,$FF,$F0,$0F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE
            .byte $AE,$EE,$FF,$FF,$D5,$FF,$FF,$FF,$FF,$DF,$FF,$FF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA,$EF,$AE,$FF,$FF,$DF,$7F,$7F,$FF
            .byte $FF,$7D,$FD,$FF,$F5,$F7,$3B,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FA
            .byte $EE,$EF,$FF,$FF,$DF,$7F,$7F,$FF,$FF,$7D,$FD,$FF,$F5,$F7,$3B,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA,$EA,$AA,$BF,$FF,$DF,$75,$5D,$57
            .byte $55,$55,$7D,$55,$77,$77,$3B,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EA
            .byte $EE,$EA,$AF,$FF,$DF,$7D,$7F,$5F,$7D,$7D,$FD,$77,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EE,$EE,$BE,$AB,$FF,$DF,$55,$75,$55
            .byte $7D,$7D,$FD,$77,$FF,$F7,$3B,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EE
            .byte $EF,$FF,$FA,$FF,$DF,$5D,$77,$7D,$7D,$7D,$FD,$77,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EE,$AF,$FF,$FF,$FF,$D5,$D5,$55,$7D
            .byte $55,$7D,$7D,$75,$77,$F7,$3B,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$EF
            .byte $BF,$FF,$FF,$FF,$FF,$FF,$FF,$7D,$FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FE,$EE,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$55
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF,$FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$EE
            .byte $BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF
            .byte $FF,$FF,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FE,$EE,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$FF,$FF,$F5,$55,$55,$55,$55,$55,$55
            .byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$5F,$EE
            .byte $B5,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$7F
            .byte $FF,$F7,$B3,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$3B,$7F,$FF,$F7,$B3,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EE
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$3B,$7F
            .byte $FF,$F7,$B0,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$EC,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$04,$3B,$7F,$FF,$F7,$BF,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$EF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$FB,$7F
            .byte $FF,$F7,$BF,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$FB,$7F,$FF,$F7,$AA,$6A,$AA,$AA,$AA,$AA
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$EE
            .byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A6,$AB,$7F
            .byte $FF,$F7,$FF,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F7,$FF,$7F,$FF,$F7,$FF,$7F,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F7,$FF,$7F
            .byte $FF,$F5,$55,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$F5,$55,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC
            .byte $3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC,$3F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC
            .byte $0F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$F0,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
            .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
            .byte $70,$8E,$00,$76,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            
            org $02E0
            
            .word L8000 	;Start at address $8000
