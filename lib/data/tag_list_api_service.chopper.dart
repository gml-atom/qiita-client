// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_list_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TagListApiService extends TagListApiService {
  _$TagListApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TagListApiService;

  @override
  Future<Response<dynamic>> getPosts() {
    final $url = '/v2/tags?sort=count';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPost(String id) {
    final $url = '/v2/tags/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
