; Encabezado
    LIST p=16F887
    #include "p16f887.inc"
    
; Palabras de configuración
  __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _MCLRE_ON & _LVP_OFF
    
; Creación de alias para los registros a utilizar
    
 
	ORG	0x00
	GOTO	INICIO
	ORG	0x05

INICIO
	banksel	    ANSEL
	clrf	    ANSEL
	banksel	    ANSELH
	clrf	    ANSELH
	banksel	    TRISA
	movlw	    B'11111111'
	movwf	    TRISA
	movlw	    B'11110011'
	movwf	    TRISB
	banksel	    PORTB
	clrf	    PORTB
	banksel	    PORTA
LED	
	btfss	    PORTA,4
	bsf	    PORTB,3
	btfsc	    PORTA,4
	BcF	    PORTB,3
	btfss	    PORTB,0
	bsf	    PORTB,2
	btfsc	    PORTA,0
	bcf	    PORTB,2
	
	GOTO	    LED
	

	END


