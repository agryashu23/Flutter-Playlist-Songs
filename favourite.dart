import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gym/provider.dart';
import 'package:provider/provider.dart';

import 'check.dart';


class Favourite extends StatefulWidget {
  const Favourite({Key? key,required this.notifyParent, required this.function}) : super(key: key);
  final Function notifyParent;
  final Function function;

  @override
  _FavouriteState createState() => _FavouriteState();
}


class _FavouriteState extends State<Favourite> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child)
    {
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
      double currentSlider = 0.0;
      return Scaffold(
          backgroundColor: const Color(0xFF03174C),
          body:gym.likes.isEmpty?Center(child: Padding(padding: EdgeInsets.all(10),
            child: Text(
              "Currently, \n You Have no Songs Added to your Playlist.",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white,letterSpacing: 1.5),
            ),
          ),):
                Column(children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: gym.likes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              onTap: (){
                                setState(() {
                                  gym.items[0]["title"] = gym.likes[index]["title"];
                                  gym.items[0]["singer"] = gym.likes[index]["singer"];
                                  gym.items[0]["image"] = gym.likes[index]["image"];
                                  gym.items[0]["url"] = gym.likes[index]["url"];
                                });
                                print(gym.items);
                                widget.function(gym.items[0]["url"]);
                                widget.notifyParent();

                              },
                              leading: Stack(children: [
                                Container(
                                  height: hSize * 0.09,
                                  width: wSize * 0.18,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      gym.likes[index]["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: hSize * 0.08,
                                  width: wSize * 0.18,
                                  child: Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 42.0,
                                  ),
                                )
                              ]),
                              title: Text(
                                gym.likes[index]["title"],
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0
                                ),
                              ),
                              subtitle: Text(
                                gym.likes[index]["singer"],
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5), fontSize: 14.0),
                              ),
                          );
                        }
                    ),
                  ),

                ]),

      );
    });
  }
}
