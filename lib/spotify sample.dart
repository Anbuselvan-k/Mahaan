import 'package:flutter/material.dart';

class spotify extends StatefulWidget {
  const spotify({super.key});

  @override
  State<spotify> createState() => _spotifyState();
}

class _spotifyState extends State<spotify> {
  List a =[
    "assets/tommy.jpg",
    "assets/as.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
    "assets/tommy.jpg",
  ];
  List b = [
    "Manasilaayo",
    "Paththavaikkum",
    "Kadharalz",
    "Paaraa",
    "Neelorpam",
    "ZagaZaga",
    "Come Back Indian",
    "Calendar Song",
    "Fear Song",
  ];
  List c = [
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
    "Anirudh Ravichander",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)=> [
          SliverAppBar(
            title: Text("Anirudh Tamil Hit Songs ALL MOVIES",style: TextStyle(fontSize: 20,color: Colors.grey),),
            leading: Icon(Icons.arrow_back),
            automaticallyImplyLeading: false,
            expandedHeight:500,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("Anirudh Tamil Hit Songs ALL MOVIES",style: TextStyle(fontSize: 15,color: Colors.red),),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Color(0XFFAE7038),Color(0XFF45301E)]),
                ),
                child: Column(
                    children: [
                      SizedBox(height:80),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 200,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText:"Find in playlist",
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: Colors.white,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              height: 50,
                              width: 80,
                              child: ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: (){}, child: Text("sort")),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: 210,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            image: DecorationImage(image: AssetImage("assets/anirudh.jpg"),fit: BoxFit.fill)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("All hit songs of one on my favorite music director & singer Anirudh,enjoy",style: TextStyle(color: Colors.grey),),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage("assets/anirudh.jpg"),fit: BoxFit.fill)
                            ),
                          ),
                          Text("Medicos life",style: TextStyle(color: Colors.white,fontSize: 15),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("🌐 8,840.10h29min",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.add_circle_outline,size:30),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_circle_down_outlined,size: 30),
                          SizedBox(width: 5),
                          Icon(Icons.share,size: 30),
                          SizedBox(width:30),
                          Icon(Icons.more_vert,size: 30),
                          SizedBox(width: 100),
                          Icon(Icons.shuffle,size: 30),
                          SizedBox(width: 5),
                          Icon(Icons.play_circle,color: Colors.green,size: 50),
                        ],
                      ),
                    ]
                ),
              ),),
          )
        ],
          body:
          Container(
            height: 410,
            color: Colors.black54,
            child:  ListView.builder(
              itemCount: a.length,
              itemBuilder: (BuildContext  context,int index){
                return Container(
                  child: ListTile(
                    leading: Image.asset(a[index],),
                    title: Text(b[index],style: TextStyle(color: Colors.white),),
                    subtitle:Text(c[index],style: TextStyle(color: Colors.white),),
                    trailing: Icon(Icons.more_vert_outlined),
                  ),
                );
              },
            ),
          ),
        ));
  }
}