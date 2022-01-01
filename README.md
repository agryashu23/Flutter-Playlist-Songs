
## Getting Started
Add the plugin (pub coming soon):


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

![WhatsApp Image 2022-01-01 at 8 56 29 PM](https://user-images.githubusercontent.com/60836876/147854026-9ea60916-35f0-4296-8177-4b6a66519ea1.jpeg)







![WhatsApp Image 2022-01-01 at 8 56 29 PM (1)](https://user-images.githubusercontent.com/60836876/147854029-6f8b44a8-0ae9-4046-a0f8-9c029bcd6e92.jpeg)



