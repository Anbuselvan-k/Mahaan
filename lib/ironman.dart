import 'package:flutter/material.dart';
class dfc extends StatelessWidget {
  const dfc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage('assets/as.jpg'),fit: BoxFit.fill),
          ),
        ),
        title: Center(child: Text('Thanos',style: TextStyle(color: Colors.red,fontSize: 50,fontWeight: FontWeight.bold),)),
        actions: [
          Icon(Icons.minimize,color: Colors.brown,size: 20,),
          Icon(Icons.mail,color: Colors.grey,size: 30,),
          Icon(Icons.close,color: Colors.red,size: 40,),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage('assets/abc.jpg'),fit: BoxFit.fill)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'username',
                hintText: 'Enter',
                icon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Enter',
                icon: Icon(Icons.key)
              ),
            ),
          ),
          Center(child: ElevatedButton(onPressed: (){}, child: Text('Login',style: TextStyle(backgroundColor: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),)))

        ],
      ),
    );
  }
}



