.PHONY: help install lint check deploy-dev deploy-staging deploy-prod maintenance

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install Ansible collections and roles
	ansible-galaxy install -r requirements.yml --force

lint: ## Lint Ansible playbooks and roles
	ansible-lint playbooks/ roles/

check: ## Check Ansible syntax
	ansible-playbook playbooks/site.yml --syntax-check -i inventories/development/hosts.yml

check-dev: ## Check development environment
	ansible-playbook playbooks/site.yml --check -i inventories/development/hosts.yml

check-staging: ## Check staging environment
	ansible-playbook playbooks/site.yml --check -i inventories/staging/hosts.yml

check-prod: ## Check production environment
	ansible-playbook playbooks/site.yml --check -i inventories/production/hosts.yml

deploy-dev: ## Deploy to development environment
	ansible-playbook playbooks/site.yml -i inventories/development/hosts.yml

deploy-staging: ## Deploy to staging environment
	ansible-playbook playbooks/site.yml -i inventories/staging/hosts.yml

deploy-prod: ## Deploy to production environment
	ansible-playbook playbooks/site.yml -i inventories/production/hosts.yml

maintenance: ## Run maintenance tasks on all environments
	ansible-playbook playbooks/maintenance.yml -i inventories/development/hosts.yml
	ansible-playbook playbooks/maintenance.yml -i inventories/staging/hosts.yml
	ansible-playbook playbooks/maintenance.yml -i inventories/production/hosts.yml

encrypt-vault: ## Encrypt sensitive files with ansible-vault
	@read -p "Enter vault file path: " vault_file; \
	ansible-vault encrypt $$vault_file

decrypt-vault: ## Decrypt vault files
	@read -p "Enter vault file path: " vault_file; \
	ansible-vault decrypt $$vault_file

list-hosts-dev: ## List development hosts
	ansible-inventory -i inventories/development/hosts.yml --list

list-hosts-staging: ## List staging hosts
	ansible-inventory -i inventories/staging/hosts.yml --list

list-hosts-prod: ## List production hosts
	ansible-inventory -i inventories/production/hosts.yml --list