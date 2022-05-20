import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamy/Radio%20api/RadioResponse.dart';
import 'package:islamy/RadioItem.dart';

class RadioFragment extends StatefulWidget {


  @override
  _RadioFragmentState createState() => _RadioFragmentState();
}

class _RadioFragmentState extends State<RadioFragment> {
  Future<RadioResponse>radioResponse;
  @override
  void initState() {
    // TODO: implement initState
    radioResponse=fetchRadio();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<RadioResponse>

      (future: radioResponse, builder: (buildContext,snapShot){

    if(snapShot.hasData) {
      return

          Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/radioo.png'),
              SizedBox(height: 50,),
      Expanded(
        child: ListView.builder(physics: PageScrollPhysics(),scrollDirection: Axis.horizontal,itemCount: snapShot.data.radios.length,itemBuilder: (context,index){
          return RadioItem(snapShot.data.radios[index]);

        },
        ),
      )
    ]
          );
    }
    else if(snapShot.hasError){
      return Text(snapShot.data.toString());}
    else{
      return Center(child: CircularProgressIndicator());
    }

    }

    );
  }

  Future<RadioResponse> fetchRadio() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));

    if (response.statusCode == 200) {

      return RadioResponse.fromJsonMap(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {

      throw Exception('Failed to load radios');
    }
  }
}
