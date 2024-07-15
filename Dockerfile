FROM alpine:latest

# Install necessary packages and create the 'tor' user
RUN apk update \
    && apk add --no-cache tor \
    && mkdir -p /var/lib/tor \
    && chown -R tor /var/lib/tor \
    && chmod 700 /var/lib/tor \
    && mkdir -p /var/lib/tor/hidden_service \
    && chown -R tor /var/lib/tor/hidden_service \
    && chmod 700 /var/lib/tor/hidden_service

# Copy your configuration files
COPY torrc /torrc
COPY entrypoint.sh /entrypoint.sh

# Set permissions for configuration files
RUN chown tor /torrc \
    && chmod 600 /torrc \
    && chown tor /entrypoint.sh \
    && chmod 755 /entrypoint.sh

# Set the entrypoint script and user
ENTRYPOINT ["/entrypoint.sh"]

# Set user as root to properly run on flux
USER root

# Define your CMD to start Tor with the specified configurations
CMD ["tor", "-f", "/tmp/torrc"]
