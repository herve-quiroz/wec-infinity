#!/bin/bash

set -e

compiler="${1?$0 <compiler> <source> <target>}"
source="${2?$0 <compiler> <source> <target>}"
target="${3?$0 <compiler> <source> <target>}"

error="${source/.baf/.err}"
win_source=$(cygpath --windows "${source}")
win_target=$(cygpath --windows "${target}")
win_error=$(cygpath --windows "${error}")

rm -f "${error}"
(cd ${compiler}/compiler && cmd /c aicompile.exe FILE ..\\..\\${win_source} ..\\..\\${win_error} ..\\..\\${win_target})
if [ -f "${error}" ]
then
	if [ `stat --format=%s ${error}` -gt 0 ]
	then
		rm -f "${target}"
		cat "${error}"
		false
	fi
fi
