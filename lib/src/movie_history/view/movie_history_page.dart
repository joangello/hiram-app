// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_history/bloc/movie_history_bloc.dart';
import 'package:hiram/src/movie_history/view/movie_history_view.dart';

/// {@template movie_history_page}
///
/// Entry point for the [MovieHistoryView] flow
///
/// {@endtemplate}
class MovieHistoryPage extends StatelessWidget {
  //#region Initializers

  /// {@macro movie_history_page}
  const MovieHistoryPage({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<MovieHistoryBloc>(context)
        ..add(MovieHistoryContentRequested()),
      child: const MovieHistoryView(),
    );
  }

  //#endregion
}
