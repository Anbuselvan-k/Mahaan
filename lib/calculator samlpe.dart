import 'dart:math';

import 'package:flutter/material.dart';

class calc extends StatefulWidget {
  const calc({super.key});

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  TextEditingController a = TextEditingController();
  String num1="";
  String num2="";
  String opr="";
  bool clk=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          SizedBox(width: 330,
            child: TextFormField(
              controller: a,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        setState(() {
                          num1="";
                          num2="";
                          clk=false;
                          opr="";
                          a.text="";
                        });
                      }, child: Text("AC",style: TextStyle(fontSize:15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        opr="%";
                        a.text="%";
                        clk=true;
                      }, child: Text("%",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        setState(() {
                          if (num1.isNotEmpty) {
                            num1 = num1.substring(0,num1.length-1);
                          }
                          a.text=num1;
                        });
                      }, child: Icon(Icons.backspace,color:Colors.white)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: (){
                          opr="/";
                          a.text="/";
                          clk=true;
                        }, child: Text("/",style: TextStyle(fontSize: 15,color: Colors.white),))
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="7";
                          a.text=num2;
                        }
                        else{
                          num1+="7";
                          a.text=num1;
                        }
                      }, child: Text("7",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="8";
                          a.text=num2;
                        }
                        else{
                          num1+="8";
                          a.text=num1;
                        }
                      }, child: Text("8",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="9";
                          a.text=num2;
                        }
                        else{
                          num1+="9";
                          a.text=num1;
                        }
                      }, child: Text("9",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        opr="*";
                        a.text="*";
                        clk=true;
                      }, child: Text("*",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk==true){
                          num2+="4";
                          a.text=num2;
                        }
                        else{
                          num1+="4";
                          a.text=num1;
                        }
                      }, child: Text("4",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk==true){
                          num2+="5";
                          a.text=num2;
                        }
                        else{
                          num1+="5";
                          a.text=num1;
                        }
                      }, child: Text("5",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk==true){
                          num2+="6";
                          a.text=num2;
                        }
                        else{
                          num1+="6";
                          a.text=num1;
                        }
                      }, child: Text("6",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        opr="-";
                        a.text="-";
                        clk=true;
                      }, child: Text("-",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="1";
                          a.text=num2;
                        }
                        else{
                          num1+="1";
                          a.text=num1;
                        }
                      }, child: Text("1",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="2";
                          a.text=num2;
                        }
                        else{
                          num1+="2";
                          a.text=num1;
                        }
                      }, child: Text("2",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="3";
                          a.text=num2;
                        }
                        else{
                          num1+="3";
                          a.text=num1;
                        }
                      }, child: Text("3",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        opr="+";
                        a.text="+";
                        clk=true;
                      }, child: Text("+",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        double plus=double.parse(num1);
                        double value=0;
                        if (plus.isNegative) {
                          value=plus.abs();
                        }
                        else{
                          value=plus*-1;
                        }
                        num1=value.toString();
                        a.text=num1;

                      }, child: Text("+/-",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2+="0";
                          a.text=num2;
                        }
                        else{
                          num1+="0";
                          a.text=num1;
                        }
                      }, child: Text("0",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        if(clk){
                          num2=".";
                          a.text=num2;
                        }
                        else{
                          num1=".";
                          a.text=num1;
                        }
                      }, child: Text(".",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height: 60,width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFF08221),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: (){
                        double x=double.parse(num1);
                        double y=double.parse(num2);
                        double? z=0;
                        if(opr=="+"){
                          z=x+y;
                        }
                        else if(opr=="-"){
                          z=x-y;
                        }
                        else if(opr=="*"){
                          z=x*y;
                        }
                        else if(opr=="/"){
                          z=x/y;
                        }
                        else if(opr=="^"){
                          z=pow(x,y) as double?;
                        }
                        num1=z.toString();
                        a.text=num1;
                        num2="";
                      }, child: Text("=",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(height:60,width:60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        opr="^";
                        a.text="^";
                        clk=true;
                      }, child: Text("^",style: TextStyle(fontSize: 15,color: Colors.white),)),
                ),
                SizedBox(width: 20),
                SizedBox(height:60,width:60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        double x = double.parse(num1);
                        double value = sqrt(x);
                        a.text = value.toString();
                        num1 = a.text;
                      }, child: Text("√",style: TextStyle(fontSize: 15,color: Colors.white),)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}