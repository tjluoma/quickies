#!/bin/sh
# What:	output a list of all mounted volumes, one line per volume.
# Tags:	osx diskutil sed grep
# URL:	https://github.com/tjluoma/quickies

diskutil list -plist 				|\
fgrep -A1 '<key>MountPoint</key>' 	|\
fgrep -v '<string>/</string>' 		|\
egrep "</string>$" 					|\
sed 's#</string>##g ; s#.*<string>##g'

exit 0

## 1. diskutil:	output information in plist (XML) form (easier to parse reliably)
## 2. fgrep:	get every line which matches '<key>MountPoint</key>' AND 1 line after it
## 3. fgrep:	remove <string>/</string> from the results (that's the boot drive)
## 4. egrep:	match every line which has '</string>' at the very end of it
## 5. sed:		remove '</string>' (and then) remove '<string>' and everything before it
