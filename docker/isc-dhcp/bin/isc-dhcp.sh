#!/bin/bash
SCRIPT_DIR=`cd $(dirname $0); pwd`

envsubst < /etc/dhcp/dhcpd.conf > /tmp/dhcpd.conf && sudo mv /tmp/dhcpd.conf /etc/dhcp/dhcpd.conf

# Display configuration
echo "dhcpd.conf:"
echo "\`\`\`"
cat /etc/dhcp/dhcpd.conf | egrep -v "^#" | egrep -v "^ *$"
echo "\`\`\`"

# Start dhcpd in IPv4 and debug mode
echo "[`hostname -s`] Started"
sudo dhcpd -4 -d

exit $?
