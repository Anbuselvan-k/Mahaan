import 'package:flutter/material.dart';
import 'package:untitled1/anbu.dart';
class valid extends StatefulWidget {
  const valid({super.key});

  @override
  State<valid> createState() => _validState();
}

class _validState extends State<valid> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Form(
       key: _formKey,
       child: Column(
         children: [
           TextFormField(
             validator: (value){
               if(value==null||value.isEmpty){
                 return "please enter correct data";
               }
             },
           ),
           ElevatedButton(onPressed: (){
             if(_formKey.currentState!.validate()){
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Processing Data')),
               );
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => cup()),
               );
             }
             else
               {
                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('Please enter correct data')),
                 );
               }
           }, child: Text("login"))
         ],
       ),
     ), 
    );  }
}
