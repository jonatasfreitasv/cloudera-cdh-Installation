# All Nodes
sudo yum update
sudo yum install nano wget

sudo rpm --import https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/RPM-GPG-KEY-cloudera
sudo wget https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/cloudera-manager.repo -P /etc/yum.repos.d/

sudo yum install oracle-j2sdk1.7

# Node 1
sudo yum install cloudera-manager-daemons cloudera-manager-server

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum update
sudo yum install mysql-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo /usr/bin/mysql_secure_installation

wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz
tar zxvf mysql-connector-java-5.1.46.tar.gz

sudo mkdir -p /usr/share/java/
cd mysql-connector-java-5.1.46
sudo cp mysql-connector-java-5.1.46-bin.jar /usr/share/java/mysql-connector-java.jar

CREATE DATABASE scm DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL ON <database>.* TO '<user>'@'%' IDENTIFIED BY '<password>';

/usr/share/cmf/schema/scm_prepare_database.sh mysql scm root Fast421566

sudo systemctl start cloudera-scm-server

http://node-1:7180
