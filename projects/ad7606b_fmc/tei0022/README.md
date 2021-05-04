##--------------------------------------------------------------
# IMPORTANT: Set ad7606b operation and interface mode
#
#    ad7606b_if  - Defines the interface type (serial OR parallel)
#
# LEGEND: Serial    - 0
#         Parallel  - 1
#
# NOTE : This switch is a 'hardware' switch. Please rebuild the
# design if the interface has to been changed.
#
##--------------------------------------------------------------


#to compile HDL design run the command
--$make build

######o/p -->###################
"Enter the interface type (serial OR parallel):
 *For serial enter '0' and For parallel enter '1'
 : "
Building ad7606b_fmc_tei0022 [C:/Snehal_dev/Git_pulls_arrow/hdl_2/projects/ad7606b_fmc/tei0022/ad7606b_fmc_tei0022_quartus.log] ..."

#console will ask for the user input for the interface type selection for hdl compile
#option available are as per mentioned above legends.
#other inputs will return error and build process will exit.