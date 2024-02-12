# Installation

before running the example fill the environment variables:

## docker-compose.yml

fill the environment value for the splunk-otel-collector service
```
splunk-otel-collector:
...
    environment:
        - SPLUNK_ACCESS_TOKEN=
        - ...
        - SPLUNK_HEC_TOKEN=
        - SPLUNK_REALM=
```
fill the environment value for the drupal service 

```
drupal:
...
    environment:
      - MYSQL_USERNAME=root
      - MYSQL_PASSWORD=root
      - SIGNALFX_SERVICE_NAME="<SERVICE_NAME>"
      - SIGNALFX_ENDPOINT_URL='http://localhost:9080/v1/trace'
      - SIGNALFX_TRACE_GLOBAL_TAGS="deployment.environment:<DEPLOYMENT_ENVIRONMENT>"
```

## change the value of REALM and ACCESS_TOKEN in setup.sh 

```
--signalfx.endpoint_url=https://ingest.<REALM>.signalfx.com/v2/trace/signalfxv1
--signalfx.access_token=<ACCESS_TOKEN>
--signalfx.service_name=<SERVICE_NAME>
```

# Run the example

```
docker-compose up
```


# (1) Build the instrumented Drupal service
docker build -t drupal-signalfx:latest -f Dockerfile

PHP Stuff
create-project drupal/recommended-project:10.2.2
composer update
sudo apt-get update
sudo apt install php-xml
sudo apt install php-gd