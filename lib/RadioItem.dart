import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamy/Radio%20api/radios.dart';
import 'package:islamy/main.dart';
class RadioItem extends StatefulWidget {

Radios item;
RadioItem(this.item);
  @override
  _RadioItemState createState() => _RadioItemState();

}
AudioPlayer audioPlayer;

class _RadioItemState extends State<RadioItem> {
@override
  void initState() {
    // TODO: implement initState
    audioPlayer=AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {


return Container(
  width: MediaQuery.of(context).size.width,
  child:   Column(
    children: [
      Center(child: Text(widget.item.name,style: TextStyle(fontSize: 24),)),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){play();}, icon: Icon(Icons.play_arrow,size: 28,color: MyThemeData.PRIMARY_COLOR,)),
          IconButton(onPressed: (){stop();}, icon: Icon(Icons.stop,size: 28,color: MyThemeData.PRIMARY_COLOR,)),
        ],
      )

    ],
  ),
);

  }
play() async {
  int result = await audioPlayer.play(widget.item.radio_url);
 
}
stop()async{
  int result = await audioPlayer.pause();
}
}
