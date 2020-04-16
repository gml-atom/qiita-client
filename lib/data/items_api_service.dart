import 'package:chopper/chopper.dart';

part 'items_api_service.chopper.dart';

@ChopperApi(baseUrl: '/v2')
abstract class ItemsApiService extends ChopperService {
  @Get(path: "/items?per_page=50")
  Future<Response> getPosts();

  @Get(path: "/items?query={str}&per_page=50")
  Future<Response> getSearchPosts(
    @Path('str') String str,
  );

  @Get(path: "/tags/{tag}/items?per_page=50")
  Future<Response> getTagPosts(
    @Path('tag') String str,
  );

  static ItemsApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://qiita.com/api',
      services: [
        // The generated implementation
        _$ItemsApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$ItemsApiService(client);
  }
}
