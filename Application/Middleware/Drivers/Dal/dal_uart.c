/**
 ********************************************************************************
 * @file    ${dal_uart}
 * @author  ${Bruno Alves}
 * @date    ${10-18-2024}
 * @brief   Driver abstraction layer used to link the MCU peripheral drivers
 *          with the middleware library to external peripherals as ble, wifi chips
 *          and etc.
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

// This board dependent and must to be adjusted
// to each customized board
#define NUMBER_OF_USED_UARTS		4

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

}sDalUart_t;

typedef struct
{
	bool Initialized;
	sDalUart_t sDalUartConfig[NUMBER_OF_USED_UARTS];

}sDalUartConfig_t;

/************************************
 * STATIC VARIABLES
 ************************************/

sDalUartConfig_t DalUartConfig = {.Initialized = false};

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
  * @brief  Link MCU UART handle Structure definition
  *			with dal uart setup
  *
  *
  * @param  None
  * @retval None
  */
void DAL_UartInit(void)
{
	if (!DalUartConfig.Initialized)
	{
		// This is MCU dependent and must to be replaced if a new mcu
		// must to be used
		DalUartConfig.sDalUartConfig[DAL_UART3].UartHandle =  &huart3;
		DalUartConfig.sDalUartConfig[DAL_UART4].UartHandle =  &huart4;

		DalUartConfig.Initialized = true;
	}
}

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
bool DAL_UartTx(uint8_t * data, uint16_t dataSizes, uint8_t uart)
{
	// is uart inside of the limits?
	if (uart < DAL_UART_COUNT)
	{
		if ((DalUartConfig.sDalUartConfig[uart].UartHandle != NULL) && (dataSizes > 0) && (data != NULL))
		{
			HAL_UART_Transmit_IT(DalUartConfig.sDalUartConfig[uart].UartHandle, data, dataSizes);
		}
	}

	return false;
}

