#!/bin/bash

    DEFAULT_SOURCE=$(pw-record --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
    DEFAULT_SINK_ID=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*\([[:digit:]]\+\):.*$/\1/p')
    DEFAULT_SINK=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
    VOLUME=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Volume/ s!^[[:space:]]\+Volume:.* \([[:digit:]]\+\)%.*!\1!p" | head -n1)
    IS_MUTED=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Mute/ s/Mute: \(yes\)/\1/p")

    action=$1
    if [ "${action}" == "up" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    elif [ "${action}" == "down" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    elif [ "${action}" == "mute" ]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
	fi

    if [ "${IS_MUTED}" != "" ]; then
          echo  "  MUTED ${DEFAULT_SINK}"
    else
          echo "  ${VOLUME}% ${DEFAULT_SINK}"
    fi

