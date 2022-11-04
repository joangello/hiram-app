// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeEntry _$EpisodeEntryFromJson(Map<String, dynamic> json) => EpisodeEntry(
      id: json['id'] as int,
      airdate: json['airdate'] as String,
      airstamp: json['airstamp'] as String,
      airtime: json['airtime'] as String,
      image: ImageEntry.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String?,
      number: json['number'] as int?,
      rating: RatingEntry.fromJson(json['rating'] as Map<String, dynamic>),
      runtime: json['runtime'] as int,
      season: json['season'] as int,
      summary: json['summary'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$EpisodeEntryToJson(EpisodeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airdate': instance.airdate,
      'airstamp': instance.airstamp,
      'airtime': instance.airtime,
      'image': instance.image.toJson(),
      'name': instance.name,
      'number': instance.number,
      'rating': instance.rating.toJson(),
      'runtime': instance.runtime,
      'season': instance.season,
      'summary': instance.summary,
      'type': instance.type,
      'url': instance.url,
    };
