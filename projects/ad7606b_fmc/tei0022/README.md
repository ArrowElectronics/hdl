##--------------------------------------------------------------
# IMPORTANT: Set ad7606b operation and interface mode
#
#    ad7606b_if  - Defines the interface type (serial OR parallel)
#
# LEGEND: Serial    - 0
#         Parallel  - 1
#
# NOTE : This switch is a 'hardware' switch. Please reimplenent the
# design if the variable has been changed.
#
##--------------------------------------------------------------


#to compile HDL design run the command
--$make build

#console will ask for the user input for the interface type selection for hdl compile
#option available are as per mentioned above.
#other inputs will return error and build process will exit.