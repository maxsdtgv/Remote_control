#line 1 "C:/Users/Dinka/Desktop/New_dev_67j60_4-release_Relay/MyProject.c"
#line 1 "c:/users/dinka/desktop/new_dev_67j60_4-release_relay/__ethj60.h"
#line 47 "c:/users/dinka/desktop/new_dev_67j60_4-release_relay/__ethj60.h"
typedef struct
 {
 unsigned char valid;
 unsigned long tmr;
 unsigned char ip[4];
 unsigned char mac[6];
 } Ethernet_arpCacheStruct;

extern Ethernet_arpCacheStruct Ethernet_arpCache[];

extern unsigned char Ethernet_macAddr[6];
extern unsigned char Ethernet_ipAddr[4];
extern unsigned char Ethernet_gwIpAddr[4];
extern unsigned char Ethernet_ipMask[4];
extern unsigned char Ethernet_dnsIpAddr[4];
extern unsigned char Ethernet_rmtIpAddr[4];

extern unsigned long Ethernet_userTimerSec;

typedef struct {
 unsigned canCloseTCP: 1;
 unsigned isBroadcast: 1;
} TEthPktFlags;
#line 74 "c:/users/dinka/desktop/new_dev_67j60_4-release_relay/__ethj60.h"
extern void Ethernet_Init(unsigned char *mac, unsigned char *ip, unsigned char fullDuplex);
extern unsigned char Ethernet_doPacket();
extern void Ethernet_putByte(unsigned char b);
extern void Ethernet_putBytes(unsigned char *ptr, unsigned int n);
extern void Ethernet_putConstBytes(const unsigned char *ptr, unsigned int n);
extern unsigned char Ethernet_getByte();
extern void Ethernet_getBytes(unsigned char *ptr, unsigned int addr, unsigned int n);
extern unsigned int Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort, unsigned int localPort, unsigned int reqLength, TEthPktFlags * flags);
extern unsigned int Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort, unsigned int localPort, unsigned int reqLength, TEthPktFlags * flags);
extern void Ethernet_confNetwork(char *ipMask, char *gwIpAddr, char *dnsIpAddr);
#line 5 "C:/Users/Dinka/Desktop/New_dev_67j60_4-release_Relay/MyProject.c"
unsigned char myMacAddr[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x01} ;
unsigned char server_ip[4] = {0, 0, 0, 0 } ;
unsigned char myIpAddr[4] = {0, 0, 0, 0 } ;
unsigned char gwIpAddr[4] = {0, 0, 0, 0 } ;
unsigned char ipMask[4] = {0, 0, 0, 0 } ;
unsigned char dnsIpAddr[4] = {0, 0, 0, 0 } ;

unsigned char obtaine_packet, getRequest[256],dyna[500],toWrite[464],hhex[7];


sbit Relay1_Port at RE1_bit;
sbit Relay2_Port at RE0_bit;
sbit Relay3_Port at RB0_bit;
sbit Relay4_Port at RB1_bit;
sbit Relay5_Port at RB2_bit;
sbit Relay6_Port at RB3_bit;
sbit Conf_pin at RF2_bit;
sbit Test_time at RD2_bit;
sbit Test_relay at RD1_bit;
sbit Chip_Select at RC2_bit;
sbit Chip_Select_Direction at TRISC2_bit;
unsigned short take, menu, res, res1, res2, timer, pos,timer_minut;
int Relay1_time,Relay2_time,Relay3_time,Relay4_time,Relay5_time,Relay6_time;
int temp_int, buffer, i,pack_len, res_find;
unsigned char
dev_name[64],
relay1_name[64],
relay2_name[64],
relay3_name[64],
relay4_name[64],
relay5_name[64],
relay6_name[64];

void interrupt() {
 if (PIR1.TMR1IF) {
 PIE1.TMR1IE = 0;
 PIR1.TMR1IF = 0;
 TMR1H = 0x80;
 Test_time = ~Test_time;
 asm CLRWDT;

 if (timer > 0) timer = timer--;
 if (timer_minut>0)timer_minut=timer_minut--;
 if (Relay1_time == 0 && Relay2_time == 0 && Relay3_time == 0 && Relay4_time == 0 && Relay5_time == 0 && Relay6_time == 0) {Test_relay=0;} else {Test_relay=1;}

 if (Relay1_time == -1) {Relay1_Port=1;} else {
 if (Relay1_time == 0) {Relay1_Port=0;} else {Relay1_Port=1;Relay1_time--;}}
 if (Relay2_time == -1) {Relay2_Port=1;} else {
 if (Relay2_time == 0) {Relay2_Port=0;} else {Relay2_Port=1;Relay2_time--;}}
 if (Relay3_time == -1) {Relay3_Port=1;} else {
 if (Relay3_time == 0) {Relay3_Port=0;} else {Relay3_Port=1;Relay3_time--;}}
 if (Relay4_time == -1) {Relay4_Port=1;} else {
 if (Relay4_time == 0) {Relay4_Port=0;} else {Relay4_Port=1;Relay4_time--;}}
 if (Relay5_time == -1) {Relay5_Port=1;} else {
 if (Relay5_time == 0) {Relay5_Port=0;} else {Relay5_Port=1;Relay5_time--;}}
 if (Relay6_time == -1) {Relay6_Port=1;} else {
 if (Relay6_time == 0) {Relay6_Port=0;} else {Relay6_Port=1;Relay6_time--;}}

 PIE1.TMR1IE = 1;
 }
}
void ReadEEPROM(void) {

 Chip_Select = 0;
 Delay_ms(1);
 SPI1_Write(0x03);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 for (i = 0; i < 4; i++) {myIPAddr[i]=SPI1_READ(buffer);}
 for (i = 0; i < 4; i++) {gwIPAddr[i]=SPI1_READ(buffer);}
 for (i = 0; i < 4; i++) {IPMask[i]=SPI1_READ(buffer);}
 for (i = 0; i < 4; i++) {dnsIPAddr[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {dev_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay1_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay2_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay3_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay4_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay5_name[i]=SPI1_READ(buffer);}
 for (i = 0; i < 64; i++) {relay6_name[i]=SPI1_READ(buffer);}
 Chip_Select = 1;
 Delay_ms(1);
}
void WriteEEPROM(void){
 buffer=0;
 for (i = 0; i < 4; i++) {toWrite[buffer]=myIPAddr[i];buffer++;}
 for (i = 0; i < 4; i++) {toWrite[buffer]=gwIPAddr[i];buffer++;}
 for (i = 0; i < 4; i++) {toWrite[buffer]=IPMask[i];buffer++;}
 for (i = 0; i < 4; i++) {toWrite[buffer]=dnsIPAddr[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=dev_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay1_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay2_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay3_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay4_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay5_name[i];buffer++;}
 for (i = 0; i < 64; i++) {toWrite[buffer]=relay6_name[i];buffer++;}
 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x06);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);

 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x01);
 SPI1_Write(0x00);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);

 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x06);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);
 Chip_Select = 0;
 Delay_ms(5);
 SPI1_Write(0x02);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 for (i = 0; i < 128; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
 Chip_Select = 1;
 Delay_ms(10);

 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x06);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);
 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x02);
 SPI1_Write(0x00);
 SPI1_Write(0x80);
 for (i = 128; i < 256; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
 Chip_Select = 1;
 Delay_ms(10);


 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x06);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);
 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x02);
 SPI1_Write(0x01);
 SPI1_Write(0x00);
 for (i = 256; i < 384; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
 Chip_Select = 1;
 Delay_ms(10);


 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x06);
 Delay_ms(3);
 Chip_Select = 1;
 Delay_ms(3);
 Chip_Select = 0;
 Delay_ms(3);
 SPI1_Write(0x02);
 SPI1_Write(0x01);
 SPI1_Write(0x80);
 for (i = 384; i < 464; i++) {SPI1_Write(toWrite[i]);Delay_ms(1);}
 Chip_Select = 1;
 Delay_ms(20);

}
unsigned int Ethernet_UserTCP(unsigned char *remoteHost, unsigned int remotePort, unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags)
 {
 unsigned int len = 0 ;
 return(len) ;
 }

unsigned int Ethernet_UserUDP(unsigned char *remoteHost, unsigned int remotePort, unsigned int destPort, unsigned int reqLength, TEthPktFlags *flags)
 {
 unsigned int len=0;

 if(destPort != 50050) {return(0);}
 pack_len=reqLength;
 for (i=0;i<256;i++){getRequest[i] ='\x00';}
 obtaine_packet=1;
 server_ip[0]=remoteHost[0];
 server_ip[1]=remoteHost[1];
 server_ip[2]=remoteHost[2];
 server_ip[3]=remoteHost[3];
 for(i = 0; i<256; i++)
 {
 getRequest[i] = Ethernet_getByte() ;
 }
 return(len) ;
 }
#line 205 "C:/Users/Dinka/Desktop/New_dev_67j60_4-release_Relay/MyProject.c"
void Update_device(void){
 for (i = 0; i < 500; i++) {dyna[i]='\x00';}
 res = strcat(dyna, "key_id=dinka&table=Devices&module_mac=");
 for (i=0; i<6; i++){bytetoHex(myMacAddr[i],hhex); strcat(dyna, hhex);}
 strcat(dyna, "&hw_ver=01&module_info=Relay control (6 relay)&module_name=");
 strcat(dyna, dev_name);
 strcat(dyna, "&module_ip=");
 for (i=0; i<4; i++){bytetostr(myIPAddr[i],hhex); strcat(dyna, hhex);strcat(dyna, ".");}
 strcat(dyna, "&module_func=Relay");
 Ethernet_sendUDP(server_ip, 50050, 50051, dyna, strlen(dyna));
}
void Update_relay(void){

 for (i = 0; i < 500; i++) {dyna[i]=0;}
 strcat(dyna, "key_id=dinka&table=Relay&relay_state=R1+");
 if (Relay1_port==1){strcat(dyna, "1;R2+");} else {strcat(dyna, "0;R2+");}
 if (Relay2_port==1){strcat(dyna, "1;R3+");} else {strcat(dyna, "0;R3+");}
 if (Relay3_port==1){strcat(dyna, "1;R4+");} else {strcat(dyna, "0;R4+");}
 if (Relay4_port==1){strcat(dyna, "1;R5+");} else {strcat(dyna, "0;R5+");}
 if (Relay5_port==1){strcat(dyna, "1;R6+");} else {strcat(dyna, "0;R6+");}
 if (Relay6_port==1){strcat(dyna, "1&");} else {strcat(dyna, "0&");}
 strcat(dyna, "relay_time=R1+");
 inttostr(Relay1_time,hhex); strcat(dyna, hhex);
 strcat(dyna, ";R2+");
 inttostr(Relay2_time,hhex); strcat(dyna, hhex);
 strcat(dyna, ";R3+");
 inttostr(Relay3_time,hhex); strcat(dyna, hhex);
 strcat(dyna, ";R4+");
 inttostr(Relay4_time,hhex); strcat(dyna, hhex);
 strcat(dyna, ";R5+");
 inttostr(Relay5_time,hhex); strcat(dyna, hhex);
 strcat(dyna, ";R6+");
 inttostr(Relay6_time,hhex); strcat(dyna, hhex);
 strcat(dyna, "&relay_name=R1+");
 strcat(dyna, relay1_name);
 strcat(dyna, ";R2+");
 strcat(dyna, relay2_name);
 strcat(dyna, ";R3+");
 strcat(dyna, relay3_name);
 strcat(dyna, ";R4+");
 strcat(dyna, relay4_name);
 strcat(dyna, ";R5+");
 strcat(dyna, relay5_name);
 strcat(dyna, ";R6+");
 strcat(dyna, relay6_name);
 Ethernet_sendUDP(server_ip, 50050, 50051, dyna, strlen(dyna));



}
void main() {
 timer=0;
 timer_minut=0;
 PORTB=0;
 PORTD=0;
 PORTF=0;
 LATB=0;
 LATF=0;
 TRISA=0;
 TRISB=0;
 TRISC=0;
 TRISD=0;
 TRISF=0x04;
 TRISE=0;

 CMCON=0x07;
 ADCON1=0x0F;
 Relay1_Port=0;
 Relay2_Port=0;
 Relay3_Port=0;
 Relay4_Port=0;
 Relay5_Port=0;
 Relay6_Port=0;
 Relay1_time=0;
 Relay2_time=0;
 Relay3_time=0;
 Relay4_time=0;
 Relay5_time=0;
 Relay6_time=0;
 obtaine_packet=0;
 INTCON = 0;
 PIE1 = 0;
 PIE2 = 0;

 PIR1.TMR1IF = 0;
 TMR1H = 0x80;
 TMR1L = 0x00;
 T1CON.RD16 = 0;
 T1CON.T1RUN = 1;
 T1CON.TMR1CS = 1;
 T1CON.T1OSCEN = 1;
 T1CON.T1CKPS1 = T1CON.T1CKPS0 = 0;
 PIE1.TMR1IE = 1;
 INTCON = 0xC0;
 T1CON.TMR1ON = 1;

 Chip_Select_Direction = 0;
 Chip_Select = 1;

 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV16, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

if (Conf_pin==0){
 for (i = 0; i < 64; i++) {dev_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay1_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay2_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay3_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay4_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay5_name[i]='\x00';}
 for (i = 0; i < 64; i++) {relay6_name[i]='\x00';}
 strcat(dev_name,"Device name");
 strcat(relay1_name,"Relay1 name");
 strcat(relay2_name,"Relay2 name");
 strcat(relay3_name,"Relay3 name");
 strcat(relay4_name,"Relay4 name");
 strcat(relay5_name,"Relay5 name");
 strcat(relay6_name,"Relay6 name");
 WriteEEPROM();
 }
 ReadEEPROM();
 Ethernet_Init(myMacAddr, myIpAddr,  1 ) ;
 Ethernet_initDHCP(5);
 Ethernet_Enable(_Ethernet_BROADCAST);
while(1)
 {
if (obtaine_packet==1) {obtaine_packet=0;

 res_find = strstr (getRequest,"update_all_tables");
 if (res_find > 0){Update_device();
 Update_relay();
 }

 res_find = strstr (getRequest,"update_Relay");
 if (res_find > 0){Update_relay();
 }

 res_find = strstr (getRequest,"Relay+R1+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay1_port=1;Relay1_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay1_time=atoi(hhex); if (Relay1_time>0) {Relay1_port=1;}

 }

 }
 res_find = strstr (getRequest,"Relay+R1+OFF");
 if (res_find > 0){Relay1_Port=0;Relay1_time=0;
 }
 res_find = strstr (getRequest,"Relay+R2+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay2_port=1;Relay2_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay2_time=atoi(hhex);if (Relay2_time>0) {Relay2_port=1;}
 }

 }
 res_find = strstr (getRequest,"Relay+R2+OFF");
 if (res_find > 0){Relay2_Port=0;Relay2_time=0;
 }

 res_find = strstr (getRequest,"Relay+R3+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay3_port=1;Relay3_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay3_time=atoi(hhex);if (Relay3_time>0) {Relay3_port=1;}
 }

 }
 res_find = strstr (getRequest,"Relay+R3+OFF");
 if (res_find > 0){Relay3_Port=0;Relay3_time=0;
 }
 res_find = strstr (getRequest,"Relay+R4+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay4_port=1;Relay4_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay4_time=atoi(hhex);if (Relay4_time>0) {Relay4_port=1;}
 }

 }
 res_find = strstr (getRequest,"Relay+R4+OFF");
 if (res_find > 0){Relay4_Port=0;Relay4_time=0;
 }

 res_find = strstr (getRequest,"Relay+R5+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay5_port=1;Relay5_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay5_time=atoi(hhex); if (Relay5_time>0) {Relay5_port=1;}
 }

 }
 res_find = strstr (getRequest,"Relay+R5+OFF");
 if (res_find > 0){Relay5_Port=0;Relay5_time=0;
 }
 res_find = strstr (getRequest,"Relay+R6+ON");
 if (res_find > 0){res_find = strstr (getRequest,"time=-1");
 if (res_find > 0) {Relay6_port=1;Relay6_time=-1;}
 else{
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 7; i++) {hhex[i]='\x00';}
 for (i=res_find+1; i<res_find+4;i++) {hhex[take]=getRequest[i];take++;}
 Relay6_time=atoi(hhex);if (Relay6_time>0) {Relay6_port=1;}
 }

 }
 res_find = strstr (getRequest,"Relay+R6+OFF");
 if (res_find > 0){Relay6_Port=0;Relay6_time=0;
 }
 res_find = strstr (getRequest,"new+module_name=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {dev_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {dev_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R1=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay1_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay1_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R2=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay2_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay2_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R3=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay3_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay3_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R4=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay4_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay4_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R5=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay5_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay5_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }
 res_find = strstr (getRequest,"new+R6=");
 if (res_find > 0){
 for (i = 0; i < 256; i++) {if (getRequest[i]=='='){res_find=i;i=256;}}
 take=0;
 for (i = 0; i < 63; i++) {relay6_name[i]='\x00';}
 for (i=res_find+1; i<pack_len;i++) {relay6_name[take]=getRequest[i];take++;
 if (take==63) {i=pack_len;}
 }
 WriteEEPROM();
 }


 }
 Ethernet_doPacket() ;
 if(Ethernet_doDHCPLeaseTime())
 Ethernet_renewDHCP(5);
 }
}
