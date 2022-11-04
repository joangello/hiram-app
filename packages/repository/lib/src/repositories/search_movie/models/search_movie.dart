// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';

/// {@template search_movie}
///
/// {@endtemplate}
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

  //#endregion
}
