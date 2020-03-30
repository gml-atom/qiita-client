import 'package:flutter/material.dart';
import 'view/top.dart';
import 'view/trend.dart';
import 'view/tag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        // タブの数
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              // タブのオプション
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(fontSize: 12.0),
              labelColor: Colors.yellowAccent,
              labelStyle: TextStyle(fontSize: 16.0),
              indicatorColor: Colors.white,
              indicatorWeight: 2.0,
              // タブに表示する内容
              tabs: [
                Tab(
                  child: Text('Top'),
                ),
                Tab(
                  child: Text('トレンド'),
                ),
                Tab(
                  child: Text('新着'),
                ),
              ],
            ),
            title: Text('見るだけ！ Qiita Client '),
          ),
          body: TabBarView(
            // 各タブの内容
            children: [
              new TopTab('top'),
              new TrendTab('test'),
              new TagTab(),
            ],
          ),
        ),
      ),
    );
  }
}
