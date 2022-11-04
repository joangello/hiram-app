// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/resources/movie/movie.dart';

part 'movie_entry.g.dart';

/// {@template movie_entry}
///
/// Reprsents the model of a single [MovieEntry]
///
/// {@endtemplate}
@JsonSerializable()
class MovieEntry extends Equatable {
  /// The Unique identifier for this [MovieEntry]
  final int id;

  /// The image for this [MovieEntry]
  final ImageEntry? image;

  /// The name of this [MovieEntry]
  final String name;

  /// The rating for this [MovieEntry]
  final RatingEntry rating;

  /// The summary for this [MovieEntry]
  final String? summary;

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        rating,
        summary,
      ];

  //#region Initializers

  /// {@macro movie_entry}
  const MovieEntry({
    required this.id,
    required this.image,
    required this.name,
    required this.rating,
    required this.summary,
  });

  /// {@macro movie_entry}
  factory MovieEntry.fromJson(Map<String, dynamic> json) {
    return _$MovieEntryFromJson(json);
  }

  //#endregion

  //#region Instances methods

  Map<String, dynamic> toJson() => _$MovieEntryToJson(this);

  //#endregion
}
