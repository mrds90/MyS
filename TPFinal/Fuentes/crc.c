/*
 * crc.c
 *
 *  Created on: 11 jun. 2022
 *      Author: mrds90
 */
#include "xparameters.h"
#include "xil_io.h"
#include "crc16_ip.h"
#include "sleep.h"
#include <stdint.h>

#define VECTOR_SIZE  25
#define DATA_IN_REG             CRC16_IP_S_AXI_SLV_REG0_OFFSET
#define DATA_ENABLE_REG         CRC16_IP_S_AXI_SLV_REG1_OFFSET
#define DATA_RESET_REG          CRC16_IP_S_AXI_SLV_REG2_OFFSET
#define CRC_RESULT_REG          CRC16_IP_S_AXI_SLV_REG3_OFFSET

#define Enable_CRC_IP()         (CRC16_IP_mWriteReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, DATA_ENABLE_REG, 1))
#define Disable_CRC_IP()        (CRC16_IP_mWriteReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, DATA_ENABLE_REG, 0))
#define Reset_CRC_IP()          (CRC16_IP_mWriteReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, DATA_RESET_REG, 1))
#define No_Reset_CRC_IP()       (CRC16_IP_mWriteReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, DATA_RESET_REG, 0))
#define Set_Data_CRC_IP(data)   (CRC16_IP_mWriteReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, DATA_IN_REG, (data)))
#define Get_CRC_IP()            (CRC16_IP_mReadReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR, CRC_RESULT_REG))


static uint8_t data_in = 0;

int main(void) {

	Reset_CRC_IP();
    Disable_CRC_IP();
    No_Reset_CRC_IP();
    xil_printf("PROGRAM START\r\n");

    while (1) {
    	data_in = inbyte();
    	if(data_in == 'r') {
    	    Reset_CRC_IP();
    	    xil_printf("RESET CRC \r\n");
    	}
    	else {
            No_Reset_CRC_IP();
            Set_Data_CRC_IP(data_in);
            xil_printf("DATA WRITTEN %.2X\r\n", CRC16_IP_mReadReg(XPAR_CRC16_IP_0_S_AXI_BASEADDR,DATA_IN_REG));
            Enable_CRC_IP();
            uint32_t crc = Get_CRC_IP();
            xil_printf("CRC: %.4X\r\n", crc);
            Disable_CRC_IP();
            xil_printf("*************\r\n");
    	}
    }
}

