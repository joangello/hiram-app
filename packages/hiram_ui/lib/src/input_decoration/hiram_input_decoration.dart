import 'package:flutter/material.dart';

/// {@template hiram_input_decoration}
///
/// The border, labels, icons, and styles used to decorate a Material
/// Design text field.
///
/// {@endtemplate}
class HiramInputDecoration {
  /// The color for the border.
  final Color? borderColor;

  /// The color for the disabled border.
  final Color? disabledBorderColor;

  /// The color for the error border.
  final Color? errorBorderColor;

  /// The style to use for the [InputDecoration.errorText].
  final TextStyle? errorStyle;

  /// Text that appears below the [HiramInputDecoration.child] and the border.
  final String? errorText;

  /// The color for the focused border.
  final Color? focusedBorderColor;

  /// The color for the focused error border.
  final Color? focusedErrorBorderColor;

  /// The style to use for the [helperText].
  final TextStyle? helperStyle;

  /// Text that provides context about the [InputDecorator.child]'s value, such
  /// as how the value will be used.
  final String? helperText;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  /// Optional widget that describes the input field.
  final String? label;

  /// The style to use for [InputDecoration.labelText] when the label is on top
  /// of the input field.
  final TextStyle? labelStyle;

  /// Optional widget to place on the line before the input.
  final Widget? prefix;

  /// Optional widget to place on the line after the input.
  final Widget? suffix;

  //#region Initializers

  /// {@macro hiram_input_decoration}
  const HiramInputDecoration({
    this.borderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.focusedErrorBorderColor,
    this.errorStyle,
    this.errorText,
    this.helperStyle,
    this.helperText,
    this.hintStyle,
    this.hintText,
    this.label,
    this.labelStyle,
    this.prefix,
    this.suffix,
  });

  //#endregion

  //#region Instance methods

  /// Creates a copy of this input decoration with the given fields replaced
  /// by the new values.
  HiramInputDecoration copyWith({
    Color? borderColor,
    Color? disabledBorderColor,
    Color? errorBorderColor,
    Color? focusedBorderColor,
    Color? focusedErrorBorderColor,
    TextStyle? errorStyle,
    String? errorText,
    TextStyle? helperStyle,
    String? helperText,
    TextStyle? hintStyle,
    String? hintText,
    String? label,
    TextStyle? labelStyle,
    Widget? prefix,
    Widget? suffix,
  }) {
    return HiramInputDecoration(
      borderColor: borderColor ?? this.borderColor,
      disabledBorderColor: disabledBorderColor ?? this.borderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      focusedErrorBorderColor:
          focusedErrorBorderColor ?? this.focusedErrorBorderColor,
      errorStyle: errorStyle ?? this.errorStyle,
      errorText: errorText ?? this.errorText,
      helperStyle: helperStyle ?? this.helperStyle,
      helperText: helperText ?? this.helperText,
      hintStyle: hintStyle ?? this.hintStyle,
      hintText: hintText ?? this.hintText,
      label: label ?? this.label,
      labelStyle: labelStyle ?? this.labelStyle,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
    );
  }

  //#endregion
}
