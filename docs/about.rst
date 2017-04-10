###################################################
About the Netfilter Iptables application for Splunk
###################################################

* Author: Guilhem Marchand

* First release was published on starting 2014

* Purposes:

The Netfilter Iptables application for Splunk manage Linux iptables based firewall logs (iptables, ufw...) generated to provide easy and accessible information about the firewall activity of your servers.

It is a very simple and lightweight application.

---------------
Splunk versions
---------------

**The application is compatible with any version of Splunk 6.x**

---------------------
Index time operations
---------------------

The application relies on Splunk standard syslog indexing, as such it does not perform any index time operation other than Splunk does by default when indexing syslog data.
