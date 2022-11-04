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
  final List<Movie> _favoriteMovies = [];

  //#region Initializers

  /// {@macro movie_history_bloc}
  MovieHistoryBloc({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository,
        super(MovieHistoryState.initial()) {
    on<AddFavoriteMovieChanged>(_handleAddFavoriteMovieChanged);
    on<MovieHistoryContentRequested>(_handleMovieHistoryContentRequested);
    on<RemoveFavoriteMovieChanged>(_handleRemoveFavoriteMovieChanged);
  }

  //#endregion

  //#region Private methods

  Future<void> _handleAddFavoriteMovieChanged(
    AddFavoriteMovieChanged event,
    Emitter<MovieHistoryState> emit,
  ) async {
    if (!state.favoriteMovies.contains(event.movie)) {
      state.favoriteMovies.add(event.movie);
      final favorites = state.favoriteMovies.reversed.toList();
      emit(state.copyWith(favoriteMovies: favorites));
    } else {
      emit(state.copyWith(favoriteMovies: state.favoriteMovies));
    }
  }

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

  Future<void> _handleRemoveFavoriteMovieChanged(
    RemoveFavoriteMovieChanged event,
    Emitter<MovieHistoryState> emit,
  ) async {
    if (state.favoriteMovies.contains(event.movie)) {
      state.favoriteMovies.removeWhere((movie) => movie.id == event.movie.id);
      final movies = state.favoriteMovies.reversed.toList();

      emit(state.copyWith(favoriteMovies: movies));
    }
  }

  @override
  MovieHistoryState? fromJson(Map<String, dynamic> json) {
    try {
      return MovieHistoryState.fromJson(json);
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
