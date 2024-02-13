import 'dart:convert'; // json kütüphanesini ekleyin
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  List? popularBooks;
  // Liste türü nullable olarak tanımlanmalı
  List? books;
  ScrollController? _scrollController;
  TabController? _tabController;

  Future<void> ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }
  
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // Bütün sayfayı scaffold olarak düşün ve column ver.
      child: SafeArea(
        // Scaffold'da üstteki tab'i siliyor.
        child: Scaffold(
          body: Column(
            children: [
              Container(
                // Row'u marginlemek için container içine alıyoruz.
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 50, color: Colors.black),
                    Row(
                      children: [
                        Icon(Icons.search, size: 50, color: Colors.black),
                        SizedBox(width: 20),
                        Icon(Icons.notification_add, size: 50, color: Colors.black),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("Popular Books ", style: TextStyle(fontSize: 30)),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(

                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      child: Container(

                        height: 180,
                        //width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 10),
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: popularBooks == null ? 0 : popularBooks?.length,
                          itemBuilder: (_, i) {
                            return Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(popularBooks?[i]["img"]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor:Colors.white,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: Offset(0,0)
                                  )
                                ]
                              ),
                              tabs: [
                                Container(
                                  width:120,
                                  height: 50,
                                  child: Text(
                                    "New",style: TextStyle(color: Colors.white),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 7,
                                          offset: Offset(0,0)
                                      )
                                    ]
                                  ),
                                ),
                                Container(
                                  width:120,
                                  height: 50,
                                  child: Text(
                                    "Popular",style: TextStyle(color: Colors.white),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 7,
                                            offset: Offset(0,0)
                                        )
                                      ]
                                  ),
                                ),
                                Container(
                                  width:120,
                                  height: 50,
                                  child: Text(
                                    "Trending",style: TextStyle(color: Colors.white),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 7,
                                            offset: Offset(0,0)
                                        )
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: books==null?0:books?.length,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            // BU BİZİM SAYFAYI ÇEVRELEYEN KONTEYNIRIMIZ.!!!!!!!!!!!!
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color:Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              //BU ASIL KONTEYNIR!!!!!!!!!!!!!!!!
                              child:Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    //Resim konteynırı
                                    Container(
                                      width: 90,
                                      height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(image: AssetImage(books?[i]["img"])),
                                        )
                                    ),
                                    SizedBox(width: 10),
                                    // Icon ve textler
                                    // Column kullanıyorsan cross axess alignment
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.star,size: 24,color: Colors.yellow,),
                                            SizedBox(width: 5),
                                            Text(books?[i]["rating"],style:TextStyle(color:Colors.red)),


                                          ],
                                        ),
                                        Text(popularBooks?[i]["title"],style:TextStyle(fontSize: 20,fontFamily: "Avenir",fontWeight: FontWeight.bold),),
                                        Text(popularBooks?[i]["text"],style:TextStyle(fontSize: 20,fontFamily: "Avenir",color: Colors.blue)),
                                        Container(
                                          width: 60,
                                          height: 20,
                                          decoration:BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.orange,
                                          ),
                                          child:Text("love",style:TextStyle(fontSize: 20,fontFamily: "Avenir",color:Colors.black),),
                                          alignment: Alignment.center,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ) ,
                            ),
                          );
                        },
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Content"),
                        ),
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Content"),
                        ),
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );

  }
}
