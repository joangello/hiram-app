// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search_movie.dart';

/// {@template search_movie_page}
///
/// Entry point for the [SearchMovieView] flow
///
/// {@endtemplate}
class SearhMoviePage extends StatelessWidget {
  //#region Initializers

  /// {@macro search_movie_page}
  const SearhMoviePage({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMovieBloc(
        moviesRepository: context.read(),
      ),
      child: const SearchMovieView(),
    );
  }

  //#endregion
}
