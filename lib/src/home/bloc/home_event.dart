// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

part of 'home_bloc.dart';

/// {@template home_event}
///
/// Represents the base event of the [HomeBloc]
///
/// {@endtemplate}
abstract class HomeEvent extends Equatable {
  //#region Initializers

  /// {@macro home_event}
  const HomeEvent();

  //#endregion
}

/// {@template home_tab_changed}
/// Subclass of [HomeEvent]
///
/// This event is emitted when the user
/// swicth between tabs
/// {@endtemplate}
class HomeTabChanged extends HomeEvent {
  /// The selected tab by the user
  final HomeState selectedTab;

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  @override
  List<Object?> get props => [selectedTab];

  //#region Initializers

  /// {@macro home_tab_changed}
  const HomeTabChanged(this.selectedTab);

  //#endregion
}
