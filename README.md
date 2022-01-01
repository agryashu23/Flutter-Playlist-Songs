
## Getting Started

Basic UI Flutter App:-

Flutter Music Player with two Tabs for Songs List and PlayList.

Add To Playlist Function,

Used Provider for faster usage of data.




## Deployment

dependencies:

```bash
  audioplayers: ^0.20.1
```



## Usage Of Player

```javascript
void playMusic(String url) async {
    if (isPlaying && currentSong !=url) {
      advancedPlayer.pause();
      int result = await advancedPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await advancedPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
          //from now we hear song
        });
      }
    }
  
    advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    advancedPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }


```


## Screenshots

![songs](https://user-images.githubusercontent.com/60836876/147854117-5417de4e-ec92-4732-8853-d6180f213cf4.jpeg)







![playlist](https://user-images.githubusercontent.com/60836876/147854121-cfc627a1-401c-45c3-9f37-957e6402e33b.jpeg)









