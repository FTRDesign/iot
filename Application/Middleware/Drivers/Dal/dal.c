/**
 ********************************************************************************
 * @file    ${dal}
 * @author  ${Bruno Alves}
 * @date    ${10-20-2024}
 * @brief   Driver abstraction layer used to link the MCU peripheral drivers
 *          with the middleware library to external peripherals as ble, wifi chips
 *          and etc.
 ********************************************************************************
 */

/************************************
 * INCLUDES
 ************************************/
#include <dal.h>
#include "cmsis_os.h"
/************************************
 * EXTERN VARIABLES
 ************************************/

/************************************
 * PRIVATE MACROS AND DEFINES
 ************************************/

/************************************
 * PRIVATE TYPEDEFS
 ************************************/

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
  * @brief  Initialized mcu peripheral driver
  *
  *
  * @param  None
  * @retval None
  */
void DAL_IniPeripheraltDriver(void)
{
	// Initialize uart MCU driver
	DAL_UartInit();

	// Links all external peripherals, as wif, ble and etc
	// with the MCU's uart
	DEFINE_ALL_UART_MODULE_LINKS();
}

