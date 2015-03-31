#!/bin/zsh
TARGET="${HOME}/.emacs.d"

SCRIPT_FILE=$0
SCRIPT_PATH=$(dirname $SCRIPT_FILE)

cd ${SCRIPT_PATH}
dir=$(basename ${PWD})
cd ..
SOURCE="${PWD}/${dir}"

if [[ -d ${TARGET} ]]; then
    realpath=$(readlink ${TARGET})
    if [[ ${realpath} == ${SOURCE} ]]; then
        echo "Already install"
        exit
    else
        echo "mv ${TARGET} ${TARGET}_BACK_`date +%s`"
        eval "mv ${TARGET} ${TARGET}_BACK_`date +%s`"
    fi
fi

link_command="ln -sf ${SOURCE} ${TARGET}"

echo ${link_command}
eval ${link_command}
