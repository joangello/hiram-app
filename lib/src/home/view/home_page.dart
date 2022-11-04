// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_history/view/movie_history_page.dart';
import 'package:hiram/src/pages/third/third.dart';
import '../../movie_favorites/movie_favorite_page.dart';
import '../../search_movie/search_movie.dart';
import '../home.dart';

/// {@template home_page}
///
/// Entry point for the flow of the app
///
/// {@endtemplate}
class HomePage extends StatelessWidget {
  //#region Initializers

  /// {@macro home_page}
  const HomePage({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.index,
              children: const [
                MovieHistoryPage(),
                SearhMoviePage(),
                MovieFavoritesPage(),
                Third(),
              ],
            ),
            bottomNavigationBar: const HomeBottomNavigationBar(),
          );
        },
      ),
    );
  }

  //#endregion
}
