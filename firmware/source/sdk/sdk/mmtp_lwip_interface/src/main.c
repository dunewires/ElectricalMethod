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

#include "xparameters.h"

#include "netif/xadapter.h"

#include "platform.h"
#include "platform_config.h"
#ifdef __arm__
#include "xil_printf.h"
#endif

/* defined by each RAW mode application */
void print_app_header();
int start_application();
int transfer_data();

/* missing declaration in lwIP */
void lwip_init();

static struct netif server_netif;
struct netif *echo_netif;

void
print_ip(char *msg, struct ip_addr *ip) 
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip), 
			ip4_addr3(ip), ip4_addr4(ip));
}


void
print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

#if XPAR_GIGE_PCS_PMA_CORE_PRESENT == 1
int ProgramSi5324(void);
int ProgramSfpPhy(void);
#endif

int main()
{
	xil_printf("Trigger Processor Begin. v 1.2\n\r");
	xil_printf("Alex's quiet Version \n\r");

	prog_clocks();

	struct ip_addr ipaddr, netmask, gw;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] =
			//{ 0x00, 0x16, 0x76, 0x34,0xf9, 0xd1 };//nwlabs '197 TP
			//{ 0x00, 0x16, 0x76, 0xC8,0x00, 0xA2 };//nwlabs  '198 APG
			//{0x00, 0x0A, 0x35, 0x03, 0x03, 0x9C};//BNL Lin Config
			//{0x00, 0x0A, 0x35, 0x03, 0xab, 0x9C};//Alex Cern
	// { 0x00, 0x0a, 0x35, 0x02,0xd1, 0xfa };//fake
	   {  	0x00, 0x30, 0x48, 0x2a, 0x89, 0x53 };//palfrey & 38

	echo_netif = &server_netif;

#if XPAR_GIGE_PCS_PMA_CORE_PRESENT == 1
	ProgramSi5324();
	ProgramSfpPhy();
#endif

	init_platform();

	/* initliaze IP addresses to be used */
	//IP4_ADDR(&ipaddr,  140, 247,132,197);//NW labs tp
	//IP4_ADDR(&ipaddr,  140, 247,132,198);//NW labs apg
	//IP4_ADDR(&ipaddr, 192, 168,   0,  107);//BNL Lin Config
		IP4_ADDR(&ipaddr, 192, 168,   2,  10);//38 oxford
	//	IP4_ADDR(&ipaddr, 192, 168,   0,  10);//ALEX CERN
	// IP4_ADDR(&ipaddr,  128, 103, 100, 138);//palfrey
    //   	IP4_ADDR(&ipaddr,  128, 103, 100, 175);//palfrey
		//IP4_ADDR(&ipaddr,  192, 168, 1, 2);
	IP4_ADDR(&netmask, 255, 255, 255,  0);
	//IP4_ADDR(&gw,      128, 103,   1,  1);
	IP4_ADDR(&gw,      192, 168,   1,  1);
	//IP4_ADDR(&gw,      192, 168,   0,  0);

	print_app_header();
	print_ip_settings(&ipaddr, &netmask, &gw);

	lwip_init();

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(echo_netif, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}
	netif_set_default(echo_netif);

	/* Create a new DHCP client for this interface.
	 * Note: you must call dhcp_fine_tmr() and dhcp_coarse_tmr() at
	 * the predefined regular intervals after starting the client.
	 */
	/* dhcp_start(echo_netif); */

	/* now enable interrupts */
	platform_enable_interrupts();

	/* specify that the network if is up */
	netif_set_up(echo_netif);

	/* start the application (web server, rxtest, txtest, etc..) */
	start_application();
	/* receive and process packets */
	while (1) {
		xemacif_input(echo_netif);
		transfer_data();
			  drainDebugFifoUdp(0x21);
				drainDebugFifoUdp(0x22);
				drainDebugFifoUdp(0x23);
				drainDebugFifoUdp(0x20);

	}
  
	/* never reached */
	cleanup_platform();

	return 0;
}
