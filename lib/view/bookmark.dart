import 'package:flutter/material.dart';
import '../models.dart';

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
    return FutureBuilder(
        future: Fav().select().orderByDesc('id').toList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.map<Widget>((Fav item) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Colors.black26)),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(item.title),
                  ),
                );
              }).toList(),
            );
          } else {
            return Text('wait');
          }
        });
  }
}
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: Colors.blue,
//      body: new Container(
//        child: new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Icon(
//                Icons.library_books,
//                size: 50.0,
//                color: Colors.white,
//              ),
//              new Text(
//                widget.categoryName,
//                style: new TextStyle(color: Colors.white),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
