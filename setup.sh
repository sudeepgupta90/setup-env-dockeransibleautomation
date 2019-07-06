#!/bin/bash  

echo "Setup Ansible Dev Environment!"

flag=0

if [ $# -eq 0 ]
then
    echo "you did not specify git repo to clone..."
    echo "will only setup environment!"
    flag=1
else
	ANSIBLE_GIT=$1
fi

PYTHON_VENV="venv"
DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ ! -d "$PYTHON_VENV" ]
then
    python3 -m venv $PYTHON_VENV
fi

rm -rf ./DockerAnsibleContainerAutomation

if [ ! -d "DockerAnsibleContainerAutomation" ]
then
    GIT_REPO="git@github.com:sudeepgupta90/DockerAnsibleContainerAutomation.git"
    git clone $GIT_REPO
fi

mv ./DockerAnsibleContainerAutomation/launchContainers.py ./
mv ./DockerAnsibleContainerAutomation/requirements.txt ./
rm -rf ./DockerAnsibleContainerAutomation

source venv/bin/activate
echo "pip activated..."
echo "$(which python)"
echo "upgrading pip"
pip install -U pip
echo "setting up requirements..."
pip install -r requirements.txt

echo "setting up ansible directory"
if [ ! -d "ansible" ]
then
    mkdir -p ./ansible/roles
fi
cd ansible
wget "https://raw.githubusercontent.com/sudeepgupta90/setup-env-dockeransibleautomation/master/ansible.cfg"

if [ $flag -eq 0 ]
then
	echo "git clone ansible repo ..."
	cd roles/
	git clone $ANSIBLE_GIT
fi

echo "setup complete"
