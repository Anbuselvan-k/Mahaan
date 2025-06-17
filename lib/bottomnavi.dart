import 'package:flutter/material.dart';

import 'login.dart';
class botomnavi extends StatefulWidget {
  const botomnavi({super.key});

  @override
  State<botomnavi> createState() => _botomnaviState();
}

class _botomnaviState extends State<botomnavi> {
  List pages=[
    Center(child: Text("data")),
    car()
  ];
  int currentindex=0;
  void tap(index){
    setState(() {
      currentindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
      ],
      onTap: tap,
        currentIndex: currentindex,
      ),

    );
  }
}
