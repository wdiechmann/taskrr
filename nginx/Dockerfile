FROM nginx:1.9
# FROM nginx:alpine 
# once ready for production !!
LABEL   "Author"="ALCO Company, Walther H Diechmann - walther@alco.dk" \
        "maintainer"="ALCO Company, Walther H Diechmann - walther@alco.dk" \
        "version"="1.0"

#  default conf for proxy service
COPY ./services.conf /etc/nginx/conf.d/default.conf

# NOT FOUND response
COPY ./html/ /var/www/html/

#  Proxy and SSL configurations
COPY ./includes/ /etc/nginx/includes/

# Proxy SSL certificates
COPY ./ssl/ /etc/ssl/certs/nginx/

RUN echo Europe/Copenhagen > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
