#!/bin/sh
# this script requires c++ compiler and cmake system
if [ $# -lt 1 ]; then
  echo "usage: ${0} target-project"
  exit 0
fi
target="${1}"
if [ -d "${target}" ]; then
  echo "building ${target} ..."
  cd "${target}" && cmake -B build . && cmake --build build && cd -
  echo "built status of ${target}: $?"
else
  echo "${target} doesn't exist!"
fi
