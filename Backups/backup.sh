#!/bin/bash

dbhost='127.0.0.1'
dbuser='user'
dbpass='pass'
dbname='db'
savepath='/home/backups'

date=`date +%Y-%m-%d_%H%M`
month=`date +%Y-%m`
filename="$savepath/$month/"$dbname"_"$date".sql"

tarname="$savepath/$month/"$dbname"_"$date".tar.gz"

if [[ ! -d "$savepath/$month" ]]; then
	mkdir -p "$savepath/$month"
	chmod 700 "$savepath/$month"
fi

mysqldump --opt --host=$dbhost --user=$dbuser --password=$dbpass $dbname > $filename
chmod 400 $filename

dirname='/var/www/htdocs'
tar -cvpzf $tarname $dirname
chmod 400 $tarname
