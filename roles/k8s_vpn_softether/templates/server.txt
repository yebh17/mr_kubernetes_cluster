# we have to check if the VPN server is working

cd /usr/local/vpnserver
./vpncmd
3
check

# Change Admin Password

./vpncmd
1
## enter your server private-ip
ServerPasswordSet
## enter any Password

# Create A Virtual Hub

HubCreate VPN
## enter some password to your VPN hub
Hub VPN

# Enable SecureNAT
## There are two ways of connecting your hubs to the server network: using a Local Bridge connection or using the SecureNAT function.
### Here we use SecureNAT, SecureNAT is a combination of Virtual NAT and DHCP Server function

SecureNatEnable

# Create and Manage Users

UserCreate client1
UserPasswordSet client1

# Setup L2TP/IPSec

IPsecEnable
## Enable L2TP over IPsec Server Function: Choose yes to enable L2TP VPN over IPSec with pre-shared key encryption.
## Enable Raw L2TP Server Function: This will enable L2TP VPN for clients with no IPSec encryption.
## Enable EtherIP / L2TPv3 over IPsec Server Function: Routers which are compatible with EtherIP / L2TPv3 over IPsec can connect to this server by enabling this function.
## Pre Shared Key for IPsec: Enter a pre-shared key to use with L2TP VPN.
## Default Virtual HUB in a case of omitting the HUB on the Username: Users must specify the Virtual Hub they are trying to connect to by using Username@TargetHubName as their username when connecting. This option specifies which Virtual Hub to be used if the user does not provide such information. In our case enter VPN.

