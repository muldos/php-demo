FROM dunglas/frankenphp

# Ideally you will pass this with -e flag on the cmd line, 
# but here we want simplicity for demo purpose

ENV FRANKENPHP_CONFIG="worker /app/public/index.php"
ENV APP_RUNTIME=Runtime\\FrankenPhpSymfony\\Runtime 
COPY . /app/