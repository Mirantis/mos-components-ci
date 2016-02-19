#!/bin/bash

ROOT=$(readlink -fn $(dirname $0)/.. )
find $ROOT -not -wholename \*.tox/\* -and -not -wholename \*.test/\* -and \( -name \*.sh -or -name \*rc -or -name functions\*.sh \) -print0 | xargs -0 bashate -v
