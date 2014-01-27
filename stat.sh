##idea from google
## created by Galihrezah
## boleh di copy namun hargai karya orang lain
yum -y update
yum -y groupinstall "Development Tools"
yum install -y gcc

1. install vnstat nya dolo
wget http://lastoebanez.url.ph/vnstat-1.11.tar.gz
tar xzvf vnstat-1.11.tar.gz
cd vnstat-1.11
make
make install

###isitahat dulu

cd /etc/init.d
wget https://raw.github.com/oebanez/script/master/vnstat
chmod a+x vnstat
chkconfig --add vnstat


    cat > /etc/vnstat.conf <<END
    
# vnStat 1.11 config file
## edited by Galihrezah
Interface "venet0"

DatabaseDir "/var/lib/vnstat"

Locale "-"

MonthRotate 1

DayFormat    "%x"
MonthFormat  "%b '%y"
TopFormat    "%x"

RXCharacter       "%"
TXCharacter       ":"
RXHourCharacter   "r"
TXHourCharacter   "t"

UnitMode 0

# output style
# 0 = minimal & narrow, 1 = bar column visible
# 2 = same as 1 except rate in summary and weekly
# 3 = rate column visible
OutputStyle 3

RateUnit 1

MaxBandwidth 100

Sampletime 5

QueryMode 0

CheckDiskSpace 1

UseFileLocking 1

BootVariation 15

TrafficlessDays 1


UpdateInterval 30

# how often (in seconds) interface status changes are checked
PollInterval 5

# how often (in minutes) data is saved to file
SaveInterval 5

# how often (in minutes) data is saved when all interface are offline
OfflineSaveInterval 30

# force data save when interface status changes (1 = enabled, 0 = disabled)
SaveOnStatusChange 1

# enable / disable logging (0 = disabled, 1 = logfile, 2 = syslog)
UseLogging 2

# file used for logging if UseLogging is set to 1
LogFile "/var/log/vnstat.log"

# file used as daemon pid / lock file
PidFile "/var/run/vnstat.pid"


# vnstati
## edited by Galihrezah

HeaderFormat "%x %H:%M"

HourlyRate 1

SummaryRate 1

SummaryLayout 1

TransparentBg 0

CBackground     "FFFFFF"
CEdge           "AEAEAE"
CHeader         "606060"
CHeaderTitle    "FFFFFF"
CHeaderDate     "FFFFFF"
CText           "000000"
CLine           "B0B0B0"
CLineL          "-"
CRx             "92CF00"
CTx             "606060"
CRxD            "-"
CTxD            "-"

END

###test dulu
service vnstat restart

clear
echo "-----------------------------------------------"
echo " install vnstat belum selesai brot"
echo " silahkan pastekan comand 1 lagi "
echo " semoga sukses dan salam phreaker dari galihrezah "
echo " doakan ane makin sukses yah hehehehe amin"
echo "-----------------------------------------------"
echo "semoga ente selalu sukses dan makin cerdas,, amin"
