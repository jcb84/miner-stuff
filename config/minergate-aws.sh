#!/bin/bash

export MAIL="###MAIL###"

export LOG_MG="/var/log/minergate"
export LOG_MG_INSTALL="${LOG_XMRIG}_install"

echo > ${LOG_MG}
echo > ${LOG_MG_INSTALL}

wget -O /tmp/mine.deb https://minergate.com/download/deb-cli >> ${LOG_MG_INSTALL}
dpkg -i /tmp/mine.deb >> ${LOG_MG_INSTALL}
rm /tmp/mine.deb
minergate-cli -user ${MAIL} -xmr 2>&1 > ${LOG_MG}
