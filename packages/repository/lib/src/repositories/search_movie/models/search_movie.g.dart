// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovie _$SearchMovieFromJson(Map<String, dynamic> json) => SearchMovie(
      score: (json['score'] as num).toDouble(),
      show: Movie.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchMovieToJson(SearchMovie instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show.toJson(),
    };
