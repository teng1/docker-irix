#!/bin/bash

while true
do

./menu-header.sh

echo "* Download menu *"
echo ""
echo "1. Show 'df -Th' output"
echo "2. List 'IRIX' directory"
echo "3. Open a shell on 'IRIX' directory"
echo "4. Open Midnight Commander on 'IRIX' directory"
echo  ""
echo "5. Download IRIX 5.3"
echo "6. Download IRIX 6.2"
echo "7. Download IRIX 6.3 for O2 R5k and O2 R10k"
echo "8. Download IRIX 6.5.x (common for IRIX 6.5.x)"
echo "9. Download IRIX 6.5.0 (requires 6.5.x)"
echo "10. Download IRIX 6.5.7 (requires 6.5.x)"
echo "11. Download IRIX 6.5.22 (requires 6.5.x)"
echo "12. Download IRIX 6.5.30 (requires 6.5.x)"
echo "13. Download MIPSPro for IRIX 6.5.x"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  1)
    df -Th
    read -rsp "$enter_continue"
    ;;
    
  2)
    ls -l $localdir/IRIX
    read -rsp "$enter_continue"
    ;;
    
  3)
    cd $localdir/IRIX
    echo "type 'exit' to return to menu"
    $SHELL
    cd
    ;;

  4)
    cd $localdir/IRIX
    mc
    cd
    ;;

  5)
    ./dl-5.3.sh
    read -rsp "$enter_continue"
    ;;

  6)
    ./dl-6.2.sh
    read -rsp "$enter_continue"
    ;;

  7)
    ./dl-6.3.sh
    read -rsp "$enter_continue"
    ;;

  8)
    ./dl-6.5.x.sh
    read -rsp "$enter_continue"
    ;;

  9)
    ./dl-6.5.0.sh
    read -rsp "$enter_continue"
    ;;

  10)
    ./dl-6.5.7.sh
    read -rsp "$enter_continue"
    ;;

  11)
    ./dl-6.5.22.sh
    read -rsp "$enter_continue"
    ;;

  12)
    ./dl-6.5.30.sh
    read -rsp "$enter_continue"
    ;;

  13)
    ./dl-MIPSPro.sh
    read -rsp "$enter_continue"
    ;;

  99)
    exit
    ;;

  *)
    echo $try_again
    ;;
esac

done
