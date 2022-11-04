// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/resources/movie/movie.dart';

part 'search_movie_entry.g.dart';

/// {@macro search_movie_entry}
///
/// {@endtemplate}
@JsonSerializable()
class SearchMovieEntry extends Equatable {
  /// The score for this [SearchMovieEntry]
  final double score;

  /// The show for this [SearchMovieEntry]
  final MovieEntry show;

  @override
  List<Object?> get props => [score, show];

  //#region Initializers

  /// {@macro search_movie_entry}
  const SearchMovieEntry({
    required this.score,
    required this.show,
  });

  /// {@macro search_movie_entry}
  factory SearchMovieEntry.fromJson(Map<String, dynamic> json) {
    return _$SearchMovieEntryFromJson(json);
  }

  //#endregion

  //#region Instance methods

  /// Return this [SearchMovieEntry] instance serialized as ´json´
  Map<String, dynamic> toJson() => _$SearchMovieEntryToJson(this);

  //#endregion
}
