import 'package:flutter/material.dart';
class bvb extends StatelessWidget {
  const bvb({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Icon(Icons.menu),
        title: Center(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Gt',style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      body: Column(
        children: [SizedBox(height: 50,),
          Center(
            child: Container(height: 400,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(image: AssetImage('assets/abc.jpg'),fit: BoxFit.fill)
              ),
             child: Column(
               children: [SizedBox(height: 15,),
                 Center(
                   child: Container(
                     height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       border: Border.all(),
                       borderRadius: BorderRadius.circular(50),
                       image: DecorationImage(image: AssetImage('assets/sample.jpg'),fit: BoxFit.fill)
                     ),

                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     decoration: InputDecoration(
                       labelText: 'User Name',
                       hintText: 'Enter Name',
                       icon: Icon(Icons.person,color: Colors.red,),
                     ),
                   ),
                 ),
                 ElevatedButton(onPressed: (){}, child: Text('Login',style: TextStyle(backgroundColor: Colors.green),))
               ],
             ),
            ),
          ),
          Row(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(image: AssetImage('assets/abc.jpg'),fit: BoxFit.fill)
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
