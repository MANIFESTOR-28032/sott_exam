import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'near_place.dart';

part 'home.g.dart';

@JsonSerializable()
class HomeModel {
  final int id;
  @JsonKey(name: "numOfRooms")
  final int rooms;
  @JsonKey(name: "totalFloors")
  final int qavat;
  final int floor;
  final num price;
  final num area;
  final String category;
  final String currency;
  final String image;
  @NearPlaceConvertor()
  @JsonKey(name: "nearestPopularPlace")
  final NearPlace nearPlace;


  HomeModel({
    required this.id,
    required this.rooms,
    required this.qavat,
    required this.floor,
    required this.price,
    required this.area,
    required this.category,
    required this.currency,
    required this.image,
    required this.nearPlace,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

class NearPlaceConvertor extends Converter<NearPlace, Map<String, dynamic>> {
  const NearPlaceConvertor();

  NearPlace fromJson(Map<String, dynamic> json) {
    return NearPlace.fromJson(json);
  }

  Map<String, dynamic> toJson(Map<String, dynamic> places) {
    return places;
  }

  @override
  Map<String, dynamic> convert(NearPlace input) {
    throw UnimplementedError();
  }
}