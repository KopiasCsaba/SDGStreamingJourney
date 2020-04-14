#!/bin/bash

if [ "$2" == "" ]; then
  echo "USAGE:"
  echo -e "\tdedicated_pulse.sh <sink_name> <command>"
  echo ""
  echo "Example:"
  echo -e "\tdedicated_pulse.sh songs 'vlc playlist.xspf'"
  exit
fi

trap ctrl_c INT

function ctrl_c() {
  pkill -f -9 $PID
}

function remove_module() {
  pactl unload-module "$(pactl list short modules | grep -i "description=$1" | head -n1 | cut --fields=1)" 2> /dev/null
}

eval "(${2}) &"
PID=$!



# New pulse audio module name that we'll use
PAMODNAME="window-$1"

remove_module $PAMODNAME

# https://askubuntu.com/questions/60837/record-a-programs-output-with-pulseaudio

DEFAULT_OUTPUT=$(pacmd list-sinks | grep -A1 "* index" | grep -oP "<\K[^ >]+")

# Add new sink
pactl load-module module-combine-sink \
  sink_name=$PAMODNAME slaves=$DEFAULT_OUTPUT \
  sink_properties=device.description=$PAMODNAME

echo "Subprocess pid: $PID Def. output: $DEFAULT_OUTPUT New module: $PAMODNAME"

# Loop until the process exits
while kill -0 $PID 2>/dev/null; do
  # Check if the application has a sink already.
  # Until it tries to make any sound, it might not have any.

  # https://askubuntu.com/questions/41858/shortcut-to-switch-between-analog-stereo-output-hdmi-audio-output/880959?noredirect=1
  SINK=$(pacmd list-sink-inputs | grep -E 'index:|sink:|process.id' | tr '\n' ' ' | tr -d '"' | sed -e 's/index:/\n/g' | tail -n +2 | grep $PID || true)

  echo $SINK | grep -q "<${PAMODNAME}>"

  if [ $? != 0 -a "$SINKINPUT" != "" ]; then
    echo "Moving sink input:  '$SINKINPUT' to '$PAMODNAME'"
    SINKINPUT=$(echo ${SINK} | cut --delimiter=' ' --fields 1)
    pactl move-sink-input $SINKINPUT $PAMODNAME || true
  fi
  sleep 1
done

echo "Removing module..."
remove_module $PAMODNAME

#rm -Rf $PD;
