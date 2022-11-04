// Copyright (c) 2022, Brothers Lopez
// https://lodge-industry.io

import 'package:equatable/equatable.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';

class Episode extends Equatable {
  final int id;
  final String airdate;
  final String airstamp;
  final String airtime;
  final ImageModel image;
  final String? name;
  final int? number;
  final Rating rating;
  final int runtime;
  final int season;
  final String? summary;
  final String? type;
  final String url;

  const Episode({
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

  factory Episode.fromEntry(EpisodeEntry entry) {
    return Episode(
      id: entry.id,
      airdate: entry.airdate,
      airstamp: entry.airstamp,
      airtime: entry.airtime,
      image: ImageModel.fromEntry(entry.image),
      name: entry.name,
      rating: Rating.fromEntry(entry.rating),
      runtime: entry.runtime,
      season: entry.season,
      summary: entry.summary,
      type: entry.type,
      url: entry.url,
    );
  }

  static const empty = Episode(
    id: 0,
    airdate: '',
    airstamp: '',
    airtime: '',
    image: ImageModel.empty,
    name: '',
    rating: Rating.empty,
    runtime: 0,
    season: 0,
    summary: '',
    type: '',
    url: '',
  );

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
