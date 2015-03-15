#!/bin/bash
condor_q abaty  | grep sh | awk '{print "condor_q -l "$1" | grep RemoteHost"}'|bash|sed -e 's/^.*@/Machine!="/'>>temporary_blist.txt

echo "parsing blacklist to keep only 1 copy of each bad machine"
for i in $(cat temporary_blist.txt); do
  isdouble=0
  for j in $(cat condor_blacklist.txt); do
    if [ "$i" == "$j" ]
      then
      isdouble=1
    fi
  done
  if [ $isdouble == 0 ]
    then
    echo $i>>condor_blacklist.txt
    echo "Adding machine to black list:"$i
  fi
done

rm temporary_blist.txt
