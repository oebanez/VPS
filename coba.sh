#!/bin/bash
#
# Newradix# ========================
# 

echo "-----------------------------------------------" >> /var/www/html/log.txt
echo "|              LastOebanez Network             |" >> /var/www/html/log.txt
echo "|             Freedom of Information           |" >> /var/www/html/log.txt
echo "-----------------------------------------------" >> /var/www/html/log.txt
echo "" >> /var/www/html/log.txt
echo "" >> /var/www/html/log.txt 

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);


echo "         Dropbear Login Monitoring         " >> /var/www/html/log.txt
echo "-------------------------------------------" >> /var/www/html/log.txt


for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/secure | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	USER=`cat /var/log/secure | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/secure | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo " $PID | $USER | $IP" >> /var/www/html/log.txt
	fi
done
echo "-------------------------------------------" >> /var/www/html/log.txt

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
echo "" >> /var/www/html/log.txt 
echo "" >> /var/www/html/log.txt 
echo "          OpenSSH Login Monitoring         " >> /var/www/html/log.txt
echo "-------------------------------------------" >> /var/www/html/log.txt
for PID in "${data[@]}"
do
        #echo "check $PID";
        NUM=`cat /var/log/secure | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
        USER=`cat /var/log/secure | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
        IP=`cat /var/log/secure | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo " $PID | $USER | $IP" >> /var/www/html/log.txt
        fi
done
echo "-------------------------------------------" >> /var/www/html/log.txt
# 



