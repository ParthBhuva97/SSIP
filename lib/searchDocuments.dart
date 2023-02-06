import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchDocuments extends StatefulWidget {
  const SearchDocuments({super.key});

  @override
  State<SearchDocuments> createState() => _SearchDocumentsState();
}

class _SearchDocumentsState extends State<SearchDocuments> {
  TextEditingController _controller = new TextEditingController();
  bool _isSuffixIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Documents Here"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _isSuffixIconVisible = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                  ),
                  suffixIcon: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: _isSuffixIconVisible ? 1.0 : 0.0,
                    child: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
