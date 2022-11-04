// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieHistoryState _$MovieHistoryStateFromJson(Map<String, dynamic> json) =>
    MovieHistoryState(
      favoriteMovies: (json['favoriteMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$DataLoadStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MovieHistoryStateToJson(MovieHistoryState instance) =>
    <String, dynamic>{
      'favoriteMovies': instance.favoriteMovies.map((e) => e.toJson()).toList(),
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'status': _$DataLoadStatusEnumMap[instance.status]!,
    };

const _$DataLoadStatusEnumMap = {
  DataLoadStatus.initial: 'initial',
  DataLoadStatus.loading: 'loading',
  DataLoadStatus.failure: 'failure',
  DataLoadStatus.refreshing: 'refreshing',
  DataLoadStatus.success: 'success',
};
