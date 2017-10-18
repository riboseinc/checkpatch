#!/bin/bash

readonly CHECKPATCH_SCRIPT=checkpatch.pl
readonly SPELLING_TXT=spelling.txt

readonly KERNEL_RAW_URL="https://raw.githubusercontent.com/torvalds/linux/master"
readonly CHECKPATCH_URL="${KERNEL_RAW_URL}/scripts/${CHECKPATCH_SCRIPT}"
readonly SPELLING_URL="${KERNEL_RAW_URL}/scripts/${SPELLING_TXT}"

echo "Downloading '${CHECKPATCH_SCRIPT}'..."
curl -f "${CHECKPATCH_URL}" -o "${CHECKPATCH_SCRIPT} || \
	exit 1
chmod 555 "${CHECKPATCH_SCRIPT}"

echo "Downloading '${SPELLING_TXT}'..."
curl -f "${SPELLING_URL}" -o "${SPELLING_TXT}" || \
	exit 1
