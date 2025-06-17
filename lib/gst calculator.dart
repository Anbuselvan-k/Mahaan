import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class goods extends StatefulWidget {
  const goods({super.key});

  @override
  State<goods> createState() => _goodsState();
}

class _goodsState extends State<goods> {
  TextEditingController a= TextEditingController();
  TextEditingController b= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: a,
              decoration: InputDecoration(
                hintText: "Selling price",
                prefixIcon: Icon(CupertinoIcons.money_dollar_circle_fill),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: b,
              decoration: InputDecoration(
                hintText: "GST",
                prefixIcon: Icon(Icons.percent),
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),

                onPressed: (){
                  double c=double.parse(a.text);
                  double d=double.parse(b.text);
                  double e=0;
                  setState(() {
                  e=(d/100)*c;
                  double f=c-e;
                  print(e);
                  print(f);
                    showDialog(context: context,
                        builder: (BuildContext context){
                      return   AlertDialog(
                       title: Container(
                         height: 200,
                         width: 200,
                         child: Column(
                           children: [
                             Text("Pre_GST Amount:$f",style: TextStyle(color: Colors.blue),),
                             Text("Total GST:$e",style: TextStyle(color: Colors.blue),)
                           ],
                         ),
                       ),
                      );
                    });

                  });
                }, child: Text("Inclusive",style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),

                onPressed: (){
                  double c=double.parse(a.text);
                  double d=double.parse(b.text);
                  double g=0;
                  setState(() {
                     g=(d/100)*c;
                    double h=(g+c);
                    print(g);
                    print(h);
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return   AlertDialog(
                            title: Container(
                              height: 200,
                              width: 200,
                              child: Column(
                                children: [
                                   Text("Post_GST Amount:$g",style: TextStyle(color: Colors.blue)),
                                  Text("Total GST:$h",style: TextStyle(color: Colors.blue))
                                ],
                              ),
                            ),
                          );
                        });

                  });
                }, child: Text("Exclusive",style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold),)),
          )

        ],
      ),
    );
  }
}
