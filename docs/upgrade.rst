#######
Upgrade
#######

Upgrading the application is entirely similar to the initial installation.

Please refer to the installation procedure: :ref:`deployment`

**Good practices for upgrade resiliency:**

- do not modify any file out of the "local" directory (create it yourself if you need any modification)

=======================================
Upgrade from version 3.1.x and previous
=======================================

Since the release 3.2.0, the application relies on the "Linux Netfilter (iptables)".

As such, if you have previously indexes data, the following steps have to be done:

- Deploy and configure the TA for iptables
- Replace and/or update the existing file monitor
- Deploy the Netfilter application new release
- Use the setup page of the application to search for both the old index/sourcetype and the standard index/eventtype
