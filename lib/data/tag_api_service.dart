import 'package:chopper/chopper.dart';

part 'tag_api_service.chopper.dart';

@ChopperApi(baseUrl: '/v2')
abstract class TagApiService extends ChopperService {
  @Get(path: "/tags?sort=count")
  Future<Response> getPosts(
//      {
////        @Query('page[number]') int pageNumber = 1,
////      @Query('per_page[aaa]') int per_page = 20,
//      @Query('sort[count]') String sort = "count"}
      );

  @Get(path: '/tags/{id}')
  // Query parameters are specified the same way as @Path
  // but obviously with a @Query annotation
  Future<Response> getPost(@Path('id') String id);

  static TagApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://qiita.com/api',
      services: [
        // The generated implementation
        _$TagApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$TagApiService(client);
  }
}
