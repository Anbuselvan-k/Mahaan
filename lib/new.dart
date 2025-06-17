import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  TextEditingController abc = TextEditingController();
  List a = [];
  String value ="";
  String value1="";
  String value2="";
  String value3="";
  String value4="";
  String value5="";
  String value6="";

  asnd(){
    int num=int.parse(abc.text);
    a.add(num);
    abc.clear();
  }
  grt(){
    setState(() {
      a.sort();
      var grt =a.where((a) => a > 5).toList();
      print(grt);
      value5=grt.toString();print(value5);
      showDialog(context: context,
          barrierDismissible: false,
          builder:(BuildContext context){
            return AlertDialog(
              title: Text("greater than value"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("greater than value:${value5}")
                  ],
                ),
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Thank you"))
              ],
            );
          });
    });
  }
  less(){
    setState(() {
      a.sort();
      print(a);
      var less =a.where((a) => a < 5).toList();
      print(less);
      value6=less.toString();
      showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("less than value"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("less than value: ${value6}")
                  ],
                ),
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child:Text("Thank You"))
              ],
            );
          });

    });
  }
  assending(){
    a.sort();
    print(a);
    value4=a.toString();
    showDialog(context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text("assending value"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("asending value:${value4}")
                ],
              ),
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("thank you"))
            ],
          );
        });
  }
  descending(){
    a.sort();
    var descending=a.reversed;
    print(descending);
    value3=a.reversed.toString();
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("descending value"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("descending value${value3}")
                ],
              ),
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("thank you"))
            ],
          );
        });
  }
  min(){
    a.sort();
    print(a);
    print("${a.first}");
    value1=a.first.toString();

    showDialog(context:context,
        barrierDismissible: false,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text("minum value"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("minimum value ${value1}")
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Thank you"))
            ],
          );
        });

  }
  maximum(){
    a.sort();
    print(a);
    print("${a.last}");
    value=a.last.toString();

    showDialog(context: context,
        barrierDismissible: false,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text("maximum value"),
            content: SingleChildScrollView(
              child: ListBody(
                children:<Widget> [
                  Text("maximum value is:${value}")
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child:Text("Thank you"))
            ],
          );
        });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: abc,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),),
          ElevatedButton(onPressed: (){
            setState(() {
              int n=int.parse(abc.text);
              a.add(n);
              abc.clear();
            });
          }, child: Text("ok")),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      assending();
                    }, child: Text("ascending")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      descending();
                    }, child: Text("DSC")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      min();
                    }, child: Text("min")),
                  ),
                ],
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    maximum();
                  }, child: Text("max")),
                ),
                ElevatedButton(onPressed: (){
                  less();
                }, child: Text("lesser")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    grt();
                  }, child: Text("greater")),
                )
              ],)
            ],
          ),
          Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all()
              ),
              child: ListView.builder(
                  itemCount: a.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: ListTile(
                        title: Text(a[index].toString()),
                      ),
                    );
                  } )

          ),


        ],

      ),

    );
  }
}

