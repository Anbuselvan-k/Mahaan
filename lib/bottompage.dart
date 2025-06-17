import 'package:flutter/material.dart';
import 'package:untitled1/Dark.dart';
import 'package:untitled1/Error.dart';
import 'package:untitled1/amazon%20page.dart';
import 'package:untitled1/batman.dart';
import 'package:untitled1/insta.dart';
import 'package:untitled1/product%20page.dart';
import 'package:untitled1/spotify.dart';
class non extends StatefulWidget {
  const non({super.key});

  @override
  State<non> createState() => _nonState();
}

class _nonState extends State<non> {
 List page=[
   sad(),
   amzo(),
   music(),
   story(),
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
      body: page[Currentindex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blueGrey,),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.blueGrey,),label: 'udates'),
        BottomNavigationBarItem(icon: Icon(Icons.wifi,color: Colors.blueGrey,),label: 'settings'),
        BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blueGrey,),label: 'settings'),
      ],
          onTap: tap,
        currentIndex: Currentindex,
      ),
    );
  }
}
