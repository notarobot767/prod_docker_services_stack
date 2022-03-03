CREATE DATABASE guac;
CREATE USER 'dbadmin'@'%' identified by 'dbadmin';
GRANT SELECT,INSERT,UPDATE,DELETE ON guac.* TO 'dbadmin'@'%';
flush privileges;