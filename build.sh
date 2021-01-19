#!/bin/sh
# this script requires c++ compiler and cmake system
if [ $# -lt 1 ]; then
  echo "usage: ${0} target-project [make-type]"
  exit 0
fi
target="${1}"
mktype="${2}"
if [ -d "${target}" ]; then
  echo "building ${target} ..."
  if [ -d "${target}/build" ]; then
    cd "${target}/build" && rm -rf * && cd -
  fi
  if echo "${mktype}" | grep -iq "ninja"; then
    cd "${target}" && cmake -G "Ninja" -B build . && cmake --build build && cd -
  else
    cd "${target}" && cmake -G "Unix Makefiles" -B build . && cmake --build build && cd -
  fi
  echo "built status of ${target}: $?"
else
  echo "${target} doesn't exist!"
fi
