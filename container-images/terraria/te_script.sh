#!/bin/bash
USERNAME='root'

# screen名
SCNAME='terraria'

# terrariaバイナリのpath
TE_PATH='/opt/terraria/'

# 実行するバイナリ
SERVICE='TerrariaServer'

ME=`whoami`

if [ $ME != $USERNAME ]; then
  echo "Please run the $USERNAME user."
  exit
fi

start() {
  if pgrep -u $USERNAME -f $SERVICE > /dev/null; then
    echo "$SERVICE is already running!"
    exit
  fi
  echo "Starting $SERVICE..."
  screen -AmdS $SCNAME  $TE_PATH/$SERVICE -config /opt/terraria/serverconfig.yaml
}

stop() {
  if pgrep -u $USERNAME -f $SERVICE > /dev/null; then
    echo "Stopping $SERVICE"
    screen -p 0 -S $SCNAME -X eval 'stuff "exit"\015'
    sleep 10
    echo "Stopped TerrariaServer"
    exit
  else
    echo "$SERVICE is not running!"
    exit
  fi
  screen -p 0 -S $SCNAME -X eval 'stuff "exit"\015'
}

status() {
  if pgrep -u $USERNAME -f $SERVICE > /dev/null; then
    echo "$SERVICE is already running!"
    exit
  else
    echo "$SERVICE is not running!"
    exit
  fi
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status
    ;;
  *)
    echo  $"Usage: $0 {start|stop|status}"
esac
