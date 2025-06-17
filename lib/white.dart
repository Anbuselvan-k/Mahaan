import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
class salads extends StatefulWidget {
  const salads({super.key});

  @override
  State<salads> createState() => _saladsState();
}

class _saladsState extends State<salads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.grey,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.local_print_shop_outlined,color: Colors.grey,),
          )
        ],
      ),

      body:Stack(
        children:<Widget> [
          Positioned(
            left: 10,
            child:Container(
              height: double.infinity,
              width: double.infinity,

              color: Colors.red,
            ),
          ),
          Positioned(right: 10,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,

          ))

        ],
      ),

    );
  }
}
