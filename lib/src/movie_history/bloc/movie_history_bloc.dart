// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:hiram/src/core/data_load_status.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repository/repository.dart';
import 'movie_history_event.dart';
import 'movie_history_state.dart';

export 'movie_history_event.dart';
export 'movie_history_state.dart';

/// {@template movie_history_bloc}
///
/// Handles the comunication between the view and
/// its state and events
///
/// {@endtemplate}
class MovieHistoryBloc
    extends HydratedBloc<MovieHistoryEvent, MovieHistoryState> {
  final MoviesRepository _moviesRepository;
  List<Movie> _favoriteMovies = [];

  //#region Initializers

  /// {@macro movie_history_bloc}
  MovieHistoryBloc({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository,
        super(MovieHistoryState.initial()) {
    on<MovieHistoryContentRequested>(_handleMovieHistoryContentRequested);
    on<ToggleFavoriteMovies>(_handleToggleFavoriteMovies);
  }

  //#endregion

  //#region Private methods

  Future<void> _handleMovieHistoryContentRequested(
    MovieHistoryContentRequested event,
    Emitter<MovieHistoryState> emit,
  ) async {
    emit(state.copyWith(status: DataLoadStatus.loading));

    try {
      final movies = await _moviesRepository.fetchMovies();
      emit(state.copyWith(movies: movies, status: DataLoadStatus.success));
    } catch (e, s) {
      emit(state.copyWith(status: DataLoadStatus.failure));
      addError(e, s);
    }
  }

  Future<void> _handleToggleFavoriteMovies(
    ToggleFavoriteMovies event,
    Emitter<MovieHistoryState> emit,
  ) async {
    if (!_favoriteMovies.contains(event.movie)) {
      _favoriteMovies.add(event.movie);
      final favorites = _favoriteMovies.reversed.toList();

      emit(state.copyWith(favoriteMovies: favorites));
    } else {
      _favoriteMovies.removeWhere((movie) => movie.id == event.movie.id);
      final movies = _favoriteMovies.reversed.toList();

      emit(state.copyWith(favoriteMovies: movies));
    }
  }

  @override
  MovieHistoryState? fromJson(Map<String, dynamic> json) {
    try {
      final state = MovieHistoryState.fromJson(json);
      _favoriteMovies = state.favoriteMovies;

      return state;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(MovieHistoryState state) {
    try {
      return state.toJson();
    } catch (e) {
      return null;
    }
  }

  //#endregion
}
