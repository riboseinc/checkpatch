#!/bin/sh

CHECKPATCH_SCRIPT=checkpatch.pl
SPELLING_TXT=spelling.txt

KERNEL_RAW_URL="https://raw.githubusercontent.com/torvalds/linux/master"
CHECKPATCH_URL="${KERNEL_RAW_URL}/scripts/${CHECKPATCH_SCRIPT}"
SPELLING_URL="${KERNEL_RAW_URL}/scripts/${SPELLING_TXT}"

# check if brew is installed
readonly brew="/usr/local/bin/brew"
if [ ! -x "${brew}" ]; then
	echo "Couldn't execute '${brew}'. (Hint: install Homebrew 'https://brew.sh/')"
	exit 1
fi

# check if wget is installed
readonly WGET_DIR="$(${brew} --prefix wget)"
if [ ! -d "${WGET_DIR}" ]; then
	echo "Couldn't find wget installation directory. (Hint: `brew install wget`)"
	exit 1
fi

# remove the old files
rm -f "${CHECKPATCH_SCRIPT}" "${SPELLING_TXT}"

echo "Downloading checkpatch.pl..."
wget "${CHECKPATCH_URL}"
chmod 555 "${CHECKPATCH_SCRIPT}"

echo "Downloading spelling.txt..."
wget "${SPELLING_URL}"
