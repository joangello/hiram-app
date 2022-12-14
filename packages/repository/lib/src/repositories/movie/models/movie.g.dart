// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      name: json['name'] as String?,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image.toJson(),
      'name': instance.name,
      'rating': instance.rating.toJson(),
      'summary': instance.summary,
    };
