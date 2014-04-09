#!/usr/bin/env bash

function setup_python_devenv() {
	sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

	sudo yum -y update
	sudo yum install -y python-pip
	sudo yum install -y python-virtualenv	
}
