#!/usr/bin/env bash
# -*- coding: utf-8 -*-
set -o errexit -o nounset -o pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

source color.sh
source log.sh
LOG_LEVEL=${LOG_LEVELS[WARNING]}

verbose="${VERBOSE-false}"
if [[ "$verbose" != false && $LOG_LEVEL -gt ${LOG_LEVELS[INFO]} ]]; then
    LOG_LEVEL=${LOG_LEVELS[INFO]}
fi
debug="${DEBUG-false}"
if [[ "$debug" != false && $LOG_LEVEL -gt ${LOG_LEVELS[DEBUG]} ]]; then
    LOG_LEVEL=${LOG_LEVELS[DEBUG]}
fi

declare -r SCRIPT_NAME="${BASH_SOURCE[0]##*/}"

usage() {
    echo >&2 "${FMT[BOLD]}USAGE:${FMT[NONE]} $SCRIPT_NAME [OPTIONS] [--] ARGS"
}

_help() {
usage
cat >&2 <<EOF
    FIXME Briefly describe the script

${FMT[BOLD]}ARGUMENTS${FMT[NONE]}
    ARG1    description of ARG1

${FMT[BOLD]}OPTIONS${FMT[NONE]}
    -h|--help       Show this help message and quit
    -v|--verbose    Enable verbose output
    -x|--debug      Enable debug output

${FMT[BOLD]}EXAMPLES${FMT[NONE]}
    FIXME add examples
EOF
}

parse_args() {
    option=''

    declare -r shortopts='ho:vx'
    declare -r longopts='help,option:,verbose,debug'
    log -l debug "Raw args:$*"
    declare parsed_args
    set +e
    parsed_args=$(getopt -n "$SCRIPT_NAME" -o $shortopts -l $longopts -- "$@")
    declare getopt_ecode=$?
    set -e
    log -l debug "Parsed args:$parsed_args"
    if [[ $getopt_ecode != 0 ]]; then
        usage
        exit 1
    fi
    eval set -- "$parsed_args"
    while true
    do
        case "$1" in
            -h|--help)
                _help
                exit 0
            ;;
            -o|--option)
                option="$2"
                shift 2
            ;;
            -v|--verbose)
                verbose=true
                LOG_LEVEL=$(( LOG_LEVEL - 10 ))
                shift
            ;;
            -x|--debug)
                debug=true
                shift
            ;;
            --)
                shift
                break
            ;;
            *)
                usage
                log error "unknown option $1"
                exit 1
            ;;
        esac
    done
    if [[ "$verbose" != false ]]; then
        if [[ $LOG_LEVEL -gt ${LOG_LEVELS[INFO]} ]]; then
            LOG_LEVEL=${LOG_LEVELS[INFO]} 
        fi
        log "verbose output enabled"
    fi
    if [[ "$debug" != false ]];then
        if [[ $LOG_LEVEL -gt ${LOG_LEVELS[DEBUG]} ]]; then
            LOG_LEVEL=${LOG_LEVELS[DEBUG]}
        fi
        log -l debug "debug output enabled"
    fi
}

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    log "Cleaning up"
    env
    # TODO do cleanup steps here
}

main() {
    parse_args "$@"
    log "main function"
}

main "$@"