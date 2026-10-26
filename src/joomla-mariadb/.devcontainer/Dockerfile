FROM mcr.microsoft.com/devcontainers/php:4-${templateOption:phpVersion}-trixie

# Install dependencies
RUN set -eux; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y \
    # System goodies
    htop \
    mc \
    ssl-cert \
    # Needed for the zst Joomla package
    zstd \
    ; \
    apt-get clean \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV JOOMLA_VERSION=${templateOption:joomlaVersion}
ENV JOOMLA_PACKAGE="Joomla_${JOOMLA_VERSION}-Stable-Full_Package.tar.zst"
ENV JOOMLA_SHA256=""

RUN set -eux; \
    export DEBIAN_FRONTEND=noninteractive; \
    JOOMLA_SHA256=$(curl -fsSL "https://api.github.com/repos/joomla/joomla-cms/releases/tags/${JOOMLA_VERSION}" \
    | jq -er --arg "${JOOMLA_PACKAGE}" '.assets[] | select(.name == "${JOOMLA_PACKAGE}") | .digest | sub("^sha256:"; "")'); \
    curl -o joomla.tar.zst -fsSL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/${JOOMLA_PACKAGE}; \
    echo "$JOOMLA_SHA256 *joomla.tar.zst" | sha256sum -c -; \
    tar --zstd -xf joomla.tar.zst -C /var/www/html; \
    rm joomla.tar.zst; \
    chown -R www-data:www-data /var/www/html
