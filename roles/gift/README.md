[![Build Status - Master](https://travis-ci.org/juju4/ansible-gift.svg?branch=master)](https://travis-ci.org/juju4/ansible-gift)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-gift.svg?branch=devel)](https://travis-ci.org/juju4/ansible-gift/branches)
# “Glorious Incident Feedback Tools” team ppa ansible role

Ansible role to setup Ubuntu ppa of “Glorious Incident Feedback Tools” team
https://launchpad.net/~gift/+archive/ubuntu/stable
Commonly used for SIFT, GRR, Timesketch...

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Ubuntu 14.04, 16.04 (only ones supported by the ppa at oct 2016).
Fedora 26 to 28 (through [COPR](https://github.com/log2timeline/plaso/wiki/Fedora-Core-Packaged-Release)).

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.gift
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.gift
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.gift/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues


## License

BSD 2-clause

