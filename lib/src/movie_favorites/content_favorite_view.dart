import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import '../movie_history/movie_history.dart';

/// {@template content_favorites}
///
/// Render the favorite movies added by the user.
///
/// {@endtemplate}
class ContentFavoriteView extends StatelessWidget {
  /// The movie asocciated to this view.
  final Movie movie;

  //#region Initializers
  const ContentFavoriteView({Key? key, required this.movie}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: movie.image.original ?? '',
            placeholder: (context, url) => Container(color: Colors.grey),
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        _FavoriteSummary(movie: movie),
      ],
    );
  }

  //#endregion
}

class _FavoriteSummary extends StatelessWidget {
  /// The movie asocciated to this view.
  final Movie movie;

  //#region Initializers

  const _FavoriteSummary({Key? key, required this.movie}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    movie.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onTap: () {
                  context
                      .read<MovieHistoryBloc>()
                      .add(RemoveFavoriteMovieChanged(movie));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  //#endregion
}
