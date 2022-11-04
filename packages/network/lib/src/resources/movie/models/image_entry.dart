// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_entry.g.dart';

/// {@template image_entry}
///
/// Represents the model of a single [ImageEntry]
///
/// {@endtemplate}
@JsonSerializable()
class ImageEntry extends Equatable {
  /// The medium resolution for this [ImageEntry]
  final String medium;

  /// The original resolution for this [ImageEntry]
  final String original;

  @override
  List<Object?> get props => [medium, original];

  //#region Initializers

  /// {@macro image_entry}
  const ImageEntry({required this.medium, required this.original});

  /// {@macro image_entry}
  factory ImageEntry.fromJson(Map<String, dynamic> json) {
    return _$ImageEntryFromJson(json);
  }

  //#endregion

  //#region Instance methods

  /// Returns this [ImageEntry] instance serialized as `json`
  Map<String, dynamic> toJson() => _$ImageEntryToJson(this);

  //#endregion
}
