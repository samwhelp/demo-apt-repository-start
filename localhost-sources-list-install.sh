#!/usr/bin/env bash


################################################################################
## Environment
################################################################################

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


################################################################################
## Base Path
################################################################################

BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"




################################################################################
## Init
################################################################################

source "${BASE_DIR_PATH}/init.sh"




################################################################################
## Module
################################################################################

function sys_localhost_sources_list_install () {

	local repo_dir_path="$(pwd)/debian"

	echo "mkdir -p /etc/apt/sources.list.d"
	mkdir -p "/etc/apt/sources.list.d"

	echo 'echo "deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] http://localhost:8080/debian ./" | sudo tee "/etc/apt/sources.list.d/demo.list"'
	echo "deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] http://localhost:8080/debian ./" | sudo tee "/etc/apt/sources.list.d/demo.list"

}

function mod_localhost_sources_list_install () {

	sys_localhost_sources_list_install

}




################################################################################
## Model
################################################################################

function model_localhost_sources_list_install () {

	mod_localhost_sources_list_install

}




################################################################################
## Portal
################################################################################

function portal_localhost_sources_list_install () {

	model_localhost_sources_list_install

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_localhost_sources_list_install

}

__main__
