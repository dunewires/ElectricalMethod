/*
 * iic_test_program.c
 *
 *  Created on: Sep 14, 2010
 *      Author: jhmccaskill
 */

/*****************************************************************************/
/*****************************************************************************/
/**
 *
 * This code assumes that no Operating System is being used.
 *
 * @note
 *
 * None.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date	 Changes
 * ----- ---- -------- ---------------------------------------------------------
 * 1.00a mta  02/24/06 Created.
 * </pre>
 *
 ******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xiic.h"
#include "xintc.h"
#include "xil_exception.h"
#include <stdio.h>

//#include "menu.h"
//#include "board_test_app.h"
#include <ctype.h>
#include <string.h>

#include <stdlib.h>
#include <ctype.h>
#include <limits.h>

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
//#define IIC_DEVICE_ID	XPAR_IIC_EEPROM_DEVICE_ID
//#define INTC_DEVICE_ID	XPAR_INTERRUPT_CNTRL_DEVICE_ID
#define INTC_DEVICE_ID	XPAR_INTC_0_DEVICE_ID
//#define IIC_INTR_ID	XPAR_INTC_0_IIC_0_VEC_ID

/*
 * The following constant defines the address of the IIC Slave device on the
 * IIC bus. Note that since the address is only 7 bits, this constant is the
 * address divided by 2.
 */
#define EEPROM_ADDRESS 0x54	/* 0xA0 as an 8 bit number. */
#define FMC_ADDRESS 0x50	/* FMC EEPROM Address. */
#define ICS8N4Q001_ADDRESS 0x6E /* Clk Generator Address. */
#define FULL_I2C_ADDRESS 0x50 /* Full I2C Address range for dedicated buses */

/*
 * The page size determines how much data should be written at a time.
 * The ML310/ML300 board supports a page size of 32 and 16.
 * The write function should be called with this as a maximum byte count.
 */
#define PAGE_SIZE   16

/*
 * The Starting address in the IIC EEPROM on which this test is performed.
 */
#define EEPROM_TEST_START_ADDRESS   128
#define CLKGEN_START_ADDRESS   16

// The following program creates an FMC EEPROM image and then programs it into the FMC EEPROM
// The program is designed for a FMC module plugged into a ML605 HPC connector
//  The program currently supports a 2K-bit (256 byte) EEPROM

#define ipmi_version 1 //IPMI v1.0
#define internal_area 0 //offset into memory (in multiples of 8 bytes) -- 0 means unused
#define chassis_area 0 //offset into memory (in multiples of 8 bytes) -- 0 means unused
//#define board_area 1 //offset into memory (in multiples of 8 bytes) -- 0 means unused 1
//#define product_area 8 //offset into memory (in multiples of 8 bytes) -- 0 means unused 9
//#define multirecord_area 0 //offset into memory (in multiples of 8 bytes) -- 0 means unused 19

#define eeprom_size 256 //256 bytes
#define MAXSTRING 8

/**************************** Type Definitions *******************************/

/*
 * The AddressType for ML300/ML310 boards should be u16 as the address
 * pointer in the on board EEPROM is 2 bytes.
 * The AddressType for ML403/ML501/ML505/ML507 boards should be u8 as the
 * address pointer in the on board EEPROM is 1 bytes.
 */
typedef u8 AddressType;

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int IicProgClocks();

extern int EepromWriteData(u16 ByteCount);

extern int EepromReadData(u8 *BufferPtr, u16 ByteCount, AddressType Address);

static int SetupInterruptSystem(XIic * IicInstPtr, int INT_ID);

static void DisableInterruptSystem(XIic * IicInstPtr, int INT_ID);

static void SendHandler(XIic *InstancePtr);

static void ReceiveHandler(XIic *InstancePtr);

static void StatusHandler(XIic *InstancePtr, int Event);

//int mygeti(int *result);

/************************** Variable Definitions *****************************/

XIic IicInstance; /* The instance of the IIC device. */
XIntc InterruptController; /* The instance of the Interrupt Controller. */

/*
 * Write buffer for writing a page.
 */
u8 WriteBuffer[PAGE_SIZE];

u8 ReadBuffer[PAGE_SIZE]; /* Read buffer for reading a page. */

u8 RegisterSpace[24];

volatile u8 TransmitComplete; /* Flag to check completion of Transmission */
volatile u8 ReceiveComplete; /* Flag to check completion of Reception */

/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
 * Main function to call the High level EEPROM example.
 *
 * @param	None.
 *
 * @return	XST_SUCCESS if successful else XST_FAILURE.
 *
 * @note		None.
 *
 ******************************************************************************/
int prog_clocks(void) {
	int Status;

	xil_printf("\n\r********************************************************");
	xil_printf("\n\r********************************************************");
	xil_printf("\n\r**     FTL S14/S18 Clock Programmer                   **");
	xil_printf("\n\r********************************************************");
	xil_printf(
			"\n\r********************************************************\r\n");

	/*
	 * Run the EEPROM example.
	 */
	Status = IicProgClocks();
	if (Status != XST_SUCCESS) {
		xil_printf("Failed\r\n");
		return XST_FAILURE;
	}
	xil_printf("Passed!\r\n");

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
 * This function writes, reads, and verifies the data to the IIC EEPROM. It
 * does the write as a single page write, performs a buffered read.
 *
 * @param	None.
 *
 * @return	XST_SUCCESS if successful else XST_FAILURE.
 *
 * @note		None.
 *
 ******************************************************************************/
int IicProgClocks() {
	u32 Index;
	int Status;
	int i2c_choice, exit_function;
	int def_freq_num, found_N;
	int i2c_address;
	int i2c_bus_id;
	int i2c_intr_id;
	u8 pattern;
	int numbytes;
	int MINT_prog, MFRAC_prog;
	u8 MINT[4];
	u32 MFRAC[4];
	u8 N[4], N_prog;
	u8 P[4];
	float f_xtal, f_out[4], freq, M_prog, M_frac;
	freq = 120;
	unsigned short int i;
	unsigned char eeprom[eeprom_size], *eeprom_ptr;

	XIic_Config *ConfigPtr; /* Pointer to configuration data */
	AddressType Address = EEPROM_TEST_START_ADDRESS;

	MINT[0] = 0x00;
	MINT[1] = 0x00;
	MINT[2] = 0x00;
	MINT[3] = 0x00;
	MFRAC[0] = 0x00000000;
	MFRAC[1] = 0x00000000;
	MFRAC[2] = 0x00000000;
	MFRAC[3] = 0x00000000;
	N[0] = 0x00;
	N[1] = 0x00;
	N[2] = 0x00;
	N[3] = 0x00;
	P[0] = 0x00;
	P[1] = 0x00;
	P[2] = 0x00;
	P[3] = 0x00;
	f_xtal = 114.285e6;
	f_out[0] = 0;
	f_out[1] = 0;
	f_out[2] = 0;
	f_out[3] = 0;

	eeprom_ptr = eeprom;
	//initialize array
	for (i = 0; i <= 255; i++) {
		eeprom[i] = 0;
	}

	//   i2c_bus_id = XPAR_IIC_0_DEVICE_ID;
	//   i2c_intr_id = XPAR_INTC_0_IIC_10_VEC_ID;
	i2c_bus_id = XPAR_AXI_IIC_0_DEVICE_ID;
	i2c_intr_id = XPAR_INTC_0_IIC_0_VEC_ID;
	i2c_address = EEPROM_ADDRESS;

	i2c_bus_id = XPAR_AXI_IIC_0_DEVICE_ID;
	i2c_intr_id = XPAR_INTC_0_IIC_0_VEC_ID;
	i2c_address = ICS8N4Q001_ADDRESS;

	/*
	 * Initialize the IIC driver so that it is ready to use.
	 */
	ConfigPtr = XIic_LookupConfig(i2c_bus_id);
	if (ConfigPtr == NULL ) {
		return XST_FAILURE;
	}

	Status = XIic_CfgInitialize(&IicInstance, ConfigPtr,
			ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the Interrupt System.
	 */
	Status = SetupInterruptSystem(&IicInstance, i2c_intr_id);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the Handlers for transmit and reception.
	 */
	XIic_SetSendHandler(&IicInstance, &IicInstance, (XIic_Handler) SendHandler);
	XIic_SetRecvHandler(&IicInstance, &IicInstance,
			(XIic_Handler) ReceiveHandler);
	XIic_SetStatusHandler(&IicInstance, &IicInstance,
			(XIic_StatusHandler) StatusHandler);

	/*
	 * Set the Slave address.
	 */
	Status = XIic_SetAddress(&IicInstance, XII_ADDR_TO_SEND_TYPE, i2c_address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to set the slave address\r\n");
		return XST_FAILURE;
	}

	Index = 0;
	pattern = 0;

	Address = 0x0;
	numbytes = 0x10;
	/*
	 * Initialize the read buffer.
	 */
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	} else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
		ReadBuffer[Index] = 0;
	}

	for (Index = 0; Index < numbytes; Index++) {
		WriteBuffer[sizeof(Address) + Index] = 0xFF;
		ReadBuffer[Index] = 0;
	}
	for (Index = 0; Index < 24; Index++) {
		RegisterSpace[Index] = 0;
	}

	xil_printf("Reading 0x%02x bytes of data from address 0x%02x\n", numbytes,
			Address);
	Status = EepromReadData(ReadBuffer, numbytes, Address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read from the Clock Generator\r\n");
		return XST_FAILURE;
	}
	xil_printf("Read data: 0x");
	for (Index = 0; Index < numbytes; Index++) {
		xil_printf("%02x", ReadBuffer[Index]);
		RegisterSpace[Index] = ReadBuffer[Index];
	}
	ReadBuffer[Index] = 0;
	xil_printf("here\r\n");

	Address = 0x10;
	numbytes = 0x8;
	/*
	 * Initialize the read buffer.
	 */
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	} else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
		ReadBuffer[Index] = 0;
	}

	for (Index = 0; Index < numbytes; Index++) {
		WriteBuffer[sizeof(Address) + Index] = 0xFF;
		ReadBuffer[Index] = 0;
	}

//				xil_printf("Reading 0x%02x bytes of data from address 0x%02x\n", numbytes, Address);
	Status = EepromReadData(ReadBuffer, numbytes, Address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read from the Clock Generator\r\n");
		return XST_FAILURE;
	}
//			    xil_printf("Read data: 0x");
	for (Index = 0; Index < numbytes; Index++) {
//					xil_printf("%02x", ReadBuffer[Index]);
		RegisterSpace[Index + 0x10] = ReadBuffer[Index];
	}
	ReadBuffer[Index] = 0;
//				xil_printf("\r\n");

	xil_printf("Raw Register data: 0x");
	for (Index = 0; Index < 24; Index++) {
		if ((Index > 0) & ((Index % 4) == 0)) {
			xil_printf(" ");
		}
		xil_printf("%02x", RegisterSpace[Index]);
	}
	xil_printf("\r\n");

	for (def_freq_num = 0; def_freq_num < 4; def_freq_num++) {
		MINT[def_freq_num] = ((RegisterSpace[0 + def_freq_num] >> 1)
				& ~(~0 << 5));
		MFRAC[def_freq_num] = (((RegisterSpace[0 + def_freq_num] & ~(~0 << 1))
				<< 17) | RegisterSpace[4 + def_freq_num] << 9
				| RegisterSpace[8 + def_freq_num] << 1
				| ((RegisterSpace[12 + def_freq_num] & (~0 << 7)) >> 7));
		N[def_freq_num] = (RegisterSpace[12 + def_freq_num] & ~(~0 << 7));
		P[def_freq_num] = 0x01;
		f_out[def_freq_num] = (f_xtal
				* (MINT[def_freq_num] + (MFRAC[def_freq_num] / 262144.0))
				/ (P[def_freq_num] * N[def_freq_num]));
		printf("F%d = %4.2f MHz\n", def_freq_num,
				(f_out[def_freq_num] / 1.0e6));
	}
	printf("\n");

	// Write to the EEPROM.
	Address = 0x0;
	numbytes = 0x10;
	/*
	 * Initialize the read buffer.
	 */
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	} else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
		ReadBuffer[Index] = 0;
	}

	for (Index = 0; Index < numbytes; Index++) {
		WriteBuffer[sizeof(Address) + Index] = 0xFF;
		ReadBuffer[Index] = 0;
	}
	for (Index = 0; Index < 24; Index++) {
		RegisterSpace[Index] = 0;
	}

//				xil_printf("Reading 0x%02x bytes of data from address 0x%02x\n", numbytes, Address);
	Status = EepromReadData(ReadBuffer, numbytes, Address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read from the Clock Generator\r\n");
		return XST_FAILURE;
	}
//			    xil_printf("Read data: 0x");
	for (Index = 0; Index < numbytes; Index++) {
//					xil_printf("%02x", ReadBuffer[Index]);
		RegisterSpace[Index] = ReadBuffer[Index];
	}
	ReadBuffer[Index] = 0;
//				xil_printf("\r\n");

	Address = 0x10;
	numbytes = 0x8;
	/*
	 * Initialize the read buffer.
	 */
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	} else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
		ReadBuffer[Index] = 0;
	}

	for (Index = 0; Index < numbytes; Index++) {
		WriteBuffer[sizeof(Address) + Index] = 0xFF;
		ReadBuffer[Index] = 0;
	}

//				xil_printf("Reading 0x%02x bytes of data from address 0x%02x\n", numbytes, Address);
	Status = EepromReadData(ReadBuffer, numbytes, Address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read from the Clock Generator\r\n");
		return XST_FAILURE;
	}
//			    xil_printf("Read data: 0x");
	for (Index = 0; Index < numbytes; Index++) {
//					xil_printf("%02x", ReadBuffer[Index]);
		RegisterSpace[Index + 0x10] = ReadBuffer[Index];
	}
	ReadBuffer[Index] = 0;
//				xil_printf("\r\n");

	xil_printf("Read data: 0x");
	for (Index = 0; Index < 24; Index++) {
		if ((Index > 0) & ((Index % 4) == 0)) {
			xil_printf(" ");
		}
		xil_printf("%02x", RegisterSpace[Index]);
	}
	xil_printf("\r\n");

	for (def_freq_num = 0; def_freq_num < 4; def_freq_num++) {

		found_N = 0;
		N_prog = 0;
		if ((found_N != 1) & ((2 * freq) >= 1950) & ((2 * freq) <= 2600)) {
			N_prog = 2;
			found_N = 1;
		}
		if ((found_N != 1) & ((3 * freq) >= 1950) & ((3 * freq) <= 2600)) {
			N_prog = 3;
			found_N = 1;
		}
		if ((found_N != 1) & ((4 * freq) >= 1950) & ((4 * freq) <= 2600)) {
			N_prog = 4;
			found_N = 1;
		}
		if ((found_N != 1) & ((5 * freq) >= 1950) & ((5 * freq) <= 2600)) {
			N_prog = 5;
			found_N = 1;
		}
		for (Index = 6; Index < 127; Index = Index + 2) {
			if ((found_N != 1) & ((Index * freq) >= 1950)
					& ((Index * freq) <= 2600)) {
				N_prog = Index;
				found_N = 1;
			}
		}
		if (found_N != 1) {
			N_prog = 0;
		}
//				printf("N_prog = %02x\n", N_prog);

		M_prog = ((N_prog * freq) / 114.285);
//				printf("M_prog = %4.4f\n", M_prog);
		MINT_prog = (int) M_prog;
//				printf("MINT_prog = %02x\n", MINT_prog);
		M_frac = M_prog - MINT_prog;
//				printf("M_frac = %4.4f\n", M_frac);
		MFRAC_prog = (int) (M_frac * 262144);
//				printf("MFRAC_prog = %05x\n", MFRAC_prog);

		RegisterSpace[0 + def_freq_num] = (RegisterSpace[0 + def_freq_num]
				& 0xC0) | (MINT_prog << 1 & 0x3E)
				| (MFRAC_prog >> 17 & 0x00000001);
		RegisterSpace[4 + def_freq_num] = (MFRAC_prog >> 9 & 0x000000FF);
		RegisterSpace[8 + def_freq_num] = (MFRAC_prog >> 1 & 0x000000FF);
		RegisterSpace[12 + def_freq_num] = (MFRAC_prog << 7 & 0x00000010)
				| N_prog;

		Address = 0;
		numbytes = 16;

		/*
		 * Initialize the data to write and the read buffer.
		 */
		if (sizeof(Address) == 1) {
			WriteBuffer[0] = (u8) (Address);
		} else {
			WriteBuffer[0] = (u8) (Address >> 8);
			WriteBuffer[1] = (u8) (Address);
			ReadBuffer[Index] = 0;
		}

		for (Index = 0; Index < numbytes; Index++) {
			WriteBuffer[sizeof(Address) + Index] = RegisterSpace[Index];
		}

		Status = EepromWriteData(sizeof(Address) + numbytes);
		if (Status != XST_SUCCESS) {
			xil_printf("Failed to write to the EEPROM\r\n");
			return XST_FAILURE;
		}

		xil_printf("\r\n");

	}

	// read again

	ReadBuffer[Index] = 0;
	xil_printf("here\r\n");

	Address = 0x10;
	numbytes = 0x8;
	/*
	 * Initialize the read buffer.
	 */
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	} else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
		ReadBuffer[Index] = 0;
	}

	for (Index = 0; Index < numbytes; Index++) {
		WriteBuffer[sizeof(Address) + Index] = 0xFF;
		ReadBuffer[Index] = 0;
	}

//				xil_printf("Reading 0x%02x bytes of data from address 0x%02x\n", numbytes, Address);
	Status = EepromReadData(ReadBuffer, numbytes, Address);
	if (Status != XST_SUCCESS) {
		xil_printf("Failed to read from the Clock Generator\r\n");
		return XST_FAILURE;
	}
//			    xil_printf("Read data: 0x");
	for (Index = 0; Index < numbytes; Index++) {
//					xil_printf("%02x", ReadBuffer[Index]);
		RegisterSpace[Index + 0x10] = ReadBuffer[Index];
	}
	ReadBuffer[Index] = 0;
//				xil_printf("\r\n");

	xil_printf("Raw Register data: 0x");
	for (Index = 0; Index < 24; Index++) {
		if ((Index > 0) & ((Index % 4) == 0)) {
			xil_printf(" ");
		}
		xil_printf("%02x", RegisterSpace[Index]);
	}
	xil_printf("\r\n");

	for (def_freq_num = 0; def_freq_num < 4; def_freq_num++) {
		MINT[def_freq_num] = ((RegisterSpace[0 + def_freq_num] >> 1)
				& ~(~0 << 5));
		MFRAC[def_freq_num] = (((RegisterSpace[0 + def_freq_num] & ~(~0 << 1))
				<< 17) | RegisterSpace[4 + def_freq_num] << 9
				| RegisterSpace[8 + def_freq_num] << 1
				| ((RegisterSpace[12 + def_freq_num] & (~0 << 7)) >> 7));
		N[def_freq_num] = (RegisterSpace[12 + def_freq_num] & ~(~0 << 7));
		P[def_freq_num] = 0x01;
		f_out[def_freq_num] = (f_xtal
				* (MINT[def_freq_num] + (MFRAC[def_freq_num] / 262144.0))
				/ (P[def_freq_num] * N[def_freq_num]));
		printf("F%d = %4.2f MHz\n", def_freq_num,
				(f_out[def_freq_num] / 1.0e6));
	}
	printf("\n");

	DisableInterruptSystem(&IicInstance, i2c_intr_id);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
 * This function setups the interrupt system so interrupts can occur for the
 * IIC device. The function is application-specific since the actual system may
 * or may not have an interrupt controller. The IIC device could be directly
 * connected to a processor without an interrupt controller. The user should
 * modify this function to fit the application.
 *
 * @param	IicInstPtr contains a pointer to the instance of the IIC device
 *		which is going to be connected to the interrupt controller.
 *
 * @return	XST_SUCCESS if successful else XST_FAILURE.
 *
 * @note		None.
 *
 ******************************************************************************/
static int SetupInterruptSystem(XIic * IicInstPtr, int INT_ID) {
	int Status;

	if (InterruptController.IsStarted == XIL_COMPONENT_IS_STARTED) {
		return XST_SUCCESS;
	}

	/*
	 * Initialize the interrupt controller driver so that it's ready to use.
	 */
	Status = XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(&InterruptController, INT_ID,
			(XInterruptHandler) XIic_InterruptHandler, IicInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller so interrupts are enabled for all
	 * devices that cause interrupts.
	 */
	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts for the IIC device.
	 */
	XIntc_Enable(&InterruptController, INT_ID);

	/*
	 * Initialize the exception table.
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XIntc_InterruptHandler,
			&InterruptController);

	/*
	 * Enable non-critical exceptions.
	 */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

static void DisableInterruptSystem(XIic * IicInstPtr, int INT_ID) {

	/*
	 * Disconnect the device driver handler
	 */
	XIntc_Disconnect(&InterruptController, INT_ID);

#ifndef TESTAPP_GEN
	/*
	 * Disable non-critical exceptions.
	 */
	Xil_ExceptionDisable();
#endif

#ifndef TESTAPP_GEN
	/*
	 * Stop the interrupt controller such that interrupts are disabled for
	 * all devices that cause interrupts
	 */
	XIntc_Stop(&InterruptController);
#endif
}

/*****************************************************************************/
/**
 * This Send handler is called asynchronously from an interrupt
 * context and indicates that data in the specified buffer has been sent.
 *
 * @param	InstancePtr is not used, but contains a pointer to the IIC
 *		device driver instance which the handler is being called for.
 *
 * @return	None.
 *
 * @note		None.
 *
 ******************************************************************************/
static void SendHandler(XIic *InstancePtr) {
	TransmitComplete = 0;
}

/*****************************************************************************/
/**
 * This Receive handler is called asynchronously from an interrupt
 * context and indicates that data in the specified buffer has been Received.
 *
 * @param	InstancePtr is not used, but contains a pointer to the IIC
 *		device driver instance which the handler is being called for.
 *
 * @return	None.
 *
 * @note		None.
 *
 ******************************************************************************/
static void ReceiveHandler(XIic *InstancePtr) {
	ReceiveComplete = 0;
}

/*****************************************************************************/
/**
 * This Status handler is called asynchronously from an interrupt
 * context and indicates the events that have occurred.
 *
 * @param	InstancePtr is a pointer to the IIC driver instance for which
 *		the handler is being called for.
 * @param	Event indicates the condition that has occurred.
 *
 * @return	None.
 *
 * @note		None.
 *
 ******************************************************************************/
static void StatusHandler(XIic *InstancePtr, int Event) {

}
