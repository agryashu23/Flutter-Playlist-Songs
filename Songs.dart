import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gym/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Songs extends StatefulWidget {
  const Songs({Key? key, required this.newItems,required this.notifyParent, required this.function}) : super(key: key);
  final Function notifyParent;
  final Function function;
  final List newItems;
  @override
  _SongsState createState() => _SongsState();
}

class _SongsState extends State<Songs> {

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, gym, child) {
      var hSize = MediaQuery
          .of(context)
          .size
          .height;
      var wSize = MediaQuery
          .of(context)
          .size
          .width;
    return Column(
      children: [
        Expanded(
        child: ListView.builder(
            itemCount: widget.newItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () {
                    setState(() {
                      gym.items[0]["title"] =
                      widget.newItems[index]["title"];
                      gym.items[0]["singer"] =
                      widget.newItems[index]["singer"];
                      gym.items[0]["image"] =
                      widget.newItems[index]["image"];
                      gym.items[0]["url"] = widget.newItems[index]["url"];
                    });
                    print(gym.items);
                    widget.function(gym.items[0]["url"]);
                    widget.notifyParent(index);
                  },
                  leading: Stack(children: [
                    Container(
                      height: hSize * 0.09,
                      width: wSize * 0.18,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.newItems[index]["image"],
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
                    widget.newItems[index]["title"],
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  ),
                  subtitle: Text(
                    widget.newItems[index]["singer"],
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14.0),
                  ),
                  trailing: IconButton(
                    icon: widget.newItems[index]["status"]
                        ? Icon(
                      MdiIcons.playlistCheck,
                      color: Colors.white,
                      size: wSize * 0.08,
                    )
                        : Icon(
                      MdiIcons.playlistPlus,
                      color: Colors.black54,
                      size: wSize * 0.08,
                    ),
                    onPressed: () {
                      if (widget.newItems[index]["status"] == false) {
                        gym.addLikes(
                            widget.newItems[index]["title"],
                            widget.newItems[index]["singer"],
                            widget.newItems[index]["image"],
                            widget.newItems[index]["url"]);
                        setState(() {
                          widget.newItems[index]['status'] = true;
                        });
                      } else {
                        gym.likes.removeWhere((element) =>
                        element["title"] ==
                            widget.newItems[index]["title"]);
                        setState(() {
                          widget.newItems[index]['status'] = false;
                        });
                      }
                      print(gym.likes);

                    },
                  ));
            }),
      ),

      ],
    );

    });
  }

}
