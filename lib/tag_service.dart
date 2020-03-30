import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class TrendRssService {
  final _targetUrl = 'https://qiita.com/api/v2/tags?page=1&per_page=100&sort=count';

  Future<AtomFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => AtomFeed.parse(xmlString));

}

