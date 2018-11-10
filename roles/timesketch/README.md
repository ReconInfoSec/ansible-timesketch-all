[![Build Status - Master](https://travis-ci.org/juju4/ansible-timesketch.svg?branch=master)](https://travis-ci.org/juju4/ansible-timesketch)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-timesketch.svg?branch=devel)](https://travis-ci.org/juju4/ansible-timesketch/branches)
# TimeSketch ansible role

Ansible role to setup TimeSketch and Plaso for Disk images Forensics Timeline
- http://www.timesketch.org/
- https://github.com/google/timesketch

Install is done from GIFT ppa on trusty/xenial so should be latest or near-latest.
For other, from source

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04 and 18.04
Preliminary support for Centos7/Fedora24 buit l2tdevtools does not cleanly build for now.

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.timesketch
```

Server started on port 5000 by default.

## Variables

Default var can be used right away outside of users and passwords obviously but should be fine for test run.

```
timesketch_root: /var/timesketch
## user to run daemon
timesketch_user: "_timesketch"
## web users of the platforms
timesketch_userlist:
    - { u: 'bob', p: 'bobpass' }
    - { u: 'john', p: 'johnpass' }
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.timesketch
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.timesketch/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building 
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/timesketch/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## Known issues

* Centos7 or Fedora24 platforms not functional currently

* Support of Ubuntu 18.04 is tentative as based on Java10 support by ELK. See also [Elastic - Support Matrix](https://www.elastic.co/support/matrix#matrix_jvm) and [Logstash - Java 10 support](https://github.com/elastic/logstash/issues/9345)

## License

BSD 2-clause


