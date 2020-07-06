import 'package:flutter/material.dart';
import '../model/models.dart';
import 'webview_container.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'search_tag_items.dart';

class TopTab extends StatefulWidget {
  TopTab(this.categoryName);
  final String categoryName;

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Fav().select().orderByDesc('type').orderByDesc('id').toList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString().length > 2) {
              return ListView(
                padding: EdgeInsets.all(2),
                children: snapshot.data.map<Widget>((Fav item) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('登録日： ' + parseDate(item.create_at)),
//                      onTap: () async {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    WebViewContainer(item.url, item.title)));
//                      },
                      onTap: () => _onTap(item.url ?? 'tag', item.title),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Text('まだブックマークされた記事、タグはありません。');
            }
          } else {
            return Text('wait');
          }
        });
  }

  _onTap(String url, String title) async {
    if (url == "tag") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchTagItems(title.substring(
                  1,
                ))),
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewContainer(url, title)));
    }
  }

  parseDate(d) {
    Intl.defaultLocale = 'ja_JP';
    initializeDateFormatting("ja_JP");
//    DateTime parsedDate = DateTime.parse(d);
    var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    var formatted = formatter.format(d);
    return formatted;
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//        future: Fav().select().orderByDesc('id').toList(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            print('------');
//            print(snapshot.data);
//            final List bookmarkList = json.decode(snapshot.data);
//            print('------');
//            print(bookmarkList[0].toMap());
//            print('------');
//            print((bookmarkList[0].toMap()).title);
//            return _body(context, bookmarkList);
//          } else {
//            return Text('読込中...');
//          }
//        });
//  }
//}
//
//ListView _body(BuildContext context, List bookmarkList) {
//  return ListView.builder(
//    itemCount: bookmarkList.length,
//    padding: EdgeInsets.all(2),
//    itemBuilder: (context, index) {
//      return Card(
//          elevation: 4,
//          child: ListTile(
//            title: Text(
//              bookmarkList[index]['title'],
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            subtitle: Text('公開日： '),
//            onTap: () async {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => WebViewContainer(
//                            bookmarkList[index]['title'],
//                            bookmarkList[index]['url'],
//                          )));
//            },
//          ));
//    },
//  );
//}

//                return Card(
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border(
//                          bottom:
//                              BorderSide(width: 1.0, color: Colors.black26)),
//                    ),
//                    padding: EdgeInsets.all(16),
//                    child: Text(item.title),
//                  ),
//                );
//              }).toList(),
//            );
//          } else {
//            return Text('wait');
//          }
//        });
//  }
//}

//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//        future: Fav().select().orderByDesc('id').toList(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          if (snapshot.hasData) {
//            return ListView(
//              children: snapshot.data.map<Widget>((Fav item) {
//                return GestureDetector(
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border(
//                          bottom:
//                              BorderSide(width: 1.0, color: Colors.black26)),
//                    ),
//                    padding: EdgeInsets.all(16),
//                    child: Text(item.title),
//                  ),
//                );
//              }).toList(),
//            );
//          } else {
//            return Text('wait');
//          }
//        });
//  }
//}
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
