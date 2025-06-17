import 'package:flutter/material.dart';
class emailauth extends StatefulWidget {
  const emailauth({super.key});

  @override
  State<emailauth> createState() => _emailauthState();
}

class _emailauthState extends State<emailauth> {
  final _formkey=GlobalKey<FormState>();
  bool textVisible=true;
  bool textconfirm=true;
  TextEditingController username=TextEditingController();
  TextEditingController mobilenumber=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
        }, icon: Icon(Icons.arrow_back,color: Colors.orange,)),
      ),
       body: Form(key: _formkey,
         child: ListView(
           children: [
             Container(
               height: 250,
               width: 100,
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage("assets/img_44.png"),fit: BoxFit.fill)
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 validator: (username){
                   if(username!.isEmpty||!RegExp(r'[a-zA-Z]').hasMatch(username)){
                     return "enter your name";
                   }
                 },
                 controller: username,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                   ),
                   prefixIcon: Icon(Icons.person),
                   hintText: "Enter Username",
                   labelText: "Username",
                   labelStyle: TextStyle(color: Colors.orange)
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 validator: (mobilenumber){
                   if(mobilenumber!.isEmpty||!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(mobilenumber)){
                     return "please enter your mobille number";
                   }
                 },
                 controller: mobilenumber,
                 maxLength: 10,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                     ),
                     prefixIcon: Icon(Icons.phone_android_sharp),
                     hintText: "Enter Mobile number",
                     labelText: "Mobile number",
                   labelStyle: TextStyle(color: Colors.orange)
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 validator: (password){
                   if(password!.isEmpty||!RegExp(r'^(?=.*?[0-9]).{6,}$').hasMatch(password)){
                     return"Enter your 6 digit password";
                   }
                 },
                 controller: password,
                 obscureText: textVisible,
                 maxLength: 6,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20)
                     ),
                     prefixIcon: Icon(Icons.password),
                     hintText: "Enter Password",
                     labelText: "Password",
                   labelStyle: TextStyle(color: Colors.orange),
                   suffixIcon: IconButton(onPressed: (){
                     setState(() {
                       textVisible=!textVisible;
                     });
                   }, icon:textVisible? Icon(Icons.visibility_off):
                   Icon(Icons.visibility)
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 validator: (confirmpassword){
                   if(confirmpassword!.isEmpty||!RegExp(r'^(?=.*?[0-9]).{6,}$').hasMatch(confirmpassword)){
                     return"Enter your confirm password";
                   }
                 },
                 controller: confirmpassword,
                 obscureText: textconfirm,
                 maxLength: 6,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20)
                     ),
                     prefixIcon: Icon(Icons.password),
                     hintText: "Enter Password",
                     labelText: " Confirm Password",
                   labelStyle: TextStyle(color: Colors.orange),
                   suffixIcon:IconButton(onPressed: (){
                     setState(() {
                       textconfirm=!textconfirm;
                     });
                   }, icon:textconfirm?Icon(Icons.visibility_off):
                       Icon(Icons.visibility)
                   )
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                   onPressed: (){
                 if(_formkey.currentState!.validate()){
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Processing data")));
                 }

                   }, child: Text("Sign Up",style: TextStyle(fontSize: 20),)),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Already having account?",style: TextStyle(color: Colors.blue)),
                 TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
                 }, child: Text("Sign In",style: TextStyle(color: Colors.orange),))
               ],
             )
           ],
         ),
       ),
    );
  }
}

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _formkey=GlobalKey<FormState>();
  bool textVisible=true;
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: _formkey,
        child: ListView(
          children: [
          Container(
          height: 250,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img_45.png"),fit: BoxFit.fill)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Sign In",style: TextStyle(fontSize: 25),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (username){
              if(username!.isEmpty||!RegExp(r'[a-zA-Z]').hasMatch(username)){
                return "Please enter your name";
              }
            },
            controller: username,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),

                enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),

                prefixIcon: Icon(Icons.person),
                hintText: "Enter Email",
                labelText: "Email",
              labelStyle: TextStyle(color: Colors.orange)

            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (password){
                  if(password!.isEmpty||!RegExp(r'^(?=.*?[0-9]).{6,}$').hasMatch(password)){
                    return"Please enter correct Password";
                  }
                },
                controller: password,
                obscureText: textVisible,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey)
                  ),border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),

                  prefixIcon: Icon(Icons.password),
                  hintText: "Enter Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.orange),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      textVisible=!textVisible;
                    });
                  },
                      icon: textVisible ?Icon(Icons.visibility):
                          Icon(Icons.visibility_off)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Processing data")));
                    }
                  }, child: Text("Login",style: TextStyle(fontSize: 15),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpassword()));

                  }, child: Text("Forgot Password ?",style: TextStyle(color: Colors.blueAccent,fontSize: 15),)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: Text("New User?",style: TextStyle(fontWeight: FontWeight.bold),)),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>emailauth()));
                }, child: Text("SignUp Now",style: TextStyle(color: Colors.orange),))
              ],
            )
            ]
            ),
      ),
    );
  }
}

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  final _formkey=GlobalKey<FormState>();
  TextEditingController username=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
        }, icon: Icon(Icons.arrow_back,color: Colors.orange,)),
      ),
      body: Form(key: _formkey,
        child: ListView(
          children: [
            SizedBox(height: 150,),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/img_46.png"),fit: BoxFit.fill),
              )
            ),SizedBox(height: 5,),
            Text("Receive en email to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                validator: (username){
                  if(username!.isEmpty||!RegExp(r'[a-zA-Z]').hasMatch(username)){
                    return "Please enter your name";
                  }
                },
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: "Enter your username",
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.orange),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: (){
                if(_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Processing data")));
                }
              }, child: Text("Forgot password",style: TextStyle(fontSize: 15),)),
            ),
          ],
        ),
      ),

    );
  }
}
