#!/bin/bash

set +x
mypath=$(pwd)

cd /root/Stuff/myTools/pycrawl
./pycrawl.py > $mypath/pycrawl_$(date +%y%m%d).txt

cd /root/Stuff/myTools/CVEalert
./fetch_source.sh
./CVE.test.py > $mypath/cve_$(date +%y%m%d).txt

cd ~/Stuff/myTools/linkerVeille
./linkerVeille.py -d $(date +%Y/%m/%d --date yesterday) > $mypath/linker_$(date +%y%m%d).html

cd $mypath
git add -A
git commit -m "auto"
git push
set -x

