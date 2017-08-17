#!/bin/bash

case "$1" in
-h)
    # Nothing needs done
    echo -n "-se for senlinx"
    echo -n '-fd for firewall d'
    ;;

-se)
    # This currently will not survice reboot.
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
    *)
        echo 'Thats bad imput :( I have to leave now'
        exit
    esac
    ;;

-SE)
    # This currently will not survice reboot.
    echo '0 to disable selinux till reboot'
    echo '1 to enable selinux till reboot'
    getenforce
    read choice; echo 'please make a choice:'
    case "$choice" in
    0)
        setenforce 0
        getenforce
        ;;

    1)
        setenforce 1
        getenforce
        ;;
    *)
        echo 'Thats bad imput :( I have to leave now'
        exit
      esac
    ;;

esac
