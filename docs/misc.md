This file contains experiments that are not yet used, 
or not final, or drafts, or incomplete.

# Creating a V4l2 source and playing a video into it

You can [create a fake webcam source](https://github.com/umlaeute/v4l2loopback), which can be included in OBS.
Also you can stream media into it.

```bash
apt-get install v4l2loopback-dkms

modprobe v4l2loopback    
ffmpeg -re  -progress - -nostats -i music.mp4  -f v4l2 /dev/video0
```

Status: I need a way to stream to it while seeing remaining time,
possibly to use a playlist, etc. Ffmpeg does not allow me to do that.


sudo modprobe v4l2loopback video_nr=10 card_label="Loopback OBS" exclusive_caps=1