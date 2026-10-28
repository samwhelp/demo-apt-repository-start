

################################################################################
## Path / Base
################################################################################

##
## * gear / Makefile
## * gear / args.sh
## * gear / prepare.sh
## * gear / gpg-setup.sh
## * gear / repo-update.sh
##

GEAR_DIR_PATH="${BASE_DIR_PATH}"
PLAN_DIR_PATH="${BASE_DIR_PATH}"




################################################################################
## Path / Model / Repo
################################################################################

REPO_DIR_NAME="debian"
REPO_DIR_PATH="${PLAN_DIR_PATH}/${REPO_DIR_NAME}"




################################################################################
## Path / Model / Keyrings
################################################################################

KEYRINGS_DIR_NAME="keyrings"
KEYRINGS_DIR_PATH="/usr/share/${KEYRINGS_DIR_NAME}"




################################################################################
## Path / Model / Key
################################################################################

REPO_PUBLIC_KEY_FILE_NAME="key.asc"
REPO_PUBLIC_KEY_FILE_PATH="${REPO_DIR_PATH}/${REPO_PUBLIC_KEY_FILE_NAME}"


REPO_KEYRING_KEY_FILE_NAME="demo-archive-keyring.gpg"
REPO_KEYRING_KEY_FILE_PATH="${KEYRINGS_DIR_PATH}/${REPO_KEYRING_KEY_FILE_NAME}"
