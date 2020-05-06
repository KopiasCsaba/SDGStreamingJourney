
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
 
## Browser source
 * You can inject a webpage into OBS, this has a huge potential.
 * You can interact with it by the option in the right click context menu -> "Interact"
 * Currently it is not gpu accelerated (it may lag), and it uses quite a lot of cpu, be aware.

## Scene in a scene
You can add a scene into a scene. You might ask why? I was like that for a while too.

I think the reason for it is: reusability.

Say that you create a scene, named src_bible. You configure some stream from some application,
you add masks, you position things and texts and so on.

Now you can add THIS scene into any other scene that might want to use it,
but you will not be required to reproduce the same configuration everywhere.
Even more, you can modify it and it will update everywhere also!

Be careful, if you have it LIVE already, and you modify it, it will update in real time in the LIVE stream too.

## Projector window
Right click on the preview or the program display, and select windows projector.
This will open a window containing what you are streaming.

And you can share this window in a video chat, so that other participants can see real time what is live right now,
e.g. they might waiting on for a music to finish, and this way they will see real time when you switch to their scenes,
and they can start talking immediately.

This way you don't need to count back for them, or notify them on chat, nothing.

## Pitfalls

 * Facebook and youtube might hit you with copyright claims not just for the songs you use (or record with a band)
 but for the backgrounds, animation loops you use too. So be careful. Creating a new stream while many ppl is watching is not fun.
 
 * Playing videos through VLC with an NDI output module: the videos should be in the same resolution, otherwise it will auto-resize during the streaming. (E.g. 720p to 1080p)
    * Command for converting to 1080p with ffmpeg: 
       ```bash
        ffmpeg -i 01_Hegyeket.mp4 -vf scale=-1:1080 -c:v libx264 -crf 0 -preset veryslow -c:a copy 01_Hegyeket_1080p.mp4
       ```
 
 * OBS has frequent updates, but I've had many occasions where someting brok with the update.
    * Don't update it automatically/blindly
    * Keep the previous versions installer/package (they only provide you with the last one)
    * Only update if you have plenty of time to test out everything, and you can roll it back.
 
 * Make sure that you have only one OBS running, as otherwise they start to ping-pong with the stream, one will connect one will disconnect, then the other way.