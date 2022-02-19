import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class Api {
  factory Api(Dio dio) => _Api(dio);

  @GET('upcoming?api_key=ae0abe93e99af67a2a954d13f36f0c4d')
  Future<String> getPopularMovie();
}
