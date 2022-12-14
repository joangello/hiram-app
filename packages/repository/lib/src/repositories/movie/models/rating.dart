// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'rating.g.dart';

/// {@template rating}
///
/// Represent's the model of a single [Rating]
///
/// {@endtemplate}
@JsonSerializable()
class Rating extends Equatable {
  /// The average for this [Rating]
  final double? average;

  @override
  List<Object?> get props => [average];

  //#region Static instances

  static const empty = Rating(average: 0);

  //#endregion

  //#region Initializers

  /// {@macro rating}
  const Rating({required this.average});

  /// {@macro rating}
  factory Rating.fromEntry(RatingEntry entry) {
    return Rating(average: entry.average ?? 0);
  }

  /// {@macro rating}
  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  /// Transform this instances serailized to json
  Map<String, dynamic> toJson() => _$RatingToJson(this);

  //#endregion
}
