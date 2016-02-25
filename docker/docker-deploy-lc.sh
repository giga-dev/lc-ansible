#!/bin/bash
cd ../
chmod 400 /mnt/${PEM_FILE_NAME}
ansible-playbook -i hosts --private-key /mnt/${PEM_FILE_NAME} site.yml