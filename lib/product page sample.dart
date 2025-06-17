import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}
class _productState extends State<product> {
  List a =[
    "assets/img.png",
    "assets/img_1.png",
    "assets/img_2.png",
    "assets/img_3.png",
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
              gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.topRight,colors: [Color(0XFF90DBE3),Color(0XFFA1E2CC)])),
        ),
        leading: Icon(Icons.arrow_back),
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor:Colors.white ,
            hintText: "mobile under 20000",
            suffixIcon: Icon(Icons.mic),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          Icon(Icons.qr_code_scanner),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          height: 450.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 100),
                          onPageChanged: (index,reason){
                            setState(() {
                              cindex=index;
                            });

                          },
                          viewportFraction:1.5),
                      itemCount: a.length,
                      itemBuilder: (BuildContext Context,int index,int realindex){
                        return
                          Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          );
                      },),
                  ),
                  Positioned(
                    top: 10,
                    left:10,
                    child: Container(
                      height:50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:Color(0XFFCC0D39),
                      ),
                      child: Center(child: Text("18%off",style: TextStyle(fontSize: 15,color: Colors.white70),)),
                    ),
                  ),
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: [
                  DotsIndicator(dotsCount:a.length,
                      position: cindex,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.black87,)),
                  SizedBox(width: 110),
                  Icon(Icons.favorite_border),
                  Icon(Icons.share)
                ],
              ),
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Visit the Samsung Store", style: TextStyle(color: Color(0XFF358693),fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 60),
                RatingBar(filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  onRatingChanged:(value) => debugPrint('$value'),
                  initialRating: 3,
                  maxRating: 5,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Samsung Galaxy M35 (Moonlight Blue,6GB RAM,128 GB Storage)"
                  "|Corning Gorilla Glass Victus+|An Tu Tu Score 595k+|"
                  "Vapour Cooling Chamber|6000mAh Battery|120Hz Super AMOLED Display|Without Charger",style: TextStyle(fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(right:270),
              child: Container(
                height: 30,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFF232F3F),
                ),
                child: Center(
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Amazon's",style: TextStyle(color: Colors.white70,fontSize: 15)
                      ),
                      TextSpan(
                          text: "Choice",
                          style: TextStyle(color: Color(0XFFB17838),fontSize: 15)
                      ),
                    ],
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("3K+ bought in pase month",style: TextStyle(fontSize: 15,),),
            ),
            Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0XFFCC0D39),
                          ),
                          child: Center(child: Text("Limited time deal",style: TextStyle(color: Colors.white70,fontSize: 17),),),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                          text: "₹2,222",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text: "/month (9 months)",style: TextStyle(fontSize: 20,)
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: RichText(text: TextSpan(children: [
                    TextSpan(
                        text: "with ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: "No Cost EMI",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text:" on your Amazon Pay Later",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text("All EMI Plans",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0XFF046F83)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "-18%",style: TextStyle(fontSize: 20,color: Colors.red),
                      ),
                      TextSpan(
                          text: "₹19,998",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                      ),
                    ],
                  )),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 270),
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                            text:"M.R.P.:",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                            text: "₹24,499",style: TextStyle(fontSize: 20,color:Colors.grey,decoration: TextDecoration.lineThrough,decorationColor: Colors.grey,fontWeight:FontWeight.bold)),],
                    ))),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: RichText(text: TextSpan(children: [
                    TextSpan(
                      text:"✔️",style: TextStyle(fontSize: 20,color: Color(0XFFF9A113)),
                    ),
                    TextSpan(
                        text: "prime",style: TextStyle(fontSize: 20,color: Color(0XFF25A0FB),fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: "One-Day",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 245),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Inclusive of all taxes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ],
                  )),
                ),
                RichText(text: TextSpan(children: [
                  TextSpan(
                    text: "Pay",style: TextStyle(fontSize: 20,color: Color(0XFF358693)),
                  ),
                  TextSpan(
                    text: "₹19,998",style: TextStyle(fontSize: 20,color: Colors.grey,decoration: TextDecoration.lineThrough,decorationColor: Colors.grey),
                  ),
                  TextSpan(
                      text: "₹19,973",style: TextStyle(fontSize: 20,color: Color(0XFFB22909),fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text:" on this item using Amazon Pay Balance. ",style: TextStyle(fontSize: 20,color:Color(0XFF358693) )
                  ),
                  TextSpan(
                    text: "Add ₹500 to avail offer.",style: TextStyle(fontSize: 20,color:Color(0XFF358693),fontWeight: FontWeight.bold),
                  ),
                ],)),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: RichText(text: TextSpan(children: [
                    TextSpan(
                      text: "Total: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: "₹19,998",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                  ],)),
                ),
                SizedBox(height: 20),
                RichText(text: TextSpan(children: [
                  TextSpan(
                      text: "FREE delivery",style: TextStyle(fontSize: 20)
                  ),
                  TextSpan(
                    text: " Tomorrow, 11 September. ",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Order within ",style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: "12 hrs 12 mins",style: TextStyle(fontSize: 20,color: Color(0XFF4B9B4B)),
                  ),
                  TextSpan(
                    text: ". ",style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                      text: "Details",style: TextStyle(fontSize: 20,color:Color(0XFF358693) )
                  ),
                ],)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(" Delivery to divahar - Perambalur 621104",style: TextStyle(fontSize: 18,color:Color(0XFF358693) )),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 330),
                  child: Text("In stock",style: TextStyle(fontSize: 20,color: Color(0XFF017401),fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
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
                ),
                SizedBox(height: 50,width: 350,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFED813),),
                      onPressed: (){}, child: Text("Add to Cart",style: TextStyle(fontSize: 20,color: Colors.black87),)),
                ),
                SizedBox(height: 10),
                SizedBox(height: 50,width: 350,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFFFA51D),
                      ),onPressed: (){}, child: Text("Bye Now",style: TextStyle(fontSize: 20,color: Colors.black87),)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}