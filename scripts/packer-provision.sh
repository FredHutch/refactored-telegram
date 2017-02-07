#!/bin/bash -e

# Use this script as a Packer provisioner.  Will configure a base set of
# tools necessary for the awsbatch tool

apt-get update
apt-get -y install \
        bind9-host wget sudo nfs-common nfs4-acl-tools \
        vim mountall python python-pip

pip install boto3

cat >> /etc/fstab <<'EREH'
fs-d2be1f9b.efs.us-east-1.amazonaws.com:/ /app nfs nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,auto
EREH

chmod ugo+x /usr/local/bin/download_and_go
