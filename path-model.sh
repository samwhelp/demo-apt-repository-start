

################################################################################
## Path / Model
################################################################################


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


REPO_KEYRING_KEY_FILE_NAME="${subject_id}-archive-keyring.gpg"
REPO_KEYRING_KEY_FILE_PATH="${KEYRINGS_DIR_PATH}/${REPO_KEYRING_KEY_FILE_NAME}"




################################################################################
## Path / Model / Apt
################################################################################

APT_SOURCES_LIST_DIR_NAME="sources.list.d"
APT_SOURCES_LIST_DIR_PATH="/etc/apt/${APT_SOURCES_LIST_DIR_NAME}"


REPO_SOURCES_LIST_FILE_NAME="${subject_id}.list"
REPO_SOURCES_LIST_FILE_PATH="${APT_SOURCES_LIST_DIR_PATH}/${REPO_SOURCES_LIST_FILE_NAME}"
