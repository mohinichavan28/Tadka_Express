FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY offers.json /usr/share/nginx/html/offers.json
EXPOSE 80
