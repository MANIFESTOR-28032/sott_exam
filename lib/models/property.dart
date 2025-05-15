class Property {
  final int id;
  final int rooms;
  final int totalFloors;
  final int currentFloor;
  final double price;
  final double area;
  final String type;
  final String currency;
  final String imageUrl;
  final LocationInfo location;

  Property({
    required this.id,
    required this.rooms,
    required this.totalFloors,
    required this.currentFloor,
    required this.price,
    required this.area,
    required this.type,
    required this.currency,
    required this.imageUrl,
    required this.location,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as int,
      rooms: json['numOfRooms'] as int,
      totalFloors: json['totalFloors'] as int,
      currentFloor: json['floor'] as int,
      price: (json['price'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      type: json['category'] as String,
      currency: json['currency'] as String,
      imageUrl: json['image'] as String,
      location: LocationInfo.fromJson(json['nearestPopularPlace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'numOfRooms': rooms,
    'totalFloors': totalFloors,
    'floor': currentFloor,
    'price': price,
    'area': area,
    'category': type,
    'currency': currency,
    'image': imageUrl,
    'nearestPopularPlace': location.toJson(),
  };
}

class LocationInfo {
  final String name;
  final String iconUrl;
  final double distance;

  LocationInfo({
    required this.name,
    required this.iconUrl,
    required this.distance,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      name: json['title'] as String,
      iconUrl: json['image'] as String,
      distance: (json['distance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': name,
    'image': iconUrl,
    'distance': distance,
  };
} 