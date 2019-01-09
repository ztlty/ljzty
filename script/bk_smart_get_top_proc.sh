#!/usr/bin/env bash
#===============================================================================
#
#          FILE: get_top_proc_in_oneline.sh
# 
#         USAGE: ./get_top_proc_in_oneline.sh <cpu|mem> <number>
# 
#   DESCRIPTION: print system resource's topN(cpu/mem)
#===============================================================================

set -o nounset                              # Treat unset variables as an error

fields="pcpu,pmem,comm"

usage() {

    echo "get_top_proc_in_oneline.sh <cpu|mem> <number of top proc>"
    exit 1
}

join() {
    local IFS="$1"
    shift; echo "$*"
}

if (( $# < 1 )) || (( $# > 2 )) ; then
    usage
fi

case $1 in 
    cpu) sort_field=pcpu ;;
    mem) sort_field=rss ;;
    *) usage ;;
esac

if [[ $# -eq 2 ]]; then
    top_n=$2
else
    top_n=6
fi

ps -eo "$fields" --sort=-"$sort_field" | head -$(( top_n + 1 )) | awk 'NR==1 { gsub(/%/,"") } {printf "%s\\n", $0 }'
