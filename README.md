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
cd modules
git clone https://github.com/hoccer/puppet-backuppc-client.git backuppc-client
git clone https://github.com/hoccer/puppet-deployment-user.git deployment-user
git clone https://github.com/hoccer/puppet-jenkins-user.git jenkins-user
git clone https://github.com/hoccer/puppet-nrpe.git nrpe
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git stdlib
git clone https://github.com/puppetlabs/puppetlabs-java.git java
```

Apply Puppet configuration:

```
puppet apply init.pp --no-report --modulepath modules --verbose
```
