#!/bin/bash
# -*- coding: utf-8 -*-

mkdir -p /var/run/mysqld
chmod 777 /var/run/mysqld

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ $RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup ($RET)"
    sleep 5
    mysql -uroot -hlocalhost -e "status" > /dev/null 2>&1
    RET=$?
done

GEN=$(pwgen -s 12 1)
USER=${MYSQL_USERNAME-admin}
PASS=${MYSQL_PASSWORD-$GEN}

if [ "$PASS" == "$GEN" ]; then
    echo "=> Creating MySQL $USER user with random password"
else
    echo "=> Using provided MySQL user ($USER) and password"
fi

mysql -uroot -hlocalhost -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -hlocalhost -e "GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%' WITH GRANT OPTION"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MySQL Server using:"
echo ""
echo "    mysql -u$USER -p$PASS -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MySQL user 'root' has no password but only allows local connections"
echo "========================================================================"

mysqladmin -uroot shutdown
