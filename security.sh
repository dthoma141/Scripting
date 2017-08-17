#!/bin/bash
#If I new how to create objects in linux i would.
#I struggle with creating methods maybe that can be an extra assigment?



# In here nothing is set to persist after reboot.   Its all set up for me to do that but I did not find the commands.
#The way I know to do it is to go modiy the config files, I have a feeling im just missing some --perminit.
# flag or somthing of that nature
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
    echo 'please make a choice:';read choice;
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
    echo '0 to set permissive selinux till reboot'
    echo '1 to set enforcing selinux till reboot'
    getenforce
    echo 'please make a choice:';read choice;
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

-fd)
    # This currently will not survice reboot.
    echo '0 to disable selinux till reboot'
    echo '1 to set enforcing selinux till reboot'
    service firewalld status
    echo 'please make a choice:';read choice;
    case "$choice" in
    0)
        systemctl stop firewalld
        systemctl status firewalld
        ;;

    1)
        systemctl start firewalld
        service firewalld status
        ;;
    *)
        echo 'Thats bad imput :( I have to leave now'
        exit
      esac
      ;;

-FD)
    # This currently will not survice reboot.
    echo '0 to set permissive selinux till reboot'
    echo '1 to set enforcing selinux till reboot'
    systemctl status firewalld
    echo 'please make a choice:';read choice;
    case "$choice" in
    0)
        systemctl start firewalld
        systemctl status firewalld
        ;;

    1)
        systemctl stop firewalld
        systemctl status firewalld
        ;;
    *)
        echo 'Thats bad imput :( I have to leave now'
        exit
      esac
    ;;

esac
