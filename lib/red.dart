import 'package:flutter/material.dart';
class pizza extends StatefulWidget {
  const pizza({super.key});

  @override
  State<pizza> createState() => _pizzaState();
}

class _pizzaState extends State<pizza> {
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

      body:Column(
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20)

              ),
              child: ListTile(

                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_39.png"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all()
                  ),
                ),
                title: Text("Pizza",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("21 dish"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
                  ),
                ),

              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 15),
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)

              ),
              child:ListTile(

                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_41.png"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all()
                  ),
                ),
                title: Text("Salads",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("21 dish"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
                ),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 15),
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)

              ),
              child:ListTile(

                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_42.png"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all()
                  ),
                ),
                title: Text("Dessorts",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("21 dish"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
                ),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 15),
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)

              ),
              child:ListTile(

                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_43.png"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all()
                  ),
                ),
                title: Text("Pasta",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("21 dish"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
                ),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 15),
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)

              ),
              child:ListTile(

                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_39.png"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all()
                  ),
                ),
                title: Text("Beverage",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                subtitle: Text("21 dish"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
                ),
              ),

            ),
          ),



        ],
      ),
      
    );
  }
}
