#!/bin/bash

case "$1" in
-h)
    # Nothing needs done
    echo -n "-se for senlinx"
    echo -n '-fd for firewall d'
    ;;

-se)
    echo '0 to disable selinux till reboot'
    echo '1 to enable selinux till reboot'
    sestatus
    read choice; echo 'please make a choice:'
    case "$choice" in
    0)
        setenforce 0
        sestatus
        ;;

    1)
        setenforce 1
        sestatus
        ;;
    esac
    ;;
esac
