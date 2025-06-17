import 'package:flutter/material.dart';
class sea extends StatelessWidget {
  const sea({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage('assets/shelby.jpg'),fit: BoxFit.fill)
        ),
         child: Column(
           children: [
             Row(
             children: [
               Column(
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 20,left: 20),
                         child: Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill),
                           ),

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20,left: 20),
                         child: Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
                           ),
                         ),
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 20,left: 20),
                         child: Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill),
                           ),

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 20,left: 20),
                         child: Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/tommy.jpg'),fit: BoxFit.fill)
                           ),
                         ),
                       ),
                     ],
                   ),

                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Container(
                   height: 200,
                   width: 100,
                   decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage('assets/sample.jpg'),fit: BoxFit.fill)
                   ),
                 ),
               ),
             ],
           ),
             Padding(
               padding: const EdgeInsets.only(top: 140),
               child: Container(
                 height: 500,
                 width: 500,
                 decoration: BoxDecoration(
                   border: Border.all(),
                   borderRadius: BorderRadius.circular(40),
                 ),
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20,left: 20),
                           child: Container(
                             height: 200,
                             width: 100,
                             decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                             ),
                           ),
                         ),
                         Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 20,left: 20),
                               child: Container(
                                 height: 100,
                                 width: 100,
                                 decoration: BoxDecoration(
                                     image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                 ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 20,left: 20),
                               child: Container(
                                 height: 100,
                                 width: 100,
                                 decoration: BoxDecoration(
                                     image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                 ),
                               ),
                             ),
                           ],
                         )

                       ],
                     ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 20),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 20),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 20),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 20),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20),
                          child: Container(
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/thomas.jpg'),fit: BoxFit.fill)
                            ),
                          ),
                        ),
                      ],
                    )
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
