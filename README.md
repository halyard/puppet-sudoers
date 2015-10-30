puppet-sudoers
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/sudoers.svg)](https://forge.puppetlabs.com/halyard/sudoers)
[![Dependency Status](https://img.shields.io/gemnasium/halyard/puppet-sudoers.svg)](https://gemnasium.com/halyard/puppet-sudoers)
[![Build Status](https://img.shields.io/circleci/project/halyard/puppet-sudoers.svg)](https://circleci.com/gh/halyard/puppet-sudoers)

Puppet module for creating sudoers user specifications

## Usage

The following puppet declaration:

```puppet
sudoers::allowed_command{ "acme":
  command          => "/usr/sbin/service",
  user             => "acme",
  require_password => false,
  comment          => "Allows access to the service command for the acme user"
}
```

Creates the file:

```
# /etc/sudoers.d/acme
acme ALL=(root) NOPASSWD: /usr/sbin/service
```

As user 'acme' you can now run the service command without a password, eg:

    $ sudo service rsyslog restart


### Parameters

The `allowed_command` type takes the following options (with defaults in brackets):

```
[*command*]               - the command you want to give access to, eg. '/usr/sbin/service'
[*filename*]              - the name of the file to be placed in /etc/sudoers.d/ ($title)
[*host*]                  - hosts which can run command (ALL)
[*run_as*]                - user to run the command as (root)
[*user*]                  - user to give access to
[*group*]                 - group to give access to
[*require_password*]      - require user to give password, setting to false sets 'NOPASSWD:' (true)
[*comment*]               - comment to add to the file
[*allowed_env_variables*] - allowed list of env variables ([])
[*require_exist*]         - Require the Group or User to exist. Setting this to false for example is needed if the user groups come from Active Directory. (true)
```

