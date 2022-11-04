// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_history/movie_history.dart';

import 'view.dart';

/// {@macro movie_favorite_view}
///
/// Represent the movie favorites added by the user.
///
/// {@endtemplate}
class MovieFavoriteView extends StatelessWidget {
  //#region Initializers

  /// {@macro movie_favorite_view}
  const MovieFavoriteView({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const _AppBar(),
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieHistoryBloc, MovieHistoryState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.quantity,
                  itemBuilder: (context, index) {
                    return state.favoriteMovies.isEmpty
                        ? _buildEmtyView(maxHeight: constraints.maxHeight)
                        : ContentFavoriteView(
                            movie: state.favoriteMovies[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                );
              },
            );
          },
        ));
  }

  //#endregion

  //#region Private methods

  Widget _buildEmtyView({required double maxHeight}) {
    return Container(
      alignment: Alignment.center,
      height: maxHeight,
      child: const Text(
        "Don't have favorite movies yet",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  //#endregion
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  //#region Initializers

  const _AppBar({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Size get preferredSize => const Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MovieHistoryBloc>().state.favoriteMovies;

    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "My Favorites (${favorites.length})",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  //#endregion
}
