#!/bin/bash

if [[ -z "${CLOUDCMD_USR}" ]] || [[ -z "${CLOUDCMD_PASS}" ]]; then
    
    echo "WARNING: Cloud Commander launched without authentication"
    cloudcmd --root /mnt/ls
    
else
    echo "Authenticated launch"
    cloudcmd --username ${CLOUDCMD_USR} --password ${CLOUDCMD_PASS} --auth --root /mnt/ls

fi
