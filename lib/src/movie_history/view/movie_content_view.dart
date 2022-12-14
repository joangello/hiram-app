// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/movie_history/movie_history.dart';
import 'package:repository/repository.dart';

/// {@template movie_content_view}
///
/// Represent The list of all movies.
///
/// {@endtemplate}
class MovieContentView extends StatelessWidget {
  /// The movie asocciated to the view.
  final Movie movie;

  //#region Initializers

  /// {@macro movie_content_view}
  const MovieContentView({Key? key, required this.movie}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: movie.image.original ?? '',
            placeholder: (context, url) => Container(color: Colors.grey),
            height: 250,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        _FooterImage(movie: movie),
      ],
    );
  }

  //#endregion
}

class _FooterImage extends StatefulWidget {
  /// The movie asocciated to this view.
  final Movie movie;

  //#region Initializers

  const _FooterImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  //endregion

  @override
  State<_FooterImage> createState() => FooterImageState();
}

class FooterImageState extends State<_FooterImage>
    with AutomaticKeepAliveClientMixin {
  //#region Overriden methods

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Text(
                  widget.movie.name ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            _buildFavoriteIcon(context),
          ],
        ),
        _buildRating(),
      ],
    );
  }

  //#endregion

  //#region Private methods

  Widget _buildFavoriteIcon(BuildContext context) {
    final movieFavorites =
        context.watch<MovieHistoryBloc>().state.favoriteMovies;

    return GestureDetector(
      child: Icon(
        movieFavorites.contains(widget.movie)
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.red,
      ),
      onTap: () {
        context
            .read<MovieHistoryBloc>()
            .add(ToggleFavoriteMovies(widget.movie));
      },
    );
  }

  Widget _buildRating() => Row(
        children: [
          const Text(
            'Rating',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '${widget.movie.rating.average}/10',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      );

  //#endregion
}
