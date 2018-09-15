
#  Command cheatsheet

---------------------------------------
Prepending to Commit Messages
To prepend text to every commit message in a given range, you'd execute a message like:

git filter-branch --msg-filter 'echo "bug ###### - \c" && cat' master..HEAD

https://davidwalsh.name/update-git-commit-messages

---------------------------------------



## duplicated lines of java code
 find . -name "*.java" | xargs cat | grep -v "import" | egrep -v "^\s*[{}]\s*$" | sed '/^\s*$/d' | grep -v "@" | sort | uniq -c | sort -nr | head -200 | less



JVM flag for looking at CPU cache metrics
https://shipilev.net/jvm-anatomy-park/11-moving-gc-locality/
The cause for performance difference is very simple, and visible with -prof perfnorm (we also use -opi 1048576 to divide by number of elements):


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

# convert to gif, -loop 0  == looping, -loop 1  == no loop
ffmpeg -i cut.mp4 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - output.gif

## do some comrpession
gifsicle -O3 --colors 128 < output.gif > final.gif
```
