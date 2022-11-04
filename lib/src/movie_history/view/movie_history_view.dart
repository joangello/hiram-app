// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_favorites/movie_favorite_page.dart';
import 'package:hiram/src/movie_history/movie_history.dart';

/// {@template movie_history}
///
/// Represent's the history of movies
///
/// {@endtemplte}
class MovieHistoryView extends StatelessWidget {
  /// The padding of the content
  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 20);

  //#region Initializers

  /// {@macro movie_history}
  const MovieHistoryView({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieHistoryBloc, MovieHistoryState>(
        builder: (context, state) {
          return GridView.builder(
            padding: _padding,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisExtent: 326,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 200,
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return MovieContentView(movie: state.movies[index]);
            },
          );
        },
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
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Hiram",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(right: 16, top: 10),
            child: _FavoriteIndexIcon(),
          ),
          onTap: () {
            Navigator.of(context).push(MovieFavoritesPage.route());
          },
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);

  //endregion
}

class _FavoriteIndexIcon extends StatelessWidget {
  //#region Initializers

  const _FavoriteIndexIcon({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    final movieFavorites =
        context.watch<MovieHistoryBloc>().state.favoriteMovies;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.favorite_border,
          color: Colors.red,
          size: 30,
        ),
        Positioned(
          right: -5,
          top: -5,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 8,
            child: Center(
              child: Text(
                "${movieFavorites.length}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //#endregion
}
