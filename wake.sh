#! /bin/bash
d=''
echo -n "В какой день вас разбудить? (гггг-мм-дд)"
read d
h=''
echo -n "В какой час вас разбудить? (чч)"
read h
declare -i m=''
echo -n "Во сколько минут избранного часа вас разбудить? (мм)"
read m
declare -i z=0
z=$m+1
echo "$d $h:$m"
echo "$z"
sleep 20
u=$(date +%s -d "$d $h:$m")
echo "$u"
echo "DISPLAY=:0
$m $h * * *  /home/ruslan/wakeupdude/alarm.sh" |crontab -
sudo rtcwake -m mem -t $u

