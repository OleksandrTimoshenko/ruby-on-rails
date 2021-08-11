include .env

registry-login:
	echo "${GITHUB_TOKEN}" | docker login ghcr.io -u ${GITHUB_USER} --password-stdin

vagrant-provision:
#	vagrant plugin install vagrant-env;
	ansible-galaxy install -r deploy/ansible-requirements.yaml;
	GITHUB_TOKEN=${GITHUB_TOKEN} \
	GITHUB_USER=${GITHUB_USER} \
	PLAYBOOK_NAME=deploy/playbook.yaml \
	vagrant up --provision;