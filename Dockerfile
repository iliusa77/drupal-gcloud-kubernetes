#FROM iliusa77/drupal:0.1
FROM gcr.io/elemental-kite-183209/drupal:latest
LABEL maintainer "FFW <ilia.comarov@ffwagency.com>"

WORKDIR /opt/bitnami/drupal/

COPY ./project/docroot/release.php .
COPY ./project/docroot/composer.json .
COPY ./project/docroot/composer.lock .

RUN composer install --no-dev
