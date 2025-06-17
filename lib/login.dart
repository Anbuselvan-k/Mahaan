import 'package:flutter/material.dart';
import 'package:untitled1/kk.dart';

class car extends StatefulWidget {
  const car({super.key});

  @override
  State<car> createState() => _carState();
}

class _carState extends State<car> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key:_formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)){
                  return 'Please enter correct data';
                }
              },
            ),
            TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return'Please enter correct data';
                }
              },
            ),
            ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing data')),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>example2()),
                );
              }
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
