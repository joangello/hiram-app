// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_entry.g.dart';

/// {@template rating_entry}
///
/// Represent's the model of a single [RatingEntry]
///
/// {@endtemplate}
@JsonSerializable()
class RatingEntry extends Equatable {
  /// The average for this [RatingEntry]
  final double? average;

  @override
  List<Object?> get props => [average];

  //#region Initializers

  /// {@macro rating_entry}
  const RatingEntry({this.average});

  /// {@macro rating_entry}
  factory RatingEntry.fromJson(Map<String, dynamic> json) {
    return _$RatingEntryFromJson(json);
  }

  //#endregion

  //#region Instances methods

  Map<String, dynamic> toJson() => _$RatingEntryToJson(this);

  //#endregion
}
