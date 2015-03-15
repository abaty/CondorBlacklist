Condor Blacklist script, writting by Austin Baty on 3/15/2015

Usage:

Before starting a blacklist, please change 'abaty' to your user name in the condor_blacklist.sh file, in order to pick up your jobs.

Any time you have a hanging job, run the bash script.  This automatically detects the machines still running condor jobs and checks the blacklist to see if it is on it.  If it is not, it adds the machine to the blacklist.

In order to use the blacklist in order to prevent jobs being submitted to bad
machines, modify the example script provided in order to insert the blacklist
into your .condor file.  This example script checks your .condor file for the
line having

Requirements = blacklist_here

and replaces "blacklist_here" with the appropriate string.  There is currently
a bug in the submit code that sometimes causes the run.condor file to not
be copied appropriately to the new directory, but I cannot reproduce it.  Just
run the submit.sh code again if this happens.


