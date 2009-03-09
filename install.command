#!/bin/bash
# 
# install script for twitterBuddy
# (c) 2009 Benjamin Goering
#
# Bash code for this heavily borrowed/inspired by the icalBuddy install
# script. Download icalBuddy at http://hasseg.org/icalBuddy/
# (c) 2008-2009 Ali Rantakari
# 

DN=`dirname $0`
THISDIR="`cd $DN; pwd`"

BINDIR=/usr/local/bin
BINFILE="${THISDIR}/twitterBuddy"



if [ ! -e "${BINFILE}" ];then
	echo "Error: can not find twitterBuddy. Make sure you're running this script from within the distribution directory (the same directory where twitterBuddy resides.)"
	exit 1
fi
echo
echo "This script will install:"
echo
echo "Rubygems: htmlentities, twitter"
echo "twitterBuddy script to: ${BINDIR}"
echo
echo "We\'ll need administrator rights to install to this location so please enter your admin password when asked."
echo "Press any key to continue installing or Ctrl-C to cancel."
read
echo
sudo -v
if [ ! $? -eq 0 ];then echo "error! aborting."; exit 10; fi
echo

echo -n "Installing Rubygems: twitter, htmlentities"
sudo gem install twitter htmlentities
if [ ! $? -eq 0 ];then echo "...error! aborting."; exit 10; fi
echo "done."

echo -n "Creating directory..."
sudo mkdir -p ${BINDIR}
if [ ! $? -eq 0 ];then echo "...error! aborting."; exit 10; fi
echo "done."

echo -n "Installing the twitterBuddy ruby script..."
sudo cp -f "${BINFILE}" "${BINDIR}"
if [ ! $? -eq 0 ];then echo "...error! aborting."; exit 10; fi
echo "done."

echo 
echo "twitterBuddy has been successfully installed."
echo