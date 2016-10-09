# cedilla-portuguese.sh (c) 2015 Canonical
# Author: Gunnar Hjalmarsson <gunnarhj@ubuntu.com>
#
# Released under the GPL
#
# File: /etc/profile.d/cedilla-portuguese.sh
# 
# The desired behavior when typing in certain languages is that
# '+c results in the ç character, and not ć. In Portuguese this
# can be achieved by setting LC_CTYPE to either pt_BR.UTF-8 or
# pt_PT.UTF-8. Related files:
# /usr/share/X11/locale/pt_BR.UTF-8/Compose
# /usr/share/X11/locale/pt_PT.UTF-8/Compose
#
# When the selected display language is Portuguese (either Brazilian
# Portuguese or Portuguese as spoken in Portugal), LC_CTYPE inherits
# the desired value from LANG. Due to this file, setting the Regional
# Formats value to Portuguese (Brazil) or Portuguese (Portugal) is
# sufficient to enable the just mentioned behavior, even if the
# display language is something else but Portuguese.
#
if [ "${LC_IDENTIFICATION%_*}" = 'pt' -a "${LANG%_*}" != 'pt' ]; then
    export LC_CTYPE="${LC_IDENTIFICATION%.*}.UTF-8"
fi
