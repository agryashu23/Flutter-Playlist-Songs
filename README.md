
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


