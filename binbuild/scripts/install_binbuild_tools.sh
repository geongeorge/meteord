set -e
set -x
# for npm module re-building
apt-get update -y
apt-get -y install build-essential g++ libssl-dev git python






npm install -g node-gyp
# pre-install node source code for faster building
echo "Pre-install node source code for faster building v${NODE_VERSION}"
# TEMP: Enabling this
# $(npm bin -g)/node-gyp install ${NODE_VERSION}

bash $METEORD_DIR/lib/cleanup.sh
