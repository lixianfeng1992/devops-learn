FROM node:alpine as builder

WORKDIR /app

COPY . /app

RUN yarn \
    && yarn build

FROM nginx:alpine

EXPOSE 80

COPY --from=builder /app/dist /usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]