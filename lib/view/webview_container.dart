import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final title;
  WebViewContainer(this.url, this.title);

  @override
  createState() => _WebViewContainerState(this.url, this.title);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  var _title;
  final _key = UniqueKey();
  _WebViewContainerState(this._url, this._title);
  bool _iconState = false;

  @override
  void initState() {
    // TODO: implement initState
    isBookmark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_url);
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: <Widget>[_bookmarkIcon()],
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                initialUrl: _url,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
          ],
        ));
  }

  Future<void> isBookmark() async {
    var bookmarlList = await Fav().select().url.equals(_url).toList();
    if (bookmarlList.length > 0) {
      setState(() {
        _iconState = true;
      });
    }
  }

  IconButton _bookmarkIcon() {
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

  void saveButtonPressed() {
    if (!_iconState) {
      Fav(
        title: _title,
        url: _url,
        create_at: DateTime.now(),
      ).save();
    } else {
      Fav().select().url.equals(_url).delete();
    }
    setState(() {
      _iconState = !_iconState;
    });
    return;
  }
}
