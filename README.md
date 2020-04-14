# Streaming Journey

This is my journey in experimenting and finding solutions for common problems in 
making an online live church service streaming from linux.

My desire is to document what i've found and share it with the world,
to help others with my solutions and findings.

**This documentation is work in progress, I'm not even sure of its final structure yet.**

Not just feel free, but **please open PR's or issues** if you have any comments or improvements!

# Topics
 * My current workflow: [state of the art](docs/state_of_the_art.md)

 * Solutions
    * [ffmpeg](docs/solutions/ffmpeg.md)

 * Tools (under [src](src))
    * [Window Management](docs/tools/windowmanagement/index.md)
        * [frame.html](docs/tools/windowmanagement/frame.html.md): Fixed title for url 
        * [dedicated_pulse_out.sh](docs/tools/windowmanagement/dedicated_pulse_out.sh.md): Assign a dedicated pulse output for a program (to be able to capture it separately in OBS) 
        * [dp_firefox.sh](docs/tools/windowmanagement/dp_firefox.sh.md): Start a firefox instance with a fixed title and a dedicated pulse output        
    * [Sources](docs/tools/sources/index.md)
           * [countdown.html](docs/tools/sources/countdown.html.md): Add a timer or a countdown to obs. 
   
 * [OBS](docs/obs.md)
 * [Miscellenaous](docs/misc.md)
 
# Preparing before streaming
This is my checklist before streaming

 * Check media sound levels & eq: Will they be too loud or silent? Fix them beforehand.

 
---- 
Soli Deo Gloria