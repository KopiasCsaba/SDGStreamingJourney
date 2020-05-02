#!/bin/bash

if [ "$1" == "" ]; then
  echo "USAGE:"
  echo -e "\tcreate_sink.sh <sink_name>"
  echo ""
  echo "Example:"
  echo -e "\tcreate_sink.sh songs "
  exit
fi

function remove_module() {
  pactl unload-module "$(pactl list short modules | grep -i "description=$1" | head -n1 | cut --fields=1)" 2> /dev/null
}

# New pulse audio module name that we'll use
PAMODNAME="window-$1"

remove_module $PAMODNAME

# https://askubuntu.com/questions/60837/record-a-programs-output-with-pulseaudio

DEFAULT_OUTPUT=$(pacmd list-sinks | grep -A1 "* index" | grep -oP "<\K[^ >]+")

# Add new sink
pactl load-module module-combine-sink \
  sink_name=$PAMODNAME slaves=$DEFAULT_OUTPUT \
  sink_properties=device.description=$PAMODNAME
