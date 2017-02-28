if [ -d "./roles/git" ]; then
  cd ./roles/git && git pull && cd ../../
else
  git clone https://github.com/geerlingguy/ansible-role-git.git ./roles/git
fi

if [ -d "./roles/docker" ]; then
  cd ./roles/docker && git pull && cd ../../
else
  git clone https://github.com/Vinelab/ansible-docker.git ./roles/docker
fi

if [ -d "./roles/ntp" ]; then
  cd ./roles/ntp && git pull && cd ../../
else
  git clone https://github.com/resmo/ansible-role-ntp.git ./roles/ntp
fi

ansible-galaxy install geerlingguy.apache -p ./roles/  &&
ansible-galaxy install geerlingguy.jenkins -p ./roles/  &&
ansible-galaxy install andreaswolf.letsencrypt -p ./roles/  &&
ansible-playbook 1_core.yml -i Vagranthosts  &&
ansible-playbook 2_gitlab.yml -i Vagranthosts  &&
ansible-playbook 3_redmine.yml -i Vagranthosts  &&
ansible-playbook 4_jenkins.yml -i Vagranthosts &&
ansible-playbook 9_apache.yml -i Vagranthosts
