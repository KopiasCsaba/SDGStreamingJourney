# How to set up VLC for broadcasting
Open up VLC, go to preferences and enable the 'All' view of the preferences.
Keep in mind, that you can not mix the "Simple" and the "All" preferences,
it might be a vlc bug, but the settings will not be saved correctly if you set preferences on both "sides".


* Video 
    * DISABLE: "Show media title on video"
* Interface
    * Main interfaces  
        * ENABLE: "Web"
        * Lua
            * ENABLE "Lua http password" to 'vlc' (you'll forget everything else)
        * Qt
            * DISABLE "Resize inteface to the native video size" (when you screen grab, you don't want this)
            * SET "Continue playback?" to Never (you'll get a small notification on the top of the video otherwise)
            * DISABLE "Display background cone or art"
* Playlist
    * DISABLE "Auto start"
    
            
# Web control interface
You can leave vlc full screen while you grab it, and remote control it through the web interface.
This lets you see the remaining time also.


 * [http://127.0.0.1:8080/](http://127.0.0.1:8080/)
 * User: leave it blank
 * Password: What you have set previously (e.g. 'vlc')