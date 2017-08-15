#!/bin/bash
#!/bin/bash
#tThis is a sscript to

1) Based on a user input parameter display the status of security - firewalld  and selinux on a Linux system

2) Based on a user input parameter temporally enable or disable security - firewalld and selinux

3) Based on a user input parameter permanently enable or disable  firewalld and selinux   - This means the altered status will survive a system reboot

4) Manually rerun the script to check the status of the services to validate changes made to the configuration

5) The script should output to the user  the progress of changing the status to services

6) On your submission, provide

    a) the script you built (standard .sh file is ok)

    b) word doc of screenshots notifying the user of the status and progress of  changes to  security services

    while test $# -gt 0; do
            case "$1" in
                    -h|--help)
                            echo '-se'
                            echo 'For SElinux Options'
                            echo '-fd'
                            echo 'For Firewall do Options'
                            exit
                            ;;
                    -se)
                            shift
                            if test $# -gt 0; then
                              sestatus
                              echo 'would you like to enable or diable selinux?'
                              echo '0 to disable'
                              echo '1 to enable'
                              read userChoice
                              case $serChoice
                                0)
                                  shift
                                  setenforce 0
                                  sestatus
                                  ;;

                                1)
                                  shift
                                  setenforce 1
                                  sestatus
                                  ;;
                                *)
                                  echo 'your imput makes me sad :('
                            else
                              echo 'you did not give me an option'
                            break
                            else
                                    echo 'use -h for help'
                                    exit 1
                            fi
                            exit
                            shift
                            ;;
                    -fd)
                            shift
                            if test $# -gt 0; then

            esac
