# Generate and copy keys

# Run as Ansible

echo -e "\n" | ssh-keygen -t rsa -N ""
sshpass -p "ansible" ssh-copy-id -i /home/ansible/.ssh/id_rsa.pub -o StrictHostKeyChecking=no ansible@web1
sshpass -p "ansible" ssh-copy-id -i /home/ansible/.ssh/id_rsa.pub -o StrictHostKeyChecking=no ansible@web2

# Test
ansible all -m ping
