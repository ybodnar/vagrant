#!/usr/bin/env bash


function install_cdh5() {
	curl -O http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
	sudo yum --nogpgcheck -y localinstall cloudera-cdh-5-0.x86_64.rpm
	sudo rpm --import http://archive.cloudera.com/cdh5/redhat/5/x86_64/cdh/RPM-GPG-KEY-cloudera
	sudo yum install -y hadoop-0.20-conf-pseudo

	configure_hdfs
	configure_mapreduce1	
}

function configure_hdfs() {
	sudo -u hdfs hdfs namenode -format	
	
	for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done
	
	sudo -u hdfs hadoop fs -mkdir -p /tmp 
	sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
	sudo -u hdfs hadoop fs -mkdir -p /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
	sudo -u hdfs hadoop fs -chmod 1777 /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
	sudo -u hdfs hadoop fs -chown -R mapred /var/lib/hadoop-hdfs/cache/mapred

	sudo -u hdfs hadoop fs -mkdir -p /user/$USER 
	sudo -u hdfs hadoop fs -chown $USER /user/$USER
}

function configure_mapreduce1() {
	for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done
}







