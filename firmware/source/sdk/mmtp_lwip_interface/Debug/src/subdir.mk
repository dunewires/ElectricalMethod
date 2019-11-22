################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/echo.c \
../src/i2c_access.c \
../src/iic_program_clocks.c \
../src/main.c \
../src/mmUdpTx.c \
../src/platform.c \
../src/platform_mb.c \
../src/platform_ppc.c \
../src/platform_zynq.c \
../src/sfp.c \
../src/si5324.c \
../src/xiic_eeprom_example.c 

OBJS += \
./src/echo.o \
./src/i2c_access.o \
./src/iic_program_clocks.o \
./src/main.o \
./src/mmUdpTx.o \
./src/platform.o \
./src/platform_mb.o \
./src/platform_ppc.o \
./src/platform_zynq.o \
./src/sfp.o \
./src/si5324.o \
./src/xiic_eeprom_example.o 

C_DEPS += \
./src/echo.d \
./src/i2c_access.d \
./src/iic_program_clocks.d \
./src/main.d \
./src/mmUdpTx.d \
./src/platform.d \
./src/platform_mb.d \
./src/platform_ppc.d \
./src/platform_zynq.d \
./src/sfp.d \
./src/si5324.d \
./src/xiic_eeprom_example.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -I../mmTrigProc_bsp/microblaze_0/include -c -fmessage-length=0 -MT"$@" -I/home/nate/Downloads/mm_top.sdk/standalone_bsp_0/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mcpu=v9.5 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


