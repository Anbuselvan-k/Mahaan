import 'package:flutter/material.dart';
class asd extends StatelessWidget {
  const asd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: Icon(Icons.male),
        title: Center(
          child: Text('moon',
          style: TextStyle(color: Colors.limeAccent,fontSize: 40,fontWeight: FontWeight.bold),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.minimize),
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
                labelText: 'user name',
                hintText: 'name',
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
                hintText: 'password',
                icon: Icon(Icons.key),
                border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: (){},
              child: Text('login'))
        ],
      ),
    );
  }
}


