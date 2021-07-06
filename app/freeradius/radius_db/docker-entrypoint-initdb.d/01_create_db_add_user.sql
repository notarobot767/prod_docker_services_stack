CREATE DATABASE radius;
CREATE USER 'radiusadmin'@'localhost' identified by 'cisco';
CREATE USER 'radiusadmin'@'%' identified by 'cisco';
GRANT ALL ON radius.* TO radiusadmin@'localhost';
GRANT ALL ON radius.* TO radiusadmin@'%';
flush privileges;
