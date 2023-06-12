#!/bin/sh

# source /home/opc/.bashrc
cd /home/admin/vpn/goss5
go build ss5

while :
do
  pids_num=`netstat -lnp |grep ':::1080 ' | wc -l`
  if [ $pids_num -eq 0 ]; then
    echo "" > log.file
    echo `date`"... pid_num: $pids_num" >> log.file
    echo restarting... >> log.file
    pwd >> log.file
    whoami >> log.file

    # Run
    nohup /home/admin/vpn/goss5/ss5 > /dev/null &
  fi

  sleep 5
done