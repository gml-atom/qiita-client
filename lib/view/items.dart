import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../data/items_api_service.dart';
import 'single_post_page.dart';
import 'webview_container.dart';

class ItemsTab extends StatelessWidget {
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
        child: Itemlist());
//        child: MaterialApp(
////          home: _buildBody(context),
//          home: Itemlist(),
//        ));
  }
}

class Itemlist extends StatelessWidget {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<ItemsApiService>(context).getPosts(),
//      future: _aaa(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

//  _aaa(BuildContext context) {
//    return Provider.of<ItemsApiService>(context).getPosts();
//  }

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
