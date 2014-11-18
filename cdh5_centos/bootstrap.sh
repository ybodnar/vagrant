#!/usr/bin/env bash

source /vagrant/prepssh.sh
source /vagrant/centos_python.sh
source /vagrant/centos_java.sh
source /vagrant/centos_cdh5.sh

configure_ssh_for_hadoop &&

setup_python_devenv &&

install_java7 && 

install_cdh5

#hello


