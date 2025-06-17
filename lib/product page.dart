import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:like_button/like_button.dart';
class amzo extends StatefulWidget {
  const amzo({super.key});

  @override
  State<amzo> createState() => _amzoState();
}

class _amzoState extends State<amzo> {
  List a=[
    "assets/img_3.png",
    "assets/img_4.png",
    "assets/img_5.png",
    "assets/img_6.png",
    "assets/img_7.png",
    "assets/img_8.png",
  ];
  var chosenvalue;
  List<String>numberlists=[
    "1","2","3","4","5"
  ];
  int cindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.lightBlueAccent.shade100,Colors.lightBlue.shade100])
          ),
        ),
        leading: Icon(Icons.arrow_back),
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            hintText: "apple 15 mobile",
            suffixIcon: Icon(Icons.mic),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code_scanner),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: CarouselSlider.builder(options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      height: 400.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16/9,
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 400),
                      onPageChanged: (index,reason){
                        setState(() {
                          cindex=index;
                        });

                      },
                      viewportFraction: 1,
                    ),
                        itemCount:a.length ,
                        itemBuilder: (BuildContext context,int index,int realIndex){
                          return Container(
                            height: 700,
                            width: 400,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Color(0XFFCC0D39)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,left: 9),
                    child: Text("13% 0ff",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),
                ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: DotsIndicator(dotsCount: a.length,
                  position: cindex,
                  decorator: DotsDecorator(
                    color: Colors.blue,
                    activeColor: Colors.black,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: LikeButton()
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.share),
                ),
              ],
            ),
            Row(
              children: [
                Text("-13%",style: TextStyle(color: Colors.red,fontSize: 40),),
                SizedBox(width: 5,),
                Text("₹"),
                Text("69,900",style: TextStyle(fontSize: 40),)
              ],
            ),
            Row(
              children: [SizedBox(height: 30,),
                RichText(text: TextSpan(children: [
                  TextSpan(text: "EMI ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  TextSpan(text: "from ₹3,389.No Cost EMI available.",style: TextStyle(color: Colors.black)),
                  TextSpan(text: "EMI options",style: TextStyle(color: Colors.lightBlueAccent))
                ])),
              ],
            ),
            Row(
              children: [SizedBox(height: 20,),
                Text("Inclusive of all taxes"),
              ],
            ),
            Row(
              children: [SizedBox(height: 30,),
                RichText(text: TextSpan(children: [
                  TextSpan(text: "Total:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  TextSpan(text: "₹69,900",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
                ])),
              ],
            ),
            Row(
              children: [SizedBox(height: 50,),
                RichText(text: TextSpan(children: [
                  TextSpan(text: "FREE delivery ",style: TextStyle(color: Colors.lightBlueAccent)),
                  TextSpan(text: "Tomorrow,14 September.",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold)),
                  TextSpan(text: "Details",style: TextStyle(color: Colors.lightBlueAccent))
                ])),

              ],
            ),
            Row(
              children: [SizedBox(height: 20,),
                Icon(Icons.location_on_outlined),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text("Delivery to Coimbatore 641004",style: TextStyle(color: Colors.lightBlueAccent),),
                ),

              ],
            ),
            Row(
              children: [SizedBox(height: 30,),
                Text("In stock",style: TextStyle(color: Colors.greenAccent,fontSize: 15),),
              ],
            ),
            Row(
              children: [
                Text("Qty: ",style: TextStyle(fontSize: 20),),
                DropdownButton<String>(
                  value:chosenvalue,
                  items: numberlists.map((String value)
                  {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),);
                  }
                  ).toList(),
                  onChanged: (String?newvalue){
                    setState(() {
                      chosenvalue=newvalue;
                    });
                  },
                ),
              ],
            ),


            SizedBox(height: 30,width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFED813),
                  ),
                  onPressed: (){}, child: Text("Add to Cart")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: 30,
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0XFFFFA41D)),
                    onPressed: (){}, child: Text("Buy Now")),
              ),
            ),
            Row(children: [SizedBox(height: 30,),
              Text("Payment"),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Secure transaction",style: TextStyle(color: Colors.lightBlueAccent),),
              )
            ],),
            Row(children: [SizedBox(height: 30,),
              Text("Ships from"),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text("Secure transaction"),
              )
            ],),
            Row(children: [SizedBox(height: 30,),
              Text("Sold by"),
              Padding(
                padding: const EdgeInsets.only(left: 42),
                child: Text("Clicktech Retail private Ltd"),
              )
            ],),
            Row(
              children: [SizedBox(height: 30,),
                Text("Details",style: TextStyle(color: Colors.lightBlueAccent),),
              ],
            ),
            Row(
              children: [SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text("Gift-wrap available.",style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            Row(
              children: [SizedBox(height: 50,),
                Text("Add to Wish List",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15),),
              ],
            ),

          ]
        ),
      ),
    );
  }
}
