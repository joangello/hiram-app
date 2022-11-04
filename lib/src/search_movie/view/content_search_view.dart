import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import '../search_movie.dart';

/// {@template content_search_view}
///
/// Represents the view for the search movies
///
/// {@endtemplate}
class ContentSearchView extends StatelessWidget {
  /// The search movie asocciated to the view.
  final SearchMovie searchMovie;

  //#region Initializers

  /// {@macro content_search_view}
  const ContentSearchView({
    Key? key,
    required this.searchMovie,
  }) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    final image = searchMovie.show.image.original ?? '';

    return GestureDetector(
      child: Row(
        children: [
          _buildImage(image),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              searchMovie.show.name ?? '',
              style: const TextStyle(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      onTap: () => context
          .read<SearchMovieBloc>()
          .add(AddSearchHistoryChanged(searchMovie)),
    );
  }

  //#region Private methods

  Widget _buildImage(String image) {
    return image.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: image,
              placeholder: (context, url) => Container(color: Colors.grey),
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          )
        : Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey,
            ),
          );
  }

  //#endregion

  //#endregion
}
