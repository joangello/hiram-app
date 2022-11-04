part of 'movie_history_bloc.dart';

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

/// {@template add_favorite_movie_changed}
/// Subclass of [MovieHistoryEvent]
///
/// This event is emited when the user added a movie
/// as favorite.
///
/// {@endtemplate}
class AddFavoriteMovieChanged extends MovieHistoryEvent {
  /// The movie added as favorite.
  final Movie movie;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [movie];

  //#region Initializers

  /// {@macro add_favorite_movie_changed}
  const AddFavoriteMovieChanged(this.movie);

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

/// {@template remove_favorite_movie_changed}
/// Subclass of [MovieHistoryEvent]
///
/// This event is emited when the user removed a movie
/// from the list of favorites.
///
/// {@endtemplate}
class RemoveFavoriteMovieChanged extends MovieHistoryEvent {
  /// The movie that will be removed.
  final Movie movie;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [movie];

  //#region Initializers

  /// {@macro remove_favorite_movie_changed}
  const RemoveFavoriteMovieChanged(this.movie);

  //#endregion
}
