import 'package:flutter/material.dart';
import '../trend_rss_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'webview_container.dart';

class TrendTab extends StatefulWidget {
  TrendTab(this.categoryName);
  final String categoryName;

  @override
  _TrendTabState createState() => _TrendTabState();
}

class _TrendTabState extends State<TrendTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.blue,
      body: new Container(
        height: double.infinity,
        width: double.infinity,
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                widget.categoryName,
                style: new TextStyle(color: Colors.white),
              ),
              Expanded(
                child: FutureBuilder(
                    future: TrendRssService().getFeed(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final feed = snapshot.data;
                        return ListView.builder(
                            itemCount: feed.items.length,
                            padding: EdgeInsets.all(2),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final item = feed.items[index];
                              return Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text(
                                    item.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text('公開日： ' + parseDate(item.published)),
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WebViewContainer(
                                                    item.links.first.href,
                                                    item.title)));
                                  },
//            onTap: () => _navigateToPost(context, posts[index]['id']),
                                ),
                              );
//                              return Container(
//                                  decoration: BoxDecoration(
//                                    border: Border(
//                                      bottom: BorderSide(color: Colors.black38),
//                                    ),
//                                  ),
//                                  child: ListTile(
//                                    title: Text(item.title),
//                                    subtitle: Text(
//                                        '公開日： ' + parseDate(item.published)),
//                                    contentPadding: EdgeInsets.all(8.0),
//                                    onTap: () async {
//                                      Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
////                                      builder: (context) => WebViewContainer("https://yahoo.co.jp")
//                                              builder: (context) =>
//                                                  WebViewContainer(
//                                                      item.links.first.href,
//                                                      item.title)));
//                                    },
//                                  ));
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  parseDate(d) {
    Intl.defaultLocale = 'ja_JP';
    initializeDateFormatting("ja_JP");
    DateTime parsedDate = DateTime.parse(d);
    var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    var formatted = formatter.format(parsedDate);
    return formatted;
  }
}
