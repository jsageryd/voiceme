#!/bin/sh

if [ -z "$SERVER" ]; then
  echo '$SERVER not set (set it to e.g. "irc.freenode.net")'
  exit 1
fi

if [ -z "$PORT" ]; then
  echo '$PORT not set (set it to e.g. "6667")'
  exit 1
fi

if [ -z "$NICK" ]; then
  echo '$NICK not set (set it to e.g. "iibot")'
  exit 1
fi

if [ -z "$PASS" ]; then
  echo '$PASS not set (set it to e.g. "hunter2")'
  exit 1
fi

if [ -z "$CHANNEL" ]; then
  echo '$CHANNEL not set (set it to e.g. "#mychannel")'
  exit 1
fi

mkfifo in
tail -f - > in &

while true; do
  (sleep 60 && printf ":j %s\n" "$CHANNEL" > in) &
  (sleep 30 && printf ":MODE %s -R\n" "$NICK" > in) &

  <in sic -h "$SERVER" -p "$PORT" -n "$NICK" -k "$PASS" |
  sed -u 's/:/ /' |
  while read -r chan date time nick msg; do
    if [ "$msg" == ".voiceme" ]; then
      echo "$chan: $date $time $nick $msg"
      nick="${nick#<}"
      nick="${nick%>}"
      printf ":MODE $CHANNEL +v $nick\n"
      printf ":MODE $CHANNEL +v $nick\n" >in
    elif [ "$msg" == ".devoiceme" ] || [ "$msg" == ".unvoiceme" ]; then
      echo "$chan: $date $time $nick $msg"
      nick="${nick#<}"
      nick="${nick%>}"
      printf ":MODE $CHANNEL -v $nick\n"
      printf ":MODE $CHANNEL -v $nick\n" >in
    fi
  done
  sleep 10
done
