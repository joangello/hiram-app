// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

/// {@template home_bloc}
///
/// Handles the comunication between the tab view
/// and its state and events
///
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //#region Initializers

  /// {@macro home_bloc}
  HomeBloc() : super(HomeState.home) {
    on<HomeTabChanged>(_handleHomeTabChanged);
  }

  //#endregion

  //#region Private methods

  Future<void> _handleHomeTabChanged(
    HomeTabChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(event.selectedTab);
  }

  //#endregion
}
