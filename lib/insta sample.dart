import 'package:flutter/material.dart';

class insta extends StatefulWidget {
  const insta({super.key});

  @override
  State<insta> createState() => _instaState();
}

class _instaState extends State<insta> {
  List a =[
    "assets/abc.jpg",
    "assets/abc.jpg",
    "assets/abc.jpg",
    "assets/abc.jpg",
    "assets/abc.jpg",
    "assets/abc.jpg",


  ];
  List b =[
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
    "assets/sample.jpg",
  ];
  List c = [
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",
    "assets/as.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Team_Busted_"),
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.more_vert_outlined)
        ],
      ),
      body: DefaultTabController(length: 3,
        child: NestedScrollView(headerSliverBuilder:(BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 570,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/as.jpg"),fit: BoxFit.fill)
                            ),
                          ),
                          SizedBox(width:60),
                          Column(
                            children: [
                              Text("175",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                              Text("posts",style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          SizedBox(width: 25),
                          Column(
                            children: [
                              Text("2858",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                              Text("followers",style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          SizedBox(width: 25),
                          Column(
                            children: [
                              Text("46",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                              Text("following",style: TextStyle(fontSize: 18),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("Team Busted Riders Club",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    Text("Sports team",style: TextStyle(fontSize: 20,color: Colors.blueAccent)),
                    Text("Establised - 2013",style: TextStyle(fontSize: 20)),
                    RichText(text: TextSpan(children: [
                      TextSpan(
                        text: "We ride to explore",style: TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                          text: "🏍️️",style: TextStyle(fontSize:20,color: Colors.red)
                      ),
                    ],)),
                    Text("150cc and Above Multi branded Bike Club",style: TextStyle(fontSize: 20)),
                    Text("All riders are welcome to join",style: TextStyle(fontSize: 20)),
                    RichText(text: TextSpan(children: [
                      TextSpan(
                        text: "Coimbatore Swag",style: TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                          text: "❤️",style: TextStyle(fontSize:20,color: Colors.red)
                      ),
                    ],)),
                    RichText(text: TextSpan(children: [
                      TextSpan(
                        text: "Dm for joining",style: TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                          text: "❤️",style: TextStyle(fontSize:20,color: Colors.black)
                      ),
                    ],)),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(left:Radius.circular(5),right:Radius.circular(5)),
                                ),
                              ),
                              onPressed: (){}, child: Text("Following",style: TextStyle(color: Colors.white),)),
                          SizedBox(width: 30),
                          ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(left:Radius.circular(5),right:Radius.circular(5)),
                                ),
                              ),
                              onPressed: (){}, child: Text("Message",style: TextStyle(color: Colors.white),)),
                          SizedBox(width: 30),
                          ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(left:Radius.circular(5),right:Radius.circular(5)),
                                ),
                              ),
                              onPressed: (){}, child: Text("Contact",style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: a.length,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: AssetImage(a[index]))
                                    ),
                                  ),
                                  Text("Team Busted")
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              pinned: true,
              floating: true,
              snap: false,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.window)),
                  Tab(icon: Icon(Icons.video_collection_outlined)),
                  Tab(icon: Icon(Icons.person)),
                ],),
            ),
          ];
        },
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: GridView.builder(
                    itemCount: b.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                        mainAxisSpacing:0,crossAxisSpacing:0),
                    itemBuilder: (BuildContext context, int index){
                      return Column(children: [
                        Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(b[index]),fit: BoxFit.fill)
                          ),
                        ),
                      ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: GridView.builder(
                    itemCount: c.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                        mainAxisSpacing:0,crossAxisSpacing:0),
                    itemBuilder: (BuildContext context, int index){
                      return Column(children: [
                        Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(c[index]),fit: BoxFit.fill)
                          ),
                        ),
                      ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: GridView.builder(
                    itemCount: b.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                        mainAxisSpacing:0,crossAxisSpacing:0),
                    itemBuilder: (BuildContext context, int index){
                      return Column(children: [
                        Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(b[index]),fit: BoxFit.fill)
                          ),
                        ),
                      ],
                      );
                    }),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}