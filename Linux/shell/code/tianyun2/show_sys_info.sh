#!/usr/bin/env bash
PS3="Your choice is :"

os_check(){
    if [ -e /etc/redhat-release ]; then
        REDHAT=`cat /etc/redhat-release | cut -d ' ' -f1`
    else
        DEBIAN=`cat /etc/issue |cut -d ' ' -f1`
    fi

    if [ "$REDHAT" == "CentOS" -o "$REDHAT" == "Red" ]; then
        P_M=yum
    elif [ "$DEBIAN" == "Ubuntu" -o "$DEBIAN" == "ubuntu" ]; then
        P_M=apt-get
    else
        Operating system does not support
        exit 1
    fi

    if [ $LOGNAME != 'root' ]; then
        echo "you are'n root"
        exit 2
    fi

    if ! which vmstat &> /dev/null; then
        echo "vmstat command not found. new the install"
        sleep 1
        os_check
        $P_M install procps -y
        echo "------------------------------------------------------------"
    fi

    if [ $? -ne '0' ]; then
        exit 3
    fi

    if ! which iostat &> /dev/null; then
        echo "iostat command not found. new the install"
        sleep 4
        os_check
        $P_M install sysstat -y
        echo "------------------------------------------------------------"
    fi

    while true;
    do
        select input in cpu_load disk_load disk_use disk_inode mem_use tcp_status cpu_top10 mem_top10 traffic quit
        do
            case $input in
                cpu_load)
                    #cpu 使用与负载
                    echo "---------------------------------------"
                    i=1
                    while [[ $i -le 3 ]];
                    do
                        echo -e "\033[32m  参考值${i}\033[0m"
                        UTIL=`vmstat |awk '{if(NR==3)print 100-$15"%"}'`
                        USER=`vmstat |awk '{if(NR==3)print $13"%"}'`
                        SYS=`vmstat |awk '{if(NR==3)print $14"%"}'`
                        IOWIAT=`vmstat |awk '{if(NR==3)print $16"%"}'`
                        echo "Util:$UTIL"
                        echo "User use:$USER"
                        echo "System use:$SYS"
                        echo "I/O wait:$IOWAIT"
                        let i++
                        sleep 1
                    done
                    break
                    ;;

                disk_load)
                    #I/O负载
                    echo "----------------------------------------------------------"
                    i=1
                    while true :
                    do
                        echo -e "\033[32m 参考值${i}\033[0m"
                        UTIL=`iostat -x -k |awk '/^[v|s]/{OFS=": ";print $1,$NF"%"}'`
                        READ=`iostat -x -k |awk '/^[v|s]/{OFS=": ";print $1,$6"KB"}'`
                        WRITE=`iostat -x -k |awk '/^[v|s]/{OFS=": ";print $1,$7"KB"}'`
                        IOWAIT=`vmstat |awk '{if(NR==3)print $16"%"}'`
                        break
                        echo -e "Util:"
                        echo -e "${UTIL}:"
                        echo -e "I/O Wait: $IOWAIT"
                        echo -e "Read/s:\n$READ"
                        echo -e "Write/s:\n$WRITE"
                        i=$(($i+1))
                        sleep 1
                    done
                    break
                    ;;

                disk_use)
                    #硬盘使用
                    DISK_LOG=/tmp/disk_use.tmp
                    DISK_TOTAL=`fdisk -l |awk '/^Disk.*bytes/ && /\/dev/ {printf $2" ";printf "%d", $3;print "GB"}'`
                    USE_RATE=`df -h |awk '/^\/dev/{print int($5)}'`
                    for i in $USE_RATE;
                    do
                        if [ $i -gt 90 ]; then
                            PART=`df -h |awk '{ if(int($5) == '''$i''') print $6 }'`
                            echo "$PART = ${i}%" >> $DISK_LOG
                        fi
                    done
                    echo "----------------------------------------------------------"
                    echo -e "Disk total:\n%${DISK_TOTAL}"
                    if [ -f $DISK_LOG ]; then
                        echo "--------------------------------------------------------"
                        cat $DISK_LOG
						echo "--------------------------------------------------------"
						rm -f $DISK_LOG
					else
						echo "--------------------------------------------------------"
						echo "Disk use rate no than 90% of the partion"
						echo "--------------------------------------------------------"
                    fi
                    break
                    ;;

                disk_inode)

                    break
                    ;;

                mem_use)
                    break
                    ;;

                tcp_status)
                    break
                    ;;

                cpu_top10)
                    break
                    ;;

                mem_top10)
                    break
                    ;;

                traffic)
                    break
                    ;;

                quit)
                    exit
                    ;;

            esac
        done
    done

}
