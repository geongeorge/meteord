set -e
set -x
# for npm module re-building
apt-get update -y
apt-get -y install build-essential g++ libssl-dev git python

# Install node

cd /tmp
curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
tar xvzf ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm

# End Install node

echo "Current node version"
node -v


npm install -g node-gyp
# pre-install node source code for faster building
echo "Pre-install node source code for faster building v${NODE_VERSION}"
# TEMP: Enabling this
# $(npm bin -g)/node-gyp install ${NODE_VERSION}

bash $METEORD_DIR/lib/cleanup.sh
