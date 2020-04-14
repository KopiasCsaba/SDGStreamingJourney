# dp_firefox.sh

This script combines [frame.html](frame.html.md) and [dedicated_pulse_out.sh](dedicated_pulse_out.sh.md),
to achieve their goals in audio and video together in one firefox instance.

To unwrap this sentence:
 
It will start a new firefox instance, with a separate temporary profile,
and sets a specified title for the window (for obs window capture)
and loads up the specified url.
Also it will create & assign a pulseaudio output sink for the browser,
so that you would be able to add an Audio Output Capture source into obs
that receives ONLY the sound from that firefox instance.

## Why

With this you can achieve a permanent configuration in OBS,
that will grab the image and the audio output of a website.

The browser will have a fixed title & pulse output sink,
the obs will have a fixed window capture & audio output capture.

This way if you start firefox and obs the same way, it will work the same way.

# How?

Start it without arguments, and it will tell you:

```bash
bash ./dp_firefox.sh
USAGE:
        dp_browser.sh <sink_and_title> <URL>

Example:
        dp_browser.sh meeting 'http://example.com/meeting'
``` 

It will do the urlencoding for you, you don't need to bother with that here.

