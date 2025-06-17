import 'package:flutter/material.dart';
class example2 extends StatelessWidget {
  const example2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Icon(Icons.menu,color: Colors.pink,size: 50,),
        title: Center(
            child: Text("Welcome",
              style: TextStyle(color: Colors.pink,fontSize: 50,fontWeight: FontWeight.bold),)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.close),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.minimize),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "USername",
                hintText: "Enter username",
                icon: Icon(Icons.person),
                border: OutlineInputBorder()
              ),
            ),
            
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink
            ),
              onPressed: (){},
              child: Text("Login"))
        ],
      ),
    );
  }
}
