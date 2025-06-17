import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/insta.dart';
import 'package:untitled1/man.dart';
import 'package:untitled1/ott.dart';
import 'package:untitled1/product%20page.dart';
import 'package:untitled1/spotify.dart';
import 'package:untitled1/valid.dart';
class log extends StatefulWidget {
  const log({super.key});

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  final _formkey =GlobalKey<FormState>();
  
  TextEditingController name=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController password=TextEditingController();

  var emailAuth="somemail@domain.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black87,
      body: Form(key: _formkey,
        child: Column(
          children: [
            Text("Create Account",style: TextStyle(color: Color(0XFFC8E6C9),fontSize: 30,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: SizedBox(width: 350,
                child: TextFormField(
                  controller: name,
                  validator: (value){
                    if (value!.isEmpty||!RegExp(r'[a-zA-Z]').hasMatch(value)){
                      return "Please enter correct name";
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: IconButton(onPressed: (){

                    }, icon: Icon(Icons.person)),
                    hintText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ), Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: SizedBox(width: 350,
                child: TextFormField(
                  controller: mail,
                  validator: (value){
                    if (value!.isEmpty||!RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return "Please enter your correct email";
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "E-mail",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: SizedBox(width: 350,
                child: TextFormField(
                  controller: password,
                  validator: (value){
                    if (value!.isEmpty||!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                      return "Please enter correct pin";
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.lock_outlined),
                    hintText: " Password",
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
            ),  SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.only(top: 10,left: 20),
                     child: ElevatedButton(
                         style: ElevatedButton.styleFrom(backgroundColor: Color(0XFFBBDEFB)),
                         onPressed: ()  {}, child: Text("    Sign Up    ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,left: 15),
                      child: Container(
                          height: 25,
                          width: 250,
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: (){}, child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/google.png"),fit: BoxFit.fill)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Google Sign In",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ))),
                    )
          ],
        ),
      ),
    );
  }
}
class login extends StatefulWidget {
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController a = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black87,
        body: Form(key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Authentication",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("required",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("We've sent a One Time Password (OTP) to the ",style: TextStyle(color: Color(0XFF98A5A7)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("mobile number above. Plese enter itto",style: TextStyle(color: Color(0XFF98A5A7)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("complete verification",style: TextStyle(color: Color(0XFF98A5A7)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(controller: a,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^(?:[+0]9)?[0-9]{6}$').hasMatch(value)) {
                      return "Please enter correct OTP";
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      filled: true,
                      labelText: "Enter OTP",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Processing data")));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>netflix()));
                  }
                }, child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: (){}, child: Text("Resend OTP",style: TextStyle(color: Colors.blue),)),
              ),
              Text("or",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              Container(
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0XFF94ACC4)),
                    onPressed: (){}, child: Text("Sign in with your password",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 40,),
              Text("© 1996-2024,Amazon.com,Inc.or its affiliates",style: TextStyle(color: Color(0XFF98A5A7)),),
            ],
          ),
        )
    );
  }
}
class wwe extends StatefulWidget {
  const wwe({super.key});

  @override
  _wweState createState() => _wweState();
}

class _wweState extends State<wwe> {
  final _formkey=GlobalKey<FormState>();
TextEditingController a=TextEditingController();
TextEditingController b= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: _formkey,
        child:Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text("Sign in",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text("Stay updated on your professional world"),
                ],
              ),
            ),SizedBox(height: 15,),

            SizedBox(width: 350,
              child: TextFormField(controller: a,
                validator: (value){
                  if(value!.isEmpty||!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return "Please enter the correct mail ";
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email or Phone"
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(width: 350,
              child: TextFormField(controller: b,
                validator: (value){
                  if (value!.isEmpty||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                    return "Please enter correct pin";
                  }
                },

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  TextButton(onPressed: (){}, child: Text("Forget password",style: TextStyle(color: Colors.blue),)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: (){
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Processing data")));

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                    }
                  }, child: Text("             Login              ",style: TextStyle(color: Colors.white,fontSize: 10),)),
            ),
            Text("             or              "),
            ElevatedButton(onPressed: (){}, child: Text("Sign in with Apple"))
          ],
        ),
      ),
    );
  }
}
class lit extends StatefulWidget {
  const lit({super.key});

  @override
  State<lit> createState() => _litState();
}

class _litState extends State<lit> {
  bool a=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: 'assets/prime.gif',
           duration: 5000,
          nextScreen: log(),
          splashTransition: SplashTransition.fadeTransition,


        ),
      );

  }
}
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  late final TabController _controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 2,
          child: Scaffold(backgroundColor: Colors.black,
            appBar: AppBar(backgroundColor: Colors.black87,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton( style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                  onPressed: (){}, icon: Icon(Icons.person),color: Colors.white,),
              ),
              title: Column(
                children: [
                  Row(
                    children: [
                      Text("Anbuselvan",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Switch profiles",style: TextStyle(color: Color(0XFF848586),fontSize: 15),),
                    ],
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.cast,color: Color(0XFF999899),),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Color(0XFF999899),))
                ),
              ],
              bottom:  TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                 Tab(text: "Watchlist",),
                  Tab(text: "Purchase",)
                ],),
            ),
            body:
            Padding(
              padding: const EdgeInsets.only(left: 70,top: 300),
              child: Column(
                children: [
                  Text("Browse now,watch later",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Watchlist is shared acroos all of",style: TextStyle(color: Colors.grey),),
                  ),
                  Text("your devices.",style: TextStyle(color: Colors.grey),),

                ],
              ),
            ),

          ),
    )
    );
  }
}
class home extends StatefulWidget {
  const home({super.key});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List page=[
    netflix(),
    prime(),
    subscribe(),
    downloads(),
    find(),

  ];
  int Currentindex=0;
  void tap (index){
    setState(() {
      Currentindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[Currentindex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed ,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt_rounded,color: Colors.white,),label: 'Prime'),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_outlined,color: Colors.white,),label: 'Subscriptions'),
        BottomNavigationBarItem(icon: Icon(Icons.save_alt,color: Colors.white,),label: 'Downloads'),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: 'Search'),

      ],
      onTap: tap,
      currentIndex: Currentindex,


      ),
      
    );
  }
}

