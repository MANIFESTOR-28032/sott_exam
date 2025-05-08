// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      id: (json['id'] as num).toInt(),
      rooms: (json['numOfRooms'] as num).toInt(),
      qavat: (json['totalFloors'] as num).toInt(),
      floor: (json['floor'] as num).toInt(),
      price: json['price'] as num,
      area: json['area'] as num,
      category: json['category'] as String,
      currency: json['currency'] as String,
      image: json['image'] as String,
      nearPlace: NearPlace.fromJson(
          json['nearestPopularPlace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'id': instance.id,
      'numOfRooms': instance.rooms,
      'totalFloors': instance.qavat,
      'floor': instance.floor,
      'price': instance.price,
      'area': instance.area,
      'category': instance.category,
      'currency': instance.currency,
      'image': instance.image,
      'nearestPopularPlace': instance.nearPlace,
    };
