######################## AMZL Linux ##############################
sudo yum update -y
sudo yum search docker
sudo yum info docker
############### install docker #####################
sudo yum install docker
################ set permission ####################
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

############## install docker compose ###############
# 1. Get pip3 
sudo yum install python3-pip
 
# 2. Then run any one of the following
sudo pip3 install docker-compose # with root access
 
# OR #
 
pip3 install --user docker-compose # without root access for security reasons

sudo systemctl enable docker.service
sudo systemctl start docker.service