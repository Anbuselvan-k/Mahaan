import 'package:flutter/material.dart';
class ten extends StatefulWidget {
  const ten({super.key});

  @override
  State<ten> createState() => _tenState();
}

class _tenState extends State<ten> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        leading: Icon(Icons.perm_contact_cal,color: Colors.white,),
        title: Center(child: Text("Ben Ten",style: TextStyle(color: Colors.white),)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.minimize,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.pageview_outlined,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.close,color: Colors.white,),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){}, child: Text("Run",style: TextStyle(color: Colors.yellow),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all()

              ),
            ),
          )
        ],
      ),
    );
  }
}
