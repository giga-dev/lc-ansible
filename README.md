# Instructions for using deploying large cluster using ansible

* Modify deploy-lc.sh script with AWS credentials and local pem file to be used to access the machines
* Modify group_vars/all file with the required settings (mostly build link and number of gsc machines)
* Execute deploy-lc.sh script
* IMPORTANT NOTE: undeploying the machines is currently done manually by AWS web ui console! DONT FORGET TO TERMINATE THE INSTANCES!  