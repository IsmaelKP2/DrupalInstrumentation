# Installation

before running the example fill the environment variables:

copy .env.example in .env 

```
cp .env.example .env
```

e.g
```
SPLUNK_ACCES_TOKEN=XXXXXXXXXXXXXXXXXXXXXXX
REALM=us1
SPLUNK_REALM=us1
SPLUNK_HEC_TOKEN=XXXXXXXXXXXXXXXXXXXXXXX
SERVICE_NAME=test-drupal
SIGNALFX_SERVICE_NAME=test-drupal
DEPLOYMENT_ENVIRONMENT=test-drupal-env

```

# Run the example

```
docker-compose up
```


# (1) Build the instrumented Drupal service
docker build -t drupal-signalfx:latest -f Dockerfile

PHP Stuff
composer create-project drupal/recommended-project:10.2.2
mv recommended-project/* .
composer update
sudo apt-get update
sudo apt install php-xml
sudo apt install php-gd