These instructions describe how to get `fir-box` up and running. Throughout, we suppose we suppose `$FIR_BOX_HOME` is set to the root of the repository.


## Create Install ISO

First, we build the OS X install image using `osx-vm-templates/prepare_iso`. This script converts an "Install OS X" app and creates a `.dmg` image that we will next use with packer. Note that using optional switches, one can set a default root user and the root user's password. Suppose `$OS_X_INSTALL_APP` is the fully qualified path of the install `.app`.

    $ cd $FIR_BOX_HOME
    $ osx-vm-templates/prepare_iso/prepare_iso.sh "$OS_X_INSTALL_APP" build

This build process will put a `.dmg` file in the `build` directory. You will need to note the `md5` checksum and the exact name of the `.dmg` file. Modify the `osx-vm-templates/packer/template.json` with these values.


## Create and Add Vagrant Box

Next, we use `packer` to build a `.box` file that will serve as our base vagrant image.

    $ cd $FIR_BOX_HOME/build
    $ packer build ../osx-vm-templates/packer/template.json

This should eventually create the `.box` file, which can be added to our local vagrant boxes using

    $ cd $FIR_BOX_HOME/build
    $ vagrant box add osx-yosemite *.box


## Provision Vagrant Box

Now that this base box has been added, we can make an instance of it:

    $ cd $FIR_BOX_HOME
    $ vagrant init osx-yosemite

Then add this to the `Vagrantfile`

```
  config.vm.provider :vmware_fusion do |v|
    # Don't boot with headless mode
    v.gui = true
  end
```

and create the VM with

    $ vagrant up

You should now be able to log in to the VM with

    $ vagrant ssh


## Configure Provisioned Vagrant Box

You can now use Ansible to configure the newly provisioned VM. Check out the VM's IP address by running `ansible ssh-config` and modify the `hosts` so that the `fir-box` host points to this IP address.

You should now be able to run the Ansible playbooks. For example,

    $ ansible-playbook --ask-pass playbook.yml
