import 'package:flutter/material.dart';
import 'package:untitled1/list.dart';
import 'package:untitled1/new.dart';
class water extends StatefulWidget {
  const water({super.key});

  @override
  State<water> createState() => _waterState();
}

class _waterState extends State<water> {
  TextEditingController an=TextEditingController();
  TextEditingController ne=TextEditingController();

    List b = [];          //container
    String value ="";
    String value1="";
    String value2="";
    String value3="";
    String value4="";
    String value5="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: an,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                onPressed: (){
                  setState(() {
                   int a=int.parse(an.text);
                    b.add(a);
                    an.clear();
                  });
                  }, child: Text("Button",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                border: Border.all()
            ),
            child: ListView.builder(
                itemCount: b.length,
                itemBuilder: (BuildContext context , int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>secondscreen(data: b[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                            color: Colors.cyan,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(b[index].toString()),
                                Row(
                                  children: [
                                    TextButton(onPressed: (){

                                      showDialog(context: context, builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              TextFormField(
                                                controller: ne,
                                                decoration: InputDecoration(
                                                   border: OutlineInputBorder()
                                                 ),

                                              ),
                                              TextButton(onPressed: (){
                                                setState(() {
                                                  b[index]=ne.text;
                                                  Navigator.pop(context);
                                                });
                                              }, child: Text("Edit"))
                                            ],
                                          ),
                                        );
                                      });
                                    },
                                        child: Icon(Icons.edit)),
                                    TextButton(onPressed: (){
                                      setState(() {
                                        b.removeAt(index);
                                      });
                                    }, child: Icon(Icons.delete)),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
            }),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                    setState(() {
                      b.sort();
                      print(b);
                      print("${b.first}");
                      value=b.first.toString();
                    });
                    showDialog(context: context,
                        builder: (BuildContext  context){
                      return AlertDialog(
                        title: ListBody(
                          children: [
                            Text("Min:${value}",style: TextStyle(color: Colors.red),)
                          ],
                        ),
                      );
                        });
                    },
                    child: Text("Min",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                    setState(() {
                      b.sort();
                      print(b);
                      print("${b.last}");
                      value1=b.last.toString();
                    });
                    showDialog(context: context,
                        builder: (BuildContext  context){
                      return AlertDialog(
                        title: ListBody(children: [
                          Text("Max:${value1}",style: TextStyle(color: Colors.red),)
                        ],),
                      );
                        });
                    },
                    child: Text("Max",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                      setState(() {
                        b.sort();
                        print(b);
                        value2=b.toString();
                      });
                      showDialog(context: context,
                          builder: (BuildContext context){
                        return AlertDialog(
                          title: ListBody(
                            children: [
                              Text("Aso:${value2}",style: TextStyle(color: Colors.red),)

                          ],),
                        );
                          });
                    },
                    child: Text("Aso",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                      setState(() {
                        b.sort();
                        var descending=b.reversed;
                        print(descending);
                        value3=b.reversed.toString();
                      });
                      showDialog(context: context,
                          builder: (BuildContext context){
                        return AlertDialog(
                          title: ListBody(children: [
                            Text("Dso:${value3}",style: TextStyle(color: Colors.red),)
                          ],),
                        );
                          });
                    },
                    child: Text("Dso",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                      setState(() {
                        b.sort();
                        var grt=b.where((b)=>b>5).toList();
                        print(grt);
                        value4=grt.toString();
                        print(value4);

                      });
                      showDialog(context: context,
                          builder: (BuildContext context){
                        return AlertDialog(
                          title: ListBody(
                            children: [
                            Text("Greater Than:${value4}",style: TextStyle(color: Colors.red),)
                          ],
                          ),
                        );
                          });
                    },
                    child: Text(">5  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.yellowAccent),
                    onPressed: (){
                      setState(() {
                        b.sort();
                        var less=b.where((b) => b < 5).toList();
                        print(less);
                        value5=less.toString();
                        print(value5);
                      });
                      showDialog(context: context,
                          builder: (BuildContext context){
                        return AlertDialog(
                          title: ListBody(
                            children: [
                              Text("Lesser Than:${value5}",style: TextStyle(color: Colors.red),)
                            ],
                          ),
                        );
                          });
                    },
                    child: Text("<5  ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
class secondscreen extends StatefulWidget {
  String data;
   secondscreen({super.key,required this.data});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.data),
      ],
    );
  }
}
