#!/bin/sh
set -x

#Author : Guillermo Reales & Anthony La Torre
#Commands required for a single spe/LO callibration
#Script follows here:

echo "Starting Time:"
date +"%D %T"

# IF error "Permission denied" run:
# chmod u+r+x <filename>.sh

# IF variable gives error "Command not recognize"
# Remember that the equal sign can have no spaces to the variable name

### VARIABLES
# * LYSO barcode
Lcode="526"
# * Date
date=$(date +%m%d%Y)
# * Bias Voltage
BV="42"
# * Jumper Position
jp="5"
# * Extra
EXTRA="Kai_test"
# Creating filenames
lspe="spe_settings.hdf5"
lp511="511_settings.hdf5"
spe_hdf5="sodium_spe_${Lcode}LYSO_${date}_${BV}v${EXTRA}.hdf5"
spe_root="sodium_spe_${Lcode}LYSO_${date}_${BV}v${EXTRA}.root"
p511_hdf5="sodium_p511_${Lcode}LYSO_${date}_${BV}v${EXTRA}.hdf5"
p511_root="sodium_p511_${Lcode}LYSO_${date}_${BV}v${EXTRA}.root"

# * number of events
ne=20000
# * ipadress
ipad="192.168.0.182"

python3 clear_temp_data.py

python3 test_write.py

# First 4 arguments are in this order:
# Channel 1 SiPM Number
ch1SiPMNum="028"
# Channel 1 Jumper Position (Position 1 is closest to the channel outlets)
ch1jp="5"
# Channel 2 SiPM Number
ch2SiPMNum="029"
# Channel 2 Jumper Position (Position 1 is closest to the channel outlets)
ch2jp="5"
# Number of Channel Specific Args
ChSpecArgs="4"

python3 save_data.py "$ChSpecArgs" "$ch1SiPMNum" "$ch1jp" "$ch2SiPMNum" "$ch2jp" BV "$BV" "Number of Events" "$ne" Lcode "$Lcode" Date "$date" Extra "$EXTRA"

echo "Ending time : "
date +"%D %T"
# Upgrades required:
# * check that the fit can be done in the background to check both fit plots
# * add data to csv / excel automatically
