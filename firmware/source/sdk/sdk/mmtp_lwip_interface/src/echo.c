/*
 * Copyright (c) 2009-2013 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */



#include <stdio.h>
#include <string.h>

#include "xparameters.h"
#include "lwip/err.h"
#include "lwip/tcp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif
#define tcpTxBufSize  516
u8_t tcpTxbuf[tcpTxBufSize];
int transfer_mmUdpTx_data();
static int transferNumber = 1;

int transfer_data() {
  return 0;
}

void print_app_header() {
  xil_printf("\n\r\n\r-----MM Trigger Processor Interface ------\n\r");
}
int *ptr = 0xc2000000;
err_t recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err) {
  /* do not read the packet if we are not in ESTABLISHED state */
  if (!p) {
    tcp_close(tpcb);
    tcp_recv(tpcb, NULL );
    return ERR_OK;
  }

  /* indicate that the packet has been received */
  tcp_recved(tpcb, p->len);
  // send_write_ack(0xabcd1234,0xfe17cafe);
  u32_t errCode = 0;

  int pktSN;
  int pktType;
  int pktAddr;
  int pktData;
  int cyLiteCmd;
  u16_t rxBufLength;
  u8_t cyLiteCmdType;
  //  xil_printf("--------------------------- \r\n");
  // xil_printf("- TCP Packet received \r\n");
  // xil_printf("- Transfer %d %s\r\n", transferNumber, " started.");
  rxBufLength = p->len;
  //process data start
  // xil_printf("- # Words received: %d\r\n", (rxBufLength / 4 - 2));
  transferNumber++;
  unsigned int uiData;
  // xil_printf("--------------------------- \r\n");

  pktSN = ((*(u8_t*) (p->payload)) << 24)
    | ((*(u8_t*) (p->payload + 1)) << 16)
    | (*(u8_t*) (p->payload + 2)) << 8
    | (*(u8_t*) (p->payload + 3));

  pktType = ((*(u8_t*) (p->payload + 4)) << 24)
    | ((*(u8_t*) (p->payload + 5)) << 16)
    | (*(u8_t*) (p->payload + 6)) << 8
    | (*(u8_t*) (p->payload + 7));

  pktAddr = ((*(u8_t*) (p->payload + 8)) << 24)
    | ((*(u8_t*) (p->payload + 9)) << 16)
    | (*(u8_t*) (p->payload + 10)) << 8
    | (*(u8_t*) (p->payload + 11));

  //xil_printf("%10x %s\r\n",ipSel," ipSel.");
  // xil_printf("%10x %s\r\n", pktSN, " pktSN.");
  // xil_printf("%10x %s\r\n", pktType, " pktType.");
  // xil_printf("%10x %s\r\n", pktAddr, " pktAddr");

  int regIndex;

  switch (pktType) {
  case 0xFE170000:
    xil_printf("TCP Control word received \r\n");

    if (pktAddr == 0x00000000) {
      cyLiteCmdType = (*(u8_t*) (p->payload + 12));
      cyLiteCmd = ((*(u8_t*) (p->payload + 12)) << 24)
	| ((*(u8_t*) (p->payload + 13)) << 16)
	| (*(u8_t*) (p->payload + 14)) << 8
	| (*(u8_t*) (p->payload + 15));
      switch (cyLiteCmdType) {
      case 0x1:
	xil_printf("JDAQ FIFO command received \r\n");
	break;
      case 0x2:
	xil_printf("\r\nrFIFO Packet Request \r\n");
	break;
      case 0x3:
	xil_printf("\r\nMM Data Packet Request \r\n");
	break;
      case 0x4:
	xil_printf("\r\n Reset ON \r\n");
	for (regIndex = 0; regIndex < 256; regIndex++) {
	  uiData =
	    *(unsigned int *) (XPAR_BRAM_1_BASEADDR
			       + (13 << 2));
	}
	break;
      case 0x5:
	xil_printf("\r\n Reset OFF \r\n");
	break;
      default:
	xil_printf("unknown command \r\n\r\n");
	errCode = 2;
	break;
      }
    }
    xil_printf("end Control request! \r\n");
    break;

  case 0xFE170001:
    xil_printf("TCP Read \r\n");
    uiData = *(unsigned int *) (XPAR_BRAM_1_BASEADDR
				+ (pktAddr << 2));
   // uiData = ptr[0];
     int txData;
    u8_t *txDataB = (u8_t*)&txData;
    int wAckBuffLength = 8;
    tcpTxbuf[0] = 0xF1;
    tcpTxbuf[1] = 0x00;
    tcpTxbuf[2] = 0x00;
    tcpTxbuf[3] = 0x00;

    txData = pktAddr;
    tcpTxbuf[4] = txDataB[3];
    tcpTxbuf[5] = txDataB[2];
    tcpTxbuf[6] = txDataB[1];
    tcpTxbuf[7] = txDataB[0];

    txData = uiData;
    tcpTxbuf[8] = txDataB[3];
    tcpTxbuf[9] = txDataB[2];
    tcpTxbuf[10] = txDataB[1];
    tcpTxbuf[11] = txDataB[0];

    transferTcpData(tcpTxbuf, 12, tpcb);

    xil_printf("Address:  %x", pktAddr);
    xil_printf(" Data:  %x\n\r", uiData);
    ;
    break;

  case 0xFE170002:
    xil_printf("TCP Write \r\n");
    int wIndex;
    for (wIndex = 0; wIndex < (rxBufLength / 4 - 3); wIndex++) {

      pktData =
	((*(u8_t*) (p->payload + 12 + (wIndex << 2))) << 24)
	| ((*(u8_t*) (p->payload + 13 + (wIndex << 2))) << 16)
	| (*(u8_t*) (p->payload + 14 + (wIndex << 2))) << 8
	| (*(u8_t*) (p->payload + 15 + (wIndex << 2)));

      // xil_printf("Address:  %x", pktAddr);
      //xil_printf(" Data:  %x\n\r", pktData);
      //
      *(unsigned int *) (XPAR_BRAM_1_BASEADDR
			 + (pktAddr << 2)) = pktData;
    }
    break;

  }
  pbuf_free(p);

  return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err) {
  static int connection = 1;

  /* set the receive callback for this connection */
  tcp_recv(newpcb, recv_callback);

  /* just use an integer number indicating the connection id as the
     callback argument */
  tcp_arg(newpcb, (void*) connection);

  /* increment for subsequent accepted connections */
  connection++;

  return ERR_OK;
}

int start_application() {
  struct tcp_pcb *pcb;
  err_t err;
  unsigned port = 7;
  xil_printf("loc1\n\r");

  /* create new TCP PCB structure */
  pcb = tcp_new();
  if (!pcb) {
    xil_printf("Error creating PCB. Out of Memory\n\r");
    return -1;
  }
  xil_printf("loc3\n\r");

  /* bind to specified @port */
  err = tcp_bind(pcb, IP_ADDR_ANY, port);
  if (err != ERR_OK) {
    xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
    return -2;
  }
  xil_printf("loc4\n\r");

  /* we do not need any arguments to callback functions */
  tcp_arg(pcb, NULL );
  xil_printf("loc1\n\r");

  /* listen for connections */
  pcb = tcp_listen(pcb);
  if (!pcb) {
    xil_printf("Out of memory while tcp_listen\n\r");
    return -3;
  }
  xil_printf("loc1\n\r");

  /* specify callback to use for incoming connections */
  tcp_accept(pcb, accept_callback);

  xil_printf("Trigger Processor TCP server started @ port %d\n\r", port);

  start_udp();

  return 0;
}


int transferTcpData(u8_t *txBufData, int  txBufLength, struct tcp_pcb *pcb)
{
  err_t err;
  
  err = tcp_write(pcb, txBufData, txBufLength, 1);
  if (err != ERR_OK) {
    xil_printf("TransferTcpData Error on tcp_write: %d\r\n", err);
    return -1;
  }
  tcp_output(pcb);
    
  return 0;
}
