/**
 ********************************************************************************
 * @file    ${file_name}
 * @author  ${user}
 * @date    ${date}
 * @brief
 ********************************************************************************
 */

/************************************
 * INCLUDES
 ************************************/
#include <dal_uart.h>
#include "cmsis_os.h"
#include "usart.h"
/************************************
 * EXTERN VARIABLES
 ************************************/

/************************************
 * PRIVATE MACROS AND DEFINES
 ************************************/

#define UART_3 		3
#define UART_4 		4

// Define a table to Associate UART port and Peripheral Module
#define UART_MODULE_LINK_TABLE \
    PERIPHERAL_LINK(UART_3, WIFI)        \
    PERIPHERAL_LINK(UART_4, CONSOLE)

// Macro Auxiliar para Expansão
#define PERIPHERAL_LINK(uart, module) module = uart

// This board dependent and must to be adjusted
// to each customized board
#define NUMBER_OF_USED_UARTS		2

// Define the number of bytes used the uart buffer
#define UART_BUFFER_SIZE           32

/************************************
 * PRIVATE TYPEDEFS
 ************************************/

//
typedef struct
{
	bool Initialized;
	UART_HandleTypeDef * UartHandle;
	uint8_t UartBuffer[UART_BUFFER_SIZE];

}sDalUartConfig_t;

typedef struct
{
	bool Initialized;
	sDalUartConfig_t sDalUartConfig[NUMBER_OF_USED_UARTS];

}sDalConfig_t;

/************************************
 * STATIC VARIABLES
 ************************************/

/************************************
 * GLOBAL VARIABLES
 ************************************/

/************************************
 * STATIC FUNCTION PROTOTYPES
 ************************************/

/************************************
 * STATIC FUNCTIONS
 ************************************/

/************************************
 * GLOBAL FUNCTIONS
 ************************************/
/**
  * @brief  Send n amount of bytes through uart interface
  *
  * @note This function use mutex from FREERTOS to control
  *       access to this function.
  *       Task goes to idle states until the mutex be released
  *
  *
  * @param  data 	  	: Pointer to the data to be send
  * @param  dataSizes 	: Number of bytes to be send
  * @retval bool		: True of the data was send, false if not
  */
bool DAL_UartTx(uint8_t * data, uint16_t dataSizes)
{

	return true;
}

