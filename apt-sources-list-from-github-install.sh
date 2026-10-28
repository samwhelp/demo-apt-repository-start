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

	local repo_keyring_key_file_path="${REPO_KEYRING_KEY_FILE_PATH}"

	local apt_sources_list_dir_path="${APT_SOURCES_LIST_DIR_PATH}"
	local repo_sources_list_file_path="${REPO_SOURCES_LIST_FILE_PATH}"

	local repo_dir_name="${REPO_DIR_NAME}"
	local repo_dir_path="${REPO_DIR_PATH}"

	local website_top_url="${WEBSITE_TOP_URL_GITHUB}"

	echo "mkdir -p ${apt_sources_list_dir_path}"
	mkdir -p "${apt_sources_list_dir_path}"

	echo "echo \"deb [signed-by=${repo_keyring_key_file_path}] ${website_top_url}/${repo_dir_name} ./\" | sudo tee \"${repo_sources_list_file_path}\""
	echo
	echo "deb [signed-by=${repo_keyring_key_file_path}] ${website_top_url}/${repo_dir_name} ./" | sudo tee "${repo_sources_list_file_path}"

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
