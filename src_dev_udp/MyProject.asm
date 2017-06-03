
_interrupt:

;MyProject.c,38 :: 		void interrupt() {
;MyProject.c,39 :: 		if (PIR1.TMR1IF) {
	BTFSS       PIR1+0, 0 
	GOTO        L_interrupt0
;MyProject.c,40 :: 		PIE1.TMR1IE = 0;       // Запрещение прерывания переполнения
	BCF         PIE1+0, 0 
;MyProject.c,41 :: 		PIR1.TMR1IF = 0;     // Сброс флага переполнения TMR1
	BCF         PIR1+0, 0 
;MyProject.c,42 :: 		TMR1H = 0x80;          // Начальные значения таймера TMR1
	MOVLW       128
	MOVWF       TMR1H+0 
;MyProject.c,43 :: 		Test_time = ~Test_time;
	BTG         RD2_bit+0, BitPos(RD2_bit+0) 
;MyProject.c,44 :: 		asm CLRWDT;
	CLRWDT
;MyProject.c,46 :: 		if (timer > 0) timer = timer--;
	MOVF        _timer+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt1
	DECF        _timer+0, 1 
L_interrupt1:
;MyProject.c,47 :: 		if (timer_minut>0)timer_minut=timer_minut--;
	MOVF        _timer_minut+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
	DECF        _timer_minut+0, 1 
L_interrupt2:
;MyProject.c,48 :: 		if (Relay1_time == 0 && Relay2_time == 0 && Relay3_time == 0 && Relay4_time == 0 && Relay5_time == 0 && Relay6_time == 0) {Test_relay=0;} else {Test_relay=1;}
	MOVLW       0
	XORWF       _Relay1_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt377
	MOVLW       0
	XORWF       _Relay1_time+0, 0 
L__interrupt377:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _Relay2_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt378
	MOVLW       0
	XORWF       _Relay2_time+0, 0 
L__interrupt378:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _Relay3_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt379
	MOVLW       0
	XORWF       _Relay3_time+0, 0 
L__interrupt379:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _Relay4_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt380
	MOVLW       0
	XORWF       _Relay4_time+0, 0 
L__interrupt380:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _Relay5_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt381
	MOVLW       0
	XORWF       _Relay5_time+0, 0 
L__interrupt381:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       0
	XORWF       _Relay6_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt382
	MOVLW       0
	XORWF       _Relay6_time+0, 0 
L__interrupt382:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt5
L__interrupt374:
	BCF         RD1_bit+0, BitPos(RD1_bit+0) 
	GOTO        L_interrupt6
L_interrupt5:
	BSF         RD1_bit+0, BitPos(RD1_bit+0) 
L_interrupt6:
;MyProject.c,50 :: 		if (Relay1_time == -1) {Relay1_Port=1;} else {
	MOVLW       255
	XORWF       _Relay1_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt383
	MOVLW       255
	XORWF       _Relay1_time+0, 0 
L__interrupt383:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt7
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_interrupt8
L_interrupt7:
;MyProject.c,51 :: 		if (Relay1_time == 0) {Relay1_Port=0;} else {Relay1_Port=1;Relay1_time--;}}
	MOVLW       0
	XORWF       _Relay1_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt384
	MOVLW       0
	XORWF       _Relay1_time+0, 0 
L__interrupt384:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt9
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_interrupt10
L_interrupt9:
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
	MOVLW       1
	SUBWF       _Relay1_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay1_time+1, 1 
L_interrupt10:
L_interrupt8:
;MyProject.c,52 :: 		if (Relay2_time == -1) {Relay2_Port=1;} else {
	MOVLW       255
	XORWF       _Relay2_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt385
	MOVLW       255
	XORWF       _Relay2_time+0, 0 
L__interrupt385:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt11
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_interrupt12
L_interrupt11:
;MyProject.c,53 :: 		if (Relay2_time == 0) {Relay2_Port=0;} else {Relay2_Port=1;Relay2_time--;}}
	MOVLW       0
	XORWF       _Relay2_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt386
	MOVLW       0
	XORWF       _Relay2_time+0, 0 
L__interrupt386:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt13
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_interrupt14
L_interrupt13:
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	MOVLW       1
	SUBWF       _Relay2_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay2_time+1, 1 
L_interrupt14:
L_interrupt12:
;MyProject.c,54 :: 		if (Relay3_time == -1) {Relay3_Port=1;} else {
	MOVLW       255
	XORWF       _Relay3_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt387
	MOVLW       255
	XORWF       _Relay3_time+0, 0 
L__interrupt387:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt15
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_interrupt16
L_interrupt15:
;MyProject.c,55 :: 		if (Relay3_time == 0) {Relay3_Port=0;} else {Relay3_Port=1;Relay3_time--;}}
	MOVLW       0
	XORWF       _Relay3_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt388
	MOVLW       0
	XORWF       _Relay3_time+0, 0 
L__interrupt388:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt17
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_interrupt18
L_interrupt17:
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
	MOVLW       1
	SUBWF       _Relay3_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay3_time+1, 1 
L_interrupt18:
L_interrupt16:
;MyProject.c,56 :: 		if (Relay4_time == -1) {Relay4_Port=1;} else {
	MOVLW       255
	XORWF       _Relay4_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt389
	MOVLW       255
	XORWF       _Relay4_time+0, 0 
L__interrupt389:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt19
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_interrupt20
L_interrupt19:
;MyProject.c,57 :: 		if (Relay4_time == 0) {Relay4_Port=0;} else {Relay4_Port=1;Relay4_time--;}}
	MOVLW       0
	XORWF       _Relay4_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt390
	MOVLW       0
	XORWF       _Relay4_time+0, 0 
L__interrupt390:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt21
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_interrupt22
L_interrupt21:
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
	MOVLW       1
	SUBWF       _Relay4_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay4_time+1, 1 
L_interrupt22:
L_interrupt20:
;MyProject.c,58 :: 		if (Relay5_time == -1) {Relay5_Port=1;} else {
	MOVLW       255
	XORWF       _Relay5_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt391
	MOVLW       255
	XORWF       _Relay5_time+0, 0 
L__interrupt391:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt23
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_interrupt24
L_interrupt23:
;MyProject.c,59 :: 		if (Relay5_time == 0) {Relay5_Port=0;} else {Relay5_Port=1;Relay5_time--;}}
	MOVLW       0
	XORWF       _Relay5_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt392
	MOVLW       0
	XORWF       _Relay5_time+0, 0 
L__interrupt392:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt25
	BCF         RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_interrupt26
L_interrupt25:
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
	MOVLW       1
	SUBWF       _Relay5_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay5_time+1, 1 
L_interrupt26:
L_interrupt24:
;MyProject.c,60 :: 		if (Relay6_time == -1) {Relay6_Port=1;} else {
	MOVLW       255
	XORWF       _Relay6_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt393
	MOVLW       255
	XORWF       _Relay6_time+0, 0 
L__interrupt393:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt27
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_interrupt28
L_interrupt27:
;MyProject.c,61 :: 		if (Relay6_time == 0) {Relay6_Port=0;} else {Relay6_Port=1;Relay6_time--;}}
	MOVLW       0
	XORWF       _Relay6_time+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt394
	MOVLW       0
	XORWF       _Relay6_time+0, 0 
L__interrupt394:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt29
	BCF         RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_interrupt30
L_interrupt29:
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
	MOVLW       1
	SUBWF       _Relay6_time+0, 1 
	MOVLW       0
	SUBWFB      _Relay6_time+1, 1 
L_interrupt30:
L_interrupt28:
;MyProject.c,63 :: 		PIE1.TMR1IE = 1;       // Разрешение прерывания переполнения
	BSF         PIE1+0, 0 
;MyProject.c,64 :: 		}
L_interrupt0:
;MyProject.c,65 :: 		}
L_end_interrupt:
L__interrupt376:
	RETFIE      1
; end of _interrupt

_ReadEEPROM:

;MyProject.c,66 :: 		void ReadEEPROM(void) {
;MyProject.c,68 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,69 :: 		Delay_ms(1);
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_ReadEEPROM31:
	DECFSZ      R13, 1, 1
	BRA         L_ReadEEPROM31
	DECFSZ      R12, 1, 1
	BRA         L_ReadEEPROM31
	NOP
;MyProject.c,70 :: 		SPI1_Write(0x03);                      // Send read mode via SPI
	MOVLW       3
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,71 :: 		SPI1_Write(0x00);                      // Send high byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,72 :: 		SPI1_Write(0x00);                      // Send low byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,73 :: 		for (i = 0; i < 4; i++) {myIPAddr[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM32:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM396
	MOVLW       4
	SUBWF       _i+0, 0 
L__ReadEEPROM396:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM33
	MOVLW       _myIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_myIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM32
L_ReadEEPROM33:
;MyProject.c,74 :: 		for (i = 0; i < 4; i++) {gwIPAddr[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM35:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM397
	MOVLW       4
	SUBWF       _i+0, 0 
L__ReadEEPROM397:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM36
	MOVLW       _gwIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_gwIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM35
L_ReadEEPROM36:
;MyProject.c,75 :: 		for (i = 0; i < 4; i++) {IPMask[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM38:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM398
	MOVLW       4
	SUBWF       _i+0, 0 
L__ReadEEPROM398:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM39
	MOVLW       _ipMask+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_ipMask+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM38
L_ReadEEPROM39:
;MyProject.c,76 :: 		for (i = 0; i < 4; i++) {dnsIPAddr[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM41:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM399
	MOVLW       4
	SUBWF       _i+0, 0 
L__ReadEEPROM399:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM42
	MOVLW       _dnsIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_dnsIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM41
L_ReadEEPROM42:
;MyProject.c,77 :: 		for (i = 0; i < 64; i++) {dev_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM44:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM400
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM400:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM45
	MOVLW       _dev_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_dev_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM44
L_ReadEEPROM45:
;MyProject.c,78 :: 		for (i = 0; i < 64; i++) {relay1_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM47:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM401
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM401:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM48
	MOVLW       _relay1_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay1_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM47
L_ReadEEPROM48:
;MyProject.c,79 :: 		for (i = 0; i < 64; i++) {relay2_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM50:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM402
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM402:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM51
	MOVLW       _relay2_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay2_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM50
L_ReadEEPROM51:
;MyProject.c,80 :: 		for (i = 0; i < 64; i++) {relay3_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM53:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM403
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM403:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM54
	MOVLW       _relay3_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay3_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM53
L_ReadEEPROM54:
;MyProject.c,81 :: 		for (i = 0; i < 64; i++) {relay4_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM56:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM404
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM404:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM57
	MOVLW       _relay4_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay4_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM56
L_ReadEEPROM57:
;MyProject.c,82 :: 		for (i = 0; i < 64; i++) {relay5_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM59:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM405
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM405:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM60
	MOVLW       _relay5_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay5_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM59
L_ReadEEPROM60:
;MyProject.c,83 :: 		for (i = 0; i < 64; i++) {relay6_name[i]=SPI1_READ(buffer);}
	CLRF        _i+0 
	CLRF        _i+1 
L_ReadEEPROM62:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadEEPROM406
	MOVLW       64
	SUBWF       _i+0, 0 
L__ReadEEPROM406:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadEEPROM63
	MOVLW       _relay6_name+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__ReadEEPROM+0 
	MOVLW       hi_addr(_relay6_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__ReadEEPROM+1 
	MOVF        _buffer+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__ReadEEPROM+0, FSR1
	MOVFF       FLOC__ReadEEPROM+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_ReadEEPROM62
L_ReadEEPROM63:
;MyProject.c,84 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,85 :: 		Delay_ms(1);
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_ReadEEPROM65:
	DECFSZ      R13, 1, 1
	BRA         L_ReadEEPROM65
	DECFSZ      R12, 1, 1
	BRA         L_ReadEEPROM65
	NOP
;MyProject.c,86 :: 		}
L_end_ReadEEPROM:
	RETURN      0
; end of _ReadEEPROM

_WriteEEPROM:

;MyProject.c,87 :: 		void WriteEEPROM(void){
;MyProject.c,88 :: 		buffer=0;
	CLRF        _buffer+0 
	CLRF        _buffer+1 
;MyProject.c,89 :: 		for (i = 0; i < 4; i++) {toWrite[buffer]=myIPAddr[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM66:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM408
	MOVLW       4
	SUBWF       _i+0, 0 
L__WriteEEPROM408:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM67
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _myIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_myIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM66
L_WriteEEPROM67:
;MyProject.c,90 :: 		for (i = 0; i < 4; i++) {toWrite[buffer]=gwIPAddr[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM69:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM409
	MOVLW       4
	SUBWF       _i+0, 0 
L__WriteEEPROM409:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM70
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _gwIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_gwIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM69
L_WriteEEPROM70:
;MyProject.c,91 :: 		for (i = 0; i < 4; i++) {toWrite[buffer]=IPMask[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM72:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM410
	MOVLW       4
	SUBWF       _i+0, 0 
L__WriteEEPROM410:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM73
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _ipMask+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ipMask+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM72
L_WriteEEPROM73:
;MyProject.c,92 :: 		for (i = 0; i < 4; i++) {toWrite[buffer]=dnsIPAddr[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM75:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM411
	MOVLW       4
	SUBWF       _i+0, 0 
L__WriteEEPROM411:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM76
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _dnsIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_dnsIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM75
L_WriteEEPROM76:
;MyProject.c,93 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=dev_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM78:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM412
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM412:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM79
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _dev_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_dev_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM78
L_WriteEEPROM79:
;MyProject.c,94 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay1_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM81:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM413
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM413:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM82
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay1_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay1_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM81
L_WriteEEPROM82:
;MyProject.c,95 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay2_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM84:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM414
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM414:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM85
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay2_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay2_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM84
L_WriteEEPROM85:
;MyProject.c,96 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay3_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM87:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM415
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM415:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM88
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay3_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay3_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM87
L_WriteEEPROM88:
;MyProject.c,97 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay4_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM90:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM416
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM416:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM91
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay4_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay4_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM90
L_WriteEEPROM91:
;MyProject.c,98 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay5_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM93:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM417
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM417:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM94
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay5_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay5_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM93
L_WriteEEPROM94:
;MyProject.c,99 :: 		for (i = 0; i < 64; i++) {toWrite[buffer]=relay6_name[i];buffer++;}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM96:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM418
	MOVLW       64
	SUBWF       _i+0, 0 
L__WriteEEPROM418:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM97
	MOVLW       _toWrite+0
	ADDWF       _buffer+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _buffer+1, 0 
	MOVWF       FSR1H 
	MOVLW       _relay6_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_relay6_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      _buffer+0, 1 
	INCF        _buffer+1, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM96
L_WriteEEPROM97:
;MyProject.c,100 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,101 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM99:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM99
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM99
	NOP
;MyProject.c,102 :: 		SPI1_Write(0x06);                      // Send WREN mode via SPI
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,103 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM100:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM100
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM100
	NOP
;MyProject.c,104 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,105 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM101:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM101
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM101
	NOP
;MyProject.c,107 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,108 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM102:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM102
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM102
	NOP
;MyProject.c,109 :: 		SPI1_Write(0x01);                      // Send STATUS mode via SPI
	MOVLW       1
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,110 :: 		SPI1_Write(0x00);                      // Send BP0,BP1 mode via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,111 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM103:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM103
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM103
	NOP
;MyProject.c,112 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,113 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM104:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM104
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM104
	NOP
;MyProject.c,115 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,116 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM105:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM105
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM105
	NOP
;MyProject.c,117 :: 		SPI1_Write(0x06);                      // Send WREN mode via SPI
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,118 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM106:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM106
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM106
	NOP
;MyProject.c,119 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,120 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM107:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM107
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM107
	NOP
;MyProject.c,121 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,122 :: 		Delay_ms(5);
	MOVLW       41
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_WriteEEPROM108:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM108
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM108
	NOP
;MyProject.c,123 :: 		SPI1_Write(0x02);                      // Send WRITE mode via SPI
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,124 :: 		SPI1_Write(0x00);                      // Send high byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,125 :: 		SPI1_Write(0x00);                      // Send low byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,126 :: 		for (i = 0; i < 128; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
	CLRF        _i+0 
	CLRF        _i+1 
L_WriteEEPROM109:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM419
	MOVLW       128
	SUBWF       _i+0, 0 
L__WriteEEPROM419:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM110
	MOVLW       _toWrite+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_WriteEEPROM112:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM112
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM112
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM109
L_WriteEEPROM110:
;MyProject.c,127 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,128 :: 		Delay_ms(10);
	MOVLW       82
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_WriteEEPROM113:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM113
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM113
	NOP
	NOP
;MyProject.c,130 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,131 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM114:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM114
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM114
	NOP
;MyProject.c,132 :: 		SPI1_Write(0x06);                      // Send WREN mode via SPI
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,133 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM115:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM115
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM115
	NOP
;MyProject.c,134 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,135 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM116:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM116
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM116
	NOP
;MyProject.c,136 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,137 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM117:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM117
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM117
	NOP
;MyProject.c,138 :: 		SPI1_Write(0x02);                      // Send WRITE mode via SPI
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,139 :: 		SPI1_Write(0x00);                      // Send high byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,140 :: 		SPI1_Write(0x80);                      // Send low byte via SPI
	MOVLW       128
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,141 :: 		for (i = 128; i < 256; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
	MOVLW       128
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_WriteEEPROM118:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM420
	MOVLW       0
	SUBWF       _i+0, 0 
L__WriteEEPROM420:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM119
	MOVLW       _toWrite+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_WriteEEPROM121:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM121
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM121
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM118
L_WriteEEPROM119:
;MyProject.c,142 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,143 :: 		Delay_ms(10);
	MOVLW       82
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_WriteEEPROM122:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM122
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM122
	NOP
	NOP
;MyProject.c,146 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,147 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM123:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM123
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM123
	NOP
;MyProject.c,148 :: 		SPI1_Write(0x06);                      // Send WREN mode via SPI
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,149 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM124:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM124
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM124
	NOP
;MyProject.c,150 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,151 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM125:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM125
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM125
	NOP
;MyProject.c,152 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,153 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM126:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM126
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM126
	NOP
;MyProject.c,154 :: 		SPI1_Write(0x02);                      // Send WRITE mode via SPI
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,155 :: 		SPI1_Write(0x01);                      // Send high byte via SPI
	MOVLW       1
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,156 :: 		SPI1_Write(0x00);                      // Send low byte via SPI
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,157 :: 		for (i = 256; i < 384; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_WriteEEPROM127:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM421
	MOVLW       128
	SUBWF       _i+0, 0 
L__WriteEEPROM421:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM128
	MOVLW       _toWrite+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_WriteEEPROM130:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM130
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM130
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM127
L_WriteEEPROM128:
;MyProject.c,158 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,159 :: 		Delay_ms(10);
	MOVLW       82
	MOVWF       R12, 0
	MOVLW       41
	MOVWF       R13, 0
L_WriteEEPROM131:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM131
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM131
	NOP
	NOP
;MyProject.c,162 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,163 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM132:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM132
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM132
	NOP
;MyProject.c,164 :: 		SPI1_Write(0x06);                      // Send WREN mode via SPI
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,165 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM133:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM133
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM133
	NOP
;MyProject.c,166 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,167 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM134:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM134
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM134
	NOP
;MyProject.c,168 :: 		Chip_Select = 0;                       // Select EEPROM chip
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,169 :: 		Delay_ms(3);
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       88
	MOVWF       R13, 0
L_WriteEEPROM135:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM135
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM135
	NOP
;MyProject.c,170 :: 		SPI1_Write(0x02);                      // Send WRITE mode via SPI
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,171 :: 		SPI1_Write(0x01);                      // Send high byte via SPI
	MOVLW       1
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,172 :: 		SPI1_Write(0x80);                      // Send low byte via SPI
	MOVLW       128
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;MyProject.c,173 :: 		for (i = 384; i < 464; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
	MOVLW       128
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_WriteEEPROM136:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WriteEEPROM422
	MOVLW       208
	SUBWF       _i+0, 0 
L__WriteEEPROM422:
	BTFSC       STATUS+0, 0 
	GOTO        L_WriteEEPROM137
	MOVLW       _toWrite+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_toWrite+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
	MOVLW       9
	MOVWF       R12, 0
	MOVLW       28
	MOVWF       R13, 0
L_WriteEEPROM139:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM139
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM139
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_WriteEEPROM136
L_WriteEEPROM137:
;MyProject.c,174 :: 		Chip_Select = 1;                       // DESelect EEPROM chip
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,175 :: 		Delay_ms(20);
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_WriteEEPROM140:
	DECFSZ      R13, 1, 1
	BRA         L_WriteEEPROM140
	DECFSZ      R12, 1, 1
	BRA         L_WriteEEPROM140
;MyProject.c,177 :: 		}
L_end_WriteEEPROM:
	RETURN      0
; end of _WriteEEPROM

_Ethernet_UserTCP:

;MyProject.c,178 :: 		unsigned int Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort, unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags)
;MyProject.c,180 :: 		unsigned int    len = 0 ;                   // my reply length
	CLRF        Ethernet_UserTCP_len_L0+0 
	CLRF        Ethernet_UserTCP_len_L0+1 
;MyProject.c,181 :: 		return(len) ;                               // return to the library with the number of bytes to transmit
	MOVF        Ethernet_UserTCP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Ethernet_UserTCP_len_L0+1, 0 
	MOVWF       R1 
;MyProject.c,182 :: 		}
L_end_Ethernet_UserTCP:
	RETURN      0
; end of _Ethernet_UserTCP

_Ethernet_UserUDP:

;MyProject.c,184 :: 		unsigned int Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort, unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags)
;MyProject.c,186 :: 		unsigned int len=0;                    // my reply length
	CLRF        Ethernet_UserUDP_len_L0+0 
	CLRF        Ethernet_UserUDP_len_L0+1 
;MyProject.c,188 :: 		if(destPort != 50050) {return(0);}
	MOVF        FARG_Ethernet_UserUDP_destPort+1, 0 
	XORLW       195
	BTFSS       STATUS+0, 2 
	GOTO        L__Ethernet_UserUDP425
	MOVLW       130
	XORWF       FARG_Ethernet_UserUDP_destPort+0, 0 
L__Ethernet_UserUDP425:
	BTFSC       STATUS+0, 2 
	GOTO        L_Ethernet_UserUDP141
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_Ethernet_UserUDP
L_Ethernet_UserUDP141:
;MyProject.c,189 :: 		pack_len=reqLength;
	MOVF        FARG_Ethernet_UserUDP_reqLength+0, 0 
	MOVWF       _pack_len+0 
	MOVF        FARG_Ethernet_UserUDP_reqLength+1, 0 
	MOVWF       _pack_len+1 
;MyProject.c,190 :: 		for (i=0;i<256;i++){getRequest[i] ='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_Ethernet_UserUDP142:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Ethernet_UserUDP426
	MOVLW       0
	SUBWF       _i+0, 0 
L__Ethernet_UserUDP426:
	BTFSC       STATUS+0, 0 
	GOTO        L_Ethernet_UserUDP143
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_Ethernet_UserUDP142
L_Ethernet_UserUDP143:
;MyProject.c,191 :: 		obtaine_packet=1;
	MOVLW       1
	MOVWF       _obtaine_packet+0 
;MyProject.c,192 :: 		server_ip[0]=remoteHost[0];
	MOVFF       FARG_Ethernet_UserUDP_remoteHost+0, FSR0
	MOVFF       FARG_Ethernet_UserUDP_remoteHost+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       _server_ip+0 
;MyProject.c,193 :: 		server_ip[1]=remoteHost[1];
	MOVLW       1
	ADDWF       FARG_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _server_ip+1 
;MyProject.c,194 :: 		server_ip[2]=remoteHost[2];
	MOVLW       2
	ADDWF       FARG_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _server_ip+2 
;MyProject.c,195 :: 		server_ip[3]=remoteHost[3];
	MOVLW       3
	ADDWF       FARG_Ethernet_UserUDP_remoteHost+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Ethernet_UserUDP_remoteHost+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _server_ip+3 
;MyProject.c,196 :: 		for(i = 0; i<256; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Ethernet_UserUDP145:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Ethernet_UserUDP427
	MOVLW       0
	SUBWF       _i+0, 0 
L__Ethernet_UserUDP427:
	BTFSC       STATUS+0, 0 
	GOTO        L_Ethernet_UserUDP146
;MyProject.c,198 :: 		getRequest[i] = Ethernet_getByte() ;
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__Ethernet_UserUDP+0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__Ethernet_UserUDP+1 
	CALL        _Ethernet_getByte+0, 0
	MOVFF       FLOC__Ethernet_UserUDP+0, FSR1
	MOVFF       FLOC__Ethernet_UserUDP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MyProject.c,196 :: 		for(i = 0; i<256; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,199 :: 		}
	GOTO        L_Ethernet_UserUDP145
L_Ethernet_UserUDP146:
;MyProject.c,200 :: 		return(len) ;
	MOVF        Ethernet_UserUDP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Ethernet_UserUDP_len_L0+1, 0 
	MOVWF       R1 
;MyProject.c,201 :: 		}
L_end_Ethernet_UserUDP:
	RETURN      0
; end of _Ethernet_UserUDP

_Update_device:

;MyProject.c,205 :: 		void Update_device(void){
;MyProject.c,206 :: 		for (i = 0; i < 500; i++) {dyna[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_Update_device148:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Update_device429
	MOVLW       244
	SUBWF       _i+0, 0 
L__Update_device429:
	BTFSC       STATUS+0, 0 
	GOTO        L_Update_device149
	MOVLW       _dyna+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_dyna+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_Update_device148
L_Update_device149:
;MyProject.c,207 :: 		res = strcat(dyna, "key_id=dinka&table=Devices&module_mac=");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	MOVF        R0, 0 
	MOVWF       _res+0 
;MyProject.c,208 :: 		for (i=0; i<6; i++){bytetoHex(myMacAddr[i],hhex); strcat(dyna, hhex);}
	CLRF        _i+0 
	CLRF        _i+1 
L_Update_device151:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Update_device430
	MOVLW       6
	SUBWF       _i+0, 0 
L__Update_device430:
	BTFSC       STATUS+0, 0 
	GOTO        L_Update_device152
	MOVLW       _myMacAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_myMacAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToHex_input+0 
	MOVLW       _hhex+0
	MOVWF       FARG_ByteToHex_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_ByteToHex_output+1 
	CALL        _ByteToHex+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_Update_device151
L_Update_device152:
;MyProject.c,209 :: 		strcat(dyna, "&hw_ver=01&module_info=Relay control (6 relay)&module_name=");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,210 :: 		strcat(dyna, dev_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _dev_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_dev_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,211 :: 		strcat(dyna, "&module_ip=");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,212 :: 		for (i=0; i<4; i++){bytetostr(myIPAddr[i],hhex); strcat(dyna, hhex);strcat(dyna, ".");}
	CLRF        _i+0 
	CLRF        _i+1 
L_Update_device154:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Update_device431
	MOVLW       4
	SUBWF       _i+0, 0 
L__Update_device431:
	BTFSC       STATUS+0, 0 
	GOTO        L_Update_device155
	MOVLW       _myIpAddr+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_myIpAddr+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _hhex+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_Update_device154
L_Update_device155:
;MyProject.c,213 :: 		strcat(dyna, "&module_func=Relay");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,214 :: 		Ethernet_sendUDP(server_ip, 50050, 50051, dyna, strlen(dyna));
	MOVLW       _dyna+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Ethernet_sendUDP_pktLen+0 
	MOVF        R1, 0 
	MOVWF       FARG_Ethernet_sendUDP_pktLen+1 
	MOVLW       _server_ip+0
	MOVWF       FARG_Ethernet_sendUDP_destIP+0 
	MOVLW       hi_addr(_server_ip+0)
	MOVWF       FARG_Ethernet_sendUDP_destIP+1 
	MOVLW       130
	MOVWF       FARG_Ethernet_sendUDP_sourcePort+0 
	MOVLW       195
	MOVWF       FARG_Ethernet_sendUDP_sourcePort+1 
	MOVLW       131
	MOVWF       FARG_Ethernet_sendUDP_destPort+0 
	MOVLW       195
	MOVWF       FARG_Ethernet_sendUDP_destPort+1 
	MOVLW       _dyna+0
	MOVWF       FARG_Ethernet_sendUDP_pkt+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Ethernet_sendUDP_pkt+1 
	CALL        _Ethernet_sendUDP+0, 0
;MyProject.c,215 :: 		}
L_end_Update_device:
	RETURN      0
; end of _Update_device

_Update_relay:

;MyProject.c,216 :: 		void Update_relay(void){
;MyProject.c,218 :: 		for (i = 0; i < 500; i++) {dyna[i]=0;}
	CLRF        _i+0 
	CLRF        _i+1 
L_Update_relay157:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Update_relay433
	MOVLW       244
	SUBWF       _i+0, 0 
L__Update_relay433:
	BTFSC       STATUS+0, 0 
	GOTO        L_Update_relay158
	MOVLW       _dyna+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_dyna+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_Update_relay157
L_Update_relay158:
;MyProject.c,219 :: 		strcat(dyna, "key_id=dinka&table=Relay&relay_state=R1+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,220 :: 		if (Relay1_port==1){strcat(dyna, "1;R2+");} else {strcat(dyna, "0;R2+");}
	BTFSS       RE1_bit+0, BitPos(RE1_bit+0) 
	GOTO        L_Update_relay160
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr7_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr7_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay161
L_Update_relay160:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr8_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr8_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay161:
;MyProject.c,221 :: 		if (Relay2_port==1){strcat(dyna, "1;R3+");} else {strcat(dyna, "0;R3+");}
	BTFSS       RE0_bit+0, BitPos(RE0_bit+0) 
	GOTO        L_Update_relay162
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr9_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr9_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay163
L_Update_relay162:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr10_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr10_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay163:
;MyProject.c,222 :: 		if (Relay3_port==1){strcat(dyna, "1;R4+");} else {strcat(dyna, "0;R4+");}
	BTFSS       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_Update_relay164
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr11_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr11_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay165
L_Update_relay164:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr12_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr12_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay165:
;MyProject.c,223 :: 		if (Relay4_port==1){strcat(dyna, "1;R5+");} else {strcat(dyna, "0;R5+");}
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_Update_relay166
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr13_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr13_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay167
L_Update_relay166:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr14_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr14_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay167:
;MyProject.c,224 :: 		if (Relay5_port==1){strcat(dyna, "1;R6+");} else {strcat(dyna, "0;R6+");}
	BTFSS       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_Update_relay168
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr15_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr15_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay169
L_Update_relay168:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr16_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr16_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay169:
;MyProject.c,225 :: 		if (Relay6_port==1){strcat(dyna, "1&");} else {strcat(dyna, "0&");}
	BTFSS       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_Update_relay170
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr17_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr17_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
	GOTO        L_Update_relay171
L_Update_relay170:
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr18_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr18_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
L_Update_relay171:
;MyProject.c,226 :: 		strcat(dyna, "relay_time=R1+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr19_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr19_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,227 :: 		inttostr(Relay1_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay1_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay1_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,228 :: 		strcat(dyna, ";R2+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr20_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr20_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,229 :: 		inttostr(Relay2_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay2_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay2_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,230 :: 		strcat(dyna, ";R3+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr21_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr21_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,231 :: 		inttostr(Relay3_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay3_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay3_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,232 :: 		strcat(dyna, ";R4+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr22_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr22_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,233 :: 		inttostr(Relay4_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay4_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay4_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,234 :: 		strcat(dyna, ";R5+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr23_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr23_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,235 :: 		inttostr(Relay5_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay5_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay5_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,236 :: 		strcat(dyna, ";R6+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr24_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr24_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,237 :: 		inttostr(Relay6_time,hhex); strcat(dyna, hhex);
	MOVF        _Relay6_time+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Relay6_time+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hhex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _hhex+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,238 :: 		strcat(dyna, "&relay_name=R1+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr25_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr25_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,239 :: 		strcat(dyna, relay1_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay1_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay1_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,240 :: 		strcat(dyna, ";R2+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr26_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr26_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,241 :: 		strcat(dyna, relay2_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay2_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay2_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,242 :: 		strcat(dyna, ";R3+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr27_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr27_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,243 :: 		strcat(dyna, relay3_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay3_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay3_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,244 :: 		strcat(dyna, ";R4+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr28_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr28_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,245 :: 		strcat(dyna, relay4_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay4_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay4_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,246 :: 		strcat(dyna, ";R5+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr29_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr29_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,247 :: 		strcat(dyna, relay5_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay5_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay5_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,248 :: 		strcat(dyna, ";R6+");
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr30_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr30_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,249 :: 		strcat(dyna, relay6_name);
	MOVLW       _dyna+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       _relay6_name+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(_relay6_name+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,250 :: 		Ethernet_sendUDP(server_ip, 50050, 50051, dyna, strlen(dyna));
	MOVLW       _dyna+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Ethernet_sendUDP_pktLen+0 
	MOVF        R1, 0 
	MOVWF       FARG_Ethernet_sendUDP_pktLen+1 
	MOVLW       _server_ip+0
	MOVWF       FARG_Ethernet_sendUDP_destIP+0 
	MOVLW       hi_addr(_server_ip+0)
	MOVWF       FARG_Ethernet_sendUDP_destIP+1 
	MOVLW       130
	MOVWF       FARG_Ethernet_sendUDP_sourcePort+0 
	MOVLW       195
	MOVWF       FARG_Ethernet_sendUDP_sourcePort+1 
	MOVLW       131
	MOVWF       FARG_Ethernet_sendUDP_destPort+0 
	MOVLW       195
	MOVWF       FARG_Ethernet_sendUDP_destPort+1 
	MOVLW       _dyna+0
	MOVWF       FARG_Ethernet_sendUDP_pkt+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Ethernet_sendUDP_pkt+1 
	CALL        _Ethernet_sendUDP+0, 0
;MyProject.c,254 :: 		}
L_end_Update_relay:
	RETURN      0
; end of _Update_relay

_main:

;MyProject.c,255 :: 		void main() {
;MyProject.c,256 :: 		timer=0;
	CLRF        _timer+0 
;MyProject.c,257 :: 		timer_minut=0;
	CLRF        _timer_minut+0 
;MyProject.c,258 :: 		PORTB=0;
	CLRF        PORTB+0 
;MyProject.c,259 :: 		PORTD=0;
	CLRF        PORTD+0 
;MyProject.c,260 :: 		PORTF=0;
	CLRF        PORTF+0 
;MyProject.c,261 :: 		LATB=0;
	CLRF        LATB+0 
;MyProject.c,262 :: 		LATF=0;
	CLRF        LATF+0 
;MyProject.c,263 :: 		TRISA=0;
	CLRF        TRISA+0 
;MyProject.c,264 :: 		TRISB=0;
	CLRF        TRISB+0 
;MyProject.c,265 :: 		TRISC=0;
	CLRF        TRISC+0 
;MyProject.c,266 :: 		TRISD=0;
	CLRF        TRISD+0 
;MyProject.c,267 :: 		TRISF=0x04;
	MOVLW       4
	MOVWF       TRISF+0 
;MyProject.c,268 :: 		TRISE=0;
	CLRF        TRISE+0 
;MyProject.c,270 :: 		CMCON=0x07;
	MOVLW       7
	MOVWF       CMCON+0 
;MyProject.c,271 :: 		ADCON1=0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;MyProject.c,272 :: 		Relay1_Port=0;
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
;MyProject.c,273 :: 		Relay2_Port=0;
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
;MyProject.c,274 :: 		Relay3_Port=0;
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
;MyProject.c,275 :: 		Relay4_Port=0;
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
;MyProject.c,276 :: 		Relay5_Port=0;
	BCF         RB2_bit+0, BitPos(RB2_bit+0) 
;MyProject.c,277 :: 		Relay6_Port=0;
	BCF         RB3_bit+0, BitPos(RB3_bit+0) 
;MyProject.c,278 :: 		Relay1_time=0;
	CLRF        _Relay1_time+0 
	CLRF        _Relay1_time+1 
;MyProject.c,279 :: 		Relay2_time=0;
	CLRF        _Relay2_time+0 
	CLRF        _Relay2_time+1 
;MyProject.c,280 :: 		Relay3_time=0;
	CLRF        _Relay3_time+0 
	CLRF        _Relay3_time+1 
;MyProject.c,281 :: 		Relay4_time=0;
	CLRF        _Relay4_time+0 
	CLRF        _Relay4_time+1 
;MyProject.c,282 :: 		Relay5_time=0;
	CLRF        _Relay5_time+0 
	CLRF        _Relay5_time+1 
;MyProject.c,283 :: 		Relay6_time=0;
	CLRF        _Relay6_time+0 
	CLRF        _Relay6_time+1 
;MyProject.c,284 :: 		obtaine_packet=0;
	CLRF        _obtaine_packet+0 
;MyProject.c,285 :: 		INTCON = 0;            // Обнуление регистра управления прерываниями
	CLRF        INTCON+0 
;MyProject.c,286 :: 		PIE1 = 0;              //
	CLRF        PIE1+0 
;MyProject.c,287 :: 		PIE2 = 0;
	CLRF        PIE2+0 
;MyProject.c,289 :: 		PIR1.TMR1IF = 0;       // Сброс TMR1IF flag bit
	BCF         PIR1+0, 0 
;MyProject.c,290 :: 		TMR1H = 0x80;          // Начальные значения таймера TMR1
	MOVLW       128
	MOVWF       TMR1H+0 
;MyProject.c,291 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;MyProject.c,292 :: 		T1CON.RD16 = 0;        // Обработка как 8 битного регистра
	BCF         T1CON+0, 7 
;MyProject.c,293 :: 		T1CON.T1RUN = 1;       // Источник - осциллятор
	BSF         T1CON+0, 6 
;MyProject.c,294 :: 		T1CON.TMR1CS = 1;      // Timer1 подключение к внешнему кварцу
	BSF         T1CON+0, 1 
;MyProject.c,295 :: 		T1CON.T1OSCEN = 1;     // Подключение цепи резонатора
	BSF         T1CON+0, 3 
;MyProject.c,296 :: 		T1CON.T1CKPS1 = T1CON.T1CKPS0 = 0; // Подключение предделителя 1:1
	BCF         T1CON+0, 4 
	BTFSC       T1CON+0, 4 
	GOTO        L__main435
	BCF         T1CON+0, 5 
	GOTO        L__main436
L__main435:
	BSF         T1CON+0, 5 
L__main436:
;MyProject.c,297 :: 		PIE1.TMR1IE = 1;       // Разрешение прерывания переполнения
	BSF         PIE1+0, 0 
;MyProject.c,298 :: 		INTCON = 0xC0;         // Enable interrupt (bits GIE and PEIE)
	MOVLW       192
	MOVWF       INTCON+0 
;MyProject.c,299 :: 		T1CON.TMR1ON = 1;      // Включение таймера TMR1 "on"
	BSF         T1CON+0, 0 
;MyProject.c,301 :: 		Chip_Select_Direction = 0;             // Set CS# pin as Output
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;MyProject.c,302 :: 		Chip_Select = 1;                       // Deselect EEPROM
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;MyProject.c,304 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV16, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;MyProject.c,306 :: 		if (Conf_pin==0){
	BTFSC       RF2_bit+0, BitPos(RF2_bit+0) 
	GOTO        L_main172
;MyProject.c,307 :: 		for (i = 0; i < 64; i++) {dev_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main173:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main437
	MOVLW       64
	SUBWF       _i+0, 0 
L__main437:
	BTFSC       STATUS+0, 0 
	GOTO        L_main174
	MOVLW       _dev_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_dev_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main173
L_main174:
;MyProject.c,308 :: 		for (i = 0; i < 64; i++) {relay1_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main176:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main438
	MOVLW       64
	SUBWF       _i+0, 0 
L__main438:
	BTFSC       STATUS+0, 0 
	GOTO        L_main177
	MOVLW       _relay1_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay1_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main176
L_main177:
;MyProject.c,309 :: 		for (i = 0; i < 64; i++) {relay2_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main179:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main439
	MOVLW       64
	SUBWF       _i+0, 0 
L__main439:
	BTFSC       STATUS+0, 0 
	GOTO        L_main180
	MOVLW       _relay2_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay2_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main179
L_main180:
;MyProject.c,310 :: 		for (i = 0; i < 64; i++) {relay3_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main182:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main440
	MOVLW       64
	SUBWF       _i+0, 0 
L__main440:
	BTFSC       STATUS+0, 0 
	GOTO        L_main183
	MOVLW       _relay3_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay3_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main182
L_main183:
;MyProject.c,311 :: 		for (i = 0; i < 64; i++) {relay4_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main185:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main441
	MOVLW       64
	SUBWF       _i+0, 0 
L__main441:
	BTFSC       STATUS+0, 0 
	GOTO        L_main186
	MOVLW       _relay4_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay4_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main185
L_main186:
;MyProject.c,312 :: 		for (i = 0; i < 64; i++) {relay5_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main188:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main442
	MOVLW       64
	SUBWF       _i+0, 0 
L__main442:
	BTFSC       STATUS+0, 0 
	GOTO        L_main189
	MOVLW       _relay5_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay5_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main188
L_main189:
;MyProject.c,313 :: 		for (i = 0; i < 64; i++) {relay6_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main191:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main443
	MOVLW       64
	SUBWF       _i+0, 0 
L__main443:
	BTFSC       STATUS+0, 0 
	GOTO        L_main192
	MOVLW       _relay6_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay6_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main191
L_main192:
;MyProject.c,314 :: 		strcat(dev_name,"Device name");
	MOVLW       _dev_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_dev_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr31_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr31_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,315 :: 		strcat(relay1_name,"Relay1 name");
	MOVLW       _relay1_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay1_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr32_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr32_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,316 :: 		strcat(relay2_name,"Relay2 name");
	MOVLW       _relay2_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay2_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr33_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr33_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,317 :: 		strcat(relay3_name,"Relay3 name");
	MOVLW       _relay3_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay3_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr34_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr34_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,318 :: 		strcat(relay4_name,"Relay4 name");
	MOVLW       _relay4_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay4_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr35_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr35_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,319 :: 		strcat(relay5_name,"Relay5 name");
	MOVLW       _relay5_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay5_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr36_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr36_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,320 :: 		strcat(relay6_name,"Relay6 name");
	MOVLW       _relay6_name+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_relay6_name+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr37_MyProject+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr37_MyProject+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;MyProject.c,321 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,322 :: 		}
L_main172:
;MyProject.c,323 :: 		ReadEEPROM();
	CALL        _ReadEEPROM+0, 0
;MyProject.c,324 :: 		Ethernet_Init(myMacAddr, myIpAddr, Ethernet_FULLDUPLEX) ;
	MOVLW       _myMacAddr+0
	MOVWF       FARG_Ethernet_Init_mac+0 
	MOVLW       hi_addr(_myMacAddr+0)
	MOVWF       FARG_Ethernet_Init_mac+1 
	MOVLW       _myIpAddr+0
	MOVWF       FARG_Ethernet_Init_ip+0 
	MOVLW       hi_addr(_myIpAddr+0)
	MOVWF       FARG_Ethernet_Init_ip+1 
	MOVLW       1
	MOVWF       FARG_Ethernet_Init_fullDuplex+0 
	CALL        _Ethernet_Init+0, 0
;MyProject.c,325 :: 		Ethernet_initDHCP(5); // get network configuration from DHCP server, wait 5 sec for the response
	MOVLW       5
	MOVWF       FARG_Ethernet_initDHCP_tmax+0 
	CALL        _Ethernet_initDHCP+0, 0
;MyProject.c,326 :: 		Ethernet_Enable(_Ethernet_BROADCAST); // enable Broadcast traffic
	MOVLW       1
	MOVWF       FARG_Ethernet_Enable_enFlt+0 
	CALL        _Ethernet_Enable+0, 0
;MyProject.c,327 :: 		while(1)                        // do forever
L_main194:
;MyProject.c,329 :: 		if (obtaine_packet==1) {obtaine_packet=0;
	MOVF        _obtaine_packet+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main196
	CLRF        _obtaine_packet+0 
;MyProject.c,331 :: 		res_find = strstr (getRequest,"update_all_tables");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr38_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr38_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,332 :: 		if (res_find > 0){Update_device();
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main444
	MOVF        R0, 0 
	SUBLW       0
L__main444:
	BTFSC       STATUS+0, 0 
	GOTO        L_main197
	CALL        _Update_device+0, 0
;MyProject.c,333 :: 		Update_relay();
	CALL        _Update_relay+0, 0
;MyProject.c,334 :: 		}
L_main197:
;MyProject.c,336 :: 		res_find = strstr (getRequest,"update_Relay");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr39_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr39_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,337 :: 		if (res_find > 0){Update_relay();
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main445
	MOVF        R0, 0 
	SUBLW       0
L__main445:
	BTFSC       STATUS+0, 0 
	GOTO        L_main198
	CALL        _Update_relay+0, 0
;MyProject.c,338 :: 		}
L_main198:
;MyProject.c,340 :: 		res_find = strstr (getRequest,"Relay+R1+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr40_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr40_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,341 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main446
	MOVF        R0, 0 
	SUBLW       0
L__main446:
	BTFSC       STATUS+0, 0 
	GOTO        L_main199
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr41_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr41_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,342 :: 		if (res_find > 0) {Relay1_port=1;Relay1_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main447
	MOVF        R0, 0 
	SUBLW       0
L__main447:
	BTFSC       STATUS+0, 0 
	GOTO        L_main200
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
	MOVLW       255
	MOVWF       _Relay1_time+0 
	MOVLW       255
	MOVWF       _Relay1_time+1 
	GOTO        L_main201
L_main200:
;MyProject.c,344 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main202:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main448
	MOVLW       0
	SUBWF       _i+0, 0 
L__main448:
	BTFSC       STATUS+0, 0 
	GOTO        L_main203
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main205
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main205:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main202
L_main203:
;MyProject.c,345 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,346 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main206:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main449
	MOVLW       7
	SUBWF       _i+0, 0 
L__main449:
	BTFSC       STATUS+0, 0 
	GOTO        L_main207
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main206
L_main207:
;MyProject.c,347 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main209:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main450
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main450:
	BTFSC       STATUS+0, 0 
	GOTO        L_main210
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main209
L_main210:
;MyProject.c,348 :: 		Relay1_time=atoi(hhex); if (Relay1_time>0) {Relay1_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay1_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay1_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main451
	MOVF        R0, 0 
	SUBLW       0
L__main451:
	BTFSC       STATUS+0, 0 
	GOTO        L_main212
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
L_main212:
;MyProject.c,350 :: 		}
L_main201:
;MyProject.c,352 :: 		}
L_main199:
;MyProject.c,353 :: 		res_find = strstr (getRequest,"Relay+R1+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr42_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr42_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,354 :: 		if (res_find > 0){Relay1_Port=0;Relay1_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main452
	MOVF        R0, 0 
	SUBLW       0
L__main452:
	BTFSC       STATUS+0, 0 
	GOTO        L_main213
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
	CLRF        _Relay1_time+0 
	CLRF        _Relay1_time+1 
;MyProject.c,355 :: 		}
L_main213:
;MyProject.c,356 :: 		res_find = strstr (getRequest,"Relay+R2+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr43_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr43_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,357 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main453
	MOVF        R0, 0 
	SUBLW       0
L__main453:
	BTFSC       STATUS+0, 0 
	GOTO        L_main214
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr44_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr44_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,358 :: 		if (res_find > 0) {Relay2_port=1;Relay2_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main454
	MOVF        R0, 0 
	SUBLW       0
L__main454:
	BTFSC       STATUS+0, 0 
	GOTO        L_main215
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
	MOVLW       255
	MOVWF       _Relay2_time+0 
	MOVLW       255
	MOVWF       _Relay2_time+1 
	GOTO        L_main216
L_main215:
;MyProject.c,360 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main217:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main455
	MOVLW       0
	SUBWF       _i+0, 0 
L__main455:
	BTFSC       STATUS+0, 0 
	GOTO        L_main218
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main220
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main220:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main217
L_main218:
;MyProject.c,361 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,362 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main221:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main456
	MOVLW       7
	SUBWF       _i+0, 0 
L__main456:
	BTFSC       STATUS+0, 0 
	GOTO        L_main222
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main221
L_main222:
;MyProject.c,363 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main224:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main457
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main457:
	BTFSC       STATUS+0, 0 
	GOTO        L_main225
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main224
L_main225:
;MyProject.c,364 :: 		Relay2_time=atoi(hhex);if (Relay2_time>0) {Relay2_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay2_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay2_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main458
	MOVF        R0, 0 
	SUBLW       0
L__main458:
	BTFSC       STATUS+0, 0 
	GOTO        L_main227
	BSF         RE0_bit+0, BitPos(RE0_bit+0) 
L_main227:
;MyProject.c,365 :: 		}
L_main216:
;MyProject.c,367 :: 		}
L_main214:
;MyProject.c,368 :: 		res_find = strstr (getRequest,"Relay+R2+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr45_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr45_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,369 :: 		if (res_find > 0){Relay2_Port=0;Relay2_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main459
	MOVF        R0, 0 
	SUBLW       0
L__main459:
	BTFSC       STATUS+0, 0 
	GOTO        L_main228
	BCF         RE0_bit+0, BitPos(RE0_bit+0) 
	CLRF        _Relay2_time+0 
	CLRF        _Relay2_time+1 
;MyProject.c,370 :: 		}
L_main228:
;MyProject.c,372 :: 		res_find = strstr (getRequest,"Relay+R3+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr46_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr46_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,373 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main460
	MOVF        R0, 0 
	SUBLW       0
L__main460:
	BTFSC       STATUS+0, 0 
	GOTO        L_main229
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr47_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr47_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,374 :: 		if (res_find > 0) {Relay3_port=1;Relay3_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main461
	MOVF        R0, 0 
	SUBLW       0
L__main461:
	BTFSC       STATUS+0, 0 
	GOTO        L_main230
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
	MOVLW       255
	MOVWF       _Relay3_time+0 
	MOVLW       255
	MOVWF       _Relay3_time+1 
	GOTO        L_main231
L_main230:
;MyProject.c,376 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main232:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main462
	MOVLW       0
	SUBWF       _i+0, 0 
L__main462:
	BTFSC       STATUS+0, 0 
	GOTO        L_main233
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main235
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main235:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main232
L_main233:
;MyProject.c,377 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,378 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main236:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main463
	MOVLW       7
	SUBWF       _i+0, 0 
L__main463:
	BTFSC       STATUS+0, 0 
	GOTO        L_main237
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main236
L_main237:
;MyProject.c,379 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main239:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main464
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main464:
	BTFSC       STATUS+0, 0 
	GOTO        L_main240
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main239
L_main240:
;MyProject.c,380 :: 		Relay3_time=atoi(hhex);if (Relay3_time>0) {Relay3_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay3_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay3_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main465
	MOVF        R0, 0 
	SUBLW       0
L__main465:
	BTFSC       STATUS+0, 0 
	GOTO        L_main242
	BSF         RB0_bit+0, BitPos(RB0_bit+0) 
L_main242:
;MyProject.c,381 :: 		}
L_main231:
;MyProject.c,383 :: 		}
L_main229:
;MyProject.c,384 :: 		res_find = strstr (getRequest,"Relay+R3+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr48_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr48_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,385 :: 		if (res_find > 0){Relay3_Port=0;Relay3_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main466
	MOVF        R0, 0 
	SUBLW       0
L__main466:
	BTFSC       STATUS+0, 0 
	GOTO        L_main243
	BCF         RB0_bit+0, BitPos(RB0_bit+0) 
	CLRF        _Relay3_time+0 
	CLRF        _Relay3_time+1 
;MyProject.c,386 :: 		}
L_main243:
;MyProject.c,387 :: 		res_find = strstr (getRequest,"Relay+R4+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr49_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr49_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,388 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main467
	MOVF        R0, 0 
	SUBLW       0
L__main467:
	BTFSC       STATUS+0, 0 
	GOTO        L_main244
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr50_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr50_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,389 :: 		if (res_find > 0) {Relay4_port=1;Relay4_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main468
	MOVF        R0, 0 
	SUBLW       0
L__main468:
	BTFSC       STATUS+0, 0 
	GOTO        L_main245
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
	MOVLW       255
	MOVWF       _Relay4_time+0 
	MOVLW       255
	MOVWF       _Relay4_time+1 
	GOTO        L_main246
L_main245:
;MyProject.c,391 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main247:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main469
	MOVLW       0
	SUBWF       _i+0, 0 
L__main469:
	BTFSC       STATUS+0, 0 
	GOTO        L_main248
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main250
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main250:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main247
L_main248:
;MyProject.c,392 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,393 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main251:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main470
	MOVLW       7
	SUBWF       _i+0, 0 
L__main470:
	BTFSC       STATUS+0, 0 
	GOTO        L_main252
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main251
L_main252:
;MyProject.c,394 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main254:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main471
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main471:
	BTFSC       STATUS+0, 0 
	GOTO        L_main255
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main254
L_main255:
;MyProject.c,395 :: 		Relay4_time=atoi(hhex);if (Relay4_time>0) {Relay4_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay4_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay4_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main472
	MOVF        R0, 0 
	SUBLW       0
L__main472:
	BTFSC       STATUS+0, 0 
	GOTO        L_main257
	BSF         RB1_bit+0, BitPos(RB1_bit+0) 
L_main257:
;MyProject.c,396 :: 		}
L_main246:
;MyProject.c,398 :: 		}
L_main244:
;MyProject.c,399 :: 		res_find = strstr (getRequest,"Relay+R4+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr51_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr51_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,400 :: 		if (res_find > 0){Relay4_Port=0;Relay4_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main473
	MOVF        R0, 0 
	SUBLW       0
L__main473:
	BTFSC       STATUS+0, 0 
	GOTO        L_main258
	BCF         RB1_bit+0, BitPos(RB1_bit+0) 
	CLRF        _Relay4_time+0 
	CLRF        _Relay4_time+1 
;MyProject.c,401 :: 		}
L_main258:
;MyProject.c,403 :: 		res_find = strstr (getRequest,"Relay+R5+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr52_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr52_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,404 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main474
	MOVF        R0, 0 
	SUBLW       0
L__main474:
	BTFSC       STATUS+0, 0 
	GOTO        L_main259
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr53_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr53_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,405 :: 		if (res_find > 0) {Relay5_port=1;Relay5_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main475
	MOVF        R0, 0 
	SUBLW       0
L__main475:
	BTFSC       STATUS+0, 0 
	GOTO        L_main260
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
	MOVLW       255
	MOVWF       _Relay5_time+0 
	MOVLW       255
	MOVWF       _Relay5_time+1 
	GOTO        L_main261
L_main260:
;MyProject.c,407 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main262:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main476
	MOVLW       0
	SUBWF       _i+0, 0 
L__main476:
	BTFSC       STATUS+0, 0 
	GOTO        L_main263
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main265
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main265:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main262
L_main263:
;MyProject.c,408 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,409 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main266:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main477
	MOVLW       7
	SUBWF       _i+0, 0 
L__main477:
	BTFSC       STATUS+0, 0 
	GOTO        L_main267
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main266
L_main267:
;MyProject.c,410 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main269:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main478
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main478:
	BTFSC       STATUS+0, 0 
	GOTO        L_main270
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main269
L_main270:
;MyProject.c,411 :: 		Relay5_time=atoi(hhex); if (Relay5_time>0) {Relay5_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay5_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay5_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main479
	MOVF        R0, 0 
	SUBLW       0
L__main479:
	BTFSC       STATUS+0, 0 
	GOTO        L_main272
	BSF         RB2_bit+0, BitPos(RB2_bit+0) 
L_main272:
;MyProject.c,412 :: 		}
L_main261:
;MyProject.c,414 :: 		}
L_main259:
;MyProject.c,415 :: 		res_find = strstr (getRequest,"Relay+R5+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr54_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr54_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,416 :: 		if (res_find > 0){Relay5_Port=0;Relay5_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main480
	MOVF        R0, 0 
	SUBLW       0
L__main480:
	BTFSC       STATUS+0, 0 
	GOTO        L_main273
	BCF         RB2_bit+0, BitPos(RB2_bit+0) 
	CLRF        _Relay5_time+0 
	CLRF        _Relay5_time+1 
;MyProject.c,417 :: 		}
L_main273:
;MyProject.c,418 :: 		res_find = strstr (getRequest,"Relay+R6+ON");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr55_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr55_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,419 :: 		if (res_find > 0){res_find = strstr (getRequest,"time=-1");
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main481
	MOVF        R0, 0 
	SUBLW       0
L__main481:
	BTFSC       STATUS+0, 0 
	GOTO        L_main274
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr56_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr56_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,420 :: 		if (res_find > 0) {Relay6_port=1;Relay6_time=-1;}
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main482
	MOVF        R0, 0 
	SUBLW       0
L__main482:
	BTFSC       STATUS+0, 0 
	GOTO        L_main275
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
	MOVLW       255
	MOVWF       _Relay6_time+0 
	MOVLW       255
	MOVWF       _Relay6_time+1 
	GOTO        L_main276
L_main275:
;MyProject.c,422 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main277:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main483
	MOVLW       0
	SUBWF       _i+0, 0 
L__main483:
	BTFSC       STATUS+0, 0 
	GOTO        L_main278
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main280
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main280:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main277
L_main278:
;MyProject.c,423 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,424 :: 		for (i = 0; i < 7; i++) {hhex[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main281:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main484
	MOVLW       7
	SUBWF       _i+0, 0 
L__main484:
	BTFSC       STATUS+0, 0 
	GOTO        L_main282
	MOVLW       _hhex+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main281
L_main282:
;MyProject.c,425 :: 		for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main284:
	MOVLW       4
	ADDWF       _res_find+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main485
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main485:
	BTFSC       STATUS+0, 0 
	GOTO        L_main285
	MOVLW       _hhex+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main284
L_main285:
;MyProject.c,426 :: 		Relay6_time=atoi(hhex);if (Relay6_time>0) {Relay6_port=1;}
	MOVLW       _hhex+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_hhex+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _Relay6_time+0 
	MOVF        R1, 0 
	MOVWF       _Relay6_time+1 
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main486
	MOVF        R0, 0 
	SUBLW       0
L__main486:
	BTFSC       STATUS+0, 0 
	GOTO        L_main287
	BSF         RB3_bit+0, BitPos(RB3_bit+0) 
L_main287:
;MyProject.c,427 :: 		}
L_main276:
;MyProject.c,429 :: 		}
L_main274:
;MyProject.c,430 :: 		res_find = strstr (getRequest,"Relay+R6+OFF");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr57_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr57_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,431 :: 		if (res_find > 0){Relay6_Port=0;Relay6_time=0;
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main487
	MOVF        R0, 0 
	SUBLW       0
L__main487:
	BTFSC       STATUS+0, 0 
	GOTO        L_main288
	BCF         RB3_bit+0, BitPos(RB3_bit+0) 
	CLRF        _Relay6_time+0 
	CLRF        _Relay6_time+1 
;MyProject.c,432 :: 		}
L_main288:
;MyProject.c,433 :: 		res_find = strstr (getRequest,"new+module_name=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr58_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr58_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,434 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main488
	MOVF        R0, 0 
	SUBLW       0
L__main488:
	BTFSC       STATUS+0, 0 
	GOTO        L_main289
;MyProject.c,435 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main290:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main489
	MOVLW       0
	SUBWF       _i+0, 0 
L__main489:
	BTFSC       STATUS+0, 0 
	GOTO        L_main291
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main293
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main293:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main290
L_main291:
;MyProject.c,436 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,437 :: 		for (i = 0; i < 63; i++) {dev_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main294:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main490
	MOVLW       63
	SUBWF       _i+0, 0 
L__main490:
	BTFSC       STATUS+0, 0 
	GOTO        L_main295
	MOVLW       _dev_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_dev_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main294
L_main295:
;MyProject.c,438 :: 		for (i=res_find+1; i<pack_len;i++) {dev_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main297:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main491
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main491:
	BTFSC       STATUS+0, 0 
	GOTO        L_main298
	MOVLW       _dev_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_dev_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,439 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main300
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main300:
;MyProject.c,438 :: 		for (i=res_find+1; i<pack_len;i++) {dev_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,440 :: 		}
	GOTO        L_main297
L_main298:
;MyProject.c,441 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,442 :: 		}
L_main289:
;MyProject.c,443 :: 		res_find = strstr (getRequest,"new+R1=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr59_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr59_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,444 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main492
	MOVF        R0, 0 
	SUBLW       0
L__main492:
	BTFSC       STATUS+0, 0 
	GOTO        L_main301
;MyProject.c,445 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main302:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main493
	MOVLW       0
	SUBWF       _i+0, 0 
L__main493:
	BTFSC       STATUS+0, 0 
	GOTO        L_main303
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main305
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main305:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main302
L_main303:
;MyProject.c,446 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,447 :: 		for (i = 0; i < 63; i++) {relay1_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main306:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main494
	MOVLW       63
	SUBWF       _i+0, 0 
L__main494:
	BTFSC       STATUS+0, 0 
	GOTO        L_main307
	MOVLW       _relay1_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay1_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main306
L_main307:
;MyProject.c,448 :: 		for (i=res_find+1; i<pack_len;i++) {relay1_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main309:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main495
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main495:
	BTFSC       STATUS+0, 0 
	GOTO        L_main310
	MOVLW       _relay1_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay1_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,449 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main312
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main312:
;MyProject.c,448 :: 		for (i=res_find+1; i<pack_len;i++) {relay1_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,450 :: 		}
	GOTO        L_main309
L_main310:
;MyProject.c,451 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,452 :: 		}
L_main301:
;MyProject.c,453 :: 		res_find = strstr (getRequest,"new+R2=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr60_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr60_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,454 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main496
	MOVF        R0, 0 
	SUBLW       0
L__main496:
	BTFSC       STATUS+0, 0 
	GOTO        L_main313
;MyProject.c,455 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main314:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main497
	MOVLW       0
	SUBWF       _i+0, 0 
L__main497:
	BTFSC       STATUS+0, 0 
	GOTO        L_main315
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main317
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main317:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main314
L_main315:
;MyProject.c,456 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,457 :: 		for (i = 0; i < 63; i++) {relay2_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main318:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main498
	MOVLW       63
	SUBWF       _i+0, 0 
L__main498:
	BTFSC       STATUS+0, 0 
	GOTO        L_main319
	MOVLW       _relay2_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay2_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main318
L_main319:
;MyProject.c,458 :: 		for (i=res_find+1; i<pack_len;i++) {relay2_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main321:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main499
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main499:
	BTFSC       STATUS+0, 0 
	GOTO        L_main322
	MOVLW       _relay2_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay2_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,459 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main324
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main324:
;MyProject.c,458 :: 		for (i=res_find+1; i<pack_len;i++) {relay2_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,460 :: 		}
	GOTO        L_main321
L_main322:
;MyProject.c,461 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,462 :: 		}
L_main313:
;MyProject.c,463 :: 		res_find = strstr (getRequest,"new+R3=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr61_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr61_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,464 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main500
	MOVF        R0, 0 
	SUBLW       0
L__main500:
	BTFSC       STATUS+0, 0 
	GOTO        L_main325
;MyProject.c,465 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main326:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main501
	MOVLW       0
	SUBWF       _i+0, 0 
L__main501:
	BTFSC       STATUS+0, 0 
	GOTO        L_main327
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main329
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main329:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main326
L_main327:
;MyProject.c,466 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,467 :: 		for (i = 0; i < 63; i++) {relay3_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main330:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main502
	MOVLW       63
	SUBWF       _i+0, 0 
L__main502:
	BTFSC       STATUS+0, 0 
	GOTO        L_main331
	MOVLW       _relay3_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay3_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main330
L_main331:
;MyProject.c,468 :: 		for (i=res_find+1; i<pack_len;i++) {relay3_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main333:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main503
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main503:
	BTFSC       STATUS+0, 0 
	GOTO        L_main334
	MOVLW       _relay3_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay3_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,469 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main336
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main336:
;MyProject.c,468 :: 		for (i=res_find+1; i<pack_len;i++) {relay3_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,470 :: 		}
	GOTO        L_main333
L_main334:
;MyProject.c,471 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,472 :: 		}
L_main325:
;MyProject.c,473 :: 		res_find = strstr (getRequest,"new+R4=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr62_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr62_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,474 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main504
	MOVF        R0, 0 
	SUBLW       0
L__main504:
	BTFSC       STATUS+0, 0 
	GOTO        L_main337
;MyProject.c,475 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main338:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main505
	MOVLW       0
	SUBWF       _i+0, 0 
L__main505:
	BTFSC       STATUS+0, 0 
	GOTO        L_main339
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main341
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main341:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main338
L_main339:
;MyProject.c,476 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,477 :: 		for (i = 0; i < 63; i++) {relay4_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main342:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main506
	MOVLW       63
	SUBWF       _i+0, 0 
L__main506:
	BTFSC       STATUS+0, 0 
	GOTO        L_main343
	MOVLW       _relay4_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay4_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main342
L_main343:
;MyProject.c,478 :: 		for (i=res_find+1; i<pack_len;i++) {relay4_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main345:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main507
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main507:
	BTFSC       STATUS+0, 0 
	GOTO        L_main346
	MOVLW       _relay4_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay4_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,479 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main348
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main348:
;MyProject.c,478 :: 		for (i=res_find+1; i<pack_len;i++) {relay4_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,480 :: 		}
	GOTO        L_main345
L_main346:
;MyProject.c,481 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,482 :: 		}
L_main337:
;MyProject.c,483 :: 		res_find = strstr (getRequest,"new+R5=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr63_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr63_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,484 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main508
	MOVF        R0, 0 
	SUBLW       0
L__main508:
	BTFSC       STATUS+0, 0 
	GOTO        L_main349
;MyProject.c,485 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main350:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main509
	MOVLW       0
	SUBWF       _i+0, 0 
L__main509:
	BTFSC       STATUS+0, 0 
	GOTO        L_main351
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main353
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main353:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main350
L_main351:
;MyProject.c,486 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,487 :: 		for (i = 0; i < 63; i++) {relay5_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main354:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main510
	MOVLW       63
	SUBWF       _i+0, 0 
L__main510:
	BTFSC       STATUS+0, 0 
	GOTO        L_main355
	MOVLW       _relay5_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay5_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main354
L_main355:
;MyProject.c,488 :: 		for (i=res_find+1; i<pack_len;i++) {relay5_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main357:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main511
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main511:
	BTFSC       STATUS+0, 0 
	GOTO        L_main358
	MOVLW       _relay5_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay5_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,489 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main360
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main360:
;MyProject.c,488 :: 		for (i=res_find+1; i<pack_len;i++) {relay5_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,490 :: 		}
	GOTO        L_main357
L_main358:
;MyProject.c,491 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,492 :: 		}
L_main349:
;MyProject.c,493 :: 		res_find = strstr (getRequest,"new+R6=");
	MOVLW       _getRequest+0
	MOVWF       FARG_strstr_s1+0 
	MOVLW       hi_addr(_getRequest+0)
	MOVWF       FARG_strstr_s1+1 
	MOVLW       ?lstr64_MyProject+0
	MOVWF       FARG_strstr_s2+0 
	MOVLW       hi_addr(?lstr64_MyProject+0)
	MOVWF       FARG_strstr_s2+1 
	CALL        _strstr+0, 0
	MOVF        R0, 0 
	MOVWF       _res_find+0 
	MOVF        R1, 0 
	MOVWF       _res_find+1 
;MyProject.c,494 :: 		if (res_find > 0){
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main512
	MOVF        R0, 0 
	SUBLW       0
L__main512:
	BTFSC       STATUS+0, 0 
	GOTO        L_main361
;MyProject.c,495 :: 		for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
	CLRF        _i+0 
	CLRF        _i+1 
L_main362:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main513
	MOVLW       0
	SUBWF       _i+0, 0 
L__main513:
	BTFSC       STATUS+0, 0 
	GOTO        L_main363
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_main365
	MOVF        _i+0, 0 
	MOVWF       _res_find+0 
	MOVF        _i+1, 0 
	MOVWF       _res_find+1 
	MOVLW       0
	MOVWF       _i+0 
	MOVLW       1
	MOVWF       _i+1 
L_main365:
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main362
L_main363:
;MyProject.c,496 :: 		take=0;
	CLRF        _take+0 
;MyProject.c,497 :: 		for (i = 0; i < 63; i++) {relay6_name[i]='\x00';}
	CLRF        _i+0 
	CLRF        _i+1 
L_main366:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main514
	MOVLW       63
	SUBWF       _i+0, 0 
L__main514:
	BTFSC       STATUS+0, 0 
	GOTO        L_main367
	MOVLW       _relay6_name+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay6_name+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main366
L_main367:
;MyProject.c,498 :: 		for (i=res_find+1; i<pack_len;i++) {relay6_name[take]=getRequest[i];take++;
	MOVLW       1
	ADDWF       _res_find+0, 0 
	MOVWF       _i+0 
	MOVLW       0
	ADDWFC      _res_find+1, 0 
	MOVWF       _i+1 
L_main369:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pack_len+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main515
	MOVF        _pack_len+0, 0 
	SUBWF       _i+0, 0 
L__main515:
	BTFSC       STATUS+0, 0 
	GOTO        L_main370
	MOVLW       _relay6_name+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_relay6_name+0)
	MOVWF       FSR1H 
	MOVF        _take+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _getRequest+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_getRequest+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        _take+0, 1 
;MyProject.c,499 :: 		if (take==63) {i=pack_len;}
	MOVF        _take+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_main372
	MOVF        _pack_len+0, 0 
	MOVWF       _i+0 
	MOVF        _pack_len+1, 0 
	MOVWF       _i+1 
L_main372:
;MyProject.c,498 :: 		for (i=res_find+1; i<pack_len;i++) {relay6_name[take]=getRequest[i];take++;
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;MyProject.c,500 :: 		}
	GOTO        L_main369
L_main370:
;MyProject.c,501 :: 		WriteEEPROM();
	CALL        _WriteEEPROM+0, 0
;MyProject.c,502 :: 		}
L_main361:
;MyProject.c,505 :: 		}
L_main196:
;MyProject.c,506 :: 		Ethernet_doPacket() ;   // process incoming Ethernet packets
	CALL        _Ethernet_doPacket+0, 0
;MyProject.c,507 :: 		if(Ethernet_doDHCPLeaseTime())
	CALL        _Ethernet_doDHCPLeaseTime+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main373
;MyProject.c,508 :: 		Ethernet_renewDHCP(5); // it's time to renew the IP address lease, with 5 secs for a reply
	MOVLW       5
	MOVWF       FARG_Ethernet_renewDHCP_tmax+0 
	CALL        _Ethernet_renewDHCP+0, 0
L_main373:
;MyProject.c,509 :: 		}
	GOTO        L_main194
;MyProject.c,510 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
