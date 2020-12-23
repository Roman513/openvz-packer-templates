OpenVZ packer templates
=======================

Packer templates for building base [OpenVZ VM box](https://app.vagrantup.com/Roman513/boxes/OpenVZ7) and [Virtuozzo box](https://app.vagrantup.com/Roman513/boxes/Virtuozzo7).
Based on Sergey Bronnikov's sources https://github.com/ligurio/openvz-packer-templates

Usage
=====

Installing Packer
-----------------

[Download](http://www.packer.io/downloads.html) the latest packer and unzip the
appropriate directory.

If you're using Homebrew:

    $ brew install packer

Running Packer
--------------

    $ git clone https://github.com/Roman513/openvz-packer-templates
    $ packer build virtuozzo-7.0.json

If you want to build only VirtualBox:

    $ packer build -only=virtualbox-iso virtuozzo-7.0.json

The result box will be available in `builds/` directory.

### Virtuozzo 7.0

By default the box `OpenVZ7` will be built using the ISO from the latest
released version of Virtuozzo distribution of OpenVZ 7.0. At this moment it is _7.0.15-628_
If you want to build the box `OpenVZ7` from the current factory ISO build, you
should override `iso_url` and `iso_checksum` variables, for example:

```console
$ export VZ_FACTORY_URL=https://download.openvz.org/virtuozzo/factory/x86_64/iso/factory-DVD && \
  export VZ_FACTORY_CHECKSUM=sha256:`curl --silent https://download.openvz.org/virtuozzo/factory/x86_64/iso/factory-CHECKSUM | grep DVD | awk '{print $1}'`

$ packer build -var "iso_url=${VZ_FACTORY_URL}" -var "iso_checksum=${VZ_FACTORY_CHECKSUM}" virtuozzo-7.0.json
```

To build Virtuozzo (not OpenVZ) box, use commands like this:
```console
$ export VZ_FACTORY_URL=http://repo.virtuozzo.com/vz/releases/vz7.iso && \
export VZ_FACTORY_CHECKSUM=sha256:`curl --silent http://repo.virtuozzo.com/vz/releases/sha256sum | grep -E 'vz7.iso$' | awk '{print $1}'` && \
export VZ_TEMPLATE='virtuozzo-7-x64'

$ packer build -var "iso_url=${VZ_FACTORY_URL}" -var "iso_checksum=${VZ_FACTORY_CHECKSUM}" -var "template=${VZ_TEMPLATE}" virtuozzo-7.0.json
```

Using Vagrant box
-----------------

	$ vagrant init Roman513/OpenVZ7
	$ vagrant up --provider virtualbox
	$ vagrant ssh

Supported versions
------------------

This templates was tested using a packer 1.6.6.
