#########
Userguide
#########

============
Key concepts
============

The Iptables application for Splunk is a simple frontend application for Netfilter Iptables based firewall.

Indexing data in Splunk relies on the TA for iptables available in Splunk base: https://splunkbase.splunk.com/app/3089

This is a pretty simple application that comes with a few reports and dashboards, as documented below.

-----------------------
Data Types (sourcetype)
-----------------------

The application uses the data sourcetype created by the TA for iptables::

    sourcetype=linux:netfilter

Those events can be retrieved using eventtypes, which is what is done by the application::

    eventtype=linux_netfilter

By default, the application will search for data using the following Splunk search::

    index=* eventtype="linux_netfilter"

Notes: This is configurable in the application setting page, it is recommended to customize the name of the index(es) where you will decide to ingest your data.

To do this, all the searches implemented in the application will use a root macro (potentially followed by other search criterias)::

    `iptables_datasource`

The iptables events are basically syslog type events, where the TA for iptables will rewrite the sourcetype to its definitive value.

--------------------
Lookups and KV Store
--------------------

The application does not currently implement any KVstore based lookup.

**It does however contains a file based lookup table:**

::

    network_services

Which is based on the lookup csv file::

    lookups/network_services.csv

This lookup table is being used to provide an auto lookup mapping with the network destination port and protocol to generate a more human friendly service name.

This mapping operates in the "props.conf" configuration file::

    # Translation of port number to service name
    # Lookups
    lookup_network_services = network_services DPT, PROTO OUTPUTNEW Service As Service

The lookup file content is based on standard network services. (/etc/services in any Linux OS)

------------------------
Main configuration files
------------------------

""""""""""
props.conf
""""""""""

**The props.conf file implements search time extractions over the following "source" field:**
::

    [source::.../(iptables|ufw).log]

This a simple stanza using regular expression, and this will match any location for the following files:

**example for standard log file locations:**

* /var/log/iptables.log
* /var/log/ufw.log

**If for some reasons the "source" value in your deployment differs from this standard, you will need to customized your configuration:**

* create a copy of default/props.conf to local/props.conf
* customize the stanza definition to match your source
* deploy and apply your new configuration

"""""""""""""""
transforms.conf
"""""""""""""""

**The transforms.conf provided by default configures the file based lookup:**
::

    # Translation of port number to service name (IANA source)

    [network_services]
    filename = network_services.csv

""""""""""""""""""
savedsearches.conf
""""""""""""""""""

**The savedsearches.conf file contains a few pre-built reports used in the application's dashboards:**

* Iptables Activity Summary

* Iptables Top Offenser

* Iptables Top 10 denied client by count

* Iptables Top 10 denied client by Country

* Iptables Top 10 denied Networking Services

* Iptables Top 10 denied Destination Ports

* Iptables Top 10 Reporting Hosts

None of these reports implement by default any acceleration or scheduling.

"""""""""""
macros.conf
"""""""""""

The macros.conf configuration contains several macros globally used in the dashboards of the application.

**The main macro defines the root search for retrieving iptables events:**

::

    # Datasource of Iptables Events

    [iptables_datasource]
    definition = (index=* eventtype=linux_netfilter)
    iseval = 0

Notes: This macro can (and should) be customized using the application setup page to match your index(es)

**The next interest macros will define the recognition of accepted and denied / dropped packets:**

::

    # Accepted Traffic - Patterns used to filter allowed traffic

    [traffic_accepted]
    definition = ( *ACCEPT*  OR *ALLOW* )
    iseval = 0

    [traffic_denied]
    definition = ( *DROP* OR *BLOCK* OR *REJECT* )
    iseval = 0

Notes: These macros can be customized as well with the setup page

**The following macro is used to filter some unwanted pollution:**

::

    # Some filter for traffic pollution

    [filter_badclients]
    definition = ( clientip!="0.0.0.0" OR clientip!="255.255.255.255" )
    iseval = 0

**Finally, the following macro "iptables_span" is used to improve Splunk charts**

===============
User interfaces
===============








