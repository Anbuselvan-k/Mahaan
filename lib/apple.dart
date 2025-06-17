import 'package:flutter/material.dart';
import 'package:untitled1/bottompage.dart';
import 'package:untitled1/ironman.dart';
class full extends StatefulWidget {
  const full({super.key});

  @override
  State<full> createState() => _fullState();
}

class _fullState extends State<full> {
  final _formkey = GlobalKey<FormState>();
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
      body: Form(key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: a,
                validator: (value){
                  if(value!.isEmpty|| !RegExp(r'[a-zA-Z]')
                  .hasMatch(value)){
                    return'Please enter correct data';
                  }
                },decoration: InputDecoration(
                  hintText: 'Enter',
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
                  if(value!.isEmpty||! RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)){
                    return'Please enter correct data';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter',
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
                    if (value!.isEmpty||!RegExp(  r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value!)) {
                      return 'Enter Valid Phone Number';
                    }
                },
                decoration: InputDecoration(
                  hintText: 'Enter',
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
                if(value!.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value))
                  return 'Please enter password';
                },
                decoration: InputDecoration(
                hintText: 'Enter',
                icon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
                onChanged: (value){
                  check();
                },
              ),
            ),
            Visibility(
              visible: isvisible,
              child:  ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content:Text('Processing data')),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>non()));
              }
            },
              child: Text('Login'),
            ),

            )


          ],
        ),
      ),
    );
  }
}
