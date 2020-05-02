# State of the art
This is the current setup I'm using.


 * OS: [Ubuntu studio](https://ubuntustudio.org/)
 * Broadcasting software: [OBS Studio](https://obsproject.com/)
 * For streaming video conferences: [StreamFixer browser extension](https://github.com/KopiasCsaba/StreamFixerBrowserExtension)
 * For capturing audio only from specific apps: [create_sink.sh](tools/windowmanagement/create_sink.sh.md)
 
# Details

Ubuntu studio is a free and awesome version of the ubuntu linux operating system.
By default it comes with an ffmpeg that supports GPU accelerated video encoding (NVENC/Nvidia and VAAPI/Intel),
of which i'm leveraging in OBS studio.

This way I'm having very little cpu usage while streaming.

I'm using the above mentioned StreamFixer browser extension that helps grabbing the streams of the participants.

For music i'm using a window-grabbed, custom pulseaudio sinked' VLC instance with it's [remote control](https://www.howtogeek.com/117261/how-to-activate-vlcs-web-interface-control-vlc-from-a-browser-use-any-smartphone-as-a-remote/),
this way i can leave it full screen behind my OBS while grabbing it, but still i can start/stop it.

Also for breaks i'm using my [blank video file](../resources).