// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearPlace _$NearPlaceFromJson(Map<String, dynamic> json) => NearPlace(
      title: json['title'] as String,
      image: json['image'] as String,
      distance: json['distance'] as num,
    );

Map<String, dynamic> _$NearPlaceToJson(NearPlace instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'distance': instance.distance,
    };
