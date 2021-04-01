#!/usr/bin/env bash
# -*- coding: utf-8 -*-
declare -A FMT=(
    [NONE]=$(tput sgr0)
    [HIDE]=$(tput cvvis)
    [HOME]=$(tput hpa 1)
    [CLR_BEGIN]=$(tput el1)
    [BOLD]=$(tput bold)
    [DIM]=$(tput dim)
    [UNDERLINE]=$(tput smul)
    [NO_UNDERLINE]=$(tput rmul)
    [ITALIC]=$(tput sitm)
    [NO_ITALIC]=$(tput ritm)
    [BLACK]=$(tput setaf 0)
    [RED]=$(tput setaf 1)
    [GREEN]=$(tput setaf 2)
    [YELLOW]=$(tput setaf 3)
    [BLUE]=$(tput setaf 4)
    [MAGENTA]=$(tput setaf 5)
    [CYAN]=$(tput setaf 6)
    [WHITE]=$(tput setaf 7)
)
# If stderr is not attached to a terminal then the formatting characters should
# not be printed. Control characters in a file (or pipe) are a pain.
if [[ ${NO_COLOR+true} == true || ${TERM-dumb} == dumb || ! -t 2 ]]; then
    for i in "${!FMT[@]}"
    do
        FMT[$i]=''
    done
fi