#!/bin/sh

# Compile and run a parallel C program with MPI.

set -e

fatal() {
  [ -n "$1" ] && echo "Error: $1"
  echo
  echo "$(basename "$0") [options] source.c ..."
  echo "Everything after source.c is passed as arguments to the executable"
  echo
  echo "Options:"
  echo "  -p nproc      Specify the number of processor to use"
  echo "  -t            Optimize compilation to time the execution"

  exit 1
}

CFLAGS="-Wall -Wextra -Wpedantic -g -Og"
LDLIBS="-lm"

while [ $# -gt 1 ] # parse options
do
  case "$1" in
    -t)
      CFLAGS=-O2
      shift
      ;;
    -p)
      [ -z "$2" ] && fatal "argument for -p not provided"
      processors="--oversubscribe -n $2"
      shift 2
      ;;
    *) break ;;
  esac
done

[ -z "$1" ] && fatal "sourcefile not provided"

exe="${1%%\.c}"
mpicc $CFLAGS "$1" -o "$exe" $LDLIBS
shift
mpirun $processors "$exe" "$@"
rm -f "$exe"
