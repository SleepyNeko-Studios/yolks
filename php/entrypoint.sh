#!/bin/sh

cd /home/container

# Print current PHP version
php -v

# 2. Handle the startup command passed from Pterodactyl
# This line replaces the {{variables}} in the panel with actual environment variables
MODIFIED_STARTUP=$(echo -e $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))

echo ":/home/container$ ${MODIFIED_STARTUP}"

# 3. Execute the command
eval ${MODIFIED_STARTUP}
