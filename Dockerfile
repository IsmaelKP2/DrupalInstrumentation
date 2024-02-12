FROM drupal:latest

RUN apt-get update -y && apt-get install -y libmcrypt-dev

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ARG SPLUNK_ACCESS_TOKEN
ARG SPLUNK_REALM
ARG SERVICE_NAME

RUN /usr/local/bin/composer install
RUN  mkdir /var/www/html/sites/default/files
RUN chown www-data:www-data /var/www/html/sites/default/files
RUN ls -ll /var/www/html/sites/default
RUN chmod 777 /var/www/html/sites/default/files
RUN touch /var/www/html/sites/default/settings.php
RUN cat /var/www/html/sites/default/default.settings.php > /var/www/html/sites/default/settings.php
RUN chown www-data:www-data /var/www/html/sites/default/settings.php
RUN chmod 777 /var/www/html/sites/default/settings.php
RUN ls -ll /var/www/html/sites/default

RUN curl -LO https://github.com/signalfx/signalfx-php-tracing/releases/latest/download/signalfx-setup.php \
        && php signalfx-setup.php --php-bin=all \
        && php signalfx-setup.php --update-config --signalfx.endpoint_url=http://splunk-otel-collector:9411/api/v2/spans \
        && php signalfx-setup.php --update-config --signalfx.access_token=$SPLUNK_ACCESS_TOKEN \
        && php signalfx-setup.php --update-config --signalfx.service_name=$SERVICE_NAME

CMD ["apache2-foreground"]
