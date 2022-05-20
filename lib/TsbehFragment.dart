import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:islamy/main.dart';

class Sebha extends StatefulWidget {
  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int flip = 0, tsbehChanger = 0;
  String tsbehCounter = '';

  var tsbehat = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,left: 43),
                child:
                    Center(child: Image.asset('assets/images/head_seb7a.png'))),
            Container(
              margin: EdgeInsets.only(top: 75),
              child: Center(
                  child: RotatedBox(
                      quarterTurns: flip,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              flip += 1;
                              if (flip % 33 == 0 && flip != 0) {
                                tsbehChanger += 1;
                              }
                              if (tsbehChanger == 3) {
                                tsbehChanger = 0;
                              }
                              tsbehCounter = (flip).toString();
                            });
                          },
                          child: Image.asset(
                            'assets/images/seb7a.png',
                          )))),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('عدد التسبيحات',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w300)),
        ),
        Container(
          child: Center(
              child: Text(tsbehCounter,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
          decoration: BoxDecoration(
              color: MyThemeData.PRIMARY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 58,
          height: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            tsbehat[tsbehChanger],
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
              color: MyThemeData.PRIMARY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 120,
          height: 50,
        ),
      ],
    );
  }
}
