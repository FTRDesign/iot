#############################################################################
# Makefile para STM32L475VGTX "iot"
# Gerado a partir do Makefile do STM32CubeIDE
# Uso: make [all|hex|size|clean]
################################################################################

# Toolchain
CC      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
SIZE    := arm-none-eabi-size

# Projeto
PROJECT   := iot
LDSCRIPT  := STM32L475VGTX_FLASH.ld

# Diretórios de código-fonte
SRC_DIRS := \
  Core/Src \
  Core/Startup \
  Drivers/STM32L4xx_HAL_Driver/Src \
  Middlewares/Third_Party/FreeRTOS/Source \
  Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F \
  Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang \
  Application/Middleware/Drivers/Dal

# Diretórios de include
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

# Flags de compilação
CFLAGS := \
  -mcpu=cortex-m4 -std=gnu11 -g3 \
  -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx \
  -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage \
  -MMD -MP \
  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb \
  $(INCLUDES)

# Flags de link
LDFLAGS := \
  -mcpu=cortex-m4 -T$(LDSCRIPT) \
  --specs=nosys.specs \
  -Wl,-Map=$(PROJECT).map \
  -Wl,--gc-sections -static --specs=nano.specs \
  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb \
  -Wl,--start-group -lc -lm -Wl,--end-group

# Descobre todos os .c e .s
SRCS := $(foreach d,$(SRC_DIRS),$(wildcard $(d)/*.c)) \
        $(wildcard Core/Startup/*.s)

# Objetos e dependências
OBJS := $(SRCS:.c=.o)
OBJS := $(OBJS:.s=.o)
DEPS := $(SRCS:.c=.d)

# Alvo padrão
all: $(PROJECT).elf

# Link
$(PROJECT).elf: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

# Compilação de fontes C
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Montagem de fontes assembly
%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

# Gerar arquivo HEX
hex: $(PROJECT).elf
	$(OBJCOPY) -O ihex $< $(PROJECT).hex

# Mostrar tamanho
size: $(PROJECT).elf
	$(SIZE) $<

# Limpeza
clean:
	rm -f $(OBJS) $(PROJECT).elf $(PROJECT).hex $(PROJECT).map $(DEPS)

# Inclui arquivos de dependência
-include $(DEPS)
