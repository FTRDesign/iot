################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/Middleware/Drivers/Dal/dal.c \
../Application/Middleware/Drivers/Dal/dal_uart.c 

OBJS += \
./Application/Middleware/Drivers/Dal/dal.o \
./Application/Middleware/Drivers/Dal/dal_uart.o 

C_DEPS += \
./Application/Middleware/Drivers/Dal/dal.d \
./Application/Middleware/Drivers/Dal/dal_uart.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Middleware/Drivers/Dal/%.o Application/Middleware/Drivers/Dal/%.su Application/Middleware/Drivers/Dal/%.cyclo: ../Application/Middleware/Drivers/Dal/%.c Application/Middleware/Drivers/Dal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -c -I../Application/Middleware/Drivers/Dal -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-Middleware-2f-Drivers-2f-Dal

clean-Application-2f-Middleware-2f-Drivers-2f-Dal:
	-$(RM) ./Application/Middleware/Drivers/Dal/dal.cyclo ./Application/Middleware/Drivers/Dal/dal.d ./Application/Middleware/Drivers/Dal/dal.o ./Application/Middleware/Drivers/Dal/dal.su ./Application/Middleware/Drivers/Dal/dal_uart.cyclo ./Application/Middleware/Drivers/Dal/dal_uart.d ./Application/Middleware/Drivers/Dal/dal_uart.o ./Application/Middleware/Drivers/Dal/dal_uart.su

.PHONY: clean-Application-2f-Middleware-2f-Drivers-2f-Dal

