#!/usr/bin/env bash
# -*- coding: utf-8 -*-
source color.sh
declare -Ari LOG_LEVELS=(
    [CRITICAL]=50
    [ERROR]=40
    [WARNING]=30
    [INFO]=20
    [DEBUG]=10
)
declare -Ar LOG_ATTRS=(
    [CRITICAL]=${FMT[RED]}
    [ERROR]=${FMT[RED]}
    [WARNING]=${FMT[YELLOW]}
    [INFO]=''
    [DEBUG]=${FMT[MAGENTA]}
)
declare -i LOG_LEVEL=${LOG_LEVELS[DEBUG]}
log() {
    # usage: log [-l LEVEL] MESSAGE
    declare -u level
    if [[ "$1" == "-l" ]]; then
        level="$2"
        shift 2
    else
        level=INFO
    fi
    if [[ ${LOG_LEVELS[$level]} -ge $LOG_LEVEL ]]; then
        echo >&2 "${LOG_ATTRS[$level]}$level:$*${FMT[NONE]}"
    fi
}