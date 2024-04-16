#!/bin/sh

packages=$(checkupdates | wc -l)

if [ "$packages" = 0 ]
then
  exit 0
fi

echo "$packages "
