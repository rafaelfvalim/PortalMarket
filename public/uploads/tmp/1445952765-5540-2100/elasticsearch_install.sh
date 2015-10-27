cd ~
##If you want to install OpenJDK
#sudo apt-get update
#sudo apt-get install openjdk-8-jre-headless -y

###Or if you want to install Oracle JDK, which seems to have slightly better performance
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

### Check http://www.elasticsearch.org/download/ for latest version of ElasticSearch and replace wget link below

wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.deb
sudo dpkg -i elasticsearch-1.4.2.deb

### NOT starting elasticsearch by default on bootup, please execute
 sudo update-rc.d elasticsearch defaults 95 10
### In order to start elasticsearch, execute
 sudo /etc/init.d/elasticsearch start

#To test it all worked:
#curl http://localhost:9200
#Should return some JSON Object including the version number