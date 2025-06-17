import 'package:flutter/material.dart';
import 'package:untitled1/bottompage.dart';

import 'anbu.dart';
class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  final _fomrmkey=GlobalKey<FormState>();
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  TextEditingController d=TextEditingController();
  bool isvisible=false;
  check(){
    setState(() {
      isvisible=a.text.isNotEmpty&&b.text.isNotEmpty&&c.text.isNotEmpty&&d.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: _fomrmkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: a,
                validator: (value){
                  if(value!.isEmpty||!RegExp(r'[a-zA-Z]').hasMatch(value)){
                    return'Please Enter Your Name';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'User Name',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  check();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: b,
                validator: (value){
                  if(value!.isEmpty||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return'Please Enter Correct Email';
                  }
                },

                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  check();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: c,
                validator: (value){
                  if(value!.isEmpty||!RegExp( r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)){
                    return'Please Enter Correct Mobile Number';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  icon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  check();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: d,
                validator: (value){
                  if(value!.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                    return'Please Enter Correct Password';
                  }
                },
                decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.key),
                border: OutlineInputBorder(),
              ),
                onChanged: (value){
                  check();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: isvisible,
                child: ElevatedButton(onPressed: (){
                  if(_fomrmkey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'))
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>non()));
                  }
                }, child: Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
