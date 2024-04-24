FROM golang:latest

EXPOSE 8080

WORKDIR /loganalyzer

RUN apt-get update && apt-get upgrade -y

RUN useradd -ms /bin/bash loganalyzer
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

#COPY ./logapp/go.mod ./logapp/
#COPY ./logapp/go.sum ./logapp/

# COPY ./ ./

RUN chown -R loganalyzer:loganalyzer /loganalyzer

USER loganalyzer

CMD ["./entrypoint.sh"]
