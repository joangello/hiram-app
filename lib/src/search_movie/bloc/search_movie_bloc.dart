import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';

import 'search_movie_event.dart';
import 'search_movie_state.dart';

export 'search_movie_event.dart';
export 'search_movie_state.dart';

/// {@template search_movie_bloc}
///
/// Handles the comunication between Search address view
/// and its state and events.
///
/// {@endtemplate}
class SearchMovieBloc extends HydratedBloc<SearchMovieEvent, SearchMovieState> {
  final SearchMoviesRepository _moviesRepository;
  List<SearchMovie> _searchesHistory = [];

  SearchMovieBloc({required SearchMoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository,
        super(SearchMovieState.initial()) {
    on<AddSearchHistoryChanged>(_handleAddSearchHistoryChanged);
    on<DeleteFromSearchHistory>(_handleDeleteFromSearchHistory);
    on<DeleteSearch>(_handleDeleteSearch);
    on<SearchChanged>(
      _handleSearchChanged,
      transformer: (e, m) =>
          e.debounce(const Duration(milliseconds: 500)).switchMap(m),
    );
  }

  //#region Private methods

  Future<void> _handleAddSearchHistoryChanged(
    AddSearchHistoryChanged event,
    Emitter<SearchMovieState> emit,
  ) async {
    final state = this.state;
    if (!_searchesHistory.contains(event.search)) {
      _searchesHistory.add(event.search);
      final search = _searchesHistory.last;

      emit(state.copyWith(searchesHistory: [...state.searchesHistory, search]));
    } else {
      emit(state.copyWith(searchesHistory: state.searchesHistory));
    }
  }

  Future<void> _handleDeleteFromSearchHistory(
    DeleteFromSearchHistory event,
    Emitter<SearchMovieState> emit,
  ) async {
    final state = this.state;
    if (_searchesHistory.contains(event.search)) {
      // _searchesHistory.removeWhere(
      //   (search) => search.show.id == event.search.show.id,
      // );
      final index = _searchesHistory.where((e) => e == event.search).toList();

      emit(
        state.copyWith(
          searchesHistory: [...state.searchesHistory]..remove(index.first),
        ),
      );
    }
  }

  Future<void> _handleDeleteSearch(
    DeleteSearch event,
    Emitter<SearchMovieState> emit,
  ) async {
    emit(state.copyWith(searches: []));
  }

  Future<void> _handleSearchChanged(
    SearchChanged event,
    Emitter<SearchMovieState> emit,
  ) async {
    try {
      if (event.search.isEmpty) {
        emit(state.copyWith(searches: []));
        return;
      }

      final searches = await _moviesRepository.searchMovie(name: event.search);
      emit(state.copyWith(searches: searches));
    } catch (e, s) {
      addError(e, s);
    }
  }

  @override
  SearchMovieState? fromJson(Map<String, dynamic> json) {
    try {
      final state = SearchMovieState(
        searches: const [],
        searchesHistory: (json['searchesHistory'] as List<dynamic>)
            .map((e) => SearchMovie.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
      _searchesHistory = state.searchesHistory;

      return state;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SearchMovieState state) {
    try {
      return {
        'searchesHistory': state.searchesHistory.map((e) => e.toJson()).toList()
      };
    } catch (e) {
      return null;
    }
  }
}
