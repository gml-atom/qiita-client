import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../data/items_api_service.dart';
import 'webview_container.dart';
import '../models.dart';

class SearchTagItems extends StatelessWidget {
  final String searchString;
  SearchTagItems(this.searchString);

  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
////        home: _buildBody(context),
//      home: HomePage(),
//    );

    return Provider(
        create: (_) => ItemsApiService.create(),
        // Always call dispose on the ChopperClient to release resources
        dispose: (context, ItemsApiService service) => service.client.dispose(),
        child: Itemlist(searchString));
//        child: MaterialApp(
////          home: _buildBody(context),
//          home: Itemlist(),
//        ));
  }
}

class Itemlist extends StatelessWidget {
  bool _iconState = false;
  final String searchString;
  Itemlist(this.searchString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索結果 : #' + searchString),
        actions: <Widget>[
          bookmartIcon(searchString),
        ],
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<ItemsApiService>(context).getTagPosts(searchString),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.error == null) {
            final List posts = json.decode(snapshot.data.bodyString);
            return _buildPosts(context, posts);
          } else {
            return Text('No data');
          }
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(2),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('公開日： ' + parseDate(posts[index]['created_at'])),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewContainer(
                          posts[index]['url'], posts[index]['title'])));
            },
//            onTap: () => _navigateToPost(context, posts[index]['id']),
          ),
        );
      },
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

class bookmartIcon extends StatefulWidget {
  final String searchString;
  bookmartIcon(this.searchString);

  @override
  createState() => _bookmartIcon(searchString);
}

class _bookmartIcon extends State<bookmartIcon> {
  bool _iconState = false;
  final String searchString;
  _bookmartIcon(this.searchString);

  @override
  void initState() {
    // TODO: implement initState
    isBookmark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _Icon();
  }

  IconButton _Icon() {
    if (_iconState) {
      return IconButton(
        icon: Icon(
          Icons.bookmark,
          color: Colors.white,
        ),
        tooltip: 'ブックマークから削除',
        onPressed: saveButtonPressed,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.bookmark_border,
          color: Colors.white,
        ),
        tooltip: 'ブックマークに追加',
        onPressed: saveButtonPressed,
      );
    }
  }

  Future<void> isBookmark() async {
    var bookmarlList =
        await Fav().select().title.equals("#" + searchString).toList();
    if (bookmarlList.length > 0) {
      setState(() {
        _iconState = true;
      });
    }
  }

  void saveButtonPressed() {
    if (!_iconState) {
      Fav(
        title: "#" + searchString,
        type: "tag",
        create_at: DateTime.now(),
      ).save();
    } else {
      Fav().select().title.equals("#" + searchString).delete();
    }
    setState(() {
      _iconState = !_iconState;
    });

    return;
  }
}
