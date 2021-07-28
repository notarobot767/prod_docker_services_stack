CREATE DATABASE guac;
CREATE USER 'guacadmin'@'localhost' identified by 'guacadmin';
CREATE USER 'guacadmin'@'%' identified by 'guacadmin';
GRANT ALL ON guac.* TO guacadmin@'localhost';
GRANT ALL ON guac.* TO guacadmin@'%';
flush privileges;