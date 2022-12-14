import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart';

import '../../core/core.dart';

part 'movie_history_state.g.dart';

/// {@template movie_history_state}
///
/// Represents the state of [MovieHistoryBloc]
///
/// {endtemplate}
@JsonSerializable(explicitToJson: true)
class MovieHistoryState extends Equatable {
  /// The list of all favorite movies selected by the user.
  final List<Movie> favoriteMovies;

  /// The list of all movies.
  final List<Movie> movies;

  /// The current status.
  final DataLoadStatus status;

  /// Contains the number of favorite movies.
  int get quantity => favoriteMovies.isEmpty ? 1 : favoriteMovies.length;

  @override
  List<Object> get props => [
        favoriteMovies,
        movies,
        status,
      ];

  //#region Initializers

  /// {@macro movie_history_state}
  const MovieHistoryState({
    required this.favoriteMovies,
    required this.movies,
    required this.status,
  });

  /// {@macro movie_history_state}
  factory MovieHistoryState.initial() {
    return const MovieHistoryState(
      favoriteMovies: [],
      movies: [],
      status: DataLoadStatus.initial,
    );
  }

  /// {@macro movie_history_state}
  factory MovieHistoryState.fromJson(Map<String, dynamic> json) {
    return _$MovieHistoryStateFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$MovieHistoryStateToJson(this);

  //#endregion

  //#region Instances methods

  MovieHistoryState copyWith({
    List<Movie>? favoriteMovies,
    List<Movie>? movies,
    DataLoadStatus? status,
  }) {
    return MovieHistoryState(
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }

  //#ednregion
}
