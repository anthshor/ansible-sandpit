## Ansible sandpit environment on a laptop

Provision an ansible sandpit environment that consists of; 

 - Ansible tower, to run ansible from
 - 2 webservers, web1 and web2 to provision to

To create the environment run

```
vagrant up
```

To log in and use;

```
vagrant ssh tower
sudo su - ansible
```

Tail log of the build

```
    tower: Number of key(s) added: 1
    tower:
    tower: Now try logging into the machine, with:   "ssh -o 'StrictHostKeyChecking=no' 'ansible@web2'"
    tower: and check to make sure that only the key(s) you wanted were added.
    tower: web1 | SUCCESS => {
    tower:     "changed": false,
    tower:     "ping": "pong"
    tower: }
    tower: web2 | SUCCESS => {
    tower:     "changed": false,
    tower:     "ping": "pong"
    tower: }

```
