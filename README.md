#  setup-env-dockeransibleautomation

This is a nifty script which creates the working environment for [Ansible development with Docker](https://github.com/sudeepgupta90/DockerAnsibleContainerAutomation "DockerAnsibleContainerAutomation")

#### How does this script work?

You can either begin with an empty/pre-existing git repository, or you could simply just setup the environment and later do as you wish. However, it is recommended to begin with a git repo.
  

##### Setup:
    wget "https://raw.githubusercontent.com/sudeepgupta90/setup-env-dockeransibleautomation/master/setup.sh"
    chmod +x setup.sh

##### Usage Example:
    ./setup.sh https://github.com/sudeepgupta90/ansible-ntp

This will setup the git repo [ansible-ntp](https://github.com/sudeepgupta90/ansible-ntp) in the "roles" directory under folder "ansible" i.e. ansible/roles/

    ├── ansible
	│   ├── ansible.cfg
	│   └── roles
	│       └── ansible-ntp
	│           ├── defaults
	│           │   └── main.yml
	│           ├── example_hosts
	│           ├── handlers
	│           │   └── main.yml
	│           ├── LICENSE
	│           ├── meta
	│           │   └── main.yml
	│           ├── README.md
	│           ├── tasks
	│           │   └── main.yml
	│           ├── tests
	│           │   ├── inventory
	│           │   └── test.yml
	│           └── vars
	│               └── main.yml
	├── launchContainers.py
	├── requirements.txt
	└── setup.sh
	└── venv

