FROM dunglas/frankenphp
# demo purpose, we want the symfony toolbar !
ENV APP_ENV=dev XDEBUG_MODE=off
# Ideally you will pass this with -e flag on the cmd line, 
# but here we want simplicity for demo purpose
ENV FRANKENPHP_CONFIG="worker /app/public/index.php"
ENV APP_RUNTIME=Runtime\\FrankenPhpSymfony\\Runtime
COPY . /app/

