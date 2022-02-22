1 - Create/Copy "enode.service" file to the following location: /etc/systemd/system/enode.service
1.1 - Run in terminal:  sudo chmod +x /etc/systemd/system/enode.service

2 - Create/Copy "enode.sh" file to the following location: /usr/local/sbin/enode.sh
2.1 - Run in terminal:  sudo chmod +x /usr/local/sbin/enode.sh

3 - Run in terminal:  sudo systemctl daemon-reload

4 - Run in terminal:  sudo systemctl start enode.service

5 - Follow logs (in terminal): sudo journalctl -u enode.service -f 