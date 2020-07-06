import 'package:flutter/material.dart';
import 'view/bookmark.dart';
import 'view/trend.dart';
import 'view/items.dart';
import 'model/history_models.dart';
import './view/webview_container.dart';
import 'view/search_items.dart';
import 'view/search_tag_items.dart';
import 'view/history.dart';


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

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  List<DynamicTabContent> myList = new List();

  List<Tab> tabs = <Tab>[
    Tab(text: 'ブックマーク'),
    Tab(text: 'トレンド'),
    Tab(text: '新着記事'),
    Tab(text: '閲覧履歴'),
  ];

  List<Widget> tabView = <Widget>[
    new TopTab('top'),
    new TrendTab('test'),
    new ItemsTab(),
    new HistoryTab(),
  ];

  TabController _tabController;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
//    _addDefaultTab();
    _tabController = getTabController();
    _tabController.index = 1;
    _historyClean();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navKey,
      theme: new ThemeData(
        primaryColor: Colors.lightGreenAccent[700],
        // ignore: deprecated_member_use
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: const IconThemeData.fallback().copyWith(
          color: Colors.white,
        ),
      ),
      home: DefaultTabController(
        // タブの数
        length: myList.length,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: '検索',
                onPressed: buttonPressed,
              ),
            ],
            bottom: TabBar(
              // タブのオプション
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              unselectedLabelStyle: TextStyle(fontSize: 12.0),
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 16.0),
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
//              isScrollable: true,
              // タブに表示する内容

              controller: _tabController,
              tabs: tabs,
//              tabs: getWidgets(),

//              tabs: myList.map((DynamicTabContent choice) {
//                return Tab(
//                  text: choice.tabTitle,
//                );
//              }).toList(),
            ),
            title: Text('見るだけ！ Qiita Client '),
          ),
          body: TabBarView(
            // 各タブの内容
            controller: _tabController,

            children: tabView,
//                myList.map((DynamicTabContent choice) => choice.view).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgets() {
    return myList.map((DynamicTabContent choice) {
      return Tab(
        text: choice.tabTitle,
      );
    }).toList();
  }

  TabController getTabController() {
    return TabController(length: tabs.length, vsync: this);
//      ..addListener(_updatePage);
  }

  void buttonPressed() {
//    final searchTextController = TextEditingController();
    final context = MyApp.navKey.currentState.overlay.context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('検索\n#タグ名 でタグ検索'),
          content: TextField(
            controller: searchTextController,
            decoration: InputDecoration(),
            autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: () async {
                if (searchTextController.text.startsWith('#')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchTagItems(searchTextController.text.substring(
                              1,
                            ))),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchItems(searchTextController.text)),
                  );
                }
              },
//              onPressed: () => Fav(title: searchTextController.text).save(),
//              onPressed: () => Navigator.pop(context),
//              onPressed: () => Navigator.push(
//                  context,
//                  MaterialPageRoute(
////                                      builder: (context) => WebViewContainer("https://yahoo.co.jp")
//                      builder: (context) =>
//                          TestTab(searchTextController.text))),
            ),
          ],
        );
      },
    );
  }

  void _historyClean() async{
    final result = await History().select().create_at.lessThan(DateTime.now().subtract(new Duration(hours: 240))).delete();
  }
}
