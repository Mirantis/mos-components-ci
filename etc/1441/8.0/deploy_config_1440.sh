#!/bin/bash 

#    Copyright 2013 Mirantis, Inc.
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
iso_path=/home/vadim/iso/MirantisOpenStack-8.0.iso
private_interface=net-1440
private_int_type=network

# Parameters for public network of master node
internet_interface=net-p5p1
internet_int_type=network

#
kvm_nodes_count=0

# Master node settings
vm_master_cpu_cores=1
vm_master_memory_mb=1024
vm_master_disk_gb=200

vm_master_ip=10.20.1.2
vm_master_gateway=10.20.1.1
vm_master_netmask=255.255.255.0
vm_master_cidr=10.20.1.2/24
vm_master_net_size=256
vm_master_dhcp_pool_start=10.20.1.3
vm_master_dhcp_pool_end=10.20.1.254


# Settings for ipmi mashines

mashines_count=4

mashine_1_host=cz7334-kvm.host-telecom.com
mashine_1_user=engineer
mashine_1_role=Operator
mashine_1_password=PNUJedHGF22fd

mashine_2_host=cz7335-kvm.host-telecom.com
mashine_2_user=engineer
mashine_2_role=Operator
mashine_2_password=PNUJedHGF22fd

mashine_3_host=cz7336-kvm.host-telecom.com
mashine_3_user=engineer
mashine_3_role=Operator
mashine_3_password=PNUJedHGF22fd

mashine_4_host=cz7337-kvm.host-telecom.com
mashine_4_user=engineer
mashine_4_role=Operator
mashine_4_password=PNUJedHGF22fd

#mashine_5_host=cz7337-kvm.host-telecom.com
#mashine_5_user=engineer
#mashine_5_role=Operator
#mashine_5_password=PNUJedHGF22fd


# Name for env_settings file

environment_settings=env_config_1440_neutron_gre.cfg

# Parameters for configure env

add_iso_to_glance=true

# Install and run tempest tests using mos-scale project

run_tests=false

# Log parameters

ENABLE_COLOR=true
