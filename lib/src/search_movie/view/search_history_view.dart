import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

import '../search_movie.dart';

/// {@template search_history_view}
///
/// Represents the view for the search movies
///
/// {@endtemplate}
class SearchHistoryView extends StatelessWidget {
  //#region Initializers

  /// {@macro search_history_view}
  const SearchHistoryView({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    final searchesHistory =
        context.watch<SearchMovieBloc>().state.searchesHistory;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          for (var search in searchesHistory) ...[
            if (search is SearchMovie) ...[
              _buildMovieSearch(search),
              const SizedBox(height: 10)
            ] else if (search is String) ...[
              _buildTextSearch(search)
            ]
          ]
        ],
      ),
    );
  }

  //#endregion

  //#region Private methods

  Widget _buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Recientes',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Ver todo',
            style: TextStyle(color: Colors.red),
          ),
        ],
      );

  Widget _buildMovieSearch(SearchMovie search) {
    return _ListTileHistoryView(
      content: search,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: search.show.image.original ?? '',
          placeholder: (context, url) => Container(color: Colors.grey),
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextSearch(String search) {
    return _ListTileHistoryView(
      content: search,
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: const Icon(
          Icons.search,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  //#endregion
}

class _ListTileHistoryView extends StatelessWidget {
  /// The content of data asocciated dto this view.
  final dynamic content;

  /// The leading widget for this list tile.
  final Widget leading;

  //#region Initializers

  const _ListTileHistoryView({
    Key? key,
    required this.content,
    required this.leading,
  }) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: 4),
            Text(
              content is SearchMovie ? content.show.name : content,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () => context
                  .read<SearchMovieBloc>()
                  .add(DeleteFromSearchHistory(content)),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  //#endregion
}
