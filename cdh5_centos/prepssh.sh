#!/usr/bin/env bash

function configure_ssh_for_hadoop() {
	ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	ssh-keyscan -H 127.0.0.1 > ~/.ssh/known_hosts
	ssh-keyscan -H localhost > ~/.ssh/known_hosts	
}
