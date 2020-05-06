# Streaming Journey

This is my journey in experimenting and finding solutions for common problems in 
making an online live church service streaming from linux.

My desire is to document what i've found and share it with the world,
to help others with my solutions and findings.

**This documentation is work in progress, I'm not even sure of its final structure yet.**

Not just feel free, but **please open PR's or issues** if you have any comments or improvements!

# How tos
 * [How to live stream an online conference](https://github.com/KopiasCsaba/StreamFixerBrowserExtension)
 * [How to compile ffmpeg with nvenc & vaapi support](docs/howtos/ffmpeg.md)
 * [How to compile OBS studio on linux](docs/howtos/compile_obs.md)
 * [How to set up an RTMP relay on your machine, to accept high quality incoming streams](docs/howtos/direct_rtmp_with_nginx.md)
 * [How to configure VLC for broadcasting](docs/howtos/vlc_setup.md)
 
# Knowledge base
 * [Intresting things I learnt about OBS](docs/obs.md)
 * [Tips and tricks](docs/tips_and_tricks.md)
 * [My current workflow](docs/state_of_the_art.md)
 * [Miscellaneous](docs/misc.md)
 
# My custom tools

 * Tools (under [src](src))
    * [Window Management](docs/tools/windowmanagement/index.md)
        * [frame.html](docs/tools/windowmanagement/frame.html.md): Fixed title for url 
        * [dedicated_pulse_out.sh](docs/tools/windowmanagement/dedicated_pulse_out.sh.md): Assign a dedicated pulse output for a program (to be able to capture it separately in OBS) 
        * [dp_firefox.sh](docs/tools/windowmanagement/dp_firefox.sh.md): Start a firefox instance with a fixed title and a dedicated pulse output        
        * [create_sink.sh](docs/tools/windowmanagement/create_sink.sh.md): Creates a new pulseaudio output sink, that you can use manually with pavucontrol & grab in OBS.        
    * [Sources](docs/tools/sources/index.md)
        * [countdown.html](docs/tools/sources/countdown.html.md): Add a timer or a countdown to obs. 
    * resources
        * [blank_media](resources/blank_media): To be used as "breaks" or "mini pauses" in a playlist

 


---- 
Soli Deo Gloria