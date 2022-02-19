// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popularmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieModel _$PopularMovieModelFromJson(Map<String, dynamic> json) =>
    PopularMovieModel(
      adult: json['adult'] as bool,
      backdrop_path: json['backdrop_path'] as String,
      id: json['id'] as int,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: json['popularity'] as int,
      poster_path: json['poster_path'] as String,
      release_date: json['release_date'] as String,
      vote_count: json['vote_count'] as int,
    );

Map<String, dynamic> _$PopularMovieModelToJson(PopularMovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'vote_count': instance.vote_count,
    };
