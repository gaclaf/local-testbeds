#!/bin/sh




########## FUNCTIONS ################

check_status ()
{
        result=$?
        if [ ${result} -ne 0 ] ; then
                echo -e "\e[01;31m[ERROR] $@ \e[00m"
                exit;
        fi
}

download()
{
    local url=$1
    echo -n "    "
    wget --progress=dot $url 2>&1 | grep --line-buffered "%" | \
        sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    echo " DONE"
}

echo "Installing nodejs:"
#download https://storage.googleapis.com/kubernetes-release/release/v1.1.1/bin/linux/amd64/kubectl


yum install -y \
	gcc-c++ \
	make \
	vim \
	dstat \
	net-tools


check_status "Cannot prepare prereqs"

curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -

check_status "Cannot install nodejs"


sudo yum install -y nodejs

check_status "Cannot install nodejs"

