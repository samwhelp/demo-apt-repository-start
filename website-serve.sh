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

function sys_website_serve_by_python () {

	echo "python3 -m http.server"
	python3 -m http.server

}



function sys_website_serve_by_php () {

	local website_localhost_name="${WEBSITE_LOCALHOST_NAME}"
	local website_localhost_port="${WEBSITE_LOCALHOST_PORT}"

	WEBSITE_LOCALHOST_NAME="localhost"
	WEBSITE_LOCALHOST_PORT="8080"

	echo "php -S ${website_localhost_name}:${website_localhost_port}"
	echo
	php -S "${website_localhost_name}:${website_localhost_port}"

}

function mod_website_serve () {

	#sys_website_serve_by_python

	sys_website_serve_by_php

}




################################################################################
## Model
################################################################################

function model_website_serve () {

	mod_website_serve

}




################################################################################
## Portal
################################################################################

function portal_website_serve () {

	model_website_serve

}


################################################################################
## Main
################################################################################

function __main__ () {

	portal_website_serve

}

__main__
