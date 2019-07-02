#! /bin/bash
apt update -y
apt install default-jdk -y
apt install unzip
mkdir /opt/tomcat
useradd -s /bin/false -d /opt/tomcat tomcat
curl -k https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz -o /tmp/apache-tomcat-9.0.10.tar.gz
tar xzvf /tmp/apache-tomcat-9.0.10.tar.gz -C /opt/tomcat --strip-components=1
chgrp -R tomcat /opt/tomcat
chmod -R g+r /opt/tomcat/conf
chmod g+x /opt/tomcat/conf
chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/

cat > /tmp/tomcat.service <<EOL
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOL

sudo cp -v /tmp/tomcat.service /etc/systemd/system/tomcat.service 
#Download our binary
wget -O /tmp/hello.war https://github.com/OmerCeliker/helloWwar/blob/master/dist/hello-1.0.0.war?raw=true
cp -v /tmp/hello.war /opt/tomcat/webapps 
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat