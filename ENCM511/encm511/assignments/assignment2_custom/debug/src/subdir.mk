################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/Assignment2_ISR.cpp \
../src/Assignment2_Main.cpp \
../src/myBlackfin.cpp \
../src/myCoffeePotFunctions.cpp 

OBJS += \
./src/Assignment2_ISR.doj \
./src/Assignment2_Main.doj \
./src/myBlackfin.doj \
./src/myCoffeePotFunctions.doj 

CPP_DEPS += \
./src/Assignment2_ISR.d \
./src/Assignment2_Main.d \
./src/myBlackfin.d \
./src/myCoffeePotFunctions.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.doj: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="Assignment2_Custom" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision any -g -D_DEBUG -I"H:\ENCM511_2014Workspace\Assignment2_Custom\system" -structs-do-not-overlap -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "$(basename $@).d" -c++ -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


