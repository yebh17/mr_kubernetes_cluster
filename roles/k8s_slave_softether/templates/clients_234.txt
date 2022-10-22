[client2]
# To configure our client

./vpncmd
2
## press enter to take the hostname a localhost

# SoftEther uses Virtual Adapters to establish a connection to our VPN server

NicCreate sofether2
AccountCreate connection2
## give the vpnserver public ip-address and port number (443, 992, 1194, 5555), Note: Instead of an IP Address, you could also enter you server’s fully qualified domain name (FQDN).
### Destination Virtual Hub Name: VPN
#### Connecting User Name: client2
##### Used Virtual Network Adapter Name: sofether2
###### AccountPasswordSet connection2
####### Specify standard or radius: standard
######## AccountConnect connection2
######### AccountStatusGet connection2

[client3]
# To configure our client

./vpncmd
2
## press enter to take the hostname a localhost

# SoftEther uses Virtual Adapters to establish a connection to our VPN server

NicCreate sofether3
AccountCreate connection3
## give the vpnserver public ip-address and port number (443, 992, 1194, 5555), Note: Instead of an IP Address, you could also enter you server’s fully qualified domain name (FQDN).
### Destination Virtual Hub Name: VPN
#### Connecting User Name: client3
##### Used Virtual Network Adapter Name: sofether3
###### AccountPasswordSet connection3
####### Specify standard or radius: standard
######## AccountConnect connection3
######### AccountStatusGet connection3

[client4]
# To configure our client

./vpncmd
2
## press enter to take the hostname a localhost

# SoftEther uses Virtual Adapters to establish a connection to our VPN server

NicCreate sofether4
AccountCreate connection4
## give the vpnserver public ip-address and port number (443, 992, 1194, 5555), Note: Instead of an IP Address, you could also enter you server’s fully qualified domain name (FQDN).
### Destination Virtual Hub Name: VPN
#### Connecting User Name: client4
##### Used Virtual Network Adapter Name: sofether4
###### AccountPasswordSet connection4
####### Specify standard or radius: standard
######## AccountConnect connection4
######### AccountStatusGet connection4