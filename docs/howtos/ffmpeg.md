## Compiling ffmpeg with NVENC & VAAPI support
Install some encoders if you want as described in here: https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

The following is based on this: https://devblogs.nvidia.com/nvidia-ffmpeg-transcoding-guide/

```bash
sudo apt install nvidia-cuda-toolkit build-essential yasm
sudo apt-get build-dep ffmpeg

mkdir ffmpeg
cd ffmpeg

# Building nv-codec-headers
git clone https://github.com/FFmpeg/nv-codec-headers
cd nv-codec-headers/
make
sudo checkinstall --default --pkgname=nv-codec-headers --fstrans=no --backup=no --pkgversion="$(date +%Y%m%d)-git" --deldoc=yes
cd ..

# Building ffmpeg
git clone https://git.ffmpeg.org/ffmpeg.git
cd ffmpeg;
./configure --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp --prefix=/opt/own/
make # You might wanna use make -j8 for multiple cores
sudo checkinstall --pkgname=ffmpeg-own --pkgversion=="$(date +%Y%m%d)-git" --default 
/opt/own/bin/ffmpeg -codecs | grep nvenc

# Adding /opt/own to path
echo -e  "PATH=/data/home/csaba/static/scripts:/opt/own/bin/:\$PATH\nexport PATH" > ~/.xsessionrc 
# After this log out and log in
```