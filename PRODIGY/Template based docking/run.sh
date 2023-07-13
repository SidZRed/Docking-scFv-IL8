#!/bin/bash
# ===========================================================================
#    Automated script generated by the CSB server for PRODIGY execution
# ===========================================================================
# July 13, 2023 20:22:51 UTC
# ===========================================================================
outputfile="output.out"

echo "# ===========================================================================" &>> $outputfile
log="complex.log"


cmd="/usr/local/bin/prodigy complex.pdb --selection A C --temperature 36.0 --contact_list --pymol_selection"

echo "command: $cmd" &>> $outputfile

$cmd &> $log
status=$?
echo "exit status: $status" &>> $outputfile
echo "log:" &>> $outputfile
cat $log >> $outputfile


exit $status
# ===========================================================================