################################################################################
# Makefile para STM32L475VGTX "iot"
################################################################################

CC      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
SIZE    := arm-none-eabi-size

PROJECT := iot
LDSCRIPT := STM32L475VGTX_FLASH.ld

SRC_DIRS := \
  Core/Src \
  Core/Startup \
  Drivers/STM32L4xx_HAL_Driver/Src \
  Middlewares/Third_Party/FreeRTOS/Source \
  Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F \
  Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang \
  Application/Middleware/Drivers/Dal

INCLUDES := \
  -ICore/Inc \
  -IDrivers/STM32L4xx_HAL_Driver/Inc \
  -IDrivers/STM32L4xx_HAL_Driver/Inc/Legacy \
  -IDrivers/CMSIS/Device/ST/STM32L4xx/Include \
  -IDrivers/CMSIS/Include \
  -IMiddlewares/Third_Party/FreeRTOS/Source/include \
  -IMiddlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 \
  -IMiddlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F \
  -IMiddlewares/Third_Party/FreeRTOS/Source/portable/MemMang \
  -IApplication/Middleware/Drivers/Dal

CFLAGS := \
  -mcpu=cortex-m4 -std=gnu11 -g3 \
  -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx \
  -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage \
  -MMD -MP \
  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb \
  $(INCLUDES)

LDFLAGS := \
  -mcpu=cortex-m4 -T$(LDSCRIPT) \
  --specs=nosys.specs \
  -Wl,-Map=$(PROJECT).map \
  -Wl,--gc-sections -static --specs=nano.specs \
  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb \
  -Wl,--start-group -lc -lm -Wl,--end-group

SRCS := $(foreach d,$(SRC_DIRS),$(wildcard $(d)/*.c)) \
        $(wildcard Core/Startup/*.s)

OBJS := $(SRCS:.c=.o)
OBJS := $(OBJS:.s=.o)
DEPS := $(SRCS:.c=.d)

all: $(PROJECT).elf

$(PROJECT).elf: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

hex: $(PROJECT).elf
	$(OBJCOPY) -O ihex $< $(PROJECT).hex

size: $(PROJECT).elf
	$(SIZE) $<

clean:
	rm -f $(OBJS) $(PROJECT).elf $(PROJECT).hex $(PROJECT).map $(DEPS)

-include $(DEPS)

