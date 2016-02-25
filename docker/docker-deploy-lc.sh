#!/bin/bash
cd ../
chmod 400 /mnt/${PEM_FILE_NAME}
sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg
ansible-playbook -i hosts --private-key /mnt/${PEM_FILE_NAME} site.yml