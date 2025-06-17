import 'package:flutter/material.dart';
import 'package:untitled1/man.dart';

import 'bottompage.dart';
class mail extends StatefulWidget {
  const mail({super.key});

  @override
  State<mail> createState() => _mailState();
}

class _mailState extends State<mail> {
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  List ca=[];

  ad()
  {
    String text1 = a.text;
    String text2 = b.text;
    String text3 = c.text;
    setState(() {
      ca.add("${text1}\n${text2}\n${text3}");
    });
  }

  void nav(String data)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>secondscreen(data:data))).
    then((editData)
    {
      setState(() {

      ca[ca.indexWhere((element)=>element== data)]=editData;

      });
    }
    );
  }

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
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: b,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: c,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
                  onPressed: (){
                   ad();
                  }, child: Text("Login",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),

            SizedBox(height: 70,),
            Container(
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: ListView.builder(
                  itemCount:ca.length,
                  itemBuilder: (BuildContext context ,int index){
                    return GestureDetector(
                    onTap: (){
                      nav(ca[index]);
                     },
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          color: Colors.greenAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(ca[index].toString()),
                              TextButton(onPressed: (){
                                setState(() {
                                  ca.removeAt(index);
                                });
                              }, child: Icon(Icons.delete))
                            
                            ],
                          ),

                        ),
                      ) ,
                    );
            }),

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

  TextEditingController q=TextEditingController();
  TextEditingController w=TextEditingController();
  TextEditingController e=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    List<String> lis = widget.data.split("\n");

    q = TextEditingController(text: lis[0]);
    w = TextEditingController(text: lis[1]);
    e = TextEditingController(text: lis[2]);


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: q,),
          TextFormField(controller: w,),
          TextFormField(controller: e,),
          ElevatedButton(onPressed: (){

           setState(() {
             String editData = "${q.text}\n${w.text}\n${e.text}";
             Navigator.pop(context,editData);
           });

          }, child: Text("update")),
        ],
      ),
    );
  }
}


