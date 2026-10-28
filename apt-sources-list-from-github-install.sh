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

function sys_apt_sources_list_from_github_install () {

	local repo_dir_name="${REPO_DIR_NAME}"
	local repo_dir_path="${REPO_DIR_PATH}"

	echo "mkdir -p /etc/apt/sources.list.d"
	mkdir -p "/etc/apt/sources.list.d"

	echo "echo \"deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] https://samwhelp.github.io/demo-apt-repository-start/${repo_dir_name} ./\" | sudo tee \"/etc/apt/sources.list.d/demo.list\""
	echo
	echo "deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] https://samwhelp.github.io/demo-apt-repository-start/${repo_dir_name} ./" | sudo tee "/etc/apt/sources.list.d/demo.list"

}

function mod_apt_sources_list_from_github_install () {

	sys_apt_sources_list_from_github_install

}




################################################################################
## Model
################################################################################

function model_apt_sources_list_from_github_install () {

	mod_apt_sources_list_from_github_install

}




################################################################################
## Portal
################################################################################

function portal_apt_sources_list_from_github_install () {

	model_apt_sources_list_from_github_install

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_apt_sources_list_from_github_install

}

__main__
