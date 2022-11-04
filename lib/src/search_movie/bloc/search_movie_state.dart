part of 'search_movie_bloc.dart';

/// {@template search_movie_state}
///
/// Represents the state of [SearchMovieBloc]
///
/// {endtemplate}
class SearchMovieState extends Equatable {
  /// Contains the text of the user's search.
  final String search;

  /// Contains the list of searched movies.
  final List<SearchMovie> searches;

  /// Contains the list of all history searches.
  final List<dynamic> searchesHistory;

  /// A flag to when the empty view is presented.
  bool get isEmpty => searches.isEmpty && searchesHistory.isEmpty;

  // A flag to when the search history is presented.
  bool get isHistory => searches.isEmpty && searchesHistory.isNotEmpty;

  @override
  List<Object> get props => [
        search,
        searches,
        searchesHistory,
      ];

  //#region Initializers

  /// {@macro search_movie_state}
  const SearchMovieState({
    required this.search,
    required this.searches,
    required this.searchesHistory,
  });

  /// {@macro search_movie_state}
  factory SearchMovieState.initial() {
    return const SearchMovieState(
      search: '',
      searches: [],
      searchesHistory: [],
    );
  }

  //#endregion

  //#region Instances methods

  SearchMovieState copyWith({
    String? search,
    List<SearchMovie>? searches,
    List<dynamic>? searchesHistory,
  }) {
    return SearchMovieState(
      search: search ?? this.search,
      searches: searches ?? this.searches,
      searchesHistory: searchesHistory ?? this.searchesHistory,
    );
  }

  //#endregion
}
