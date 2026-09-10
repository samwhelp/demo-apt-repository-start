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

function sys_local_keyring_install () {

	echo "mkdir -p /usr/share/keyrings"
	mkdir -p "/usr/share/keyrings"

	echo "cat debian/key.asc | sudo gpg --yes --dearmor --output /usr/share/keyrings/demo-archive-keyring.gpg"
	cat "debian/key.asc" | sudo gpg --yes --dearmor --output "/usr/share/keyrings/demo-archive-keyring.gpg"

}

function mod_local_keyring_install () {

	sys_local_keyring_install

}




################################################################################
## Model
################################################################################

function model_local_keyring_install () {

	mod_local_keyring_install

}




################################################################################
## Portal
################################################################################

function portal_local_keyring_install () {

	model_local_keyring_install

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_local_keyring_install

}

__main__
