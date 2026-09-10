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

function sys_gpg_secret_key_exist () {

	local key_id="${1}"

	if gpg --list-secret-keys "${key_id}" > /dev/null 2>&1; then
		return 0
	fi

	return 1
}

function mod_gpg_secret_key_exist () {

	local key_id="${KEY_EMAIL}"

	sys_gpg_secret_key_exist "${key_id}"

}

function sys_gpg_key_create () {

	local key_name="${1}"
	local key_email="${2}"

gpg --batch --generate-key << __EOF__
Key-Type: RSA
Key-Length: 4096
Key-Usage: sign
Subkey-Type: RSA
Subkey-Length: 4096
Subkey-Usage: sign
Name-Real: ${key_name}
Name-Email: ${key_email}
Expire-Date: 0
%no-protection
%commit
__EOF__

}

function mod_gpg_key_create () {

	local key_name="${KEY_NAME}"
	local key_email="${KEY_EMAIL}"

	sys_gpg_key_create "${key_name}" "${key_email}"

}

function sys_gpg_public_key_export () {

	local key_id="${1}"
	local des_file_path="${2}"


	local run_cmd="gpg --yes --output ${des_file_path} --armor --export ${key_id}"


	echo ${run_cmd}
	${run_cmd}

}

function mod_gpg_public_key_export () {

	local key_email="${KEY_EMAIL}"
	local des_file_path="${REPO_PUBLIC_KEY_FILE_PATH}"

	sys_gpg_public_key_export "${key_email}" "${des_file_path}"

}

function sys_gpg_key_fingerprint () {

	local key_id="${1}"

	local run_cmd="gpg --fingerprint ${key_id}"

	echo ${run_cmd}
	${run_cmd}

}

function mod_gpg_key_fingerprint () {

	local key_id="${KEY_EMAIL}"

	sys_gpg_key_fingerprint "${key_id}"

}




################################################################################
## Model
################################################################################

function model_gpg_key_setup () {

	if mod_gpg_secret_key_exist; then

		echo
		echo "##"
		echo "## ## Key Exist"
		echo "##"
		echo

		mod_gpg_public_key_export

		mod_gpg_key_fingerprint

		return 0

	fi


	echo
	echo "##"
	echo "## ## Create New Key"
	echo "##"
	echo

	mod_gpg_key_create

	mod_gpg_public_key_export

	mod_gpg_key_fingerprint

}




################################################################################
## Portal
################################################################################

function portal_gpg_key_setup () {

	model_gpg_key_setup

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_gpg_key_setup

}

__main__
