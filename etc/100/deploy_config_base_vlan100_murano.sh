# Parameters for public network of master node
internet_interface=br-public
internet_int_type=bridge
internet_bootproto=dhcp
# eth0
internet_netmask=255.255.255.0
internet_gateway=172.18.162.1
internet_dns=172.18.176.6

private_interface=br-admin
private_int_type=bridge
public_interface=br-all
public_int_type=bridge

kvm_nodes_count=3

vm_slave_memory_mb=12288
vm_slave_disk_gb=200

fuel_master_install_timeout=120

mashines_count=1
#ipmi
mashine_1_host=cz7905-kvm.host-telecom.com
mashine_1_user=mosqa
mashine_1_role=Administrator
mashine_1_password=kVma4okZ2j6S71a

environment_settings=env_config_base.cfg

run_tests=false
