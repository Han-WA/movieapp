import 'package:json_annotation/json_annotation.dart';
part 'popularmodel.g.dart';

@JsonSerializable()
class PopularMovieModel {
  final bool adult;
  final String backdrop_path;
  final int id;
  final String original_title;
  final String overview;
  final int popularity;
  final String poster_path;
  final String release_date;
  final int vote_count;

  PopularMovieModel({
    required this.adult,
    required this.backdrop_path,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.vote_count,
  });

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieModelFromJson(json);
}
