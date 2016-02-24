#!/bin/bash -e

#    Copyright 2016 Mirantis, Inc.
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

#
# This script runs specific tests(tempest/scenario) for any project if gate job
# or runs all tempest tests if project not specified or if periodic job.
#


source functions/product.sh
source functions/resources.sh
import_config ${1}

SSH_OPTIONS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

INSTALL_MOS_TEMPEST_RUNNER_LOG=${INSTALL_MOS_TEMPEST_RUNNER_LOG:-"install_rally_tempest_log.txt"}
RUN_TEMPEST_LOG=${RUN_TEMPEST_LOG:-"rally_tempest_log.txt"}
RUN_TEMPEST_LOGGING_PATH=${RUN_TEMPEST_LOGGING_PATH:-"."}

run_with_logs git clone https://github.com/Mirantis/mos-integration-tests/
cd mos-integration-tests
virtualenv venv
source venv/bin/activate
sudo docker build -t rally-tempest custom-scripts/rally-tempest/
sudo docker save -o ./dimage rally-tempest
sshpass -p 'r00tme' ${SSH_OPTIONS} dimage root@"${vm_master_ip}":/root/rally

sshpass -p 'r00tme' ${SSH_OPTIONS} scripts/install_rally.sh root@"${vm_master_ip}":/root/
ssh_to_master "chmod +x /root/run_rally.sh && /bin/bash -xe /root/run_rally.sh > /root/log.log"
