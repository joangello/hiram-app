import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    const sizeValue = "XX-SMALL";
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.blue,
          child: Center(
            child: Text(
              singleCaptitalized(sizeValue),
            ),
          ),
        ),
      ),
    );
  }

  String singleCaptitalized(String sizeValue) {
    if (sizeValue.contains('-')) {
      final splitted = sizeValue.split('-');
      final letterToCapitalized = splitted[1].toCapitalized();

      return '${splitted[0]}-$letterToCapitalized';
    }

    return sizeValue.replaceAll(' ', '/');
  }
}
