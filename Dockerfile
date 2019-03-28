FROM node:10.15.3-slim

RUN apt-get update \
    && apt-get install -y nginx

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN yarn \
    && yarn build \
    && cp -r dist/* /var/www/html \
    && rm -rf /app

CMD [ "nginx", "-g", "daemon off;" ]