#!/bin/sh

# python3 /loganalyzer/app/manage.py wait_for_database
# python3 /loganalyzer/app/manage.py makemigrations --no-input
# python3 /loganalyzer/app/manage.py migrate
# python3 /loganalyzer/app/manage.py collectstatic --no-input
# python3 /loganalyzer/app/manage.py compilemessages
# if [ "$DEBUG" = "True" ]
# then
#   /docker-entrypoint.sh nginx
#   python3 /loganalyzer/app/manage.py runserver 0.0.0.0:8008
# else
#   gunicorn --chdir /loganalyzer/app loganalyzer.wsgi:application --bind 0.0.0.0:8008 --daemon
#   /docker-entrypoint.sh nginx -g "daemon off;"
# fi

php /loganalyzer/app/artisan serve
