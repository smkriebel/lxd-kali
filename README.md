# kali-lxd

LXD provides kali images, including a cloud image that supports initial setup with cloud-init.  
When used with the kali cloud image, this profile will give you an initially configured kali 
box with X11 support on a Linux host.

This profile creates a user `kali` with _full_ sudo permissions and the default password of `kali`.
Please change this password as soon as possible.

## Instructions

### Download "lxd-kali" profile found in this repo.

```sh
$ wget https://raw.githubusercontent.com/smkriebel/lxd-kali/master/lxd-kali.profile
$ lxc profile create kali
$ cat lxd-kali.profile | lxc profile edit kali`  
```
### Create the lxd container.

```sh
$ lxc launch -p default -p kali images:kali/cloud/current kali
```
The command example above assumes you are using the `default` profile to set things like network and storage.
Include the proper profiles if you're not using the `default` profile name.

_Note: Make sure you use the cloud version of the kali image or this profile will not fully work._

### Log into the container.

You can log into the container using the console using the credentials supplied above:

```sh
$ lxc console kali
```
Or log directly into the 'kali' user _without_ using a password:

```sh
$ lxc exec kali -- sudo --login --user kali
```
## Acknowledgement

This profile is based on information published on [Simos's Blog](https://blog.simos.info/).
