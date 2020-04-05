import 'package:flutter/material.dart';

class TestTab extends StatefulWidget {
  TestTab(this.categoryName);
  final String categoryName;

  @override
  _TestTabState createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.library_books,
                size: 50.0,
                color: Colors.white,
              ),
              new Text(
                widget.categoryName,
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
