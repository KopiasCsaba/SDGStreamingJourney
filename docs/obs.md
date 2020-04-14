
# OBS 
## Hardware acceleration
You can use hardware acceleration for streaming and for recording too.
Use it, as it helps reducing CPU usage.

There is VAAPI (Intel) and NVENC (Nvidia),
they might be only available if you choose the advanced options in the "Output" preferences.

For recording the stream, there is an option (in advanced mode) to use the same encoder
as the one being used for the streaming, if I understand correctly, this way
you can use it without requiring or using another hardware accelerated encoder.

## NDI
[NDI](https://www.ndi.tv/) is a protocol for transferring video through the network.
Several applications can use it:
 * Skype (every caller is one stream)
 * VLC (There is a plugin, you can use it as an output module, therefore "streaming" to an NDI channel)
 * OBS (It can output and receive input from NDI if you install the [plugin](https://github.com/Palakis/obs-ndi))
 


## Pitfalls
 * Facebook and youtube might hit you with copyright claims not just for the songs you use (or record with a band)
 but for the backgrounds, animation loops you use too. So be careful.
 * Playing videos through VLC with an NDI output module: the videos should be in the same resolution, otherwise it will auto-resize during the streaming.
 * OBS has frequent updates, but I've had many occasions where someting brok with the update.
    * Don't update it automatically/blindly
    * Keep the previous versions installer/package (they only provide you with the last one)
    * Only update if you have plenty of time to test out everything, and you can roll it back.
 
 