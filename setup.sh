curl -LO https://github.com/signalfx/signalfx-php-tracing/releases/latest/download/signalfx-setup.php
php signalfx-setup.php --php-bin=all
php signalfx-setup.php --update-config --signalfx.endpoint_url=https://ingest.<REALM>.signalfx.com/v2/trace/signalfxv1
php signalfx-setup.php --update-config --signalfx.access_token=<ACCESS_TOKEN>
php signalfx-setup.php --update-config --signalfx.service_name=<SERVICE_NAME>