import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class TrendRssService {
  final _targetUrl = 'https://qiita.com/popular-items/feed.atom';

  Future<AtomFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => AtomFeed.parse(xmlString));

}