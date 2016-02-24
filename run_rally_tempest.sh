#!/bin/bash

#    Copyright 2014 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

source functions/resources.sh
import_config ${1}

# Log parameters
LOGGING_PATH=${LOGGING_PATH:-"logs/"}
LOG_NAME=${LOG_NAME:-"log.txt"}

INSTALL_RALLY_TEMPEST_LOGGING_PATH=${INSTALL_RALLY_TEMPEST_LOGGING_PATH:-"${LOGGING_PATH}"}
INSTALL_RALLY_TEMPEST_LOG_NAME=${INSTALL_RALLY_TEMPEST_LOG_NAME:-"install_rally_tempest_log.txt"}

export LOGGING_PATH=${LOGGING_PATH:-"logs/"}
export LOG="${LOGGING_PATH}${LOG_NAME}"
export INSTALL_RALLY_TEMPEST_LOG="${INSTALL_RALLY_TEMPEST_LOGGING_PATH}${INSTALL_RALLY_TEMPEST_LOG_NAME}"

if [ ! -d "${LOGGING_PATH}" ]; then
    mkdir ${LOGGING_PATH}
    touch ${LOG}
    chmod 666 ${LOG}
fi

# Create and use python virtualenv
virtualenv
check_return_code_after_command_execution $? "Create virtualenv is failed."

#   Run tests for project
./actions/install_rally_tempest.sh
