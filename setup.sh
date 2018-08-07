#!/bin/bash  

echo "Setup Ansible Dev Environment!"

if [ $# -eq 0 ]
then
	echo "specify git repo to clone, and setup ansible dev environment!"
	exit 1
fi

ANSIBLE_GIT=$1
PYTHON_VENV="venv"
DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ ! -d "$PYTHON_VENV" ]
then
    python3 -m venv $PYTHON_VENV
    # echo $project_folder + "/"+ $python_venv
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
	mkdir ./ansible
fi

cd ansible

git clone $1