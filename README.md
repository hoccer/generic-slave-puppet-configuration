generic-slave-puppet-configuration
===========================

#### Requirement

* Ubuntu 14.04 LTS minimal install
* extra packages
```
git puppet librarian-puppet
```

#### Puppet install

* login as deployment user
* cd to puppet/generic-slave-puppet-configuration
* Prepare Puppet modules:
```
librarian-puppet install
```

Apply Puppet configuration:

```
sudo puppet apply init.pp --no-report --modulepath modules --verbose
```
