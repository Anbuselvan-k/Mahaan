import 'package:flutter/material.dart';
import 'package:untitled1/bmi%20calculator.dart';
import 'package:untitled1/calculator.dart';
import 'package:untitled1/gst%20calculator.dart';
class age extends StatefulWidget {
  const age({super.key});

  @override
  State<age> createState() => _ageState();
}

class _ageState extends State<age> {
  List a=[
    add(),
    weight(),
    goods(),
  ];
  int Currentindex=0;
  void tap (index){
    setState(() {
      Currentindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: a[Currentindex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.purple,),label:"person"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.red,),label:"Gst" ),
      ],
        onTap: tap,
        currentIndex: Currentindex,
      ),
    );
  }
}
