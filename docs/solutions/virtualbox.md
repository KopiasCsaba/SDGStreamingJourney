# Using virtualbox for Skype and VLC with NDI

## Software stack
 * Host OS: Ubuntu Studio
    * OBS
 * Guest OS: Win10
    * Currently using the free [90 day trial virtual machine](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
    * Skype
    * VLC

## Virtualbox setup:
 * Networking: Have a "bridged" interface for your network adapter
     * This will enable NDI to pass out from the VM to your OBS running on your host
 * Video ram: max
 * 3D enabled
 * CPU:
     * Nested paging enabled
     * PAE extension disabled
 * Audio: enabled
  
## Windows setup
 * Improve network speed & latency between host-guest: [link](https://www.petri.com/how-to-improve-network-performance-in-windows-virtualbox-guests)
 * Disable automatic updates as much as possible: [link](https://www.cleverfiles.com/howto/disable-update-windows-10.html)
 * Disable the default user's password for automatic login after boot
 * Disable pagefile
 * Set up the keyboard layout you like
 
 
### VLC
 * [http://videolan.org](http://videolan.org)
 * Setup NDI tools: [https://ndi.tv/tools/#download-tools](https://ndi.tv/tools/#download-tools)
 
 In vlc's settings:
 * Video output module: NDI Video
 * Video input module: NDI Video
 * All / Video / Show media title on video (uncheck)
 
### Skype
 * [http://skype.com](http://skype.com)
 * Enable NDI output [link](https://www.newtek.com/blog/tips/using-ndi-in-skype/)