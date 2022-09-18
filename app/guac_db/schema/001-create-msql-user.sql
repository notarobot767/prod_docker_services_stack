CREATE DATABASE guac;
DROP USER 'dbadmin'@'%';
flush privileges;
CREATE USER 'dbadmin'@'%' identified by 'dbadmin';
GRANT SELECT,INSERT,UPDATE,DELETE ON guac.* TO 'dbadmin'@'%';
flush privileges;