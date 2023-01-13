// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram_ui/hiram_ui.dart';

import '../search_movie.dart';

/// {@template search_movie_view}
///
/// Represents the view for the search movie.
///
/// {@endtemplate}
class SearchMovieView extends StatelessWidget {
  /// The padding of the content
  EdgeInsets get _padding => const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 16);

  //#region Initializers

  /// {@macro search_movie_view}
  const SearchMovieView({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: _padding,
                  child: HiramSearchBar(
                    onChanged: (value) {
                      context.read<SearchMovieBloc>().add(SearchChanged(value));
                    },
                    onClear: () =>
                        context.read<SearchMovieBloc>().add(DeleteSearch()),
                  ),
                ),
                _SearchView(maxHeight: constraints.maxHeight),
              ],
            );
          },
        ),
      ),
    );
  }

  //#endregion
}

class _SearchView extends StatelessWidget {
  /// The maximun height for the view.
  final double maxHeight;

  //#region Initializers

  const _SearchView({
    Key? key,
    required this.maxHeight,
  }) : super(key: key);

  //#endregion

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      builder: (context, state) {
        return Expanded(
          child: GestureDetector(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: state.searches.isEmpty ? 1 : state.searches.length,
              itemBuilder: (context, index) {
                return state.isEmpty
                    ? _buildEmtyView()
                    : state.isHistory
                        ? const SearchHistoryView()
                        : ContentSearchView(searchMovie: state.searches[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          ),
        );
      },
    );
  }

  //#region Private methods

  Widget _buildEmtyView() {
    return Container(
      alignment: Alignment.center,
      height: maxHeight,
      child: const Text(
        "The search is empty",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  //#endregion
}
