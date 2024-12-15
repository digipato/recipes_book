#!/bin/sh
set -u

echo "Usage: debug|local up|restart|down|logs"

DIR0="$(dirname "$(readlink -f "$0")")"
echo "$DIR0"

NAME="$(basename "$DIR0")"
echo "$NAME"

if [ $# -eq 0 ]; then
  echo "Devi passare almeno un parametro."
  exit 1
fi

echo "$1 $2"

cd ../_deploy/compose/"$1" || exit
pwd

if [ "$2" = "up" ]; then
  sudo docker compose up -d
elif [ "$2" = "restart" ]; then
  sudo docker compose restart
elif [ "$2" = "down" ]; then
  sudo docker compose down
elif [ "$2" = "logs" ]; then
  sudo docker compose logs -f --tail 1000
elif [ "$2" = "stop" ]; then
  sudo docker compose stop
fi

cd ../../app || exit