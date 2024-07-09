FROM dunglas/frankenphp
ARG COMPOSER_AUTH
RUN apt-get update && apt-get install -y --no-install-recommends \
	acl \
	file \
	gettext \
	git \
	&& rm -rf /var/lib/apt/lists/*

RUN set -eux; \
	install-php-extensions \
		@composer \
		apcu \
		intl \
		opcache \
		zip \
	;

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
# demo purpose, we want the symfony toolbar !
ENV APP_ENV=dev XDEBUG_MODE=off
# Ideally you will pass this with -e flag on the cmd line, 
# but here we want simplicity for demo purpose
ENV FRANKENPHP_CONFIG="worker /app/public/index.php"
ENV APP_RUNTIME=Runtime\\FrankenPhpSymfony\\Runtime
COPY . /app/

