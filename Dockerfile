FROM mhart/alpine-node
LABEL Name=stickerapp Version=0.19.0 
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /usr/src/app && mv /tmp/node_modules /usr/src
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN /usr/src/node_modules/.bin/gulp
EXPOSE 3000
CMD npm start
