import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ott%20login%20page.dart';
class netflix extends StatefulWidget {
  const netflix({super.key});

  @override
  State<netflix> createState() => _netflixState();
}

class _netflixState extends State<netflix> {
  List a=[
    "assets/img_13.png",
    "assets/img_14.png",
    "assets/img_15.png",
    "assets/img_16.png",
    "assets/img_17.png",
    "assets/img_18.png",
    "assets/img_19.png",
    "assets/img_20.png",
  ];
  List b=[
    "Tamil",
    "English",
    "Malayalam",
    "Telugu",
    "Kannada",
    "Hindi",
    "Marathi",
    "Punjabi",
  ];
  List c=[
  ];
  int cindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(image: AssetImage("assets/img_12.png"))
            ),
          ),
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.cast,color: Colors.white,),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
                }, icon: Icon(Icons.person,color: Color(0XFFBFDBE5),)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Row(
              children: [
                Container(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){}, child: Text("Movie",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>subscribe()));
                      }, child: Text("TV shows",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>prime()));
                      }, child: Text("Live TV",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: CarouselSlider.builder(options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 300),
                onPageChanged: (index, reason){
                  setState(() {
                    cindex=index;
                  });
                },
                viewportFraction: 1,
              ),
                itemCount: a.length,
                itemBuilder: (BuildContext context ,int index ,int realIndex){
                  return Container(
                    height: 300,
                    width: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text("Watch for FREE-Most popular shows >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                          Text("Nantha"),
                        ],
                      ),
                    );
                  }),
            ),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Watch in you Language",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(color: Colors.black87,
                        child: Column(
                          children: [
                          Container(
                          height: 90,
                          width: 230,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.only(right: 190,bottom: 11),
                              child: Text(b[index],style: TextStyle(color: Colors.white),),
                            ),

                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text("Stories from the heartland >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Featured previews",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ), SizedBox(height: 10,),
             Stack(

               children: [
                 SizedBox(height: 10,),
                 Container(
                   child: CarouselSlider.builder(options: CarouselOptions(
                     scrollDirection: Axis.horizontal,
                     height: 250,
                     enlargeCenterPage: true,
                     autoPlay: false,
                     aspectRatio: 16/9,
                     autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                     enableInfiniteScroll: true,
                     autoPlayAnimationDuration: Duration(milliseconds: 300),
                     onPageChanged: (index, reason){
                       setState(() {
                         cindex=index;
                       });
                     },
                     viewportFraction: 1,
                   ),
                     itemCount: a.length,
                     itemBuilder: (BuildContext context ,int index ,int realIndex){
                       return Container(
                         height: 300,
                         width: 450,
                         decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                         ),
                       );
                     },
                   ),
                 ),
                     Positioned(
                       top: 150,
                         left:  100,
                         child:
                         Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.plus,color: Colors.white,size:25,)),
                                   Text("Watchlist",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.info,color: Colors.white,size: 25,)),
                                   Text("Details",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                                 ],
                               ),
                             )
                           ],
                         ),

                     ),
               ],
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }
}

class prime extends StatefulWidget {
  const prime({super.key});

  @override
  _primeState createState() => _primeState();
}

class _primeState extends State<prime> {
  List a=[
    "assets/img_31.png",
    "assets/img_32.png",
    "assets/img_33.png",
    "assets/img_34.png",
    "assets/img_35.png",
    "assets/img_36.png",
    "assets/img_37.png",
    "assets/img_38.png",
  ];
  List b=[
    "Tamil",
    "English",
    "Malayalam",
    "Telugu",
    "Kannada",
    "Hindi",
    "Marathi",
    "Punjabi",
  ];
  List c=[
  ];
  int cindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: AssetImage("assets/img_12.png"))
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.cast,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                onPressed: (){}, icon: Icon(Icons.person,color: Color(0XFFBFDBE5),)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Row(
              children: [
                Container(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){}, child: Text("Movie",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                      onPressed: (){}, child: Text("TV shows",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: CarouselSlider.builder(options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 300),
                onPageChanged: (index, reason){
                  setState(() {
                    cindex=index;
                  });
                },
                viewportFraction: 1,
              ),
                itemCount: a.length,
                itemBuilder: (BuildContext context ,int index ,int realIndex){
                  return Container(
                    height: 300,
                    width: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text("Watch for FREE-Most popular shows >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                          Text("Nantha"),
                        ],
                      ),
                    );
                  }),
            ),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Watch in you Language",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(color: Colors.black87,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 230,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 190,bottom: 11),
                              child: Text(b[index],style: TextStyle(color: Colors.white),),
                            ),

                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text("Stories from the heartland >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Featured previews",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ), SizedBox(height: 10,),
            Stack(

              children: [
                SizedBox(height: 10,),
                Container(
                  child: CarouselSlider.builder(options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    onPageChanged: (index, reason){
                      setState(() {
                        cindex=index;
                      });
                    },
                    viewportFraction: 1,
                  ),
                    itemCount: a.length,
                    itemBuilder: (BuildContext context ,int index ,int realIndex){
                      return Container(
                        height: 300,
                        width: 450,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 150,
                  left:  100,
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.plus,color: Colors.white,size:25,)),
                            Text("Watchlist",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.info,color: Colors.white,size: 25,)),
                            Text("Details",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class subscribe extends StatefulWidget {
  const subscribe({super.key});

  @override
  _subscribeState createState() => _subscribeState();
}

class _subscribeState extends State<subscribe> {
  List a=[
    "assets/img_23.png",
    "assets/img_24.png",
    "assets/img_26.png",
    "assets/img_25.png",
    "assets/img_27.png",
    "assets/img_28.png",
    "assets/img_29.png",
    "assets/img_30.png",
  ];
  List b=[
    "Tamil",
    "English",
    "Malayalam",
    "Telugu",
    "Kannada",
    "Hindi",
    "Marathi",
    "Punjabi",
  ];
  List c=[
  ];
  int cindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black87,
        title: Text("Subscriptions",style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.cast,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                onPressed: (){}, icon: Icon(Icons.person,color: Color(0XFFBFDBE5),)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Anime Times: Popular Anime now at ",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("₹39/month  ≻",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),

            SizedBox(height: 10,),
            Container(
              child: CarouselSlider.builder(options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 300),
                onPageChanged: (index, reason){
                  setState(() {
                    cindex=index;
                  });
                },
                viewportFraction: 1,
              ),
                itemCount: a.length,
                itemBuilder: (BuildContext context ,int index ,int realIndex){
                  return Container(
                    height: 300,
                    width: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text("Watch for FREE-Most popular shows >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                          Text("Nantha"),
                        ],
                      ),
                    );
                  }),
            ),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Watch in you Language",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(color: Colors.black87,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 230,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 190,bottom: 11),
                              child: Text(b[index],style: TextStyle(color: Colors.white),),
                            ),

                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text("Stories from the heartland >",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 10,),
            Container(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(color: Colors.black87,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 155),
              child: Text("Featured previews",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            ), SizedBox(height: 10,),
            Stack(

              children: [
                SizedBox(height: 10,),
                Container(
                  child: CarouselSlider.builder(options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    onPageChanged: (index, reason){
                      setState(() {
                        cindex=index;
                      });
                    },
                    viewportFraction: 1,
                  ),
                    itemCount: a.length,
                    itemBuilder: (BuildContext context ,int index ,int realIndex){
                      return Container(
                        height: 300,
                        width: 450,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 150,
                  left:  100,
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.plus,color: Colors.white,size:25,)),
                            Text("Watchlist",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.info,color: Colors.white,size: 25,)),
                            Text("Details",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(dotsCount: a.length,
                position: cindex,
                decorator: DotsDecorator(
                    color: Color(0XFF98A5A7),
                    activeColor: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class downloads extends StatefulWidget {
  const downloads({super.key});

  @override
  _downloadsState createState() => _downloadsState();
}

class _downloadsState extends State<downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text("Downloads",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.cast,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                onPressed: (){}, icon: Icon(Icons.person,color: Color(0XFFBFDBE5),)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 280,bottom: 15),
            child: Text("No videos downloaded",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0XFF33363D)),

                onPressed: (){}, child: Text("Find videos to downloaded",style: TextStyle(color: Colors.white,fontSize: 10,),)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Row(
              children: [
                Text("Auto Downloads: On . ",style: TextStyle(color: Colors.white,),),
                TextButton(onPressed: (){}, child: Text("Manage",style: TextStyle(color: Colors.blue),))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class find extends StatefulWidget {
  const find({super.key});

  @override
  _findState createState() => _findState();
}

class _findState extends State<find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text("Search",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.cast,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                style: IconButton.styleFrom(backgroundColor: Color(0XFF1A7AA1)),
                onPressed: (){}, icon: Icon(Icons.person,color: Color(0XFFBFDBE5),)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search by actor,title..",
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
            ),SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Genres",style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
            ),SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(
                          onPressed: (){}, child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Action and adventure",style: TextStyle(color: Colors.white,fontSize: 10,),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(
                          onPressed: (){}, child: Text("Anime",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Documentary",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Comedy",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Drama",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Fantasy",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Horror",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Kids",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(),color: Color(0XFF33363D),
                      ),
                      child: TextButton(

                          onPressed: (){}, child: Text("Science ficition",style: TextStyle(color: Colors.white,fontSize: 10,),)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            OutlinedButton(style: OutlinedButton.styleFrom(backgroundColor: Color(0XFF33363D)),
              child: const Text("See more",style: TextStyle(color: Colors.white),),
              onPressed: () => print("Pressed button0"),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Featured collections",style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
            ),

            Container(
              height: 300,
              child: ListView(
                children:<Widget> [
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Hindi",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("English",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Tamil",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Telugu",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Malayalam",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ), Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Kannada",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Punjabi",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Gujarati",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Text("Bengali",style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(style: OutlinedButton.styleFrom(backgroundColor: Color(0XFF33363D)),
              autofocus: true,
              child: const Text("See more",style: TextStyle(color: Colors.white),),
              onPressed: () => print("Pressed button"),
            ),


          ],
        ),
      ),

    );
  }
}

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
