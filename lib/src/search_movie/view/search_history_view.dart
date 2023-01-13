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
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              for (var search in state.recentlySearches) ...[
                _HistoryContentView(search: search)
              ]
            ],
          ),
        );
      },
    );
  }

  //#endregion

  //#region Private methods

  Widget _buildHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Recientes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'Ver todo',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      );

  //#endregion
}

class _HistoryContentView extends StatelessWidget {
  final SearchMovie search;

  //#region Initializers

  const _HistoryContentView({
    Key? key,
    required this.search,
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
            ClipRRect(
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
            const SizedBox(width: 4),
            Text(
              search.show.name ?? '',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 15,
              ),
              onTap: () => context
                  .read<SearchMovieBloc>()
                  .add(DeleteFromSearchHistory(search)),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  //#endregion
}
