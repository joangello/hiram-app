// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';

part 'search_movie.g.dart';

/// {@template search_movie}
///
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class SearchMovie extends Equatable {
  /// The score for this [SearchMovie]
  final double score;

  /// The show for this [SearchMovie]
  final Movie show;

  @override
  List<Object?> get props => [score, show];

  //#region Initializers

  /// {@macro search_movie}
  const SearchMovie({required this.score, required this.show});

  /// {@macro search_movie}
  factory SearchMovie.fromEntry(SearchMovieEntry entry) {
    return SearchMovie(
      score: entry.score,
      show: Movie.fromEntry(entry.show),
    );
  }

  /// {@macro movie}
  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    return _$SearchMovieFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);

  //#endregion
}
