#!/bin/sh
# What:	Get the current SSID of the AirPort / Wi-Fi network that your computer is connected to (if any).
# Tags:	osx airport sed grep
# URL:	https://github.com/tjluoma/quickies

airport -I |\
egrep 'AirPort: Off|^ *SSID: ' |\
sed 's#^ *SSID: ##g'

## 1. airport: 	a link to /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport which has been at that path since 10.6 at least
## 2. egrep:	Show just the line matching SSID (not BSSID!) or "AirPort: Off" if the AirPort card is disabled
## 3. sed:		Remove the 'SSID: ' and everything that came before it on that line
#
#
#	This will handle SSIDs which have spaces/weird characters in the names too
