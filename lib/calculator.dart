import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  String num1="";
  String num2="";
  String opr="";
  bool clk=false;
TextEditingController nan=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black87,
      appBar:AppBar(backgroundColor: Colors.black12,
        leading: Icon(CupertinoIcons.arrow_down_right_arrow_up_left,color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.calculate_outlined,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.square_grid_2x2,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert,color: Colors.white,),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: TextFormField(controller: nan,
              cursorColor: Colors.red,style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      nan.text="";
                      num1="";
                      num2="";
                      opr="";
                      clk=false;
                    });
                  }, child: Text("AC",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      opr="%";
                      nan.text+="%";
                      clk=true;
                    });
                  }, child: Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      print(num1);
                      if (num1 != null && num1.length > 0) {
                        num1 = num1.substring(0, num1.length - 1);
                        print(num1);
                      }
                      nan.text=num1;
                    });
                  }, child:Icon(Icons.backspace,color:Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      opr="÷";
                      nan.text+="÷";
                      clk=true;
                    });
                  }, child: Text("÷",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    if(clk){
                      num2+="7";
                      nan.text=num2;
                    }
                    else{
                      num1+="7";
                      nan.text=num1;
                    }
                  }, child: Text("7",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                   if(clk){
                     num2+="8";
                     nan.text=num2;
                   }
                   else{
                     num1+="8";
                     nan.text=num1;
                   }
                  }, child: Text("8",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                   if (clk){
                     num2+="9";
                     nan.text=num2;
                   }
                   else{
                     num1+="9";
                     nan.text=num1;
                   }
                  }, child: Text("9",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      opr="*";
                      nan.text+="×";
                      clk=true;
                    });
                  }, child: Text("⨯",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    if(clk){
                      num2+="4";
                      nan.text=num2;
                    }
                    else{
                      num1+="4";
                      nan.text=num1;
                    }
                  }, child: Text("4",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                   if(clk){
                     num2+="5";
                     nan.text=num2;
                   }
                   else{
                     num1+="5";
                     nan.text=num1;
                   }
                  }, child: Text("5",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    if(clk) {
                      num2+="6";
                      nan.text=num2;
                    }
                    else{
                      num1+="6";
                      nan.text=num1;
                    }
                  }, child: Text("6",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {
                      opr="-";
                      nan.text="-";
                      clk=true;
                    });
                  }, child: Text("–",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),

                  ),
                  child: TextButton(onPressed: (){
                   if(clk) {
                     num2+="1";
                      nan.text=num2;
                    }
                   else{
                     num1+="1";
                     nan.text=num1;
                   }
                  }, child: Text("1",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                 if(clk) {
                   num2+="2";
                      nan.text=num2;
                    }
                 else{
                   num1+="2";
                   nan.text=num1;
                 }
                  }, child: Text("2",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                  if(clk) {
                    num2+="3";
                      nan.text=num2;
                    }
                  else{
                    num1+="3";
                    nan.text=num1;
                  }
                  }, child: Text("3",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                   setState(() {
                     opr="+";
                     nan.text="+";
                     clk=true;
                   });
                  }, child: Text("+",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    int a=int.parse(num1);
                    if(a.isNegative){
                      a=a.abs();
                      nan.text=a.toString();
                    }
                    else{
                      a=a*-1;
                      nan.text=a.toString();
                    }

                  }, child: Text("+/-",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){
                    if(clk) {
                      num2+="0";
                      nan.text="0";
                    }
                    else{
                      num1+="0";
                      nan.text="0";
                    }
                  }, child: Center(child: Text("0",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFF2E2E2E),
                  ),
                  child: TextButton(onPressed: (){

                  }, child: Text(".",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 23),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0XFFED6825),

                  ),
                  child: TextButton(onPressed: (){
                    double a=double.parse(num1);
                    double b=double.parse(num2);
                    double c=0;
                    if(opr=="+"){
                      c=a+b;

                    }
                    else if(opr=="-"){
                      c=a-b;
                    }
                    else if(opr=="*"){
                      c=a*b;
                    }
                    else if(opr=="%"){
                      c=a%b;
                    }
                    else if(opr=="/"){
                      c=a/b;
                    }
                    nan.text=c.toString();
                    num1=nan.text;
                    num2="";
                  }, child: Text("=",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
