import 'package:flutter/material.dart';
class weight extends StatefulWidget {
  const weight({super.key});

  @override
  State<weight> createState() => _weightState();
}

class _weightState extends State<weight> {
   TextEditingController c = TextEditingController();
   TextEditingController b = TextEditingController();
  double _result=0;
  Color a=Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: c,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Height",
                prefixIcon: Icon(Icons.trending_up)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller:b,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Weight",
                prefixIcon: Icon(Icons.line_weight)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: BMI, child: Text("Calculate")),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: a,
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Center(
              child: Text(_result== null ? "Enter Value":"${_result.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFFF5D45D),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Underweight",style: TextStyle(fontSize: 15),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFF5BB168),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Normal",style: TextStyle(fontSize: 15),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFF6CBFE7),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Overweight",style: TextStyle(fontSize: 15),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFFF5A84C),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Obese 1",style: TextStyle(fontSize: 15),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFFF5905F),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Obese 2",style: TextStyle(fontSize: 15),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFFD84F56),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    ),
                    Text("Extreme",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void BMI(){
    double height =double.parse(c.text)/100;
    double weight=double.parse(b.text);
    double heightsquare=height * height;
    double result=weight/heightsquare;
    _result=result;
    setState(() {
      if(_result<=17){
         a=Color(0XFFF5D45D);
         Text;"Under Weight";
      }
      else if (_result>=18 && _result<=24){
        a=Color(0XFF5BB168);
        Text;"Normal Weight";
      }
      else if (_result>=25 && _result<=29){
       a= Color(0XFF6CBFE7);
        Text;"Over weight";
      }
      else if (_result>=30 && _result<=34){
       a= Color(0XFFF5A84C);
        Text;"Obese Type 1";
      }
      else if (_result>=35 && _result<=39){
        a=Color(0XFFF5905F);
        Text;"Obese Type 2";
      }  else if (_result>=40){
        a=Color(0XFFD84F56);
        Text;"Extreme";
      }

    });
  }
}
