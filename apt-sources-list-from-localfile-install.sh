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

function sys_apt_sources_list_from_localfile_install () {

	local apt_sources_list_dir_path="${APT_SOURCES_LIST_DIR_PATH}"
	local repo_sources_list_file_path="${REPO_SOURCES_LIST_FILE_PATH}"

	local repo_dir_name="${REPO_DIR_NAME}"
	local repo_dir_path="${REPO_DIR_PATH}"

	echo "mkdir -p ${apt_sources_list_dir_path}"
	mkdir -p "${apt_sources_list_dir_path}"

	echo "echo \"deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] file://${repo_dir_path} ./\" | sudo tee \"${repo_sources_list_file_path}\""
	echo
	echo "deb [signed-by=/usr/share/keyrings/demo-archive-keyring.gpg] file://${repo_dir_path} ./" | sudo tee "${repo_sources_list_file_path}"

}

function mod_apt_sources_list_from_localfile_install () {

	sys_apt_sources_list_from_localfile_install

}




################################################################################
## Model
################################################################################

function model_apt_sources_list_from_localfile_install () {

	mod_apt_sources_list_from_localfile_install

}




################################################################################
## Portal
################################################################################

function portal_apt_sources_list_from_localfile_install () {

	model_apt_sources_list_from_localfile_install

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_apt_sources_list_from_localfile_install

}

__main__
