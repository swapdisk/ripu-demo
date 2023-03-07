# RHEL In-place Upgrade Automation

This is a collection of Ansible playbooks that demonstrate how to automate RHEL in-place upgrades based on the Leapp tool.

The following playbooks are included:

- analysis.yml - Generates the Leapp preupgrade analysis report
- upgrade.yml - Creates LVM snapshots and launches the in-place OS upgrade
- rollback.yml - Undo the OS upgrade by performing LVM snapshot rollback
- commit.yml - Removes the LVM snapshots and cleans up

## Notes

Here are some random issues I've hit running this on the RHDP Ansible Automation Platform 2 Linux Automation Workshop.

Before we do anything, we need to manually copy the PES metadata as explained at KB article [Leapp utility metadata in-place upgrades of RHEL for disconnected upgrades](https://access.redhat.com/articles/3664871). Fix from the AAP controler node like this example: 

```
scp leapp-data-21.tar.gz node1:
ssh node1 sudo mkdir -p /etc/leapp/files
ssh node1 sudo tar -xzf leapp-data-21.tar.gz -C /etc/leapp/files
```

The RHEL8 instances do not have the latest RHEL package versions installed. These leads to "Newest installed kernel not in use" inhibitor being raised when running the Leapp pre-upgrade. The solution is to dnf update and reboot, for example: 

```
dnf -y update && reboot
```
