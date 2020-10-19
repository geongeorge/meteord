#!/bin/bash
set -e
if [ -z "$NODE_VERSION" ]; then
  echo "Must set NODE_VERSION with --build-arg NODE_VERSION=x.y.z when building docker image"
  exit 1
fi
echo "Installing Node v${NODE_VERSION}"
NODE_ARCH=x64

# check we need to do this or not

# NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

# cd /tmp
# curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
# tar xvzf ${NODE_DIST}.tar.gz
# rm -rf /opt/nodejs
# mv ${NODE_DIST} /opt/nodejs

# ln -sf /opt/nodejs/bin/node /usr/bin/node
# ln -sf /opt/nodejs/bin/npm /usr/bin/npm



# echo 'export NVM_DIR="/opt/circleci/.nvm"' >> "$BASH_ENV"
# echo ' [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$BASH_ENV"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
node -v
nvm install v12
nvm alias default v12

echo "Current node version"
node -v


npm install --global npm@6
