### Demo for PAT (Port Address Translation)

# flush filter and nat table, delete all chains
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X

# allow input, forward, output
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

# status
# list all rules in filter
sudo iptables -L -n -v
# list all rules in nat
sudo iptables -t nat -L -n -v

# set rule for port forwarding
sudo iptables -t nat -A PREROUTING -d $(hostname -I) -p tcp --dport 2222 -j DNAT --to-destination $(hostname -I):22

### if it doesn't work you may need to set kernel flags (system settings)

# allow routing of localhost traffic
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo nano /etc/sysctl.conf # -> net.ipv4.conf.all.route_localnet=1
sudo sysctl -p