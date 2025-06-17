import 'package:flutter/material.dart';

class bmicalc extends StatefulWidget {
  const bmicalc({super.key});

  @override
  State<bmicalc> createState() => _bmicalcState();
}

class _bmicalcState extends State<bmicalc> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  String opr = "";
  String Bmivalue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TextFormField(
                  controller: a,
                  decoration: InputDecoration(
                    hintText: "Enter Height in CM",
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TextFormField(
                controller: b,
                decoration: InputDecoration(
                  hintText: "Enter Weight in KG",
                ),
              ),
            ),
            SizedBox(height:20),
            SizedBox(height: 50,width: 250,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                ),
                    onPressed: (){
                      double x = double.parse(a.text);
                      double y = double.parse(b.text);
                      double z = 0;
                      double height = x/100;
                      z = y / (height * height);
                      c.text = z.toString();
                      print(z);
                      if (z < 16) {showDialog(context: context, builder:(BuildContext context){
                        return AlertDialog(
                          title: Container(
                            height: 70,
                            width: 300,
                            color: Colors.purpleAccent,
                            child: Column(
                              children: [
                                Text("Person is  Severely underweight",style: TextStyle(fontSize: 20),),
                                Text("$z",style: TextStyle(fontSize: 20)),
                              ],
                            ),
                          ),
                        );
                      });
                      }
                      else if (z<=18.4){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.deepOrangeAccent,
                              child: Column(
                                children: [
                                  Text("Person is underweight",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      else if (z<=24.9){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Text("Person is in Normalweight",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      else if (z<=29.9){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.yellow,
                              child: Column(
                                children: [
                                  Text("Person is Overweight",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      else if (z<=34.9){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.yellowAccent,
                              child: Column(
                                children: [
                                  Text("Person is Moderately obese",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      else if (z<=39.9){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.redAccent,
                              child: Column(
                                children: [
                                  Text("Person is Severely obese",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      else if (z>40){
                        showDialog(context: context, builder:(BuildContext context){
                          return AlertDialog(
                            title: Container(
                              height: 70,
                              width: 300,
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Text("Person is Morbidly obese",style: TextStyle(fontSize: 20),),
                                  Text("$z",style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                    }, child: Text("Calculate",style: TextStyle(color: Colors.white),))),
            SizedBox(height:20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TextFormField(
                controller: c,
                decoration: InputDecoration(
                  hintText: "BMI Value",
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}