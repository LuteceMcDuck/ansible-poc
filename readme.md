Directory Structure:
  - inventories/: Environment-specific host inventories (production, staging, development)
  - playbooks/: Main playbooks for deployment, site configuration, and maintenance
  - roles/: Custom roles (common, nginx) with proper structure
  - group_vars/: Variables organized by host groups
  - host_vars/: Host-specific variables
  - collections/: For Ansible collections
  - Plugin directories: For custom plugins and extensions

  Key Features:
  - Multi-environment support (dev/staging/prod)
  - Modular role structure following Ansible best practices
  - Comprehensive variable management with group_vars and host_vars
  - Example playbooks for common operations (deploy, maintenance, site setup)
  - Requirements file for managing external collections and roles
  - Proper ansible.cfg configuration optimized for performance and security
  - Makefile for common operations and CI/CD integration
  - .gitignore for version control best practices

  Semaphore UI Compatibility:
  - Clear project organization that Semaphore can easily navigate
  - Separate inventory files for each environment
  - Modular playbooks that can be run independently
  - Proper variable structure for environment-specific configurations