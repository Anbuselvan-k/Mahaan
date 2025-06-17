import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class sad extends StatefulWidget {
  const sad({super.key});

  @override
  State<sad> createState() => _sadState();
}

class _sadState extends State<sad> {
  List a=[
    "assets/shelby.jpg",
    "assets/img_1.png",
    "assets/img_2.png",
    "assets/tommy.jpg",
    "assets/img.png",
    "assets/sample.jpg",
    "assets/abc.jpg",
    "assets/as.jpg",
  ];
  List b=[
    "assets/sample.jpg",
    "assets/abc.jpg",
    "assets/as.jpg",
    "assets/tommy.jpg",
    "assets/img.png",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[Colors.lightBlueAccent, Colors.greenAccent]),
        ),
      ),
        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            hintText: "search or ask a question",
            suffixIcon: Icon(Icons.mic),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code_scanner),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
              color: Colors.lightGreenAccent.shade100,
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("Deliver to coimbatore"),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: b.length,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(image: AssetImage(b[index]),fit: BoxFit.fill)
        
                            ),
                          ),
                        ),
                        Text("Shelby Family")
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height:150 ,
                  child: CarouselSlider.builder( options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    height: 180.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    viewportFraction: 1,
                  ),itemCount: a.length,
                    itemBuilder: (BuildContext context, int index, int realIndex){
                      return Container(
                        height: 100,
                        width: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                        ),
                      );
                    },
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: b.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              width:150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(b[index]),fit: BoxFit.fill)
                              ),
                            ),
                            Text("hi")
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(),
              child: GridView.builder(
                  itemCount: a.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(a[index])),
                          ),
                        ),
                        Text("Thomas Shelby")
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
