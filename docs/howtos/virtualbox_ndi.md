# Using virtualbox for Skype and VLC with NDI
Here is how to have a virtualbox windows guest with various NDI using software,
and how to grab these from your OBS running on your host operating system.

## Personal experience
I've used this method, and it was kind of working. But there was a major problem:
sometimes the Skype NDI source resized itself, even during live broadcast.
Probably because the participant's network speed changed, and skype reduced the quality.

But the problem is that this messes up your layout in OBS, as many times as many times this happen,
that is frustrating.

Also keeping a windows virtual machine has it's drawbacks: it's sluggish, frustrating to maintain, etc.
It happened to me, that skype just simply did not wanted to start, because it messed up it's own update.
Windows will update itself even if you want or not, that will cause cpu & network usage and even reboots.

But if you need it for any reason, here is the important steps I took:


# Software stack
 * Host OS: Ubuntu Studio
    * OBS
 * Guest OS: Win10
    * Base image: [free 90 day trial virtual machine](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
    * Skype
    * VLC

# Virtualbox setup:
In the VM settings:
 * Networking: Have a "bridged" interface for your network adapter
     * This will enable NDI to pass out from the guest to your OBS running on your host
 * Video ram: max out
 * Enable 3D
 * CPU:
     * Nested paging enabled
     * PAE extension disabled
 * Audio: enabled
  
# Guest windows setup
 * Improve network speed & latency between host-guest: [link](https://www.petri.com/how-to-improve-network-performance-in-windows-virtualbox-guests)
 * Disable automatic updates as much as possible: [link](https://www.cleverfiles.com/howto/disable-update-windows-10.html)
 * Disable the default user's password for automatic login after boot
 * Disable pagefile
 * Set up the keyboard layout you like
 
 
## VLC
 * [http://videolan.org](http://videolan.org)
 * Setup NDI tools: [https://ndi.tv/tools/#download-tools](https://ndi.tv/tools/#download-tools)
 
 In vlc's settings:
 * Video output module: NDI Video
 * Video input module: NDI Video
 * All / Video / Show media title on video (uncheck)
 
## Skype
 * [http://skype.com](http://skype.com)
 * Enable NDI output [link](https://www.newtek.com/blog/tips/using-ndi-in-skype/)

# OBS setup
 * Install [OBS NDI Plugin](https://github.com/Palakis/obs-ndi)
 * Add an NDI source to your scene, and select the correct stream.
