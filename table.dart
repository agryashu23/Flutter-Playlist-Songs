import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'Songs.dart';
import 'favourite.dart';

class TExist extends StatefulWidget {
  const TExist({Key? key}) : super(key: key);

  @override
  _TExistState createState() => _TExistState();
}

class _TExistState extends State<TExist>{
  final GlobalKey<_TExistState> _key = GlobalKey();

  List itemsList = [
    {
      "title": "Uptown Funk",
      "singer": "One Republic",
      "url": "assets/boy1.jpg",
      "image":
      "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg",
      "status": false,
    },
    {
      "title": "Black Space",
      "singer": "Sia",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      "image":
      "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
      "status": false,
    },
    {
      "title": "Shake it off",
      "singer": "Coldplay",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      "image":
      "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
      "status": false,
    },
    {
      "title": "Lean On",
      "singer": "T. Schürger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
      "image":
      "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg",
      "status": false,
    },
    {
      "title": "Sugar",
      "singer": "Adele",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
      "image":
      "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg",
      "status": false,
    },
    {
      "title": "Believer",
      "singer": "Ed Sheeran",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      "image":
      "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg",
      "status": false,
    },
    {
      "title": "Stressed out",
      "singer": "Mark Ronson",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
      "image":
      "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg",
      "status": false,
    },
    {
      "title": "Girls Like You",
      "singer": "Maroon 5",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
      "image":
      "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg",
      "status": false,
    },
    {
      "title": "Let her go",
      "singer": "Passenger",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
      "image":
      "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg",
      "status": false,
    },
    {
      "title": "Roar",
      "singer": "Katy Perry",
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
      "image":
      "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp",
      "status": false,
    },
  ];
  int num = 0;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Dark Mode On',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));
    } else {
      setState(() {
        isSwitched = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text('Light Mode On',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
      ));
    }
  }

  TabController? controller;
  IconData btnIcon = Icons.play_arrow;
  late  AudioPlayer advancedPlayer;
  var bgColor=  const Color(0xFF03174C);
  var iconHoverColor = const Color(0xFF065BC3);

  Duration duration = new Duration();
  Duration position = new Duration();

  //9.Now add music player
  bool isPlaying = false;
  bool isLoop = false;
  bool isSwitched = false;
  List newItems = [];

  String currentSong = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    advancedPlayer =AudioPlayer();
  }
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
    //11
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
  @override
  Widget build(BuildContext context) {

    return Consumer<FormModel>(builder: (context, gym, child) {
      newItems = itemsList;
      var hSize = MediaQuery
          .of(context)
      
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      if (gym.likes.length != 0) {
        gym.likes.forEach((element) {
          newItems.forEach((active) {
            if (element["title"] == active["title"]) {
              active["status"] = true;
            }
          });
        });
      }
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: isSwitched ? Colors.grey : Color(0xFF03174C),
          appBar: AppBar(
            title: Text("Music Player"),
            centerTitle: true,
            actions: [
              Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.blue.shade800,
                inactiveTrackColor: Colors.lightBlueAccent,
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(6, 5, 6, 0),
                height: hSize*0.08,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Songs",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Icon(MdiIcons.music)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Playlist",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Icon(MdiIcons.playlistPlay)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: hSize*0.648,
                child: TabBarView(
                  children: [
                   Songs(newItems: newItems,  notifyParent: refresh,function:playMusic),
                    Favourite(notifyParent: refresh,function:playMusic),
                  ],
                ),
              ),
              Container(
                height: hSize * 0.16,
                // padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                    BorderRadius.only(topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                backgroundImage:
                                NetworkImage(gym.items[0]["image"]),
                                radius: wSize * 0.08,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(gym.items[0]["title"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text(gym.items[0]["singer"],
                                    style: TextStyle(
                                      color: Colors.white54,
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // num = num-1;
                                  // setState(() {
                                  //   gym.items[0] = newItems[num];
                                  // });
                                  // playMusic(gym.items[0]["url"],);
                                },
                                icon: Icon(Icons.skip_previous_outlined,
                                    color: Colors.white, size: 30)),
                            IconButton(
                                onPressed: () {
                                  playMusic(gym.items[0]["url"],);
                                  setState(() {
                                    gym.player();
                                  });

                                  if(isPlaying)
                                  {
                                    advancedPlayer.pause();
                                    setState(() {
                                      btnIcon = Icons.play_arrow;
                                      isPlaying = false;
                                    });
                                  }
                                  else{
                                    advancedPlayer.resume();
                                    setState(() {
                                      btnIcon = Icons.pause;
                                      isPlaying = true;
                                    });
                                  }

                                },
                                icon: Icon(btnIcon,
                                    color: Colors.white, size: 30)),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () {
                                  // num = num+1;
                                  //   gym.items[0] = newItems[num];
                                  // playMusic(gym.items[0]["url"],);
                                },
                                icon: Icon(Icons.skip_next_outlined,
                                    color: Colors.white, size: 30),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Duration(seconds: position.inSeconds.toInt())
                              .toString()
                              .split('.')[0]
                              .substring(2),
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 4),
                              trackShape: RectangularSliderTrackShape(),
                              trackHeight: 4,
                            ),
                            child: Slider(
                              value: position.inSeconds.toDouble(),
                              max: duration.inSeconds.toDouble(),
                              min: 0,
                              inactiveColor: Colors.grey[500],
                              activeColor: Colors.white,
                              onChanged: (val) {
                                seekToSec(val.toInt());
                              },
                            ),
                          ),
                        ),
                        Text(
                          Duration(seconds: duration.inSeconds.toInt())
                              .toString()
                              .split('.')[0]
                              .substring(2),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }
    );
  }

  refresh(index) {

    setState(() {
       num = index;
    });
  }
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    advancedPlayer.seek(newPos);

  }
}
