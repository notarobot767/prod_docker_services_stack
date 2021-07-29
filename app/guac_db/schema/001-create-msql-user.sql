CREATE DATABASE guac;
CREATE USER 'guacadmin'@'%' identified by 'guacadmin';
GRANT SELECT,INSERT,UPDATE,DELETE ON guac.* TO 'guacadmin'@'%';
flush privileges;