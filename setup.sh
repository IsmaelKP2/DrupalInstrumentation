curl -LO https://github.com/signalfx/signalfx-php-tracing/releases/latest/download/signalfx-setup.php
php signalfx-setup.php --php-bin=all
php signalfx-setup.php --update-config --signalfx.endpoint_url=https://ingest.us1.signalfx.com/v2/trace/signalfxv1
php signalfx-setup.php --update-config --signalfx.access_token=U3EJ9YqiOOH7VKApYY9Rwg
php signalfx-setup.php --update-config --signalfx.service_name=test-drupal