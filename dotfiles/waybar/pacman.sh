#!/bin/bash

PACKAGES=$(checkupdates | wc -l)

[[ $PACKAGES == 0 ]] && exit 0

echo $PACKAGES 
