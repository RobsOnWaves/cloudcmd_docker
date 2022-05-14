#!/bin/bash

if [[ -z "${CLOUDCMD_USR}" ]] || [[ -z "${CLOUDCMD_PASS}" ]]; then
    MY_SCRIPT_VARIABLE="Some default value because DEPLOY_ENV is undefined"
else
  MY_SCRIPT_VARIABLE="${CLOUDCMD_USR}"
fi

echo $MY_SCRIPT_VARIABLE