import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';

import '../data/tag_api_service.dart';
import 'single_post_page.dart';

class TagTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
////        home: _buildBody(context),
//      home: HomePage(),
//    );

    return Provider(
        create: (_) => TagApiService.create(),
        // Always call dispose on the ChopperClient to release resources
        dispose: (context, TagApiService service) => service.client.dispose(),
        child: MaterialApp(
//          home: _buildBody(context),
          home: Taglist(),
        ));
  }
}

class Taglist extends StatelessWidget {
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
      future: Provider.of<TagApiService>(context).getPosts(),
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

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['id'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index]['id']),
            onTap: () => _navigateToPost(context, posts[index]['id']),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
//        builder: (context) => SinglePostPage(postId: id),
        builder: (context) => SinglePostPage(postId: id),
      ),
    );
  }
}
