import 'package:flutter/material.dart';

class MyNewPage extends StatelessWidget {
  final Function onBackButtonPressed;

  MyNewPage({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LET HIM COOK'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 330,
                child: Stack(
                  children: [
                    // Resim
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(650),
                        ),
                        child: Image.asset(
                          "images/cooking.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Metin
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: Text(
                        "Granite \n Cooking \n Class",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // İkinci metin ve ikon
                    Align(
                      alignment: Alignment(0.1, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.share_location),
                            Icon(Icons.linear_scale_sharp),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Pleasant Park",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 120,
                      left: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          "Guest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 220,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 18),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: ClipOval(
                          child: Image.asset("images/p1.jpg", fit: BoxFit
                              .cover),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: ClipOval(
                          child: Image.asset("images/p2.jpg", fit: BoxFit
                              .cover),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: ClipOval(
                          child: Image.asset("images/p3.jpg", fit: BoxFit
                              .cover),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: ClipOval(
                          child: Image.asset("images/p4.jpg", fit: BoxFit
                              .cover),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Granite Cooking !',
                          style: TextStyle(color: Colors.orange),
                        ),
                        TextSpan(
                          text: 'The latest fad in Foodology, get the inside scoop.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Guest lists full up fast so be sure to apply beforehand to secure a spot.", style: TextStyle(color: Colors.blueAccent, fontSize: 20)),
                  SizedBox(height: 15),
                  Text("Gallery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(
                            child: Image.asset("yeni.jpg",fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                        width: 150,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(
                          child: Image.asset("pas2.png",fit: BoxFit.fill),
                        ),
                      ),
                        SizedBox(width: 20),
                        Container(
                          width: 150,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(
                            child: Image.asset("pas3.png",fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          ),


        ],
      ),
    );
  }
}
