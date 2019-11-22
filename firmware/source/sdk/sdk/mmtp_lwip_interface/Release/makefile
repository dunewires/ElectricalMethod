################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include .metadata/.plugins/org.eclipse.cdt.make.core/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
mmtp_lwip_interface.elf.size \


# All Target
all: mmtp_lwip_interface.elf secondary-outputs

# Tool invocations
mmtp_lwip_interface.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L/home/nate/Downloads/mm_top.sdk/standalone_bsp_0/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mcpu=v9.5 -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "mmtp_lwip_interface.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

mmtp_lwip_interface.elf.size: mmtp_lwip_interface.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size mmtp_lwip_interface.elf  |tee "mmtp_lwip_interface.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) mmtp_lwip_interface.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
