import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentInfo extends StatefulWidget {
  String docName;
  DocumentInfo({super.key, required this.docName});

  @override
  State<DocumentInfo> createState() => _DocumentInfoState();
}

class _DocumentInfoState extends State<DocumentInfo> {
  int currentIndex = 0;
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
              "List Of Documents",
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
      body: currentIndex == 0
          ? SingleChildScrollView(
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        height: 500,
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DocumentInfo(
                                                docName: "$index")));
                                  },
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("$index"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("This Page is for FlowChart"),
                    ],
                  )),
            ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.yellow,
        color: Colors.blue,
        items: const [
          FaIcon(
            FontAwesomeIcons.fileLines,
            size: 25,
          ),
          FaIcon(
            FontAwesomeIcons.stackOverflow,
            size: 25,
          ),
          FaIcon(
            FontAwesomeIcons.youtube,
            size: 25,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (currentIndex == 2) {
            var query = widget.docName.toString().replaceAll(" ", "+");
            var url =
                Uri.parse("https://youtube.com/results?search_query=${query}");
            _launchUrl(url);
          }
        },
      ),
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}
