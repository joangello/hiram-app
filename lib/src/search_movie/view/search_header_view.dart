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

  late FocusNode _focusNode;

  //#region Overriden methods

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        textController = _controller.text;
      });
    });
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 30),
      child: Column(
        children: [
          if (_focusNode.hasFocus) ...[
            const Text(
              'Encontramos el focus de esta mierda',
              style: TextStyle(color: Colors.white),
            )
          ],
          TextField(
            focusNode: _focusNode,
            controller: _controller,
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
              border: InputBorder.none,
              // prefixIcon: const Icon(
              //   Icons.search,
              //   color: Colors.grey,
              // ),
              // suffixIcon: _controller.text.isEmpty
              //     ? const SizedBox.shrink()
              //     : IconButton(
              //         icon: const Icon(
              //           Icons.clear,
              //           color: Colors.white,
              //         ),
              //         onPressed: () {
              //           _controller.text = '';
              //           context.read<SearchMovieBloc>().add(DeleteSearch());
              //         },
              //       ),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.grey),
            onChanged: (name) => context
                .read<SearchMovieBloc>()
                .add(SearchChanged(textController)),
            // onSubmitted: (text) =>
            //     context.read<SearchMovieBloc>().add(AddSearchHistoryChanged(text)),
          ),
        ],
      ),
    );
  }

  //#endregion
}
