FROM debian:12-slim

EXPOSE 8000

WORKDIR /loganalyzer

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gettext nginx php-fpm php-cli php-xml php-bcmath php-ctype php-fileinfo php-json php-mbstring php-pdo php-tokenizer php-curl composer

RUN useradd -ms /bin/bash loganalyzer
RUN mkdir /loganalyzer/static
RUN mkdir /loganalyzer/media
RUN mkdir /loganalyzer/logapp

# RUN mkdir ./nginx-templates
# RUN mkdir ./nginx-conf.d
# ENV NGINX_ENVSUBST_TEMPLATE_DIR /loganalyzer/nginx-templates
# ENV NGINX_ENVSUBST_OUTPUT_DIR /loganalyzer/nginx-conf.d
# 
# COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY ./nginx.default.conf.template ./nginx-templates/default.conf.template

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# COPY ./ ./

RUN chown -R loganalyzer:loganalyzer /loganalyzer

USER loganalyzer

CMD ["./entrypoint.sh"]
