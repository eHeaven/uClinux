#!/bin/sh

# make sure that NAT is working
#ping -c 4 -n sunrise
: ==== start ====
TESTNAME=basic-pluto-10
source /testing/pluto/bin/northlocal.sh

ipsec setup start
/testing/pluto/bin/wait-until-pluto-started
ipsec auto --add northnet--eastnet-nat

echo done
