#!/bin/sh

# source /home/opc/.bashrc
MYDIR=/root/go-socks5-deepers
cd  $MYDIR
go build ss5

while :
do
  pids_num=`netstat -lnp |grep ':::23333' | wc -l`
  if [ $pids_num -eq 0 ]; then
    echo "" > log.file
    echo `date`"... pid_num: $pids_num" >> log.file
    echo restarting... >> log.file
    pwd >> log.file
    whoami >> log.file

    # Run
    nohup $MYDIR/ss5 > /dev/null &
  fi

  sleep 5
done