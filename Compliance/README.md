# Steampunk Spotters Integration with Ansible Automation Platform

Welcome to the Compliance demo. This demo shows how can Spotter help you detect and early fail, when it detects, not just Ansible related issues, but security/compliance issues in Ansible Code.

## Prerequisites

- Push the Policies folder to project XIUWiKRaRP6MF5zohfvrwQ
  - Run `spotter --timeout 50 policies set Policies --project-id XIUWiKRaRP6MF5zohfvrwQ`

- Navigate to Compliance folder and scan the Playbook to default project

- Then show that there is no errors, and then scan to project XIUWiKRaRP6MF5zohfvrwQ, and there will be custom rules and some errors.

## Key Points to Highlight

1. Mention that the playbook itself will run (show the playbook) without errors in Ansible.
2. However, upon inspection of the playbook, we notice some poor practices, such as storing access keys as plain text.
3. Then show that reboot command is present, and the playbook would go and reboot all of the cisco infrastructure.