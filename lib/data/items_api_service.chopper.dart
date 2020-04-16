// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ItemsApiService extends ItemsApiService {
  _$ItemsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ItemsApiService;

  @override
  Future<Response<dynamic>> getPosts() {
    final $url = '/v2/items?per_page=50';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSearchPosts(String str) {
    final $url = '/v2/items?query=$str&per_page=50';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTagPosts(String str) {
    final $url = '/v2/tags/$str/items?per_page=50';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
