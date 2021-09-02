# Wrappers for the `gcloud` CLI
This directory provides wrappers around `gcloud` command line utility within GCP to allow Ansible to run from a GCP Cloudshell instance.

## Requirements
* `ansible >= 2.10`

## How to use?
* Copy `scp.sh` and `ssh.sh` files into a known directory on your GCP Cloudshell instance.

* Add or change the following variables in your Ansible playbook YAML file:
    ```
    ansible_ssh_executable: <PATH-TO-ssh.sh-SCRIPT>
    ansible_scp_executable: <PATH-TO-scp.sh-SCRIPT>
    ```

* Your `ansible_host` should match the VM Instance name on your Compute Engine web console, meaning that in your inventory there should not be any IP, hostnames or FQDNs.
