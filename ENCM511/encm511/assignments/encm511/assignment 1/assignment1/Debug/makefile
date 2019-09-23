################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL := ${ComSpec}

-include ../makefile.init

RM := clean

# All of the sources participating in the build are defined here
-include sources.mk
-include system/startup_ldf/subdir.mk
-include system/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(DSP_DEPS)),)
-include $(DSP_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LINKER_LOG_OUTPUTS += \
linker_log.xml \


# All Target
all: Assignment1.dxe

# Tool invocations
Assignment1.dxe: $(OBJS) $(LDF_SRCS)
	@echo 'Building target: $@'
	@echo 'Invoking: CrossCore Blackfin Linker'
	ccblkfn.exe -proc ADSP-BF533 -si-revision any -TH:/ENCM511_2014Workspace/Assignment1/system/startup_ldf/app.ldf -no-mem -LH:/ENCM511_2014Workspace/Assignment1/Debug/system/startup_ldf C:/Analog\ Devices/CrossCore\ Embedded\ Studio\ 1.1.0/Blackfin/lib/bf532_rev_any/BlackfinBF533_CoffeePot_Library_Release_NoSPI.dlb -flags-link -MDDEBUG -add-debug-libpaths -o Assignment1.dxe $(OBJS) $(LDF_SRCS)  -flags-link -od,.\.
	@echo 'Finished building target: $@'
	@echo ' '

linker_log.xml: Assignment1.dxe $(OBJS) $(LDF_SRCS)

# Other Targets
clean:
	-$(RM) $(C++_DEPS)$(OBJS)$(C_DEPS)$(ASM_DEPS)$(CC_DEPS)$(DSP_DEPS)$(DXE)$(CPP_DEPS)$(LINKER_LOG_OUTPUTS)$(S_DEPS)$(CXX_DEPS) Assignment1.dxe
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
