import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/AhadethFragment.dart';

class HadethDetails extends StatelessWidget {
  Hadeth elhadeth;

static final String ROUTE_NAME='hadethDetails';
  @override
  Widget build(BuildContext context) {
    elhadeth = ModalRoute.of(context).settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(

          image: DecorationImage(fit: BoxFit.fill,
              image: AssetImage('assets/images/bg3.png'))

      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          child: Center(

              child:  elhadeth.content.length==0?CircularProgressIndicator()
                  : ListView.builder(itemBuilder: (context,index){
                return Container(margin: EdgeInsets.only(top: 60),child: Text(elhadeth.content[index],textDirection: TextDirection.rtl,style: TextStyle(fontSize: 19),textAlign: TextAlign.center,));

              },
                itemCount: elhadeth.content.length,)

          ),
        ),
      ),
    );
  }
}
