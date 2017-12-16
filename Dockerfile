FROM node:carbon

MAINTAINER Tim Udoma <timudoma@gmail.com>

#Prevent Docker from re-installing node modules everytime the app's sorce changes
#Install dependencies
COPY package*.json  /tmp/package.json
RUN cd /tmp && npm install --production
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

#Create a working directory for the app
WORKDIR /opt/app

# Bundle app source
COPY . /opt/app

#App's running port 3000
EXPOSE 3000

CMD ["npm", "start"]
