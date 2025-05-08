import 'package:freezed_annotation/freezed_annotation.dart';

part 'near_place.g.dart';

@JsonSerializable()
class NearPlace {
  final String title;
  final String image;
  final num distance;

  NearPlace({
    required this.title,
    required this.image,
    required this.distance,
  });

  factory NearPlace.fromJson(Map<String,dynamic>json)=>_$NearPlaceFromJson(json);

  Map<String,dynamic>toJson()=>_$NearPlaceToJson(this);
}


