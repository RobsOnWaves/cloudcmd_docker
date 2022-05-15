#!/bin/bash

if [[ -z "${CLOUDCMD_USR}" ]] || [[ -z "${CLOUDCMD_PASS}" ]]; then
    
    echo "WARNING: Cloud Commander launched without authentication"
    
    cloudcmd
    
else
    echo "Authenticated launch"
    cloudcmd --username ${CLOUDCMD_USR} --password ${CLOUDCMD_PASS} --auth --save --no-server --root /mnt/ls
    cloudcmd
fi
