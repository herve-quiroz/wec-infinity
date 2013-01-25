#!/bin/bash

set -e

compiler="${1?$0 <compiler> <source> <target>}"
source="${2?$0 <compiler> <source> <target>}"
target="${3?$0 <compiler> <source> <target>}"

error="${source/.baf/.err}"

compiler_path="tools/aicompile/${compiler}"
if [ ! -x "${compiler_path}/aicompile.exe" ]
then
  echo "no such compiler: ${compiler_path}" >&2
  exit 1
fi

if [ ! -f "${source}" ]
then
  echo "no such source file: ${source}" >&2
  exit 1
fi

echo "${compiler_path}: ${source} -> ${target}" >&2

cygwin=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
esac

# TODO(herve-quiroz) make this work on other platform (e.g. Linux with Wine)
if [ ${cygwin} = "true" ]
then
  win_source=$(cygpath --windows "${source}")
  win_target=$(cygpath --windows "${target}")
  win_error=$(cygpath --windows "${error}")
else
  echo "TODO: only Cygwin is supported" >&2
  exit 1
fi

rm -f "${error}"
(cd tools/aicompile/${compiler} && cmd /c aicompile.exe FILE ..\\..\\..\\${win_source} ..\\..\\..\\${win_error} ..\\..\\..\\${win_target})
if [ -f "${error}" ]
then
	if [ `stat --format=%s ${error}` -gt 0 ]
	then
		rm -f "${target}"
		cat "${error}"
		false
	fi
fi
