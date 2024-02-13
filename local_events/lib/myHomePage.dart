import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_events/newPage.dart';
import 'build_button.dart';
import 'newPage2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Bütün Widget'lar bunun içine yazılacak.
            Expanded(
                child: Container(
              padding: EdgeInsets.all(25),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange,
                    Colors.deepOrange,
                    Colors.grey[200]!,
                    Colors.grey[200]!,
                  ],
                  stops: [0.0, 0.5, 0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Local Events",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.key),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "What's Up",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Butonlar
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildButton(Icons.search, "All"),
                        buildButton(Icons.music_note, "Music"),
                        buildButton(Icons.location_on, "Meetup"),
                        buildButton(Icons.sports_soccer, "Sport"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyNewPage(
                            onBackButtonPressed: () {},
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //İç içe istiyorsan stack kullanacaksın.
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "images/photo2.png",
                                    height: 100,
                                    width: 320,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Text(
                                  "5 Kilometer",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Text(
                                  "Downtown Run",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Row(
                                  children: [
                                    Icon(Icons.share_location),
                                    Text(
                                      "Pleasant Park",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 20,
                            bottom: 17,
                            child: Column(
                              children: [
                                Icon(Icons.timelapse, size: 55),
                                Text(
                                  "3H",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyNewPage2(
                            onBackButtonPressed: () {},
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //İç içe istiyorsan stack kullanacaksın.
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    "images/indir.png",
                                    height: 100,
                                    width: 320,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Text(
                                  "Granite",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Text(
                                  "Cooking Class",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4, left: 15),
                                child: Row(
                                  children: [
                                    Icon(Icons.share_location),
                                    Text(
                                      "Food Court Avenue",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 20,
                            bottom: 17,
                            child: Column(
                              children: [
                                Icon(Icons.timelapse, size: 55),
                                Text(
                                  "6H",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
