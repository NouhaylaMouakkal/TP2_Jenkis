FROM nginx
COPY ./src/index.html /usr/share/nginx/html
EXPOSE 80
