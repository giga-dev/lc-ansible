#!/bin/bash
export AWS_ACCESS_KEY_ID="<KEY_ID>"
export AWS_SECRET_ACCESS_KEY="<ACCESS_KEY>"
export AWS_DEFAULT_REGION="<REGION>"
export PEM_LOCATION="<LOCAL_PEM>"
ansible-playbook -i hosts --private-key ${PEM_LOCATION} site.yml
