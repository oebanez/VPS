##idea from google
## created by Suhendra Wahyu
## boleh di copy namun hargai karya orang lain
yum install -y php php-pear
cd /var/www/html/
rm -f -r index.php
rm -f -r index.html
wget http://lastoebanez.url.ph/stat.zip
unzip stat.zip

chkconfig httpd on
service httpd start
chkconfig vnstat on

clear
echo "-----------------------------------------------"
echo " install vnstat sg sudah selesai brot"
echo " akses di ip vps anda di browser ente "
echo " semoga sukses dan salam phreaker dari galihrezah "
echo " doakan ane makin sukses yah hehehehe amin"
echo "-----------------------------------------------"
echo "semoga ente selalu sukses dan makin cerdas,, amin"
