; Encabezado
    LIST p=16F887
    #include "p16f887.inc"
    
; Palabras de configuración
  __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _MCLRE_ON & _LVP_OFF
    
; Creación de alias para lo sregistros a utilizar
    
CONT	equ	0x20 
W_TEMP	equ	0x21
STATUS_TEMP	EQU	0x22
      
	ORG	0x00
	GOTO	INICIO
	ORG	0x04
	GOTO	LEDs
	ORG	0x05

INICIO

	banksel	    ANSEL
	clrf	    ANSEL
	banksel	    ANSELH
	clrf	    ANSELH
	banksel	    TRISA
	movlw	    00h
	movwf	    TRISA
	banksel	    TRISB
	movlw	    01h
	movwf	    TRISB
	
	banksel     PORTB
	clrf	    PORTB
	banksel     OPTION_REG 
	movlw	    b'10000000'
	movwf	    OPTION_REG
	BANKSEL	    INTCON
	movlw	    b'10010000'
	
ciclo	nop ;espera que se presente una interrupción
	nop
	goto ciclo


	
	
	
LEDs
	;guardamos contexto
        movwf	    W_TEMP
	swapf       STATUS_TEMP,W
	movwf	    STATUS_TEMP
	
	btfsc	    PORTB,0
	goto	    sale
	
	btfss	    INTCON,1
	goto	    sale
	incf	    CONT,1
	btfsc	    CONT,5
	clrf	    CONT
	movf	    CONT,0
	movwf	    PORTA
sale	bcf	    INTCON,1
	
	swapf	    STATUS_TEMP,W
	movf	    STATUS
	swapf	    W_TEMP,F
	swapf	    W_TEMP,W
	RETFIE
	END
