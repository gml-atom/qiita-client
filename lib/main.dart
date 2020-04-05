import 'package:flutter/material.dart';
import 'view/top.dart';
import 'view/trend.dart';
import 'view/test.dart';

void main() => runApp(MyApp());

class DynamicTabContent {
  String tabTitle;
  Widget view;

  DynamicTabContent.name(this.tabTitle, this.view);
}

class MyApp extends StatefulWidget {
  static final navKey = new GlobalKey<NavigatorState>();
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<DynamicTabContent> myList = new List();

  final List<Tab> tabs = <Tab>[
    Tab(text: 'HOME'),
    Tab(text: 'トレンド'),
    Tab(text: 'タグ一覧'),
  ];

  TabController _tabController;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myList.add(new DynamicTabContent.name("HOME2", new TopTab('top')));
    myList.add(new DynamicTabContent.name('トレンド2', new TrendTab('test')));
    myList.add(new DynamicTabContent.name('タグ一覧2', new TopTab('top')));
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navKey,
      home: DefaultTabController(
        // タブの数
        length: myList.length,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'sss',
                onPressed: buttonPressed,
//                onPressed: () async {
//                  Duration date = await showTimerDialog(context: context);
//                },
              ),
            ],
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
              controller: _tabController,

              tabs: myList.map((DynamicTabContent choice) {
                return Tab(
                  text: choice.tabTitle,
                );
              }).toList(),
            ),
            title: Text('見るだけ！ Qiita Client '),
          ),
          body: TabBarView(
            // 各タブの内容
            controller: _tabController,
            children:
                myList.map((DynamicTabContent choice) => choice.view).toList(),
          ),
        ),
      ),
    );
  }

  void buttonPressed() {
//    final searchTextController = TextEditingController();
    final context = MyApp.navKey.currentState.overlay.context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('サンプルダイアログ'),
          content: TextField(
            controller: searchTextController,
            decoration: InputDecoration(
              hintText: "sec",
            ),
            autofocus: true,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("OK"),
//              onPressed: () => Navigator.pop(context),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
//                                      builder: (context) => WebViewContainer("https://yahoo.co.jp")
                      builder: (context) => TestTab("aaaa"))),
            ),
          ],
        );
      },
    );
  }
}
