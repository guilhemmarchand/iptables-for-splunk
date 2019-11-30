#!/bin/bash

splunk-appinspect inspect `ls iptables*.tgz | head -1` --mode precert --included-tags splunk_appinspect
