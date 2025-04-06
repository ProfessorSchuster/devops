# check interfaces
ip a

# edit netplan for client and gateway (check Netplan yaml files for content)
sudo nano /etc/netplan/00-installer-config.yaml

# allow routing of localhost traffic
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo nano /etc/sysctl.conf # -> net.ipv4.conf.all.route_localnet=1
sudo sysctl -p


# ---


# delete all rules, chains in filter and nat table
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -X
sudo iptables -t nat -X

# nat rule with iptables
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# (optional) allow forwarding to enable stateful firewall, not necassary for NAT
sudo iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT

# (optional) save rules to make them persistent
sudo apt install iptables-persistent -y
sudo netfilter-persistent save