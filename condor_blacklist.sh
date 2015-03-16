#!/bin/bash
condor_q $USER  | grep $USER | awk '{print "condor_q -l "$1" | grep RemoteHost"}'|bash|sed -e 's/^.*@/Machine!="/'>>temporary_blist.txt
echo "parsing blacklist to keep only 1 copy of each bad machine"
cat condor_blacklist.txt >> temporary_blacklist.txt
cat temporary_blacklist.txt | sort | uniq > condor_blacklist.txt

rm temporary_blist.txt 
