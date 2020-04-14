# State of the art
This is the current setup I'm using.


 * Ubuntu studio
 * OBS Studio
 * VirtualBox -> Win10 -> skype & vlc (with ndi plugin)


Currently we are having a skype group call, with someone sharing their phone's screen with a bible app.
Through NDI from a virtual machine OBS receives every single participants stream & audio.

Playing music is done through a playlist in VLC with NDI output too.
The reason for this is that this is the only way i've found this far, to
see the position of the playback of a medium. OBS does not report it currently afaik.

The setup is described in more details [right here](solutions/virtualbox.md).

# Problems with it:
 * All together painful (managing windows, managing virtual box, sluggish, etc)
 * Skype NDI source is auto resizing, and there is no way to fix it. If a participants network quality changes drasticly,
 it will resize in OBS too. 
 * Audio & video quality from participants could be way better.
 * Skype sometimes auto updates, once I was unable to start it again for two hours. W.H.A.T.
 