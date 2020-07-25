#! /bin/bash

npx -q -p renovate -c \
'for conf in *.json; do
  echo $conf
  cp $conf renovate.json
  renovate-config-validator
  RESULT=$((RESULT|$?))
  rm renovate.json
done
exit $RESULT'
