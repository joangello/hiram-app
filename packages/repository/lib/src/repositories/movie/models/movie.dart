// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:network/network.dart';
import 'package:repository/src/repositories/movie/movies_repository.dart';

extension RatingX on Rating {
  Map<String, dynamic> toJson() => {
        'average': average ?? 0,
      };
}

extension ImageX on ImageModel {
  Map<String, dynamic> toJson() => {
        'medium': medium ?? '',
        'original': original ?? '',
      };
}

extension MovieX on Movie {
  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image.toJson(),
        'name': name ?? '',
        'rating': rating.toJson(),
        'summary': summary ?? '',
      };
}

/// {@template movie}
///
/// Reprsents the model of a single [Movie]
///
/// {@endtemplate}
class Movie extends Equatable {
  /// The Unique identifier for this [Movie]
  final int id;

  /// The image for this [Movie]
  final ImageModel image;

  /// The name of this [Movie]
  final String? name;

  /// The rating for this [Movie]
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      image: ImageModel.fromJson(json),
      name: json['name'] as String?,
      rating: Rating.fromJson(json),
      summary: json['sumary'] as String?,
    );
  }

  //#endregion
}
