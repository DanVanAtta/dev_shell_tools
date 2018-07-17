
### SSH Tunnel

```
function tunnel() {
  PROD_IP=$1
  RROD_PORT=$2
  PROD_USER=$3
  TUNNEL_PORT=$4
  TUNNEL_HOST=$5
  
  ssh -L ${TUNNEL_PORT}:${TUNNEL_HOST}:${PROD_PORT} ${PROD_USER}@${PROD_IP}
}
```

### Linux Screen Recording

```
sudo apt-get install -y gifsicle gtk-recordmydesktop


gtk-recordmydesktop

ffmpeg -i out.ogv \
       -c:v libx264 -preset veryslow -crf 22 \
       -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
       output.mp4

ffmpeg -i output.mp4 -ss 00:00:07 -t 00:00:11 cut.mp4 
# https://stackoverflow.com/questions/18444194/cutting-the-videos-based-on-start-and-end-time-using-ffmpeg

# shorten down, keep seconds 7 through 10
ffmpeg -i output.mp4 -ss 00:00:07 -t 00:00:10 cut.mp4

# convert to git
ffmpeg -i cut.mp4 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 1 - output.gif

## do some comrpession
gifsicle -O3 --colors 128 < output.gif > final.gif
```
