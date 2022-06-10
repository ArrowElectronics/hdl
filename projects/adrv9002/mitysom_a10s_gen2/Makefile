####################################################################################
## Copyright 2018(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################

PROJECT_NAME := adrv9002_mitysom_a10s

M_DEPS += ../common/adrv9002_qsys_cssi.tcl
M_DEPS += ../common/adrv9002_qsys_lssi.tcl
M_DEPS += ../../common/mitysom_a10s/mitysom_a10s_system_qsys.tcl
M_DEPS += ../../common/mitysom_a10s/mitysom_a10s_system_assign.tcl
M_DEPS += ../../common/mitysom_a10s/mitysom_a10s_plddr4_dacfifo_qsys.tcl
M_DEPS += ../../common/mitysom_a10s/mitysom_a10s_plddr4_assign.tcl

LIB_DEPS += axi_adrv9001
LIB_DEPS += axi_dmac
LIB_DEPS += util_pack/util_cpack2
LIB_DEPS += util_pack/util_upack2

include ../../scripts/project-intel.mk

build:
	@echo "Enter the interface type (CSSI OR LSSI):"
	@echo " *For CMOS SSI '1' and For LVDS SSI enter '0'"
	read -p " : " CONTINUE && echo "$$CONTINUE" > "interface_selection"; \
	[ $$CONTINUE = 0 ]|| [ $$CONTINUE = 1 ] ||(echo "wrong input Exiting..."; exit 1;)
	make all
