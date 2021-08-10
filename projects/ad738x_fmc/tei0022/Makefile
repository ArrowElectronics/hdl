####################################################################################
## Copyright 2018(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################

PROJECT_NAME := ad738x_fmc_tei0022

M_DEPS += ../common/ad738x_qsys.tcl
M_DEPS += ../../common/tei0022/tei0022_system_qsys.tcl
M_DEPS += ../../common/tei0022/tei0022_system_assign.tcl

LIB_DEPS += axi_dmac

include ../../scripts/project-intel.mk

build:
	@echo "Enter the choice for the adc :"
	@echo " *For ad7380 enter '0' and For ad7381 enter '1'"
	read -p " : " CONTINUE && echo "$$CONTINUE" > "interface_selection"; \
	[ $$CONTINUE = 0 ]|| [ $$CONTINUE = 1 ] ||(echo "wrong input Exiting..."; exit 1;)
	make all


