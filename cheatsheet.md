
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
gtk-recordmydesktop

ffmpeg -i out.ogv \
       -c:v libx264 -preset veryslow -crf 22 \
       -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
       output.mp4

ffmpeg -i output.mp4 -ss 00:00:07 -t 00:00:11 -async 1 -c copy cut.mp4 
# https://stackoverflow.com/questions/18444194/cutting-the-videos-based-on-start-and-end-time-using-ffmpeg

# shorten down, keep seconds 7 through 10
ffmpeg -i output.mp4 -ss 00:00:07 -t 00:00:10 cut.mp4
```
