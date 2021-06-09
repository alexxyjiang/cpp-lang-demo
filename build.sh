#!/bin/sh
# this script requires c++ compiler and cmake system
if [ $# -lt 1 ]; then
  echo "usage: ${0} target-project [makefile-type/build-type]"
  exit 0
fi
target="${1}"
tags="$*"
mkfiletype="Unix Makefiles"
buildtype="Release"
for tag in "${tags}"; do
  if echo "${tag}" | grep -iq "ninja"; then
    mkfiletype="Ninja"
  fi
  if echo "${tag}" | grep -iq "debug"; then
    buildtype="Debug"
  fi
done

if [ -d "${target}" ]; then
  echo "[${0}] build ${buildtype} ${target} binaries with ${mkfiletype} ..."
  target_src_path="`pwd`/${target}"
  target_bin_path="./build/${target}"
  echo "[${0}] clean up ..."
  if [ -d "${target_bin_path}" ]; then
    rm -rf ${target_bin_path}
  fi
  mkdir -p ${target_bin_path}
  cd ${target_bin_path} &&
  cmake -G "${mkfiletype}" \
    -D CMAKE_BUILD_TYPE="${buildtype}" \
    ${target_src_path} &&
  cmake --build . && cd -
  echo "[${0}] build ${buildtype} ${target} binaries with ${mkfiletype} exit code $?"
else
  echo "[${0}] ${target} doesn't exist!"
fi
