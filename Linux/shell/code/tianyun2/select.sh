#!/usr/bin/env bash
PS3="Your choices is"
select choice in disk_partition filesystem cpu_load mem_util quit
do
    case "$choice" in
        disk_partition)
            fdisk -h
            ;;

        filesystem)
            df -h
            ;;

        cpu_load)
            uptime
            ;;

        mem_util)
            free -m
            ;;

        quir)
            break
            ;;

        *)
            ;;
    esac
done
