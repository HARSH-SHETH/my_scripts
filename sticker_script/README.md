# Create your own animated whatsapp stickers
## Command Structure
`./sticker.sh  <youtube-url>/<local mkv file> <starting timestamp> <ending timestamp>` 

## Prerequisites
* ffmpeg version 4.1 or above
* youtube-dl (if you face any problem try installing a recent version)
* adb (android-data-bridge) 
* Installation commands are given [here](https://github.com/HARSH-SHETH/my_scripts/new/master/sticker_script/install.md)


## Get the script
* clone this repository with: `git clone https://github.com/HARSH-SHETH/my_scripts`
* navigate to this directory: `cd my_scripts/sticker_script`
* make the script executable: `chmod u+x script.sh`
* Run the script. 

## Usage 
### This script needs 3 arguments: 
* `youtube url` or `local .mkv or .mp4` file
* `starting timestamp`  "where to begin clipping the video
* `ending timestamp`  "where to end clipping the video 

**Make sure that clipping time is less than 10 seconds so that sticker size doest not exceed 1MB size limit.**

### Examples: 
> ./sticker.sh 'https://www.youtube.com/watch?v=1_yZHp9xiTo' 00:00:10 00:00:15 

> ./sticker.sh ~/anime/my_hero_academia/s01e01.mkv 00:23:12 00:23:15
