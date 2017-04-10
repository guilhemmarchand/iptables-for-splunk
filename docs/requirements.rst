##############
Pre-requisites
##############

============================================
Linux Netfilter (iptables) technology add-on
============================================

Since the release 3.2.0, the application relies on the very good quality add-on:

- https://splunkbase.splunk.com/app/3089/

As such, please refer to the application documentation to every step related to the indexing configuration for Splunk:

- https://github.com/doksu/TA_netfilter/wiki

Basically, the application globally use the following default query to retrieve the Iptables events:::

    (index=* eventtype=linux_netfilter)

However, this is very easily customizable via the settings page of the application. (available at first startup or in the "Help & Settings" menu.
