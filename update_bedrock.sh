#!/bin/bash

# Set the URL for the Bedrock download page
DOWNLOAD_PAGE_URL="https://www.minecraft.net/en-us/download/server/bedrock"
USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36"

# Fetch the download page and extract the latest download link
echo "Fetching the latest Bedrock server URL from $DOWNLOAD_PAGE_URL..."
LATEST_URL=$(curl -s -A "$USER_AGENT" $DOWNLOAD_PAGE_URL | grep -Eo 'https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\.zip' | head -1)

echo "Latest version URL: $LATEST_URL"

# Download the Bedrock server
echo "Downloading the latest version..."
curl --http1.1 --location --retry 3 --retry-delay 5 --max-time 600 -b cookies.txt -A "Mozilla/5.0" -o bedrock-server.zip $LATEST_URL


# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download Bedrock server."
    exit 1
fi

# Unzip the downloaded file
echo "Unzipping the Bedrock server..."
unzip -o bedrock-server.zip -d /bedrock

# Check if the unzip was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to unzip Bedrock server."
    exit 1
fi

# Remove the zip file
rm bedrock-server.zip

# Check if the server binary exists and is executable
if [ -f /bedrock/bedrock_server ]; then
    echo "Bedrock server downloaded and unzipped successfully."
    chmod +x /bedrock/bedrock_server
else
    echo "Error: bedrock_server not found after unzipping."
    exit 1
fi
