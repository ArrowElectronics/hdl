##-----------------------------------------------------------------------------
# IMPORTANT: Set ad738x type for HDL build
#
#    ad738x_if- Defines the interface type (serial OR parallel)
#
# LEGEND: ad7380/ad7383/ad786   - 0  (these are 16 bit differential ADC)
#         ad7381/ad7384/ad7387  - 1  (these are 14 bit pseudo differential ADC)
#	  ad7388  		- 2  (these are 12 bit single ended ADC)
#
# NOTE : This switch is a 'hardware' switch. Please rebuild the
# design if the AD738x type has to been changed.
#
##------------------------------------------------------------------------------

#to compile HDL design run the command
--$make build

######o/p -->###################
"Enter the choice for the adc ::
 *For ad7380/ad7383/ad7386 enter '0' , For ad7381/ad7384/ad7387 enter '1' and For ad7388 enter '2' 
 : "
Building ad738x_fmc_tei0022 [___/projects/ad738x_fmc/tei0022/ad738x_fmc_tei0022_quartus.log] ..."

#console will ask for the user input for the interface type selection for hdl compile
#option available are as per mentioned above legends.
#other inputs will return error and build process will exit.