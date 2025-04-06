# Install UFW
sudo apt update
sudo apt install ufw -y

# Activate UFW
sudo ufw enable

# Check UFW Status
sudo ufw status verbose

# Install and allow SSH
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo ufw allow ssh

# Get IP address
hostname -I

# Reject SSH with UFW
sudo ufw reject ssh

# Reject outgoing HTTPS
curl http://www.google.com
sudo ufw reject out https
curl https://www.google.com

# Delete rules
sudo ufw delete reject out https
sudo ufw delete allow ssh

# Reset UFW
sudo ufw reset