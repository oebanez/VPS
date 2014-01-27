##Auto Script By Newradix
#Kill Dropbear
echo 
echo "Stopping & Killing All Dropbear User..."
echo "Success"
killall -9 dropbear
service dropbear start
echo "Success"
echo "Now, Check Your User Log with Command : ./log.sh"
echo 