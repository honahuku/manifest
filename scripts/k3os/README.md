# readme

## k3osでIPを固定する
configの後の値は実行結果を見ながら変える
```
sudo connmanctl services
sudo connmanctl config ethernet_eec1fcb51b79_cable --ipv4 manual 192.168.30.11 255.255.255.0 192.168.30.1 --nameservers 192.168.30.1
```