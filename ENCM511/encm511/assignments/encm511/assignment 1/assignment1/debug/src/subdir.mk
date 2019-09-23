################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/CoffeePot_main.cpp \
../src/MyCoffeePotFunctionsCPP.cpp \
../src/MyDoSimulationCPP.cpp 

ASM_SRCS += \
../src/TurnOnHeatASM.asm \
../src/TurnOnWaterASM.asm 

OBJS += \
./src/CoffeePot_main.doj \
./src/MyCoffeePotFunctionsCPP.doj \
./src/MyDoSimulationCPP.doj \
./src/TurnOnHeatASM.doj \
./src/TurnOnWaterASM.doj 

ASM_DEPS += \
./src/TurnOnHeatASM.d \
./src/TurnOnWaterASM.d 

CPP_DEPS += \
./src/CoffeePot_main.d \
./src/MyCoffeePotFunctionsCPP.d \
./src/MyDoSimulationCPP.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.doj: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="Assignment1" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision any -g -D_DEBUG -I"H:\ENCM511_2014Workspace\Assignment1\system" -structs-do-not-overlap -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "$(basename $@).d" -c++ -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.doj: ../src/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin Assembler'
	easmblkfn.exe -file-attr ProjectName="Assignment1" -proc ADSP-BF533 -si-revision any -g -D_DEBUG -i"H:\ENCM511_2014Workspace\Assignment1\system" -gnu-style-dependencies -MM -Mo "$(basename $@).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


