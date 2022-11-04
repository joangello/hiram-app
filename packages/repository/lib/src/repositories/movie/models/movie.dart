// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';

part 'movie.g.dart';

/// {@template movie}
///
/// Reprsents the model of a single [Movie]
///
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class Movie extends Equatable {
  /// The Unique identifier for this [Movie]
  final int id;

  /// The image for this [Movie]
  // @JsonKey(toJson: _imageToJson, fromJson: _imageFromJson)
  final ImageModel image;

  /// The name of this [Movie]
  final String? name;

  /// The rating for this [Movie]
  // @JsonKey(toJson: _ratingToJson, fromJson: _ratingFromJson)
  final Rating rating;

  /// The summary for this [Movie]
  final String? summary;

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        rating,
        summary,
      ];

  //#region Static instances

  static const empty = Movie(
    id: 0,
    image: ImageModel.empty,
    name: '',
    rating: Rating.empty,
    summary: '',
  );

  //#endregion

  //#region Initializers

  /// {@macro movie}
  const Movie({
    required this.id,
    required this.image,
    required this.name,
    required this.rating,
    required this.summary,
  });

  /// {@macro movie}
  factory Movie.fromEntry(MovieEntry entry) {
    return Movie(
      id: entry.id,
      image: ImageModel.fromEntry(
          entry.image ?? const ImageEntry(medium: '', original: '')),
      name: entry.name,
      rating: Rating.fromEntry(entry.rating),
      summary: entry.summary,
    );
  }

  /// {@macro movie}
  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  //#endregion
}
