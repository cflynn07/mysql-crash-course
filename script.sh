#!/bin/bash

CMD="mysql -uroot -ppassword -h127.0.0.1 crashcourse"
function runcmd {
  echo "$1;" | $CMD 2>/dev/null
}


databases=$(runcmd "show databases")
echo "Databases:"
for i in $databases; do
  echo " - $i"
done

$CMD < mysql_scripts/create.sql
$CMD < mysql_scripts/populate.sql
runcmd "show tables"
