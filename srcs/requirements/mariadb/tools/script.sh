#!/bin/bash
service mysql start

#create database
 mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;" 
#create user 
mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USR'@'%' IDENTIFIED BY '$DB_PASS' ;" 
#grant privileges
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USR'@'%' IDENTIFIED BY '$DB_PASS' ;"
#flush privileges lush the privileges in MySQL. 
#It allows the server to reload the grant tables and apply any changes made to the user privileges.
mysql -u root -e "FLUSH PRIVILEGES;" 
#
service mysql stop
#
mysqld_safe