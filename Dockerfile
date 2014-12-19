FROM ubuntu:14.04
MAINTAINER Doug Smith "doug.smith.mail@gmail.com"
RUN apt-get -yqq update
RUN apt-get -yqq install nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
ADD node-app /opt/nodeapp
WORKDIR /opt/nodeapp
RUN npm install
EXPOSE 8666
ENTRYPOINT ["nodejs", "server.js"]
