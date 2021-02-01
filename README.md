# Ansible AWX demo

This example installs Ansible's [AWX Project](https://github.com/ansible/awx) (the upstream open source project behind [Ansible Tower](https://www.ansible.com/tower) on [Debian](http://www.debian.org) virtualmachine running in [VirtualBox](https://www.virtualbox.org/wiki/Downloads), so you can test and run AWX... to test and run more Ansible playbooks!

## How to install AWX demo

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  1. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
  1. Install [Ansible](https://www.ansible.com/). 
  1. Install [AWX Ansible Collection](https://github.com/ansible/awx/blob/devel/awx_collection/README.md) module. Needed to manage AWS with Ansible. 
     - Command: `ansible-galaxy collection install awx.awx`
  1. Install [Community.Crypto Collection](https://docs.ansible.com/ansible/latest/collections/community/crypto/) module. Needed to generate SSL certificate for AWX. 
     - Command: `ansible-galaxy collection install community.crypto`
  1. Open a shell prompt (Terminal app on a Mac) and cd into the folder containing the `Vagrantfile`
  1. Type in `vagrant up`, and Vagrant will create both new VMs and configure them.
  1. Run `local_config.sh` to configure host. This adds VMs to `/etc/hosts` etc.

> Note: This VM uses 4 GB of RAM by default, because AWX requires a lot of memory to perform well. If you are using a server or local workstation with less than 8 GB of RAM, AWX may not run very well!

## List of VMs

| VM name | Description        | IP address   | Username | Password | Note                             |
| ------- | ------------------ | ------------ | -------- | -------- | -------------------------------- |
| awx     | Ansible AWX server | 192.168.6.65 | vagrant  | vagrant  | Logs in automatically as vagrant |
| minion1 | Ansible target     | 192.168.6.66 | vagrant  | vagrant  | 
| minion2 | Ansible target     | 192.168.6.67 | vagrant  | vagrant  |
| tool    | Tool server        | 192.168.6.68 | vagrant  | vagrant  |


### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`; Windows: `%systemroot%\system32\drivers\etc\hosts`), adding the lines below:

    192.168.6.65  awx.local

(Where `awx.local` is the hostname you have configured in the `Vagrantfile`).

### Logint ot AWX

After hosts file is configured, you could visit http://awx.local/ in a browser, and you'll see the AWX login page. Log in with the default credentials:

  - Username: `admin`
  - Password: `password`

> Note: The first time you install AWX, it takes some time to set up AWX's database (and this process will peg one CPU core for a while!). If you get a 500 error notice when you visit awx.local, wait a little bit and try again.

## Related links

  - [Git Cheat sheets](https://training.github.com/downloads/github-git-cheat-sheet/)
  - [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file)
  - [Guide for installing Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
  - [Markdown Cheat sheet](https://www.markdownguide.org/cheat-sheet/)

# Thanks!

Based on work of [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
