import 'package:flutter/material.dart';
class vcx extends StatelessWidget {
  const vcx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage('assets/as.jpg'),)
          ),
        ),
        title: Center(child: Text('Gt',
        style: TextStyle(color: Colors.red,fontSize: 45,fontWeight: FontWeight.bold),)),
        actions: [
          Icon(Icons.menu,color: Colors.red,)
        ],

      ),
      body: Column(
        children: [
          SizedBox(height: 60,),
          Center(
            child: Container(
              height: 350,
              width: 350,
             // color: Colors.brown,
              decoration: BoxDecoration(
                color: Colors.brown,
                border: Border.all(),
               // borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                  image: AssetImage('sample.jpg'),
                  fit: BoxFit.fill
                ),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('Gt',style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
          ),
          SizedBox(height: 20
            ,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Student Name',
                hintText: 'Enter Name',
                icon: Icon(Icons.person),
                border: OutlineInputBorder()
              ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Center(child: Text('Login',style: TextStyle(backgroundColor: Colors.green,fontSize: 20),)),),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage("assets/abc.jpg"),fit: BoxFit.fill)
            ),
          )
        ],
      ),
    );
  }
}
