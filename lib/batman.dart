import 'package:flutter/material.dart';


class bnm extends StatelessWidget {
  const bnm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: Icon(Icons.menu,color: Colors.cyan,size: 35,),
        title: Center(child: Text('joker', style: TextStyle(color: Colors.redAccent,fontSize: 40,fontWeight: FontWeight.bold),)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.label),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.man),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'username',
                hintText: 'enter',
                icon: Icon(Icons.person),
               border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'enter',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent),
              onPressed: (){},
              child: Text('Login', )),

          Container(
            height: 300,
              width: 300,
            // color: Colors.cyan,
            decoration: BoxDecoration(
              color: Colors.cyan,
              border: Border.all(),
              //borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                  image: AssetImage("assets/sample.jpg"),
                fit: BoxFit.fill
              ),
              shape: BoxShape.rectangle,
            ),
            child: Center(child: Text("data",style: TextStyle(color: Colors.cyan,fontSize: 35),)),

          ),

        ],
      ),

    );
  }
}
