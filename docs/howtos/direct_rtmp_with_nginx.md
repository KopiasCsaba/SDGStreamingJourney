# How to host a local RTMP service for broadcasting

If you have a good environemnt for this (strong hardware, fast network, etc), 
you might want to receive high quality RTSP streams to include them in your broadcast.

This way you can have the maximum quality (resolution/bitrate) that your network enables,
without reencoding and extra latency.

You can set up clients to stream to your service, and you can grab them directly into OBS.

Your clients can be:
  * IP cameras
  * Mobile devices with the appropriate software installed
  * Another OBS instances
  
# How it is going to work?

You will have an nginx webserver running, with an RTMP relay module inside of it.
You need an external IP address, i was using [ngrok](https://ngrok.com/).

Clients will set up their streaming software/device for an URL that is pointing right at your machine,
and they will start to stream to a named stream.

You will use a different URL that is the "output" of your nginx relay with the stream's name, and you can play it
in OBS or ffplay, as you wish.

# Setup

I'm doing this on an ubuntu stuido.

```bash
git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git
sudo apt-get install  libpcre3-dev libpcre3 libssl-dev  build-essential

```

Download the latest stable nginx source from [here](http://nginx.org/en/download.html).

```bash
mkdir nginx-stable
tar -xf nginx-1.*.tar.gz --strip-components=1 --directory nginx-stable
cd nginx-stable

./configure --with-http_ssl_module --add-module=../nginx-rtmp-module --prefix=/opt/own
make -j8

sudo checkinstall --default --pkgname=nginx-own --fstrans=no --backup=no --pkgversion="$(date +%Y%m%d)-stable" --deldoc=yes
```

You are ready!

Head over to [resources/nginx_rtmp](../../resources/nginx_rtmp), and execute **./startnginx.sh**

# How to use it?
First set up some source that will stream directly to your machine.

## Set up Android
 * Install [CamON](https://play.google.com/store/apps/details?id=com.spynet.camon)
 * Settings / Adapters / Live streaming
    * Enable: check
    * Server: rtmp://YOUR_ADDRESS/show
    * Stream: Android
    
## Set up OBS
 * Install OBS
 * Settings / Stream
    * Service: Custom
    * Server: rtmp://YOUR_ADDRESS/show
    * Stream key: OBS (Yes this will be the name of the stream)
    
    

## Playback
Now lets try to play back those sources!

```
vlc rtmp://127.0.0.1/show/<stream name/key>
vlc rtmp://127.0.0.1/show/Android
vlc rtmp://127.0.0.1/show/OBS

```

Now you can just simply add a VLC source to your OBS and get the stream for yourself in the best possible quality.

## Stats
You can view your stats here:
 * [http://127.0.0.1:8080/stats](http://127.0.0.1:8080/stats)


# Experiences with this technique

I've found that there is about a 3-4 sec lag, but the quality is awesome,
you are really only limited by the network and the hardware's speed.
 
The android application is quite awesome too, it can stream even when it is minimised, 
and it has quite a few nice features too.

It is resilient against network disruptions, it reconnects automatically, and everything works
again as soon as possible without you touching anything.

But keep in mind, that you might need to communicate with your participant somehow,
and for that you will need a different device, or a chat application.

This is an easy and nice solution, but we found the [StreamFixer](https://github.com/KopiasCsaba/StreamFixerBrowserExtension) fits our needs better,
as we need an easy way to communicate with eachother during broadcast.

But if you have only one person talking, or you want IP cameras or other OBS instances in your broadcast, this could work nicely.

It is nice that nginx does not reencode anything, so it uses virtually no cpu while mirroring the incoming streams to its clients.



