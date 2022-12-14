import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

/// {@template movie_history_event}
///
/// Represents the event of [MovieHistoryBloc]
///
/// {@endtemplate}
abstract class MovieHistoryEvent extends Equatable {
  //#region Initailizers

  /// {@macro movie_history_event}
  const MovieHistoryEvent();

  //#endregion
}

/// {@template movie_history_content_requested}
/// Subclass of [MovieHistoryEvent]
///
/// This event is emited when the app is initialized to get
/// all history movies.
///
/// {@endtemplate}
class MovieHistoryContentRequested extends MovieHistoryEvent {
  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [];
}

/// {@template toggle_favorite_movies}
/// Subclass of [MovieHistoryEvent]
///
/// This event is emited when the user selected a movie
/// from the list of favorites.
///
/// {@endtemplate}
class ToggleFavoriteMovies extends MovieHistoryEvent {
  /// The movie added as favorite.
  final Movie movie;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [movie];

  //#region Initializers

  /// {@macro toggle_favorite_movies}
  const ToggleFavoriteMovies(this.movie);

  //#endregion
}
