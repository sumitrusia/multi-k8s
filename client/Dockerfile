#Build phase
FROM node:alpine as builder
WORKDIR '/app'
#COPY package.json .
#For beanstalk...
COPY package*.json ./
#For proxy problem for windows & Sumit Linux machine
RUN npm config set proxy http://10.9.16.176:80
RUN npm config set https-proxy http://10.9.16.176:80

RUN npm install
COPY . .
RUN npm run build


#Run phase
FROM nginx
#For beanstalk...
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html