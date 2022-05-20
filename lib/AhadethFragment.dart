import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/HadethDetails.dart';
import 'package:islamy/HadethItem.dart';

import 'main.dart';

class AhadethFragment extends StatefulWidget {


  @override
  _AhadethFragmentState createState() => _AhadethFragmentState();
}

class _AhadethFragmentState extends State<AhadethFragment> {
  List<Hadeth>list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethContent();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              child: Image.asset('assets/images/quran.png'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: MyThemeData.PRIMARY_COLOR)),
                    child: Text(
                      'اسم الحديث',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )),
                Expanded(child:  ListView.builder(itemCount:list.length,itemBuilder: (context,index){

                  return HadethItem(list[index]);

                }

                )

                )
              ],
            )),
      ],
    );
  }

  loadHadethContent() async
  {
   List<Hadeth> hadethList=[];
    String fileContent = (await rootBundle.loadString(
        'assets/content/ahadeth.txt'));
    List<String> ahadeth = fileContent.split('#\r\n');
    for(int i=0;i<ahadeth.length;i++){
      print(ahadeth[i]);
      String hadeth=ahadeth[i];
      List<String>hadethlines = hadeth.split('\n');
      String title = hadethlines[0];
      List<String> hadethContent=[];
      for(int j=1;j<hadethlines.length;j++){
      hadethContent.add(hadethlines[j]);
      }
     Hadeth hadethObject= Hadeth(title,hadethContent);
      hadethList.add(hadethObject);
    }
setState(() {
 list= hadethList;
});
  }

}
class Hadeth{
  String title;
  List<String> content;
  Hadeth(this.title,this.content);
}
