import 'package:flutter/material.dart';
import 'package:untitled1/sample.dart';
class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown,
        leading: Icon(Icons.arrow_left),
        title: Text('Menu'),
        actions: [
          Icon(Icons.home)
        ],
      ),
      body:
         ListView(
          children:<Widget> [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(),
                borderRadius: BorderRadius.circular(30)
              ),
               child: ListTile(
                 leading: Icon(Icons.person),
                 title: Text('Attendance report'),
                 trailing: Icon(Icons.arrow_right_sharp),
               ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: ListTile(
                  leading: Icon(Icons.text_format),
                  title: Text('Mock Interview'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Payment report'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: Icon(Icons.pause_presentation),
                  title: Text('All students project url'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Leave request'),
                  trailing: Icon(Icons.arrow_right_sharp),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
