// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovieState _$SearchMovieStateFromJson(Map<String, dynamic> json) =>
    SearchMovieState(
      searches: (json['searches'] as List<dynamic>)
          .map((e) => SearchMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchesHistory: (json['searchesHistory'] as List<dynamic>)
          .map((e) => SearchMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchMovieStateToJson(SearchMovieState instance) =>
    <String, dynamic>{
      'searches': instance.searches.map((e) => e.toJson()).toList(),
      'searchesHistory':
          instance.searchesHistory.map((e) => e.toJson()).toList(),
    };
