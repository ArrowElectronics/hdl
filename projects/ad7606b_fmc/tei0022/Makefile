####################################################################################
## Copyright 2018(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################

PROJECT_NAME := ad7606b_fmc_tei0022

M_DEPS += ../common/ad7606b_qsys.tcl
M_DEPS += ../../common/tei0022/tei0022_system_qsys.tcl
M_DEPS += ../../common/tei0022/tei0022_system_assign.tcl

LIB_DEPS += axi_dmac
LIB_DEPS += axi_ad7616_06b

include ../../scripts/project-intel.mk

build:
	@echo "Enter the interface type (serial OR parallel):"
	@echo " *For serial enter '0' and For parallel enter '1'"
	read -p " : " CONTINUE && echo "$$CONTINUE" > "interface_selection"; \
	[ $$CONTINUE = 0 ]|| [ $$CONTINUE = 1 ] ||(echo "wrong input Exiting..."; exit 1;)
	make all


