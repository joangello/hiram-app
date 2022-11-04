// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/network.dart';

part 'episode_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class EpisodeEntry extends Equatable {
  const EpisodeEntry({
    required this.id,
    required this.airdate,
    required this.airstamp,
    required this.airtime,
    required this.image,
    required this.name,
    this.number,
    required this.rating,
    required this.runtime,
    required this.season,
    required this.summary,
    required this.type,
    required this.url,
  });

  factory EpisodeEntry.fromJson(Map<String, dynamic> json) {
    return _$EpisodeEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EpisodeEntryToJson(this);

  static const empty = EpisodeEntry(
    id: 0,
    airdate: '',
    airstamp: '',
    airtime: '',
    image: ImageEntry(medium: '', original: ''),
    name: '',
    rating: RatingEntry(average: 0),
    runtime: 0,
    season: 0,
    summary: '',
    type: '',
    url: '',
  );

  final int id;
  final String airdate;
  final String airstamp;
  final String airtime;
  final ImageEntry image;
  final String? name;
  final int? number;
  final RatingEntry rating;
  final int runtime;
  final int season;
  final String? summary;
  final String? type;
  final String url;

  @override
  List<Object?> get props => [
        id,
        airdate,
        airstamp,
        airtime,
        image,
        name,
        number,
        rating,
        runtime,
        season,
        summary,
        type,
        url,
      ];
}
