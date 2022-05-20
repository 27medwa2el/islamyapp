import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/SuraDetails.dart';

class SuraShow extends StatelessWidget {
  int pos = 0;
  String suraName;

  SuraShow(this.pos, this.suraName);




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetails.ROUTE_NAME,arguments: SuraDetailsParameters(pos,suraName));

      },
        child: Text(suraName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}
