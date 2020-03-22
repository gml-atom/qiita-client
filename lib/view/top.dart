import 'package:flutter/material.dart';

class TopTab extends StatefulWidget {
  TopTab(this.categoryName);
  final String categoryName;

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
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