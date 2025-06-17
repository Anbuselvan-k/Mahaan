import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class story extends StatefulWidget {
  const story({super.key});

  @override
  State<story> createState() => _storyState();
}

class _storyState extends State<story> {
  List a= [
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
    "assets/img_11.png",
  ];
  List b=[
    "💥",
    "💤",
    "🖤",
    "😎",
    "me",
    "peace",
    "party",
    "aa",
    "🚄",
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
      appBar: AppBar(backgroundColor: Colors.black87,
        leading: Icon(CupertinoIcons.lock,color: Colors.white,),
        title: Text("anbu_1340",style: TextStyle(color: Colors.white),),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(CupertinoIcons.plus_app,color: Colors.white,),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu,color: Colors.white,),
          ),
        ],
      ),
    body: DefaultTabController(length: 3,
      child: NestedScrollView(headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black87,
            expandedHeight: 450,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(image: AssetImage("assets/img_10.png"),fit: BoxFit.fill),

                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      Column(
                        children: [
                          Text("14",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("posts",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(width: 50,),
                      Column(
                        children: [
                          Text("341",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("followers",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(width: 50,),
                      Column(
                        children: [
                          Text("593",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                          Text("following",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Anbu",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(style: OutlinedButton.styleFrom(backgroundColor: Color(0XFF262626)),
                            onPressed: (){}, child: Text("anbu_1340",style: TextStyle(color: Colors.white),)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0XFF262626),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            onPressed: (){}, child: Text("    Edit profile    ",style: TextStyle(color: Colors.white),),),
                        ),
                        ElevatedButton(style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0XFF262626),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                            onPressed: (){}, child: Text("    Share profile    ",style: TextStyle(color: Colors.white),)),
                        ElevatedButton(
                            style: OutlinedButton.styleFrom(backgroundColor: Color(0XFF262626),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                            ),onPressed: (){}, child: Icon(Icons.person_add,color: Colors.white,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 150,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: a.length,
                        itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Text(b[index],style: TextStyle(color: Colors.white),)

                        ],
                      );
                    }
                    ) ,

                  )
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
      },  body: TabBarView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black87
            ),
            child: GridView.builder(
                itemCount: a.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                    mainAxisSpacing:0,crossAxisSpacing:0),
                itemBuilder: (BuildContext context, int index){
                  return Column(children: [
                    Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                          image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
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
            decoration: BoxDecoration(color: Colors.black87),
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
                        color: Colors.black87,
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
            decoration: BoxDecoration(color: Colors.black87),
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
      ],),),
    ),

    );
  }
}
