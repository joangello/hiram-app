import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart';

part 'search_movie_state.g.dart';

/// {@template search_movie_state}
///
/// Represents the state of [SearchMovieBloc]
///
/// {endtemplate}
@JsonSerializable(explicitToJson: true)
class SearchMovieState extends Equatable {
  /// Contains the list of searched movies.
  final List<SearchMovie> searches;

  /// Contains the list of all history searches.
  final List<SearchMovie> searchesHistory;

  /// A flag to when the empty view is presented.
  bool get isEmpty => searches.isEmpty && searchesHistory.isEmpty;

  // A flag to when the search history is presented.
  bool get isHistory => searches.isEmpty && searchesHistory.isNotEmpty;

  @override
  List<Object> get props => [
        searches,
        searchesHistory,
      ];

  //#region Initializers

  /// {@macro search_movie_state}
  const SearchMovieState({
    required this.searches,
    required this.searchesHistory,
  });

  /// {@macro search_movie_state}
  factory SearchMovieState.initial() {
    return const SearchMovieState(
      searches: [],
      searchesHistory: [],
    );
  }

  /// {@macro movie_history_state}
  factory SearchMovieState.fromJson(Map<String, dynamic> json) {
    return _$SearchMovieStateFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$SearchMovieStateToJson(this);

  //#endregion

  //#region Instances methods

  SearchMovieState copyWith({
    List<SearchMovie>? searches,
    List<SearchMovie>? searchesHistory,
  }) {
    return SearchMovieState(
      searches: searches ?? this.searches,
      searchesHistory: searchesHistory ?? this.searchesHistory,
    );
  }

  //#endregion
}
