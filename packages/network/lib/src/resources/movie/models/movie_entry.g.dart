// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntry _$MovieEntryFromJson(Map<String, dynamic> json) => MovieEntry(
      id: json['id'] as int,
      image: json['image'] == null
          ? null
          : ImageEntry.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String,
      rating: RatingEntry.fromJson(json['rating'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$MovieEntryToJson(MovieEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'rating': instance.rating,
      'summary': instance.summary,
    };
