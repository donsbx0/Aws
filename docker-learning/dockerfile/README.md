### Build 2 separate docker image (mysql , php app) and check connection from php app to mysql

# 1. Build image from Dockerfile_mysql
docker build -t mysql:v1 .

#Run image
docker run --name=mysql-v1 --add-host=mysql.v1:172.31.38.205 --add-host=phpapache.v1:172.31.38.205 -p 5678:3306 -dt mysql:v1

#Access mysql
docker exec -it mysql-v1 mysql -u root -P 5678 -p

# 2. Build image from Dockerfile_php
docker build -t php-apache:8.0 .

#Run image 
docker run --name=php-apache-v1 --add-host=phpapache.v1:172.31.38.205 --add-host=mysql.v1:172.31.38.205 -p 5556:80 -dt php-apache:8.0
