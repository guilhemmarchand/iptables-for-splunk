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

**The application is compatible with any version of Splunk 6.4 and later**

---------------------
Index time operations
---------------------

The Netfilter application relies on the installation of the "Linux Netfilter (iptables)" technology add-on:

- https://splunkbase.splunk.com/app/3089/

--------------
Index creation
--------------

The application **does not** create any index at installation time.

----------------------------
Summarization implementation
----------------------------

The application **does not** currently implement any piece of summarization, accelerated reports or data models.
