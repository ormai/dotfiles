#!/usr/bin/env bash

PACKAGES=$(checkupdates | wc -l)

if [[ $PACKAGES == 0 ]]
then
  exit 0
fi

echo "$PACKAGES "
