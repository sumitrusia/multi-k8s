FROM node:alpine
WORKDIR '/app'

COPY ./package.json .
#For proxy problem for windows & Sumit Linux machine
#RUN npm config set proxy http://10.9.16.176:80
#RUN npm config set https-proxy http://10.9.16.176:80
RUN npm install

COPY . .
CMD ["npm", "run", "start"]