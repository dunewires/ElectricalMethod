
#include <stdio.h>
#include <string.h>
#include "xparameters.h"


#include "lwip/err.h"
#include "lwip/udp.h"
#define mmDataTxUdpPort 6008
//#define VERBOSE


struct ip_addr udpDstIpAddr;
//#define fwd_port 1234
#define transmit_port 5008


struct udp_pcb *mmDataTxPcb;

#define out_buf_size 3
int out_buf_i = 0;
int buf[out_buf_size];

#define udpTxBufSize  520
u8_t udpTxbuf[udpTxBufSize];



int send_write_ack(u32_t serNum, u32_t errCode)
{
  u8_t *serNumB = (u8_t*)&serNum;
  u8_t *errCodeB = (u8_t*)&errCode;
  int wAckBuffLength = 8;
  udpTxbuf[0] = serNumB[3];
  udpTxbuf[1] = serNumB[2];
  udpTxbuf[2] = serNumB[1];
  udpTxbuf[3] = serNumB[0];
  udpTxbuf[4] = errCodeB[3];
  udpTxbuf[5] = errCodeB[2];
  udpTxbuf[6] = errCodeB[1];
  udpTxbuf[7] = errCodeB[0];
  transfer_mmUdpTx_data(udpTxbuf, wAckBuffLength, mmDataTxPcb);
  return 0;
}

int drainDebugFifoUdp(int fifoAddr) {
  unsigned int statusFlags, rDFifoData;
  u32_t regStatusInitial,regStatusNext;
  int i; 
  int statusBit;
  int rDFifoBufSize = udpTxBufSize;
  int rDFifoTxIndex = 8;
  int rfifo;
  u8_t *rDFifoB = (u8_t*) &rDFifoData;
  //  xil_printf("start drain fifo %x\r\n", fifoAddr);
  statusBit = fifoAddr & 0xF;
  //  xil_printf("start drain fifo %x\r\n", statusBit);
  udpTxbuf[0] = 0xF0;
  udpTxbuf[1] = 0x00;
  udpTxbuf[2] = 0x00;

  rDFifoData = fifoAddr;
  udpTxbuf[4] = rDFifoB[3];
  udpTxbuf[5] = rDFifoB[2];
  udpTxbuf[6] = rDFifoB[1];
  udpTxbuf[7] = rDFifoB[0];
  rDFifoTxIndex = 8;
  regStatusInitial = *(u32_t *) (XPAR_BRAM_1_BASEADDR + (0x0005 << 2));
  regStatusNext = *(u32_t *) (XPAR_BRAM_1_BASEADDR + (0x0003 << 2));
  while (1) {
    statusFlags = *(unsigned int *) (XPAR_BRAM_1_BASEADDR + (0x0001 << 2));

    if (((statusFlags & 0x000001 << (statusBit*2)) == 0) & (rDFifoTxIndex < rDFifoBufSize-8))
      // Get more data from FIFO
      {
	rDFifoData = *(unsigned int *) (XPAR_BRAM_1_BASEADDR + (fifoAddr << 2));
	//change byte order
	//xil_printf("%x\n\r", rDFifoData);
	udpTxbuf[rDFifoTxIndex] = rDFifoB[3];
	udpTxbuf[rDFifoTxIndex+1] = rDFifoB[2];
	udpTxbuf[rDFifoTxIndex+2] = rDFifoB[1];
	udpTxbuf[rDFifoTxIndex+3] = rDFifoB[0];
	rDFifoTxIndex += 4;
      } 
    else //send any buffered data
      {
	if (rDFifoTxIndex > 8)
	  {
	    statusFlags = *(unsigned int *) (XPAR_BRAM_1_BASEADDR + (0x0001 << 2));
	    statusFlags =  ((statusFlags >> (statusBit*2)) & 0x000003);
	    udpTxbuf[2] = statusFlags;
	    transfer_mmUdpTx_data(udpTxbuf, rDFifoTxIndex, mmDataTxPcb);
		#ifdef VERBOSE
				xil_printf("UDP FIFO sent  %x\r\n",fifoAddr);
		#endif

	  }
	return 0;
      }
  }

}

int transfer_mmUdpTx_data(u8_t *txBufData, int  txBufLength, struct udp_pcb *pcb)
{
  err_t err;
  static u8_t udpTransferNumber = 1; 
  txBufData[3] = udpTransferNumber;
  udpTransferNumber++; 

  if (!mmDataTxPcb) {
    xil_printf("!connected_pcb\r\n");
    return -1;
  }
  //difference between pbuf_raw and pbuf_transport?
    struct pbuf * pbuf_to_be_sent = pbuf_alloc(PBUF_TRANSPORT, txBufLength, PBUF_POOL);
    //  struct pbuf * pbuf_to_be_sent = pbuf_alloc(PBUF_TRANSPORT, 8, PBUF_POOL);
  if (!pbuf_to_be_sent){
    xil_printf("error allocating pbuf to send\r\n");
    return -1;
  }
  //use memcpy to enable the writing of the data buffer before the packet is sent.
    memcpy(pbuf_to_be_sent->payload, txBufData, txBufLength);
  // memcpy(pbuf_to_be_sent->payload, txBufData, 8);
  err = udp_send(pcb, pbuf_to_be_sent);
  if (err != ERR_OK) {
    xil_printf("Error on udp_send: %d\r\n", err);
    return -1;
  }
  pbuf_free(pbuf_to_be_sent);
  return 0;
}

void start_udp( ){
  //struct udp_pcb *ptel_pcb = udp_new();
  int port = mmDataTxUdpPort;
  err_t err;
 
  //	udp_bind(ptel_pcb, IP_ADDR_ANY, port);
     // IP4_ADDR(&udpDstIpAddr, 128, 103,   100, 173);//pc2
   //IP4_ADDR(&udpDstIpAddr, 128, 103,   100, 252);//new 2
 //IP4_ADDR(&udpDstIpAddr, 192, 168,   1, 3);
  //IP4_ADDR(&udpDstIpAddr, 10,251,103,57);
  //IP4_ADDR(&udpDstIpAddr, 140,247,132,65);
    //   IP4_ADDR(&udpDstIpAddr, 140,247,132,12);//new pc2
 // IP4_ADDR(&udpDstIpAddr, 192, 168,   0, 100); //lin's version
   //IP4_ADDR(&udpDstIpAddr, 192, 168,   0, 1); //Alex cern version
      IP4_ADDR(&udpDstIpAddr, 192, 168,   2, 100); //38 Oxford
   //IP4_ADDR(&udpDstIpAddr, 128, 103,   100, 251);//laptop
   //IP4_ADDR(&udpDstIpAddr, 128, 103,   100, 252);//new pc2
  print_ip("MM Data sent to IP  : ", &udpDstIpAddr);
  xil_printf("\r\n");
  xil_printf("%s%d\r\n", "using port           : ",port);

  mmDataTxPcb = udp_new(); 
  if (!mmDataTxPcb) {
    xil_printf("Error creating PCB. Out of Memory\r\n");
    return -1;
  }
 
  if ((err = udp_connect(mmDataTxPcb, &udpDstIpAddr, port)) != ERR_OK) {
    xil_printf("error on udp_connect: %x\n\r", err);
  }



}



