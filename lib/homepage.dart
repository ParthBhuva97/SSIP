import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello User!",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Search Documents",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          child: Stack(children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.linear_scale_sharp,
                    size: 30,
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AnimSearchBar(
                        width: 350,
                        textController: textController,
                        onSuffixTap: () {},
                        onSubmitted: (String) {},
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          color: Colors.blue[600],
                          child: Container(
                            height: 100,
                            width: 100,
                          ),
                          elevation: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.yellow,
        color: Colors.blue,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
            color: Colors.white,
          ),
          Icon(
            Icons.map,
            size: 25,
            color: Colors.white,
          )
        ],
        onTap: (index) {},
      ),
    );
  }
}
