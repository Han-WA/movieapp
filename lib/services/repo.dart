import 'package:movie_app/models/popularmodel.dart';

import 'api.dart';

class Repo {
  final Api _api;
  Repo(this._api);

  Future<PopularMovieModel> getPopularMovie() => _api.getPopularMovie();
}
