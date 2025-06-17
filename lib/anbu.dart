import 'dart:ui';

import 'package:flutter/material.dart';
class cup extends StatelessWidget {
  const cup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
              ),
            ),
            Container(
                   height: 400,
                   width: 400,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.yellowAccent),
                   ),
                   child: ClipRect(
                     child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5,),
                      child:  Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Padding(
                               padding: const EdgeInsets.only(top: 40),
                               child: TextFormField(
                                 decoration: InputDecoration(
                                     labelText: 'User Name',
                                     hintText: 'Enter Name',
                                     icon: Icon(Icons.person),
                                     border: OutlineInputBorder(),
                                 ),
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Padding(
                               padding: const EdgeInsets.only(top: 10),
                               child: TextFormField(
                                 decoration: InputDecoration(
                                     labelText: 'Password',
                                     hintText: 'Enter Pin',
                                     icon: Icon(Icons.key),
                                     border: OutlineInputBorder()
                                 ),
                               ),
                             ),
                           ),Padding(
                             padding: const EdgeInsets.only(top: 10),
                             child: ElevatedButton(
                               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                 onPressed: (){
                                 Navigator.pop(context);
                                 },
                                 child: Text('Login',style: TextStyle(color: Colors.white, ),)),
                           )
                         ],
                       ),
                     ),
                   ),
                 ),


            Container(
              height: 350,
              width: 400,
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.red ),
                    ),
                    child: Column(
                      children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                ),
                              ),
                            ),
                        Text('Thomas',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Column(
                   children: [
                     Container(
                       height: 200,
                       width: 200,
                       decoration: BoxDecoration(),
                       child: Padding(
                         padding: const EdgeInsets.only(top: 130,left: 30),
                         child: TextFormField(
                           decoration: InputDecoration(
                             labelText: 'Email',
                             icon: Icon(Icons.mail,color: Colors.red,),
                             border: OutlineInputBorder(),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 60),
                       child: ElevatedButton(onPressed: (){}, child: Text('Login')),
                     )
                   ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
