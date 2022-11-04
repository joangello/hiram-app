import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/core/data_load_status.dart';
import 'package:repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

/// {@template search_movie_bloc}
///
/// Handles the comunication between Search address view
/// and its state and events.
///
/// {@endtemplate}
class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMoviesRepository _moviesRepository;
  final List<dynamic> _searchesHistory = [];

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
    if (!state.searchesHistory.contains(event.search)) {
      _searchesHistory.add(event.search);
      final searches = _searchesHistory.reversed.toList();
      emit(state.copyWith(searchesHistory: searches));
    } else {
      emit(state.copyWith(searchesHistory: state.searchesHistory));
    }
  }

  Future<void> _handleDeleteFromSearchHistory(
    DeleteFromSearchHistory event,
    Emitter<SearchMovieState> emit,
  ) async {
    if (_searchesHistory.contains(event.search)) {
      _searchesHistory.removeWhere((search) => search == event.search);
      final searches = _searchesHistory.reversed.toList();

      emit(state.copyWith(searchesHistory: searches));
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
      emit(state.copyWith(searches: searches, search: event.search));
    } catch (e, s) {
      addError(e, s);
    }
  }

  //#endregion
}
