import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class listview extends StatefulWidget {
  const listview({super.key});

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  List a=[
    "assets/shelby.jpg",
    "assets/tommy.jpg",
    "assets/img.png",
    "assets/img_1.png",
    "assets/img_2.png",
    "assets/as.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: CarouselSlider.builder(

                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  height: 180.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 16/ 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ), itemCount: a.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                    ),
                  );
                }, ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: a.length,
                    itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                            ),
                          ),
                          Text("hi")
                        ],
                      );
                    }),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              child: GridView.builder(
                  itemCount: a.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(a[index]))
                          ),
                        ),
                        Text("data")
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