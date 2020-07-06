import 'package:flutter/material.dart';
import '../model/history_models.dart';
import 'webview_container.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'search_tag_items.dart';

class HistoryTab extends StatefulWidget {

  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: History().select().orderByDesc('create_at').toList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString().length > 2) {
              return ListView(
                padding: EdgeInsets.all(2),
                children: snapshot.data.map<Widget>((History item) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('閲覧日： ' + parseDate(item.create_at) + '       閲覧回数：' + item.num.toString()),
                      onTap: () => _onTap(item.url,item.title),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Text('まだ閲覧した記事はありません。');
            }
          } else {
            return Text('wait');
          }
        });
  }

  _onTap(String url, String title) async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewContainer(url, title)));
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
