import 'package:flutter/material.dart';
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
            ),
        child: Column(
          children: [SizedBox(height: 20,),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50),
                 // image: DecorationImage(image: AssetImage('assets/shelby.jpg'),fit: BoxFit.fill)
              ),
              child: Column(children: [
              ],),
            ),
            Row(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 150,
                  width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                      image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill)

                    ),

                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                   // image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
                  ),
                 child: Column(
                   children: [
                     Container(
                         height: 100,
                         width: 150,
                         decoration: BoxDecoration(
                           border: Border.all(),
                           borderRadius: BorderRadius.only(),
                           // image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
                         ),
                         child: Image.asset("assets/thomas.jpg"),),
                     Text("data"),

                   ],
                 ),
                 // child: Text('data',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),

                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50,right: 100),
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.contain)
                      ),

                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(height:100 ,
                          width: 100,
                            child: TextFormField()),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('Okay'))
                    ],
                  ),
                ],
              ),
              ),
            )
          ],
        ),
        ),
      );

  }
}
