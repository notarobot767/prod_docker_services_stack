CREATE DATABASE radius;
CREATE USER 'radiusadmin'@'%' identified by 'cisco';
GRANT ALL ON radius.* TO radiusadmin@'%';
flush privileges;
