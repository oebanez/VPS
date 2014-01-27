##Auto Script By Newradix
#Kill OpenSSH
echo 
echo "Stopping & Killing All OpenSSH User..."
echo "Success"
killall -9 sshd
service sshd start
echo "Success"
echo "Now, Check Your User Log with Command : ./log.sh"
echo 