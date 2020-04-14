# dedicated_pulse_out.sh
Dedicated pulse output for an application

## What
This script does a few things:
 * Starts the specified application
 * Creates a pulse audio output sink with a specified name
    * Assigns the default output of your system to that sink
 * Waits for the application to connect to pulseaudio (in other words to try to make any noise)
    * Assigns the application's output to the created sink
    * Repeats that in every second during the life of the application

And, lastly...
 * Waits for CTRL-C
    * And kills the application
 * Waits for the app to quit
    * And removes the sink and quit
   
## Why

Because this way you can start an application and
insert an "Audio Output Capture" source in OBS,
that is receiving ONLY the output of that application.

Pretty neat, uh?
    
## How
Start it without arguments, and it will tell you how:

```
./dedicated_pulse_out.sh 
USAGE:
        dedicated_pulse.sh <sink_name> <command>

Example:
        dedicated_pulse.sh songs 'vlc playlist.xspf'
```

If you follow that example, then you will be able to add an
Audio Output Capture source that is pointing to the "window-songs" 
named output sink from pulse audio.
    

## Known bugs
 * According to the source-comment mentioned link,
 the combined sink should play the applications output on the main output too.
 For me it does not work:)
    * Solution: You can enable monitoring (right click->properties) in OBS, and you will hear it.