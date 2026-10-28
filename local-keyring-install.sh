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

function sys_keyring_key_install () {

	local keyrings_dir_path="${KEYRINGS_DIR_PATH}"

	local repo_keyring_key_file_path="${REPO_KEYRING_KEY_FILE_PATH}"

	local repo_public_key_file_path="${REPO_PUBLIC_KEY_FILE_PATH}"


	echo "mkdir -p ${keyrings_dir_path}"
	mkdir -p "${keyrings_dir_path}"

	echo "cat ${repo_public_key_file_path} | sudo gpg --yes --dearmor --output ${repo_keyring_key_file_path}"
	echo
	cat "${repo_public_key_file_path}" | sudo gpg --yes --dearmor --output "${repo_keyring_key_file_path}"

}

function mod_keyring_key_install () {

	sys_keyring_key_install

}




################################################################################
## Model
################################################################################

function model_keyring_key_install () {

	mod_keyring_key_install

}




################################################################################
## Portal
################################################################################

function portal_keyring_key_install () {

	model_keyring_key_install

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_keyring_key_install

}

__main__
