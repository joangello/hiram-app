// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'image.g.dart';

/// {@template image}
///
/// Represents the model of a single [ImageModel]
///
/// {@endtemplate}
@JsonSerializable()
class ImageModel extends Equatable {
  /// The medium resolution for this [ImageModel]
  final String? medium;

  /// The original resolution for this [ImageModel]
  final String? original;

  @override
  List<Object?> get props => [medium, original];

  //#region Static instances

  static const empty = ImageModel(medium: '', original: '');

  //#endregion

  //#region Initializers

  /// {@macro image_model}
  const ImageModel({required this.medium, required this.original});

  /// {@macro image_model}
  factory ImageModel.fromEntry(ImageEntry entry) {
    return ImageModel(
      medium: entry.medium,
      original: entry.original,
    );
  }

  /// {@macro image_model}
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return _$ImageModelFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  //#endregion
}
