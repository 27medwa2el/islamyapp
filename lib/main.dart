import 'package:flutter/material.dart';
import 'package:islamy/AhadethFragment.dart';
import 'package:islamy/HadethDetails.dart';
import 'package:islamy/QuranFragment.dart';
import 'package:islamy/RadioFragment.dart';
import 'package:islamy/SuraDetails.dart';
import 'package:islamy/TsbehFragment.dart';

void main() {
  runApp(MyApp());
}

class MyThemeData {
  static final PRIMARY_COLOR = Color(0xFFB7935F);

}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SuraDetails.ROUTE_NAME: (context) => SuraDetails(),
        HadethDetails.ROUTE_NAME: (context) => HadethDetails(),
      },
      theme: ThemeData(
          accentColor: Colors.black,
        primaryColor: MyThemeData.PRIMARY_COLOR
      ),

      home: Container(

        decoration: BoxDecoration(

            image: DecorationImage(fit: BoxFit.fill,
                image: AssetImage('assets/images/bg3.png'))

        ),

        child: Scaffold(

          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(child: Text('Islamy',style: TextStyle(color: Colors.black),)),
            elevation: 0,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyThemeData.PRIMARY_COLOR),
            child: BottomNavigationBar(
              selectedIconTheme: IconThemeData(color: Colors.black),
              selectedLabelStyle: TextStyle(),

               currentIndex: selectedIndex,
               onTap: (index){
                setState(() {
                  selectedIndex=index;
                });
               },
              showUnselectedLabels: false,
              items: [BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/radio.png')),label: 'radio'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/sebha.png')),label: 'sebha'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/moshaf.png')),label: 'quran'),
                BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined) ,label: 'ahadeth')],
            ),
          ),
          body: selectedFragment(selectedIndex),


        ),
      ),
    );
  }
  selectedFragment(selectedIndex){
    if(selectedIndex==0)
      return RadioFragment();
    else if(selectedIndex==2)
      return QuranFragment();
    else if(selectedIndex==1)
      return Sebha();
    else
      return AhadethFragment();
  }
}

