sudo iptables -I INPUT -p tcp --dport 32740 -j ACCEPT
sudo iptables -I OUTPUT -p tcp --dport 32740 -j ACCEPT
