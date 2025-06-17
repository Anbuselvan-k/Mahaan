import 'package:flutter/material.dart';
class iphone extends StatefulWidget {
  const iphone({super.key});

  @override
  State<iphone> createState() => _iphoneState();
}

class _iphoneState extends State<iphone> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController a=TextEditingController();
  TextEditingController b=TextEditingController();
  TextEditingController c=TextEditingController();
  bool isvisible=false;
  check(){
    setState(() {
      isvisible=a.text.isNotEmpty&&b.text.isNotEmpty&&c.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Icon(Icons.menu,color: Colors.red,),
        title: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: AssetImage('assets/img.png'),fit: BoxFit.fill),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search,color: Colors.red,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shop,color: Colors.red,),
          ),
        ],
      ),
      body: Form(key: _formkey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img_1.png'),fit: BoxFit.fill)
          ),
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty||!RegExp(r'[a-zA-Z]')
                        .hasMatch(value)){
                      return 'Please Enter Correct Name';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter Name',
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value){
                    check();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)){
                      return'Please Enter Correct Mail';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Mail ID',
                    hintText: 'Enter Mail',
                    icon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value){
                    check();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){

                    }

                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Pin',
                    icon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value){
                    check();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: isvisible,
                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing data'))
                      );
                    }
                  },
                      child: Text('Login')),
                ),
              )

            ],
          ) ,
        ),
      ),
    );
  }
}
