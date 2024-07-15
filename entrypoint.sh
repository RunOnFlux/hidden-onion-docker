#!/bin/sh -e

# Fill-in environment variables in the torrc config file
cp /torrc /tmp/torrc

for var in SERVICE_HOST SERVICE_PORT ONION_PORT; do
    eval val="\$$var"
    sed -i "s,{{ $var }},$val,g" /tmp/torrc
done

# Print the updated file content for verification
echo "Updated torrc file:"
cat /tmp/torrc

# Check if the file was updated successfully
if [ -s /tmp/torrc ]; then
    echo "torrc file updated successfully."
else
    echo "Failed to update torrc file."
fi

exec "$@"
