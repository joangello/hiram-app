import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

/// {@template search_movie_event}
///
/// Represents the base event of [SearchMovieBloc]
///
/// {@endtemplate}
abstract class SearchMovieEvent extends Equatable {
  //#region Initializers

  /// {@macro search_movie_event}
  const SearchMovieEvent();

  //#endregion
}

/// {@template add_search_history_changed}
/// Subclass of [SearchMovieEvent]
///
/// This event is executed when the user selects
/// an element from the search
///
/// {@endtemplate}
class AddSearchHistoryChanged extends SearchMovieEvent {
  /// The search selects by the user.
  final SearchMovie search;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object> get props => [search];

  //#region Initializers

  /// {@macro add_search_history_changed}
  const AddSearchHistoryChanged(this.search);

  //#endregion
}

/// {@template delete_from_search_history}
/// Subclass of [SearchMovieEvent]
///
/// This event is executed when the user delete
/// an element from the search history.
///
/// {@endtemplate}
class DeleteFromSearchHistory extends SearchMovieEvent {
  /// The element that will be removed from the search history.
  final SearchMovie search;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [search];

  const DeleteFromSearchHistory(this.search);
}

/// {@template search_changed}
/// Subclass of [SearchMovieEvent]
///
/// This event is executed when the user delete
/// the search.
///
/// {@endtemplate}
class DeleteSearch extends SearchMovieEvent {
  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object> get props => [];
}

/// {@template search_changed}
/// Subclass of [SearchMovieEvent]
///
/// This event is executed when the user selects
/// an element from the search.
///
/// {@endtemplate}
class SearchChanged extends SearchMovieEvent {
  /// The search text entered by the user.
  final String search;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object> get props => [search];

  //#region Initializers

  /// {@macro search_changed}
  const SearchChanged(this.search);

  //#endregion
}
