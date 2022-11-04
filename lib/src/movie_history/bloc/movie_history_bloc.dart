// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:hiram/src/core/data_load_status.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:repository/repository.dart';

part 'movie_history_event.dart';
part 'movie_history_state.dart';

/// {@template movie_history_bloc}
///
/// Handles the comunication between the view and
/// its state and events
///
/// {@endtemplate}
class MovieHistoryBloc extends Bloc<MovieHistoryEvent, MovieHistoryState> {
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
    if (!_favoriteMovies.contains(event.movie)) {
      _favoriteMovies.add(event.movie);
      final favorites = _favoriteMovies.reversed.toList();
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
    if (_favoriteMovies.contains(event.movie)) {
      _favoriteMovies.removeWhere((movie) => movie.id == event.movie.id);
      final movies = _favoriteMovies.reversed.toList();

      emit(state.copyWith(favoriteMovies: movies));
    }
  }

  // @override
  // MovieHistoryState? fromJson(Map<String, dynamic> json) {
  //   try {
  //     return MovieHistoryState(
  //       favoriteMovies: (json['favoriteMovies'] as List<dynamic>)
  //           .map((e) => Movie.fromJson(e))
  //           .toList(),
  //       movies: (json['movies'] as List<dynamic>)
  //           .map((e) => Movie.fromJson(e))
  //           .toList(),
  //       status: DataLoadStatus.values[json['status'] as int],
  //     );
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // @override
  // Map<String, dynamic>? toJson(MovieHistoryState state) {
  //   try {
  //     return {
  //       'favoriteMovies': state.favoriteMovies.map((e) => e.toJson()).toList(),
  //       'movies': state.movies.map((e) => e.toJson()).toList(),
  //       'status': state.status.index,
  //     };
  //   } catch (e) {
  //     return null;
  //   }
  // }

  //#endregion
}
