FROM mcr.microsoft.com/devcontainers/php:4-${templateOption:imageVariant}

COPY --from=joomla:${templateOption:joomlaVariant}-${templateOption:imageVariant}-fpm-alpine \
    /usr/src/joomla /var/www/html
