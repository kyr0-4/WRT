#!/bin/sh
# ========================================================
# Set the Time Zone
# ========================================================
TIMEZONE='CST6CDT,M4.1.0,M10.5.0'
ZONENAME='America/Mexico City'
echo 'Setting timezone to' $TIMEZONE
uci set system.@system[0].timezone="$TIMEZONE"
echo 'Setting zone name to' $ZONENAME 
uci set system.@system[0].zonename="$ZONENAME"

# ========================================================
# To identify better when connected to SSH and when seen on the network
# ========================================================
uci set system.@system[0].hostname='Terracotta'
uci set network.lan.hostname="`uci get system.@system[0].hostname`"
echo $(uci get system.@system[0].hostname) > /proc/sys/kernel/hostname

# ========================================================
# LAN config
# ========================================================
uci del network.lan.ipaddr
uci set network.lan.ipaddr='192.168.40.1'

# ========================================================
# Commit changes, flush
# ========================================================
uci commit
sync
