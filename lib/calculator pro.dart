import 'package:flutter/material.dart';
class zero extends StatefulWidget {
  const zero({super.key});

  @override
  State<zero> createState() => _zeroState();
}

class _zeroState extends State<zero> {

  TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black87,
      body: Column(
        children: [
          TextFormField(
            controller: ctr,
            style: TextStyle(color: Colors.white),),

          TextButton(onPressed: (){
            setState(() {
              ctr.text = "1";
            });
          }, child: Text("1",style: TextStyle(color: Colors.white),))
        ],
      )


    );
  }
}
