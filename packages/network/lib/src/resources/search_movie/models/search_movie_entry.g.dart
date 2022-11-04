// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovieEntry _$SearchMovieEntryFromJson(Map<String, dynamic> json) =>
    SearchMovieEntry(
      score: (json['score'] as num).toDouble(),
      show: MovieEntry.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchMovieEntryToJson(SearchMovieEntry instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show,
    };
