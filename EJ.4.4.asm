; Encabezado
    LIST p=16F887
    #include "p16f887.inc"
    
; Palabras de configuración
  __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _MCLRE_ON & _LVP_OFF
    
; Creación de alias para los registros a utilizar
  
    



;=============================================================================0

	ORG	0X00
	GOTO	INICIO
	ORG	0X04
	;GOTO	ISR
 
	ORG	0X05
INICIO
	nop
	nop
	nop
end
	
	; Vamos a suponer que la entrada de la señal es por PUERTO B  

	
	
 