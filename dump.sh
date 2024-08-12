#!/bin/bash
echo ""
echo "LineageOS 20.x dump blob for Potter P Smart 2019"
echo "please put *.img in raw format here before start"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
echo "To generate proprietary files"
echo "cd dump && find $PWD -type f | sort > potter-files.txt"
echo ""
sleep 5

echo "Dump file from phone"
#rm -rf dump/
#mkdir dump/

#adb pull /system_root/system dump/
#adb pull /vendor dump/
#adb pull /product dump/
#adb pull /odm dump/
#adb pull /preavs dump/

echo "Start extraction"
sleep 5
sudo ./extract-files.sh potter ./dump/ > dump.log

echo "Reset owner"
sudo chown -R $(id -u):$(id -g) ./../../../vendor/huawei/*


echo "Umount all"
sleep 5


#rm -rf dump/system/
#rm -rf dump/vendor/
#rm -rf dump/product/
#rm -rf dump/odm/

