#!/usr/bin/env bash
# -*- coding: utf-8 -*-
source color.sh
spinner() {
    echo >&2 -ne '\b\' && sleep 1
    echo >&2 -ne '\b|' && sleep 1
    echo >&2 -ne '\b/' && sleep 1
    echo >&2 -ne '\b-' && sleep 1
}
block_spinner() {
#:<<EOF
    echo >&2 -ne "${FMT[HOME]}⠄ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠆ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠇ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠏ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠟ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠿ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠻ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠹ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠸ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠰ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠠ " && sleep 0.1
#EOF
    # ⠯
:<<EOF
    echo >&2 -ne "${FMT[HOME]}⠏ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠏ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠛ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠹ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠼ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠶ " && sleep 0.1
    echo >&2 -ne "${FMT[HOME]}⠧ " && sleep 0.1
EOF
}