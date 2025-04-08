/**
 ********************************************************************************
 * @file    ${file_name}
 * @author  ${user}
 * @date    ${date}
 * @brief
 ********************************************************************************
 */

#ifndef __DAL_UART_H_
#define __DAL_UART_H_

/************************************
 * INCLUDES
 ************************************/
#include <stdbool.h>
#include <stdint.h>
/************************************
 * MACROS AND DEFINES
 ************************************/

// Macro to link the module with the uart mcu peripheral
#define DEFINE_UART_MODULE_LINK(module, uart) \
    enum { module = uart }

// Macro to link all peripherals with the respective modules
#define DEFINE_ALL_UART_MODULE_LINKS()        \
    DEFINE_UART_MODULE_LINK(WIFI, DAL_UART3); \
    DEFINE_UART_MODULE_LINK(CONSOLE, DAL_UART4)
/************************************
 * TYPEDEFS
 ************************************/
// Enum to enumerate uarts
typedef enum
{
	DAL_UART0 = 0,
	DAL_UART1,
	DAL_UART2,
	DAL_UART3,
	DAL_UART4,
	DAL_UART_COUNT
}eDalUartNumber_t;
/************************************
 * EXPORTED VARIABLES
 ************************************/

/************************************
 * GLOBAL FUNCTION PROTOTYPES
 ************************************/
void DAL_UartInit(void);
bool DAL_UartTx(uint8_t * data, uint16_t dataSizes, uint8_t uart);


#endif /* __DAL_UART_H_ */
