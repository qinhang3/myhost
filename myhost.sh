#!/bin/sh
RID=$1
HOS=$2
LINE=`curl -v https://1617117080550385.cn-shenzhen.fc.aliyuncs.com/2016-08-15/proxy/yorkshire/fc-host/?rid=${RID}\&host=${HOS}`
echo '获取到解析地址' $LINE
grep -v RID${RID} /etc/hosts > /tmp/hosts.new
echo $LINE >> /tmp/hosts.new
echo '生成新的host文件'
cat /tmp/hosts.new
echo '准备写入host文件.输入密码来授权'
sudo cp /tmp/hosts.new /etc/hosts
echo '替换成功'
