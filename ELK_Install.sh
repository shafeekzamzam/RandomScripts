#Assuming Ubuntu OS

#Install PreRequisites
sudo apt-get update
sudo apt-get install openjdk-11-jre-headless
java -version

#Installing Elasticsearch
https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.1-linux-x86_64.tar.gz
#update the download URL as required
sudo apt-get update
sudo apt-get install elasticsearch
sudo service elasticsearch start
curl localhost:9200

#Installing and setting up Logstash
https://artifacts.elastic.co/downloads/logstash/logstash-7.14.1-linux-x86_64.tar.gz
#update the download URL as required
sudo apt-get update
sudo apt-get install logstash
sudo apt-get update
sudo service logstash start
sudo service logstash status


sudo echo 'input {
    file {
    type => "syslog"
    path => [ "/var/log/messages", "/var/log/*.log" ]
    }
    }
    output {
    stdout {
    codec => rubydebug
    }
    elasticsearch {
    host => "localhost" # If you are running elasticsearch in different instance, use #the prive ip instead of localhost.
    }
    }'>> /etc/logstash/conf.d/logstash-syslog.conf
    
sudo service logstash restart
    
    
#Installing and configuring kibana
https://artifacts.elastic.co/downloads/kibana/kibana-7.14.1-linux-x86_64.tar.gz
#update the download URL as required
tar -xzf kibana
sudo mkdir -p /opt/kibana
sudo mv kibana* /opt/kibana
    
cd /etc/init.d && sudo wget https://raw.githubusercontent.com/akabdog/scripts/master/kibana4_init -O kibana4
sudo chmod +x /etc/init.d/kibana4
sudo update-rc.d kibana4 defaults 96 9
    
sudo service kibana4 start
    
    
    
    
    
    
    
    
    
    
    
    
