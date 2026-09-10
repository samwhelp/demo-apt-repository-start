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

function sys_repo_packages_file_update () {

	##
	## ## Create 'debian/Packages'
	##

	echo 'dpkg-scanpackages --multiversion . > Packages'
	dpkg-scanpackages --multiversion . > Packages

}

function mod_repo_packages_file_update () {

	sys_repo_packages_file_update

}

function sys_repo_packages_file_compress () {

	##
	## ## Create 'debian/Packages.gz'
	##

	echo "gzip -k -f Packages"
	gzip -k -f Packages

}

function sys_repo_packages_file_compress_v2 () {

	##
	## ## Create 'debian/Packages.gz'
	##

	echo "gzip -k -f -n Packages"
	gzip -k -f -n Packages

}

function mod_repo_packages_file_compress () {

	#sys_repo_packages_file_compress

	sys_repo_packages_file_compress_v2

}

function sys_repo_release_file_update () {

	##
	## ## Create 'debian/Release'
	##

	echo 'apt-ftparchive release . > Release'
	apt-ftparchive release . > Release

}

function mod_repo_release_file_update () {

	sys_repo_release_file_update

}

function sys_repo_release_file_gpg () {

	##
	## ## Create 'debian/Release.gpg'
	##

	local key_id="${1}"

	echo "gpg --yes -u "${key_id}" -abs -o Release.gpg Release"
	gpg --yes -u "${key_id}" -abs -o Release.gpg Release

}

function mod_repo_release_file_gpg () {

	local key_id="${KEY_EMAIL}"

	sys_repo_release_file_gpg "${key_id}"

}


function sys_repo_release_file_gpg_sign () {

	##
	## ## Create 'debian/InRelease'
	##

	local key_id="${1}"

	echo "gpg --yes -u "${key_id}" --clearsign -o InRelease Release"
	gpg --yes -u "${key_id}" --clearsign -o InRelease Release

}

function mod_repo_release_file_gpg_sign () {

	local key_id="${KEY_EMAIL}"

	sys_repo_release_file_gpg_sign "${key_id}"

}


function mod_repo_release_file_sign () {

	mod_repo_release_file_gpg

	mod_repo_release_file_gpg_sign

}


################################################################################
## Model
################################################################################

function module_repo_update () {

	mod_repo_packages_file_update
	mod_repo_packages_file_compress

	mod_repo_release_file_update
	mod_repo_release_file_sign

}

function model_repo_update () {

	local repo_dir_path="${REPO_DIR_PATH}"

	pushd "${repo_dir_path}" > /dev/null

	module_repo_update

	popd > /dev/null

}




################################################################################
## Portal
################################################################################

function portal_repo_update () {

	model_repo_update

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_repo_update

}

__main__
