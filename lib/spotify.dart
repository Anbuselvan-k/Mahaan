import 'package:flutter/material.dart';
class music extends StatefulWidget {
  const music({super.key});

  @override
  State<music> createState() => _musicState();
}

class _musicState extends State<music> {
  List a=[
    "assets/as.jpg",
    "assets/tommy.jpg",
    "assets/shelby.jpg",
    "assets/img_2.png",
    "assets/img_1.png",
    "assets/sample.jpg",
    "assets/img_10.png",
    "assets/img_11.png",
    "assets/tommy.jpg",
    "assets/img.png",

  ];
  List b=[
    "Nee Kavithaigala",
    "Idhayam Love(Megamo Aval)",
    "Vaanam Paarthen",
    "Kannamma",
    "Agayam Theepiditha",
    "Maya Nadhi",
    "Manasula Soora Kathu",
    "Aval",
    "The Life Of Ram",
    "Kaarkuzhal Kadavaiye",
  ];
  List c=[
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
    "Pradeep Kumar",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context , bool innerBoxIsScrolled)=>[
        SliverAppBar(backgroundColor: Colors.brown.shade300,
          title: Text("Pradeep Kumar Drugs !...",style: TextStyle(color: Colors.white),),
          leading: Icon(Icons.arrow_back,color: Colors.white,),
          automaticallyImplyLeading: true,
          expandedHeight: 520,
          pinned:true,
          forceElevated: innerBoxIsScrolled,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0XFF8D7955),Color(0XFF3C3529)]
              ),
            ),

             child: Column(
               children: [ SizedBox(height: 70,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 60,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0XFF88775A),
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.white,
                            hintText: "Find in playlist",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: 80,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0XFF88775A),
                            hintText: "Sort",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 Container(
                   height: 200,
                   width: 200,
                   decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage("assets/img_9.png"),fit: BoxFit.fill),
                   ),
                 ),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 10,left: 10),
                     child: RichText(text: TextSpan(children: [
                       TextSpan(text: "Pradeep Kumar Drugs ! ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                     ])),
                   ),

                 ],
               ),
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         height: 20,
                         width: 20,
                         decoration: BoxDecoration(
                           border: Border.all(),
                           borderRadius: BorderRadius.circular(20),
                           image: DecorationImage(image: AssetImage("assets/img_10.png"),fit: BoxFit.fill)
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: Text("Anbuselvan ⚡",style: TextStyle(color: Colors.white),),
                     )
                   ],
                 ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("🌐 244,692 saves . 7h 35min",style: TextStyle(color: Colors.white70),),
                    ),
                  ],
                ),
                 Row(
                   children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       height: 50,
                       width: 40,
                       decoration: BoxDecoration(
                         border: Border.all(),
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(image: AssetImage("assets/img_11.png"),fit: BoxFit.fill)
                       ),
                     ),
                   ),
                   Icon(Icons.add_circle_outline_rounded,color: Colors.white,),SizedBox(width: 10,),
                   Icon(Icons.arrow_circle_down_outlined,color: Colors.white,),SizedBox(width: 10,),
                   Icon(Icons.more_vert,color: Colors.white,),SizedBox(width: 10,),SizedBox(width: 150,),
                   Icon(Icons.shuffle,color: Colors.green,size: 40,),SizedBox(width: 14,),
                   Icon(Icons.play_circle,color: Colors.green,size: 40,),
                 ],),
               ],
             ),
          ),
        ),
        ),
      ],
        body: SingleChildScrollView(
          child: Container(
            height: 900,
            color: Colors.black87,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: a.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    child: ListTile(
                      leading: 
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(a[index]),fit: BoxFit.fill)
                        ),
                      ),
                      title: Text(b[index],style: TextStyle(color: Colors.white),),
                      subtitle:Text(c[index],style: TextStyle(color: Colors.white),),
                      trailing: Icon(Icons.more_vert),
                   
                    ),
                  );
                },
                  ),
          
          
          
          
          ),
        ),
    ),
    );
  }
}
