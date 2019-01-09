#!/usr/bin/env bash
#===============================================================================
#
#          FILE: get_site_status.sh
# 
#         USAGE: ./get_site_status.sh <url>
# 
#   DESCRIPTION: test site by curl tool
#===============================================================================

if [[ -z "$1" ]]; then
    echo "$0 <url>"
    exit 1
fi

echo "ACCESS $1 STATS："
curl -L -w '
HTTP CODE:\t%{http_code}
CONTENT SIZE:\t%{size_download}
REDIRECT COUNT:\t%{num_redirects}

TIME_NAMELOOKUP:\t%{time_namelookup}
TIME_CONNECT:\t%{time_connect}
TIME_STARTTRANSFOR:\t%{time_starttransfer}
TIME_TOTAL:\t%{time_total}

' -o /dev/null -s "$1"
