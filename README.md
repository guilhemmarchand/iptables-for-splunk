# iptables-for-splunk
Netfilter Iptables Application for Splunk intends to provide a nice frontend for Iptables based Firewalls.

*** Full installation and use guides are available in:***
 
\- [Yoursuchageek, My blog dedicated post, includes details steps and screenshots](http://youresuchageek.blogspot.fr/2013/02/splunknetfilteriptables.html)  
\- Main menu under the application "About Splunk For Iptables" / "Installation / Use guide - Splunk for Iptables"

This app is maintained by Guilhem Marchand (see author). Suggestions and bug reports are appreciated.

*** Functional Overview ***

*** Main functionalities:***

Multi-Host supported: This application can manage as many Iptables reporting hosts as required

Using centralized Syslog or Splunk forwarders is required in a Multi-Host environment

Real-Time and Time-Range Overview Dashboards

Real-Time and Time-Range Google Maps views

Dedicated search interfaces

Saved searches

Iptables events field extractions

*** Following field are being extracted from Iptables events:***

- iptables_host = Reporting Iptables host
- interface_input = Inbound Interface
- interface_output = Output Interface
- source_ip = Source IP origin of denied packet
- destination_ip = Destination IP of denied packet
- protocol = Protocol type
- source_port = Source port of denied packet
- destination_port = Destination port of denied packet
- Other standard Iptables log fields...

Also provide translation between attempted connection and IANA port. (Networking service name)
