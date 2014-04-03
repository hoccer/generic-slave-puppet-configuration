build1-puppet-configuration
===========================

#### Requirement

* Ubuntu 14.04 LTS minimal install
* extra packages
```
git puppet
```

#### Puppet install

Prepare Puppet modules:
```
su -
mkdir -p puppet/modules
cd puppet/modules
git clone https://github.com/hoccer/puppet-backuppc-client.git backuppc-client
git clone https://github.com/hoccer/puppet-deployment-user.git deployment-user
git clone https://github.com/hoccer/puppet-nrpe.git nrpe
```

Apply Puppet configuration:

```
puppet apply build1.pp --no-report --modulepath modules --verbose
```