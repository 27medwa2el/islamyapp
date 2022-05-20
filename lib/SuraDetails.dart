import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetails extends StatefulWidget {
  static final String ROUTE_NAME='suraDetails';

  @override
  _SuraDetailsState createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String>ayaList;
  @override
  Widget build(BuildContext context) {

    var parameters = ModalRoute
        .of(context)
        .settings
        .arguments as SuraDetailsParameters;
   readSuraContent('assets/content/${parameters.pos}.txt');
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
      ),
       body: Container(
         margin: EdgeInsets.only(top: 55),
         child: Center(
          
           child:  ayaList.length==0?CircularProgressIndicator()
               : ListView.builder(itemBuilder: (context,index){
                 return Text(ayaList[index],style: TextStyle(fontSize: 24),textDirection: TextDirection.rtl,);

           },
           itemCount: ayaList.length,)
             
         ),
       ),
      ),
    );
  }
  void readSuraContent(String fileName) async{
    String fileContent= (await rootBundle.loadString(fileName));
    List<String> lines= fileContent.split('\n');
    setState(() {
      ayaList= lines;
    });

  }
}
class SuraDetailsParameters{
  int pos;
  String suraName;
  SuraDetailsParameters(this.pos,this.suraName);

}
