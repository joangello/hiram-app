import 'package:flutter/material.dart';

import 'package:hiram_ui/hiram_ui.dart';

/// {@template hiram_search_bar}
///
/// Render the text field where the user will search for movies.
///
/// {@endtemplate}
class HiramSearchBar extends StatefulWidget {
  /// The decoration to show around the text field
  final HiramInputDecoration? inputDecoration;

  /// Called when the user initiates a change to the TextField's
  /// value: when they have inserted or deleted text.
  final ValueChanged<String>? onChanged;

  /// Called when the user clears the textfield content
  final VoidCallback? onClear;

  //#region Initializers

  /// {@macro hiram_search_bar}
  const HiramSearchBar({
    Key? key,
    this.inputDecoration,
    this.onChanged,
    this.onClear,
  }) : super(key: key);

  //#endregion

  //#region Overriden methods

  @override
  State<HiramSearchBar> createState() => HiramSearchBarState();

  //#endregion
}

class HiramSearchBarState extends State<HiramSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  String _text = '';

  BoxDecoration get _decoration => BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      );

  //#region Overriden methods

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
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
    return LayoutBuilder(builder: (context, builder) {
      final maxWidth = _focusNode.hasFocus
          ? builder.maxWidth * 0.81
          : !_focusNode.hasFocus && _text.isNotEmpty
              ? builder.maxWidth * 0.81
              : builder.maxWidth;
      return Row(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.linear,
                height: 40,
                width: maxWidth,
                decoration: _decoration.copyWith(color: Colors.grey[900]),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.linear,
                height: 40,
                width: maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: _decoration,
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 4),
                    _buildTextField(),
                    if (_text.isNotEmpty) ...[
                      GestureDetector(
                        child: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onTap: () {
                          _controller.text = '';
                          widget.onClear?.call();
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          _buildCancelButton(builder.maxWidth),
        ],
      );
    });
  }
  //#endrgeion

  //#region Private methods

  Widget _buildCancelButton(double maxWidth) => Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.linear,
          height: 20,
          width: maxWidth * 0.20,
          padding: const EdgeInsets.only(left: 4),
          child: GestureDetector(
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {
              _controller.text = '';
              widget.onClear?.call();
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ),
      );

  Widget _buildPlaceHolder() => Positioned(
        bottom: 11,
        left: 1,
        child: Text(
          'Search',
          style: TextStyle(
            color: _focusNode.hasFocus ? Colors.grey[600] : Colors.grey,
          ),
        ),
      );

  Widget _buildTextField() {
    return Expanded(
      child: Stack(
        children: [
          if (_text.isEmpty) ...[_buildPlaceHolder()],
          TextField(
            focusNode: _focusNode,
            controller: _controller,
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 10),
            ),
            style: const TextStyle(color: Colors.grey),
            onChanged: widget.onChanged,
          )
        ],
      ),
    );
  }

  //#endregion
}
