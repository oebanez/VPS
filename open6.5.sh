##Auto Script By Newradix
#Update Dulu
yum -y update && yum -y upgrade
yum install zlib zlib-devel pam pam-devel openssl openssl-devel gcc patch -y
yum -y install libgssapi pam-devel -y

#download OpenSSH 6.3
wget http://mirror.esc7.net/pub/OpenBSD/OpenSSH/portable/openssh-6.5p1.tar.gz
tar zxvf openssh-6.5p1.tar.gz

#Pindah Directory
cd openssh-6.5p1

#Install Config
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pam

#Delete Config Lama
rm /etc/ssh/ssh_config
rm /etc/ssh/sshd_config

#Compile
make && make install

#Buka Port
echo "Port 143" >> /etc/ssh/sshd_config
echo "Port 109" >> /etc/ssh/sshd_config
echo "Port  22" >> /etc/ssh/sshd_config

#Restart Service
service sshd restart
chkconfig sshd on
