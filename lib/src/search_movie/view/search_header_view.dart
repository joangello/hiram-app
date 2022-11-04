import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiram/src/search_movie/search_movie.dart';

/// {@template search_header_view}
///
/// Render the text field where the user will search for movies.
///
/// {@endtemplate}
class SearchHeaderView extends StatefulWidget {
  //#region Initializers

  /// {@macro search_header_view}
  const SearchHeaderView({Key? key}) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  State<SearchHeaderView> createState() => SearchHeaderViewState();

  //#endregion
}

class SearchHeaderViewState extends State<SearchHeaderView> {
  late TextEditingController _controller;
  String textController = '';

  //#region Overriden methods

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        textController = _controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextField(
        controller: _controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          label: const Text(
            "Search",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: _controller.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _controller.text = '';
                    context.read<SearchMovieBloc>().add(DeleteSearch());
                  },
                ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
        ),
        style: const TextStyle(color: Colors.grey),
        onChanged: (name) =>
            context.read<SearchMovieBloc>().add(SearchChanged(textController)),
        onSubmitted: (text) =>
            context.read<SearchMovieBloc>().add(AddSearchHistoryChanged(text)),
      ),
    );
  }

  //#endregion
}
