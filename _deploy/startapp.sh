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

cd compose/"$1" || exit
pwd

if [ "$2" = "up" ]; then
  docker compose up -d
elif [ "$2" = "restart" ]; then
  docker compose restart
elif [ "$2" = "down" ]; then
  docker compose down
elif [ "$2" = "logs" ]; then
  docker compose logs -f --tail 1000
elif [ "$2" = "stop" ]; then
  docker compose stop
fi

cd ../..