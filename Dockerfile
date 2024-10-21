FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y unzip curl libc6 libcurl4 cron rsync && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /bedrock

# Copy the version update script
COPY update_bedrock.sh .
RUN chmod +x ./update_bedrock.sh && \
    # Setup cron job to check for updates every day at midnight
    echo "0 0 * * * /bedrock/update_bedrock.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/bedrock_update && \
    # Give execution rights on the cron job
    chmod 0644 /etc/cron.d/bedrock_update && \
    # Apply cron job
    crontab /etc/cron.d/bedrock_update && \
    # Run the version update script to download the latest version
    ./update_bedrock.sh

# Copy the config generation script
COPY init.sh .
RUN chmod +x init.sh

# Copy the world, resource packs, and behavior packs
# COPY config/* ./

# Set environment variables
ENV EULA=TRUE \
    SERVER_PORT=19132 \
    SERVER_PORTV6=19133

# Expose the default Bedrock server port
EXPOSE ${SERVER_PORT}/udp
EXPOSE ${SERVER_PORTV6}/udp

# Run the config generation script and start the server
ENTRYPOINT ["/bedrock/init.sh"]
