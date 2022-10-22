[client1]
# To configure our client

./vpncmd
2
## press enter to take the hostname a localhost

# SoftEther uses Virtual Adapters to establish a connection to our VPN server

NicCreate sofether1
AccountCreate connection1
## give the vpnserver public ip-address and port number (443, 992, 1194, 5555), Note: Instead of an IP Address, you could also enter you server’s fully qualified domain name (FQDN).
### Destination Virtual Hub Name: VPN
#### Connecting User Name: client1
##### Used Virtual Network Adapter Name: sofether1
###### AccountPasswordSet connection1
####### Specify standard or radius: standard
######## AccountConnect connection1
######### AccountStatusGet connection1