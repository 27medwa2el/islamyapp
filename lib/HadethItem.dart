import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/AhadethFragment.dart';
import 'package:islamy/HadethDetails.dart';

class HadethItem extends StatelessWidget {
Hadeth hadeth;
HadethItem(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.of(context).pushNamed(HadethDetails.ROUTE_NAME,arguments: hadeth);
      HadethDetails();
    },child: Text(hadeth.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));

  }
  }

