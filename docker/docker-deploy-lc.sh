#!/bin/bash
cd ../
ansible-playbook -i hosts --private-key /mnt/${PEM_FILE_NAME} site.yml