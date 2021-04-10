snap install docker

mkdir -p /root/nkn/
wget -O /root/nkn/config.json https://raw.githubusercontent.com/dmitriy-a-bit/nkn-autodeploy/main/config.json

docker run -d \
--ip `ip a show eth0 | grep -A 2 BRO | grep inet | awk '{print $2}' | cut -d '/' -f 1` \
-p $ip:30001:30001 \
-p $ip:30002:30002 \
-p $ip:30003:30003 \
-p $ip:30004:30004 \
-p $ip:30005:30005 \
-v /root/nkn:/nkn/data \
--name nkn  \
--rm -it nknorg/nkn:2.0.8
