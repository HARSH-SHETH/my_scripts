#!/bin/bash
# Convert mkv files to webp format

#delete most recent webp file
rm recent.webp >/dev/null 2>&1

type youtube-dl >/dev/null 2>&1 || { echo >&2 "This script needs youtube-dl installed"; exit;}
type ffmpeg >/dev/null 2>&1 || { echo >&2 "This script needs ffmpeg installed"; exit; }
type adb >/dev/null 2>&1 || { echo >&2 "This script needs adb installed"; exit;}

echo "just a wait for few seconds..."


input_file="$1"
temp_file='temp.mp4'
webp_file='temp.webp'

#{
if [[ "$1" =~ ^https://.*youtube.com/.* ]]
then
  echo "youtube video"
  youtube-dl -f 'worstvideo[ext=mp4]' -o 'temp.%(ext)s' --external-downloader ffmpeg \
    --external-downloader-args "-ss $2 -to $3" "$1" >/dev/null 2>&1

  ffmpeg -y -i "$temp_file" -vcodec libwebp -filter:v fps=fps=20 -lossless 1 -loop 0 -preset default -an -vsync 0 -s 500:500 "$webp_file"  >/dev/null 2>&1

else
  echo "normal file"
  ffmpeg -y -i "$input_file" -ss "$2" -to "$3" -codec copy "$temp_file" >/dev/null 2>&1
  ffmpeg -y -i "$temp_file" -vcodec libwebp -filter:v fps=fps=20 -lossless 1 -loop 0 -preset default -an -vsync 0 -s 500:500 "$webp_file" >/dev/null 2>&1
fi
#}

if adb get-state >/dev/null 2>&1
then
  newstickerfile=`adb shell ls "sdcard/WhatsApp/Media/WhatsApp\ Stickers/" -t | head -n 1`
  mv "$webp_file" ./"$newstickerfile"
  adb push "$newstickerfile" "/sdcard/WhatsApp/Media/WhatsApp Stickers/"
  cp "$newstickerfile" recent.webp 
  echo "file transfered open your latest recieved sticker on whatsapp"
else
  echo "not connected"
fi

rm "$newstickerfile"
rm "$temp_file"
