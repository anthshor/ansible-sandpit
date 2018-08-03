# Add ansible
useradd ansible
echo ansible | passwd --stdin ansible

# Add using visudo
echo "ansible ALL=(ALL)       NOPASSWD:ALL"| sudo EDITOR='tee -a' visudo
