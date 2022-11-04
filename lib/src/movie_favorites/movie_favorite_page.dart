// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_favorites/movie_favorite_view.dart';
import 'package:hiram/src/movie_history/movie_history.dart';

/// {@template movie_favorite_page}
///
/// Entry point to this [MovieFavoriteView] flow
///
/// {@endtemplate}
class MovieFavoritesPage extends StatelessWidget {
  //#region Static methods

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: BlocProvider.of<MovieHistoryBloc>(context),
        child: const MovieFavoriteView(),
      ),
    );
  }

  //#endregion

  //#region Initializers

  /// {@macro movie_favorite_page}
  const MovieFavoritesPage({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<MovieHistoryBloc>(context),
      child: const MovieFavoriteView(),
    );
  }

  //#endregion
}
