FROM debian:stretch
MAINTAINER Jesse Rosenberger

ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION:-12.19.0}
ONBUILD ENV NODE_VERSION ${NODE_VERSION:-12.19.0}

RUN bash $METEORD_DIR/lib/install_base.sh
RUN bash $METEORD_DIR/lib/install_node.sh
# No Need Phantom js anymore
# RUN bash $METEORD_DIR/lib/install_phantomjs.sh
RUN bash $METEORD_DIR/lib/cleanup.sh

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
# RUN chmod +x /usr/local/bin/dumb-init
# ENTRYPOINT ["dumb-init", "--"]

# Install puppeteer so it's available in the container.
# RUN npm i puppeteer --unsafe-perm
    # Add user so we don't need --no-sandbox.
    # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
    # && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    # && mkdir -p /home/pptruser/Downloads \
    # && chown -R pptruser:pptruser /home/pptruser \
    # && chown -R pptruser:pptruser /node_modules


# USER pptruser
# CMD ["google-chrome-stable"]

# Run everything after as non-privileged user.
EXPOSE 80

RUN chmod +x $METEORD_DIR/run_app.sh


ENTRYPOINT exec $METEORD_DIR/run_app.sh

