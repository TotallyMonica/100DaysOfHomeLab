# Day one of 100 Days of Homelab

 - Downloaded `DD-WRT`
    - [HTTP](https://dd-wrt.com/support/other-downloads/?path=betas%2F2022%2F06-19-2022-r49268%2Fnetgear-r7000P%2F)
    - [FTP](ftp.dd-wrt.com/betas/2022/06-19-2022-r49268]

 - Flashed a Netgear R7000P to DD-WRT
    - [Guide](https://wiki.dd-wrt.com/wiki/index.php/Netgear_R7000P#Installation)
 - Changed IP range to 172.20.0.0/16
 - Enabled DDNS with DynDNS.org
 - Set up basic VLAN
 - Enabled ssh for file copy
 - Added my ssh key
 - Disabled lights
 - Disabled activity lights
 - Downloaded a backup of the firmware

VLAN configs:
1. Network only, no internet
2. Internet only, no network
3. Network and internet

Disable power, internet, 2.4 GHz, and 5GHz LEDs:
```shell
for i in 2 3 8 9 10
do
    gpio enable $i
done
```

Disable Radio and WPS LEDs:
```shell
for i in 11 12 13
do
    gpio disable $i
done
```

Got `et` from the [DD-WRT forum thread](https://forum.dd-wrt.com/phpBB2/viewtopic.php?p=1181821) and unzipped using `unzip` on my host system.
```shell
unzip et.zip
```

I then transferred `et` to the router

```shell
scp et root@172.20.0.1:/tmp/root/et
```

Disabled activity on LAN ports with
```shell
./et robowr 0x0 0x18 0x1ff 
```

Disabled LEDs on the LAN ports with
```shell
./et robowr 0x0 0x1a 0x0 
```