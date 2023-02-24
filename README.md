# RHEL In-place Upgrade Automation

This is a collection of Ansible playbooks that demonstrate how to automate RHEL in-place upgrades based on the Leapp tool.

The following playbooks are included:

- analysis.yml - Generates the Leapp preupgrade analysis report
- upgrade.yml - Creates LVM snapshots and launches the in-place OS upgrade
- rollback.yml - Undo the OS upgrade by performing LVM snapshot rollback
- commit.yml - Removes the LVM snapshots and cleans up
