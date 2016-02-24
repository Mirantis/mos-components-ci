#!/bin/bash

source functions/resources.sh
import_config ${1}

test -f mos_version.env && source mos_version.env

py27_virtualenv
python -c "from componentspython import nailgun; nailgun.get_snapshot('"${vm_master_ip}"')"
